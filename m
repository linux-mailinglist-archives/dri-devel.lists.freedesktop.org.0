Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D396A9C17
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 17:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F13010E70E;
	Fri,  3 Mar 2023 16:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F4E10E70A;
 Fri,  3 Mar 2023 16:48:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7CD83B81990;
 Fri,  3 Mar 2023 16:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395AAC433D2;
 Fri,  3 Mar 2023 16:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677862103;
 bh=1auQdaHF8WrUc2XS2AV/wHeHyXy2dDhMmuSXxxr5tu0=;
 h=From:To:Cc:Subject:Date:From;
 b=GoklBibh4/Qbs4upVxR/GK4zWEOg1WCIoZD55m7JaYPLceyaYc4FKylvxKO8YopRp
 DAYs082pAvbRY2ELGaseX6c8Bpvg2pT/fkMJPZe0oaB72lOJvd+3U1ptrfi1IlQLTf
 Cigeh76hZjACjiWHg97SY25GYfji0FrO1EOEqXSzF7bj2URF/OkOYoUesQsJrSKJ0V
 Z8Uw56J/n6QsOr1Cb+ovuSv/XOC7DUvvK6Wx6XuwE5MOTmvnPxpopf8AobJFciJfZg
 S8ViZ1lXdPiJGtqhfgrhFrUYxSLmxmhUCHVILgfE840YMKPsT05MyogtPH7LA3Yj2T
 TVRKqE8Tvnr9w==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1pY8aU-0003Qa-KA; Fri, 03 Mar 2023 17:48:55 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/4] drm/msm/adreno: fix runtime PM imbalance at unbind
Date: Fri,  3 Mar 2023 17:48:03 +0100
Message-Id: <20230303164807.13124-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As reported by Bjorn, we can end up with an unbalanced runtime PM
disable count if unbind() is called before the DRM device is opened
(e.g. if component bind fails due to the panel driver not having been
loaded yet).

As runtime PM must currently stay disabled until the firmware has been
loaded, fix this by making the runtime PM disable call at unbind()
conditional.

The rest of the series fixes further imbalances in the load_gpu() error
paths and removes a bogus pm_runtime_set_active() call. Included is also
a related indentation cleanup.

Johan


Changes in v2
 - fix the runtime PM imbalance in the gpu load error paths (new)

 - drop the patch removing the pm_runtime_disable() from
   adreno_gpu_cleanup() as this function can currently still be called
   with runtime PM enabled if suspending the scheduler in
   adreno_system_suspend() at unbind fails


Johan Hovold (4):
  drm/msm/adreno: fix runtime PM imbalance at unbind
  drm/msm/adreno: fix runtime PM imbalance at gpu load
  drm/msm/adreno: drop bogus pm_runtime_set_active()
  drm/msm/adreno: clean up component ops indentation

 drivers/gpu/drm/msm/adreno/adreno_device.c | 26 +++++++++++++---------
 1 file changed, 16 insertions(+), 10 deletions(-)

-- 
2.39.2

