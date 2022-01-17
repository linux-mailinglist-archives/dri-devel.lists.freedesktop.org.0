Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 363F949011E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 06:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A1C10EAE3;
	Mon, 17 Jan 2022 05:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1B110EAE2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 05:22:03 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id m90so28464296uam.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 21:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0P1WTEs+C+NbyMn3/HlAbUcrz7+Kd9kkvPJ4rg/pU4s=;
 b=psesmIOPOr5OiIVxN1wHFuJUnLekk2YFVaXZamYwh14J7oRo6/pLggWrMKide9+iDp
 YjpQLCMsexC7a2YVtl9qxAoLsn92ZJ/+qT1CdQJ/tlPX2Dk8PfWEq4r61ehGEpr5xZHr
 Bha2INqQ2gaBoFhb/J2kvVauaiVgpDIZxO5F2LbJqRAKmNwfvn/M8NVG3E+H1Z3/QjuC
 J8PCYgAnR4xDUvP82fDAhrLPqsa2Ox9Wa0dp1rq4R5klNhDFM34gYtu0znF2pvS88t/L
 feKsBELWedzI9RGLVe8abvhoV5XEYs8GXUHt4Y6jkOkT6X6shpe220HCljxumu9Jnt1Y
 SjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=0P1WTEs+C+NbyMn3/HlAbUcrz7+Kd9kkvPJ4rg/pU4s=;
 b=NjY7Q1fmfU9g4yvbhHLjm6U3PNU0bVqg9MDUCPTYzZ3SDUvL4mupYbxUPu1ifOsSRk
 OTR0FQXGRu9Va1wco9AC2iqfrWOt2t7HTxzUsN6hzV80f4SKDz84LNR0Nn+8VGxfnb3F
 Pd+Eu/MIrimQRKM7fEt3fR8gdQcMrptLYfzrUbo1hyn72X66dqK/1IPrzI9OCDxhzQHw
 hwGjvhN8DF1QYMJxf02eysda2BcL2tndb6Oy2nLpn0u6xKPafgNE1q0pdQpLUijI22tF
 vvHtTf5ioC3ylq1c3+6oY/PXVWbcvgvDX3IIrT+OjscKX3Z4iLhjAVDGuonezdW6FWta
 Wv7A==
X-Gm-Message-State: AOAM5316/KqZhc1k0HKK8M0t7em4j+elielbW1R35urDlv+ToQX57Gwa
 dAJmg6GwHz9jy9XzsxYY7ol9wZqHOuwhhzOe
X-Google-Smtp-Source: ABdhPJzyeSo2PP/9o8OtEwKETybhzkTyrtMW0L1Rzhtz2OHgwhbKaKuuKx1rGlyv39dxQHOsMLTsVA==
X-Received: by 2002:a05:6102:dcd:: with SMTP id
 e13mr3901912vst.84.1642396922557; 
 Sun, 16 Jan 2022 21:22:02 -0800 (PST)
Received: from kubuntu-desktop.. ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id g5sm3233255vke.6.2022.01.16.21.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 21:22:02 -0800 (PST)
From: Julian Braha <julianbraha@gmail.com>
To: narmstrong@baylibre.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v3] drm: bridge: fix unmet dependency on DRM_KMS_HELPER for
 DRM_PANEL_BRIDGE
Date: Mon, 17 Jan 2022 00:21:46 -0500
Message-Id: <20220117052146.75811-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.32.0
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
Cc: robert.foss@linaro.org, fazilyildiran@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 jagan@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When DRM_CHIPONE_ICN6211 is selected, and DRM_KMS_HELPER is not selected,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for DRM_PANEL_BRIDGE
  Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && DRM_KMS_HELPER [=n]
  Selected by [y]:
  - DRM_CHIPONE_ICN6211 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && OF [=y]

This is because DRM_CHIPONE_ICN6211 selects DRM_PANEL_BRIDGE
without depending on or selecting DRM_KMS_HELPER,
despite DRM_PANEL_BRIDGE depending on DRM_KMS_HELPER.

This unmet dependency bug was detected by Kismet,
a static analysis tool for Kconfig.
Please advise if this is not the appropriate solution.

Fixes: ce517f18944e ("drm: bridge: Add Chipone ICN6211 MIPI-DSI to RGB bridge")
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
v2:
- changed from "select" to "depends on"

v3:
- new line now uses tabs instead of spaces.

 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 61db5a66b493..a1b52eaf26e0 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -30,6 +30,7 @@ config DRM_CDNS_DSI
 config DRM_CHIPONE_ICN6211
 	tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
 	depends on OF
+	depends on DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL_BRIDGE
 	help
--
2.32.0
