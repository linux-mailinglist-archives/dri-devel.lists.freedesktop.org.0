Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B386D249CC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 13:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6861910E74C;
	Thu, 15 Jan 2026 12:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="H+qVKlxp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489F610E00C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 12:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K3lmc7QEyNt/iSe2ODLygHtjHQBoDIO0I37oJkE79MM=; b=H+qVKlxphWxcb3chARcMSLAECf
 PIvOwKHhGaGplVXw9jQaAcBM1cz6uOCt9PundnON4Y+42LePTM4SV96A8vx/wOIY7hbF9cr0Q40mx
 dezAcvUUgzjuw5/Qxo29Otsr2H6SRExDeqLIBuufOnnlKLkzDyEmRFFJ62SXrkYP4td7t9Bw4Dutu
 CMwzwC0WSAoOelB+zruI2aHddRMDO+WCT0+z1GeXRmC1S46ewnuTi3a+bi2aiwo0V2XY64aYW2KRK
 /++RwjQTOF2+/abNCRt0P16tTtqN1usZ1/O/lj8mcNhd+oYUcq+zWDh+ey9SOIbyRhmKSzoE56G0K
 9KZANlXQ==;
Received: from [187.36.210.68] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__CHACHA20_POLY1305:256)
 (Exim) id 1vgMpK-005jkF-8M; Thu, 15 Jan 2026 13:51:50 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH] drm/panel: ilitek-ili9882t: Select DRM_DISPLAY_DSC_HELPER
Date: Thu, 15 Jan 2026 09:50:48 -0300
Message-ID: <20260115125136.64866-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The panel-ilitek-ili9882t driver uses drm_dsc_pps_payload_pack() which
is provided by the DRM_DISPLAY_DSC_HELPER. Add the missing Kconfig
select to fix the following build error:

  ERROR: modpost: "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/panel-ilitek-ili9882t.ko] undefined!

Fixes: 65ce1f5834e9 ("drm/panel: ilitek-ili9882t: Switch Tianma TL121BVMS07 to DSC 120Hz mode")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/panel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index a0fe6069e5e4..ae25f003aa33 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -280,6 +280,7 @@ config DRM_PANEL_ILITEK_ILI9882T
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DSC_HELPER
 	help
 	  Say Y if you want to enable support for panels based on the
 	  Ilitek ILI9882t controller.
-- 
2.52.0

