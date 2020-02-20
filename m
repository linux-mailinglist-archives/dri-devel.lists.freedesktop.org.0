Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CFF16629A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 17:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50B76EDE1;
	Thu, 20 Feb 2020 16:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A8F6EDC3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 16:28:04 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id u6so5398608wrt.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 08:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4L5pErhEaYa7J2GkK43QrlafHtSEfJ6mEB5MQxQaGdU=;
 b=flSVXLW8+HCvS8lAoJdppN6qT5tWnzrNaEvEDnJmCgXcC2tk9cOjdv39eJrYBTrce6
 EE/1vV9CN8QbXXJsX0KSgeSB2gmE+JqHk9DjtSAUBjiL7T1KieNxc7BkDooT9hlfc32z
 Uoi7JJddr44DQ+YGv+YisVbx4co+nwyfkwRUHk+vsmmqGdilfxBKTuc6WKWpLbN6r6b0
 08mfBvTjdJmVCPuNVGCt3gzrs8JFmo2tI27Ped5uetie25Z8Bx+0kqR3Qp8WGFcfTdfl
 7derxVfCJGNu99SNb4n+lADjOUAjezljlLhQjh9H4Gm2LsMu9SILZx0lw+bn9TkZDCU9
 rstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4L5pErhEaYa7J2GkK43QrlafHtSEfJ6mEB5MQxQaGdU=;
 b=eGorgryBtYQM5V0SiWkn5e8hnZmgalT7nzkWGxPJ8g02Aj7UQ/hYXD3rgsORjqA5un
 6v2YhZLWIviflcWadLpNnsvh71HrF9+o63UH1mQI583sD4X7NkON6zUNFHOlQ/Gh7S+e
 Kf19niYRJeS5OA1s7M+oR9GMee0uwMeUvTFm0/r2gwR53uZ8/aGadwdfA0EpLKS2NUb3
 KwaN1OiD7Ae6e5/HYxo/7KQd915EocFHjXwjNvi+ED6Xu+T8o6L5QHRUnl6ZbNBJAcKl
 u/43AHAo8aSgNKBFvLI2pxMypZ9vvjiSCKPEKlgUlYmTpeJLOoY1pRswJ6iIfc/GLCs+
 jOrw==
X-Gm-Message-State: APjAAAX06xuuNqnt7WtH+WkKxy7YjEQL7Vuk08Kr3qWN6P8yEi6evp3i
 W6K9kXlqXN7IpoTOrzrywPfISg==
X-Google-Smtp-Source: APXvYqz8btEuioC58lPL2CALueebDz5VNXjtrpbgzakzF4p5lCTfG1eLu+ErlTVF5foqpDnbiJSStA==
X-Received: by 2002:adf:f14b:: with SMTP id y11mr20564948wro.90.1582216082632; 
 Thu, 20 Feb 2020 08:28:02 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c15sm104164wrt.1.2020.02.20.08.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 08:28:02 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/meson: add Amlogic Video FBC registers
Date: Thu, 20 Feb 2020 17:27:56 +0100
Message-Id: <20200220162758.13524-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200220162758.13524-1-narmstrong@baylibre.com>
References: <20200220162758.13524-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the registers of the VPU VD1 Amlogic FBC decoder module, and routing
register.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_registers.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
index 8ea00546cd4e..f784d7d1fe2e 100644
--- a/drivers/gpu/drm/meson/meson_registers.h
+++ b/drivers/gpu/drm/meson/meson_registers.h
@@ -144,10 +144,15 @@
 #define		VIU_SW_RESET_OSD1               BIT(0)
 #define VIU_MISC_CTRL0 0x1a06
 #define		VIU_CTRL0_VD1_AFBC_MASK         0x170000
+#define		VIU_CTRL0_AFBC_TO_VD1		BIT(20)
 #define VIU_MISC_CTRL1 0x1a07
 #define		MALI_AFBC_MISC			GENMASK(15, 8)
 #define D2D3_INTF_LENGTH 0x1a08
 #define D2D3_INTF_CTRL0 0x1a09
+#define VD1_AFBCD0_MISC_CTRL 0x1a0a
+#define		VD1_AXI_SEL_AFB			(1 << 12)
+#define		AFBC_VD1_SEL			(1 << 10)
+#define VD2_AFBCD1_MISC_CTRL 0x1a0b
 #define VIU_OSD1_CTRL_STAT 0x1a10
 #define		VIU_OSD1_OSD_BLK_ENABLE         BIT(0)
 #define		VIU_OSD1_OSD_MEM_MODE_LINEAR	BIT(2)
@@ -365,6 +370,23 @@
 #define VIU_OSD1_OETF_LUT_ADDR_PORT 0x1add
 #define VIU_OSD1_OETF_LUT_DATA_PORT 0x1ade
 #define AFBC_ENABLE 0x1ae0
+#define AFBC_MODE 0x1ae1
+#define AFBC_SIZE_IN 0x1ae2
+#define AFBC_DEC_DEF_COLOR 0x1ae3
+#define AFBC_CONV_CTRL 0x1ae4
+#define AFBC_LBUF_DEPTH 0x1ae5
+#define AFBC_HEAD_BADDR 0x1ae6
+#define AFBC_BODY_BADDR 0x1ae7
+#define AFBC_SIZE_OUT 0x1ae8
+#define AFBC_OUT_YSCOPE 0x1ae9
+#define AFBC_STAT 0x1aea
+#define AFBC_VD_CFMT_CTRL 0x1aeb
+#define AFBC_VD_CFMT_W 0x1aec
+#define AFBC_MIF_HOR_SCOPE 0x1aed
+#define AFBC_MIF_VER_SCOPE 0x1aee
+#define AFBC_PIXEL_HOR_SCOPE 0x1aef
+#define AFBC_PIXEL_VER_SCOPE 0x1af0
+#define AFBC_VD_CFMT_H 0x1af1
 
 /* vpp */
 #define VPP_DUMMY_DATA 0x1d00
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
