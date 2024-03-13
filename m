Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE59A87AB99
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 17:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4F110E75C;
	Wed, 13 Mar 2024 16:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WV98qSgT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED18110E75C;
 Wed, 13 Mar 2024 16:44:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5EA99614B8;
 Wed, 13 Mar 2024 16:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024D5C43394;
 Wed, 13 Mar 2024 16:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710348252;
 bh=qyHUlnlZHD6ThMTuwTmYi7wuWxF1xwykBrdeqrhso6w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WV98qSgT5EpwS3zfY5PwjcpDPq11RqSagwtF1YponA3eRZk9SFceQRttsbz7yG3+L
 35QszWJuKpvomTlNNIS/DU9qHG17AsuH2TPAfJ8TECI/P/uz/cTSz0UF/T8ofIQrTs
 BcM7w0jYXTTkUClUHwtobTUcopmsiuae6kPkd9HkXXaor/k3856VjsjIabzA4pCHPs
 i9J0p/9PYkmrJFuQWTgUaVqpGAfG0IGtJdT0wLcfj5WWl9KiEJWq6BagzFpNqfpfx5
 sWMgg6PVGNhkS1pF1zQctg2QykHcezsZ2rJd0Ei0xCfIpsaSmEN473XFxLIneBu6PX
 sx1kYLW3vD3LA==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan+linaro@kernel.org>) id 1rkRiG-0000000062B-06pu;
 Wed, 13 Mar 2024 17:44:20 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
 stable@vger.kernel.org
Subject: [PATCH 1/2] drm/msm/dp: fix runtime PM leak on disconnect
Date: Wed, 13 Mar 2024 17:43:05 +0100
Message-ID: <20240313164306.23133-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240313164306.23133-1-johan+linaro@kernel.org>
References: <20240313164306.23133-1-johan+linaro@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure to put the runtime PM usage count (and suspend) also when
receiving a disconnect event while in the ST_MAINLINK_READY state.

This specifically avoids leaking a runtime PM usage count on every
disconnect with display servers that do not automatically enable
external displays when receiving a hotplug notification.

Fixes: 5814b8bf086a ("drm/msm/dp: incorporate pm_runtime framework into DP driver")
Cc: stable@vger.kernel.org      # 6.8
Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4c72124ffb5d..8e8cf531da45 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -655,6 +655,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 		dp_display_host_phy_exit(dp);
 		dp->hpd_state = ST_DISCONNECTED;
 		dp_display_notify_disconnect(&dp->dp_display.pdev->dev);
+		pm_runtime_put_sync(&pdev->dev);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
-- 
2.43.2

