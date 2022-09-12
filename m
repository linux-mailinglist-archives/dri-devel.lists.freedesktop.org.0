Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801D35B5D79
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 17:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E85A10E5B9;
	Mon, 12 Sep 2022 15:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4A610E5AC;
 Mon, 12 Sep 2022 15:41:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97058B80DCA;
 Mon, 12 Sep 2022 15:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF884C43140;
 Mon, 12 Sep 2022 15:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662997286;
 bh=9CE7orcQkUcjA2k8uttjXrckagCUwwToGrdo8aBWuGI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QWQzktamSYNI5dM48LjRFqP8L5Np9Evcoq5crLoCkgyRtUoFHbo7nT6bEZ9ItPidp
 lze49PbVlrBUVj3HdnyJ98d2wt70bcEMD20lOFwzLruTE/ZRJfmb1rCB6PvP4b6Wre
 g5zYx1CwzE5d7ozHzsdQQfjDDiVzEO8yilhgOm68s+SLADm9E6cKZ5TeNDjy2rZ+yV
 sG9I9nna3xrBYzGYuDtD6p42DUPWYmzEqTZqbDdSQ2V9RCkox21933VTFFNVrErHpP
 l0TVofnMFhmVKRBKMvyYnWL68Y1BW8O30uVi9hYDAI/oPipp3Vpg2xR97HaYgVPkDz
 OuBIUgHmU/Vug==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1oXlYp-0003Mo-5V; Mon, 12 Sep 2022 17:41:23 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH 1/7] drm/msm: fix use-after-free on probe deferral
Date: Mon, 12 Sep 2022 17:40:40 +0200
Message-Id: <20220912154046.12900-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220912154046.12900-1-johan+linaro@kernel.org>
References: <20220912154046.12900-1-johan+linaro@kernel.org>
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
 stable@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bridge counter was never reset when tearing down the DRM device so
that stale pointers to deallocated structures would be accessed on the
next tear down (e.g. after a second late bind deferral).

Given enough bridges and a few probe deferrals this could currently also
lead to data beyond the bridge array being corrupted.

Fixes: d28ea556267c ("drm/msm: properly add and remove internal bridges")
Cc: stable@vger.kernel.org      # 5.19
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 391d86b54ded..d254fe2507ec 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -241,6 +241,7 @@ static int msm_drm_uninit(struct device *dev)
 
 	for (i = 0; i < priv->num_bridges; i++)
 		drm_bridge_remove(priv->bridges[i]);
+	priv->num_bridges = 0;
 
 	pm_runtime_get_sync(dev);
 	msm_irq_uninstall(ddev);
-- 
2.35.1

