Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEDF5B5D75
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 17:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7AF10E5AC;
	Mon, 12 Sep 2022 15:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713E710E5B6;
 Mon, 12 Sep 2022 15:41:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7EE136124E;
 Mon, 12 Sep 2022 15:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74D2C433D7;
 Mon, 12 Sep 2022 15:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662997285;
 bh=q6cfW2LaGIg+SltIIpaovEiimKBRJf/TFohwH/CWcBE=;
 h=From:To:Cc:Subject:Date:From;
 b=QdMtE+15VMAO+Mtj17TfJ1AwHaWfsJoUtC8CmVxmCpVlOCyOYM1vYgjJ/xG2pKp2x
 +xsGO14Dz2AesZvKBxhVksflSqKrb/MapsXoDdYhToqJiwxN7YEOlC9asR4wCDN7kD
 ubYdV2QOB01WuXNSENpeNGIsGZ96Qtasd/b/OMSCA/+iT5Msr8bfe4jGOGbbOdWGys
 LXgmSSXv7mNrXLlRWWXhAvEoKqdIXjgvZDCHqcVOs4u9ixqF3sWF+WzkdCsJXGcweF
 /KMXHtXFu4xl7zwHkrz6a7c9inMOFa9SQVy3sfREfF1t/4BJrPzEQk6v6NUlOaWRdq
 mWOS6y0Eb2qNg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1oXlYo-0003Ml-Bl; Mon, 12 Sep 2022 17:41:23 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH 0/7] drm/msm: probe deferral fixes
Date: Mon, 12 Sep 2022 17:40:39 +0200
Message-Id: <20220912154046.12900-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MSM DRM is currently broken in multiple ways with respect to probe
deferral. Not only does the driver currently fail to probe again after a
late deferral, but due to a related use-after-free bug this also
triggers NULL-pointer dereferences.

These bugs are not new but have become critical with the release of
5.19 where probe is deferred in case the aux-bus EP panel driver has not
yet been loaded.

The underlying problem is lifetime issues due to careless use of
device-managed resources.

Specifically, device-managed resources allocated post component bind
must be tied to the lifetime of the aggregate DRM device or they will
not necessarily be released when binding of the aggregate device is
deferred.

The following call chain and pseudo code serves as an illustration of
the problem:

 - platform_probe(pdev1)
   - dp_display_probe()
     - component_add()

 - platform_probe(pdev2) 				// last component
   - dp_display_probe()					// d0
       - component_add()
         - try_to_bring_up_aggregate_device()
	   - devres_open_group(adev->parent)		// d1

	   - msm_drm_bind()
	     - msm_drm_init()
	       - component_bind_all()
	         - for_each_component()
		   - component_bind()
		     - devres_open_group(&pdev->dev)	// d2
	             - dp_display_bind()
		       - devm_kzalloc(&pdev->dev)	// a1, OK
		     - devres_close_group(&pdev->dev)	// d3

	       - dpu_kms_hw_init()
	         - for_each_panel()
	           - msm_dp_modeset_init()
		     - dp_display_request_irq()
		       - devm_request_irq(&pdev->dev)	// a2, BUG
		     - if (pdev == pdev2 && condition)
		       - return -EPROBE_DEFER;

	      - if (error)
 	        - component_unbind_all()
	          - for_each_component()
		    - component_unbind()
		      - dp_display_unbind()
		      - devres_release_group(&pdev->dev) // d4, only a1 is freed

           - if (error)
	     - devres_release_group(adev->parent)	// d5

The device-managed allocation a2 is buggy as its lifetime is tied to the
component platform device and will not be released when the aggregate
device bind fails (e.g. due to a probe deferral).

When pdev2 is later probed again, the attempt to allocate the IRQ a
second time will fail for pdev1 (which is still bound to its platform
driver).

This series fixes the lifetime issues by tying the lifetime of a2 (and
similar allocations) to the lifetime of the aggregate device so that a2
is released at d5.

In some cases, such has for the DP IRQ, the above situation can also be
avoided by moving the allocation in question to the platform driver
probe (d0) or component bind (between d2 and d3). But as doing so is not
a general fix, this can be done later as a cleanup/optimisation.

Johan


Johan Hovold (7):
  drm/msm: fix use-after-free on probe deferral
  drm/msm: fix memory corruption with too many bridges
  drm/msm/dp: fix IRQ lifetime
  drm/msm/dp: fix aux-bus EP lifetime
  drm/msm/dp: fix bridge lifetime
  drm/msm/hdmi: fix IRQ lifetime
  drm/msm: drop modeset sanity checks

 drivers/gpu/drm/bridge/parade-ps8640.c   |  2 +-
 drivers/gpu/drm/display/drm_dp_aux_bus.c |  5 +++--
 drivers/gpu/drm/msm/dp/dp_display.c      | 16 +++++++++-------
 drivers/gpu/drm/msm/dp/dp_parser.c       |  6 +++---
 drivers/gpu/drm/msm/dp/dp_parser.h       |  5 +++--
 drivers/gpu/drm/msm/dsi/dsi.c            |  9 +++++----
 drivers/gpu/drm/msm/hdmi/hdmi.c          |  7 ++++++-
 drivers/gpu/drm/msm/msm_drv.c            |  1 +
 include/drm/display/drm_dp_aux_bus.h     |  6 +++---
 9 files changed, 34 insertions(+), 23 deletions(-)

-- 
2.35.1

