Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1061912AF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 15:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B7389C86;
	Tue, 24 Mar 2020 14:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449A789BC2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 14:20:27 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v25so1545009wmh.5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 07:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sBEY6IZdpR56nXsPUK2cFqYc8DeNfrXDbwpY0flDUNU=;
 b=Ujq4taOC53EX1VPxJIgX0apsuybWLHZBAKegJRrf/6iNtbxxaFxidGswTmXhcSbMeS
 5Xw3ZVu/LmLaXCJcuW8EMPuv9z7UYqeNNGxgLAQ6VinOKxZvBF/JnMPnZMfv87Rd4h5x
 QI1vyPTYzCjWy/FZgINt6zQKZQd/3dhqTrXo6uDt5z1xtyg5B7IY9IoQ53kXeZwpBs4L
 qcEzw7jIKeAWHn1oyzhZHE1t2mkKVCEZSRS+Lm9l6zcwA1TCayaFEaU7efzyfrGQKe/h
 srTZdxNIRvztfg6C9z37mIq4oy5+ODSMBiID77DGBu3wnQ9RmzjIbGgcHiF/ptrkmn+J
 h/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sBEY6IZdpR56nXsPUK2cFqYc8DeNfrXDbwpY0flDUNU=;
 b=nMpMd+M2DJDWdkun6U9Wy/iPkn6ARQs3xtUTI0bIXhF+I1aEMKnAuMM8QzzNsLW4wB
 oOgGj31F4jI2MVEC0vp32fXGpMMOV1zmIB6/A7kd0wsoQ+hwYEjUIdlwuCPr9NxOJ008
 rAj336LKkm7Qvv3t0nT2jK0EIK44ApyvbQvQBYOBw8UNsho/r5fqWn1FbOGesBZMzALI
 ax6Uh3/hX9FlMJPegB++3whzm/W+0N5i2Ja3hRFHq9N6RGj4jbG5Tulq/dLqj3ZjKCMX
 xd/UwcHEu/9kv2Ys2PyF+mOynF23so0bGh08v1ym1mTeaIvYFbc0YWUMzwHe9s3M28td
 nGFQ==
X-Gm-Message-State: ANhLgQ2/e3A6JKQzBVCkxLsOhbUTwrfHDHwEqM8H/9Yn1e/BftUOhwaT
 co+djAFBLQgss/OA2YWLmvJWxA==
X-Google-Smtp-Source: ADFU+vvOnCjmbsfdy/PDaPF1ocXefI+ISW1golVVq0SNsJU1J64MUUy13XNRUmg4TPFrYbXH1WjhsQ==
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr4817627wmi.1.1585059625706;
 Tue, 24 Mar 2020 07:20:25 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o4sm28688472wrp.84.2020.03.24.07.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 07:20:25 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/7] drm/meson: add Amlogic Video FBC registers
Date: Tue, 24 Mar 2020 15:20:11 +0100
Message-Id: <20200324142016.31824-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200324142016.31824-1-narmstrong@baylibre.com>
References: <20200324142016.31824-1-narmstrong@baylibre.com>
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
Cc: mjourdan@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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
index 8ea00546cd4e..08631fdfe4b9 100644
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
+#define		VD1_AXI_SEL_AFBC		(1 << 12)
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
