Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E85887AB9B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 17:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD3F10EAA4;
	Wed, 13 Mar 2024 16:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tiTMbvmK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044E010E927;
 Wed, 13 Mar 2024 16:44:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5EA6E614A1;
 Wed, 13 Mar 2024 16:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0640C433F1;
 Wed, 13 Mar 2024 16:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710348252;
 bh=hu6DpvE5WrtXLVtktC2RDOr1HzwCQFEFXKkD6CCXoEY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tiTMbvmKsyx73w93QN46IBb2DHWPyCDhJne0/OXUI93WUuu8GYWMh4rALJ94WrhDP
 2WgG2A221GyBBoNi2aWVhvfTtJLxvqVAIN6wdoGd4u+FccgB772Kh8gVWQjYo/HSN8
 obGqFzUrEBNJVdvsPdJUkHpK9feCq7n9kYwo7VUC8fdL96HvKpVbbCA++qr782BkUl
 RRAo71ipEk7P3TxmY5bn7KcWAWhcxtrqlZo6k6IsV7/kwZldlzlNd8Ec79ScfBZDOI
 cSHmgkHo+ClUz4L9C7HDxiG+2+P+wUB996/Sz/xLhANkWP2ynLBlL2LWIw4d5fWdd0
 ZTt79M+XF0wJg==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan+linaro@kernel.org>) id 1rkRiG-0000000062D-0QH9;
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
Subject: [PATCH 2/2] drm/msm/dp: fix runtime PM leak on connect failure
Date: Wed, 13 Mar 2024 17:43:06 +0100
Message-ID: <20240313164306.23133-3-johan+linaro@kernel.org>
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

Make sure to balance the runtime PM usage counter (and suspend) before
returning on connect failures (e.g. DPCD read failures after a spurious
connect event or if link training fails).

Fixes: 5814b8bf086a ("drm/msm/dp: incorporate pm_runtime framework into DP driver")
Cc: stable@vger.kernel.org      # 6.8
Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8e8cf531da45..78464c395c3d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -598,6 +598,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	ret = dp_display_usbpd_configure_cb(&pdev->dev);
 	if (ret) {	/* link train failed */
 		dp->hpd_state = ST_DISCONNECTED;
+		pm_runtime_put_sync(&pdev->dev);
 	} else {
 		dp->hpd_state = ST_MAINLINK_READY;
 	}
-- 
2.43.2

