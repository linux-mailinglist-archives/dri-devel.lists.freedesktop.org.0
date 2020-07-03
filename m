Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A312135CE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 10:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1664A6EA12;
	Fri,  3 Jul 2020 08:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7F56EA17
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 08:07:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f139so33101671wmf.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 01:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+8L2ymad7uoE5dUtck9cxUKwpycxjoxw6UPplO4++sw=;
 b=cA7HaW9ozERboAuFN1YKyL0eJ9qTEfjabd73QLZYCr8JYx4MDRAY4sr1CrwKxd7e+0
 +2qaUWTyjHD2UNG5edk+loEfOfALbhN42YcMZ/HzDyzRfYTcE3DWKeECrUeImTL7sw92
 peWipbKkC0KxjjZhFz9PrenW0V/O8wWfGbqQAbdzpq3Qhh1rssa2psDvVD55QUHEgwNR
 S8c2J0nmpdi7VQ9sA2PLt8EWyzDUaevnN/BQXHjDxCA3GiJ38FzcoHPP7SYKwtvBy21M
 14LF6HL1WcbbI0QlLreutc0zQ6IazLYgG0CmG8GuCLt5n+UiUF06HupOpCYd+oGaLN7H
 RAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+8L2ymad7uoE5dUtck9cxUKwpycxjoxw6UPplO4++sw=;
 b=qV7CYJoLLImnFN8LqPiY3tagFnbZBrnlcvd1wmVTzdrCYtnGekEH/ukMyX+gXVCi0q
 lCo5uQCSIMcbHuy8i9lWBp0RZMgHJTaQwL8hweNNVngSLGWI1CE+T76U46/zwjScBdxg
 IRqP6gazp/UgB9VegZkVHPamDWYBI/o4SX6Z3aaWaLgJf+xWcIkWpv9E3/a5lDejb0Bq
 ernDFZPqwBL0x09JoRpJZezvTaK8oitPwmIRaeIlRtA55Ltz1IXxIYgTZTIyR6JqJY1D
 Mnc+pzzMk6QGyFnkfuHIBai5/kuORuHmruvb+Yo1lChyWezu98dL4U3C1QW/eIIVBOLo
 98rA==
X-Gm-Message-State: AOAM532wnjI7g6BNtURvCxiKJs5ONEzEojzNSR5E6+/tBjqH0xBCRjbW
 MZqSWTMvC138apAiWDz+gN7tyA==
X-Google-Smtp-Source: ABdhPJxFqjpvl3b0UJve6c0iOJ4MjwZ0scn2Vk9ofpstuBtdKJs4JuNzymRK6MsAmFbBysjHmny/RQ==
X-Received: by 2002:a1c:a70d:: with SMTP id q13mr34051103wme.55.1593763660377; 
 Fri, 03 Jul 2020 01:07:40 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:6959:e617:6562:cabf])
 by smtp.gmail.com with ESMTPSA id 1sm12682403wmf.0.2020.07.03.01.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 01:07:39 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 2/6] drm/meson: add Amlogic Video FBC registers
Date: Fri,  3 Jul 2020 10:07:24 +0200
Message-Id: <20200703080728.25207-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200703080728.25207-1-narmstrong@baylibre.com>
References: <20200703080728.25207-1-narmstrong@baylibre.com>
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
Cc: jianxin.pan@amlogic.com, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the registers of the VPU VD1 Amlogic FBC decoder module, and routing
register.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
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
