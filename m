Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8EBB26464
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 13:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4B810E84F;
	Thu, 14 Aug 2025 11:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="GbdnvxO0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B52D10E866
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 11:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
 bh=rY14a9yxr74FB40Vw1Xff3ggg57AOflGxQdWJpiKAyY=; b=GbdnvxO08omcS58zsZHNsk1UjZ
 lTxFF7gdWMXqUVGdOtDTYQ+JX0wE2839OKs2Jxyai+lwc66cJZWw74XR3OWf3OBiPxLdbDqVZp2Rt
 LEYd9l5g0Eh/9nNpqnVm4MmaNzY2ibBBLwCJKUl6Z290vqvFsUAeNB4+52bFhMU4l53R8cc208ua1
 IIEaLfo8Ee3sxO6PL6qFy+E18nJq6Whiwo+VG0n+PUnLBBvxZ/1eDayPKJFgvMsGd1+HuUB/RRwgh
 mNS4BO/IPC7XME5edAeeAXPEboqXq6dkYrjiSKczIYWeEnrFBcNu23Y6vuBhNXeQvazKBPPOFjroY
 wv9ukb5A==;
Received: from i53875b38.versanet.de ([83.135.91.56] helo=phil..)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1umWEz-0003Km-JV; Thu, 14 Aug 2025 13:35:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: tomeu@tomeuvizoso.net
Cc: ogabbay@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, heiko@sntech.de
Subject: [PATCH 2/2] accel/rocket: Depend on DRM_ACCEL not just DRM
Date: Thu, 14 Aug 2025 13:35:19 +0200
Message-ID: <20250814113519.1551855-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250814113519.1551855-1-heiko@sntech.de>
References: <20250814113519.1551855-1-heiko@sntech.de>
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

With the current dependency on only DRM, a config of

CONFIG_DRM_ACCEL_ROCKET=y

is possible, but of course wrong, because without DRM_ACCEL the build-
system will never even enter drivers/accel/* .

So depend on DRM_ACCEL instead of just DRM.

Fixes: ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/accel/rocket/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/Kconfig b/drivers/accel/rocket/Kconfig
index af6cda273892..16465abe0660 100644
--- a/drivers/accel/rocket/Kconfig
+++ b/drivers/accel/rocket/Kconfig
@@ -2,7 +2,7 @@
 
 config DRM_ACCEL_ROCKET
 	tristate "Rocket (support for Rockchip NPUs)"
-	depends on DRM
+	depends on DRM_ACCEL
 	depends on (ARCH_ROCKCHIP && ARM64) || COMPILE_TEST
 	depends on ROCKCHIP_IOMMU || COMPILE_TEST
 	depends on MMU
-- 
2.47.2

