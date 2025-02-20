Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363A8A3E8B0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 00:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1032810E9F6;
	Thu, 20 Feb 2025 23:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="DHfx1VNR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0E010E9F3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 23:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eK4Q+gaIL/QDz6EnUoiKhEYDORlBBBWA6cwM5FTMJWU=; b=DHfx1VNRaazraKTN/FWLVGZCpy
 z1l/UskSBoxSdyWKGdBQIVOxFWCazo8EgM97zvh7yvzc9gXxO1gnzbWer374BOM4qps/DO9rh/eAo
 tjVLhlHI7+mTC0xa11E6zThVmfY2rFinw600vsJjzVQvd8YgGb1UWT8Ka69GegAuWLkVJ+zSwC8Ug
 GCFu0SoGzA2cI8yZFJA6rzI1m+NLAWzsJxg+mI1S/jV6jUcTMhjhk5d0+We6BO574D7HqRLjzyvJ0
 9tI5+05x6oJdn5AI4r538D6/N0gdMCU8dltkviQm0Ogs5H8BFYz3580Fee2CFTJ2V51Pkjk/dQWTe
 7phMiwFw==;
Received: from i53875bc0.versanet.de ([83.135.91.192]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tlGAz-0004Wc-0R; Fri, 21 Feb 2025 00:41:53 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: gregkh@linuxfoundation.org,
	heiko@sntech.de
Cc: rafael@kernel.org, dakr@kernel.org, hjc@rock-chips.com,
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de
Subject: [PATCH 2/2] drm/rockchip: Fix shutdown when no drm-device is set up
Date: Fri, 21 Feb 2025 00:41:41 +0100
Message-ID: <20250220234141.2788785-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250220234141.2788785-1-heiko@sntech.de>
References: <20250220234141.2788785-1-heiko@sntech.de>
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

When the drm-driver probes, it mainly creates the component device, where
all the sub-drivers (vops, hdmi, etc) hook into.

This will cause the shutdown handler to get called on shutdown, even
though the drm-device might not have been set up, or the component bind
might have failed.

So use the new component helper to check whether the drm-device is up
and only then call the drm-atomic helper to release all the drm magic.

This prevents failures when the drm-device is never set, or has been
freed up already for example by a probe-defer during the component bind.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 439edc165ff6..285b721ff28a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -484,9 +484,11 @@ static void rockchip_drm_platform_remove(struct platform_device *pdev)
 
 static void rockchip_drm_platform_shutdown(struct platform_device *pdev)
 {
-	struct drm_device *drm = platform_get_drvdata(pdev);
+	if (component_master_is_bound(&pdev->dev, &rockchip_drm_ops)) {
+		struct drm_device *drm = platform_get_drvdata(pdev);
 
-	drm_atomic_helper_shutdown(drm);
+		drm_atomic_helper_shutdown(drm);
+	}
 }
 
 static const struct of_device_id rockchip_drm_dt_ids[] = {
-- 
2.47.2

