Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58FCC0C39F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F91310E347;
	Mon, 27 Oct 2025 08:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mmBi6vaM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3DF10E344
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:06:28 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-592f7e50da2so4747660e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 01:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761552387; x=1762157187; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mG4iS2woxPf+3BthpgnKFGsPtU8cg+2wLUJdaVgtpEs=;
 b=mmBi6vaMJJ61JT+KX9L9Jr3wU36JZj83Mx+XlEMYhacjKEoy51HHmZSVwtmHJB0nk5
 F8krTFTcjINLFOxog8CmM7Ber8TdL/cp9tqifuLTmWzEie7TDBPGjQl9B1jOloK8H7K4
 lE+Nn1Gxi60YyVgKSUGyZYwMs91cqtyiN9pXXC3FCLMmav08oND66URqN8Oo8SVBQPo2
 fALwe1CJYYbvdJrwSO/8GmKRvQbGBbATu66sRe+4Mt5wRl8aELsZgKO81aWDzUHiu05c
 ealP4pPoNfF0ZezLPebsLTxmIlCV7U4CleTxbI+CpPuwx4vW0T9clFr6D32BvX2jKLTi
 wKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761552387; x=1762157187;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mG4iS2woxPf+3BthpgnKFGsPtU8cg+2wLUJdaVgtpEs=;
 b=LuH2xFzwYENQWTVOdM5mDDk00rUde3faolHfD96UBewedKHOVsNVY92tPkMqdzIMrG
 9Zrunn/JKsHSDszaHvfIVuYiyOnpLXg6XUSR9wZExYZBRPjmJXlHwFDHC/K5XRIdhZQB
 BJRIwK0dgPalYNHZzFV0YQe1UqZabht0GicPq+neBwlI06N3jxVNNm2VvDvCzz96M98T
 Om+KtxUOLHTzDqNbwLyqpMEcfPhplnIrh6VanSTE/iv0dExk2gUzYOvQ7iRnpxMM7JM6
 TPnlzYfp9Dw9HEIeNb/gtUMYZKe2L0M73/TzrMGQxlsDK9ZfXlGUKuRm/h8kjB/7VeeJ
 3XIg==
X-Gm-Message-State: AOJu0YxislrQQzNsNHa/5xHOwsLMJqavvUwiiLHmWVZrzHhXLNj8EkRl
 B/ka4usWaQRrqx5hWicikSqrroyOdVEhvultf70M4Kh7QfRGkqItBu54
X-Gm-Gg: ASbGnctlTpLPqaFwX/Q91G3EF0MAWjKPbxo0MhEDXyoJp2Tnh11SLgdOsnDUXNIh6Dk
 h/kg5rMfl8RGxioyqde8NfHtpyFB5Adbz0Fiozbe++3ul7984iwO/zxt/n/0HtMO3hl/g98VumJ
 EXbCycyLKXHa0j390R6RY9AzcOfZiB3Snf2Voggg5Cs0PXy/czQt8k409/AJLjceWQFjhsYYDya
 KSJoUOJZjrba8ts5n8NB6h2nqgHiKp1KBzbxTcYFkGhx4HWQkhpLHyy1eo5MPtMsdh65wQ4W8tv
 A75BOjbbUnDbQlN501wPNUtvwl3PKG5Ux6ex7NV8EnxMpmFtHxMayeqh77EapuiHr6VJ/PkJacj
 5eCG0OElIcHi3YWYe2sF6JYt6UxrbunRRjaDPM7yh3JkZlRjXJSBjD7Ma/AcK2vriPN9ov+dOt8
 D+krvE7EyI9NF7yCzHgwYPJqW/hzTAnxgL7KqM/I5fBSBz
X-Google-Smtp-Source: AGHT+IE7lymUIggT5POZWMrgs3TqPtDu6HHycwtT2bdPZdUD1qE3qAPOhZ/+mLdtO5qNpBF5VygU1g==
X-Received: by 2002:a05:6512:b26:b0:593:7bc:970a with SMTP id
 2adb3069b0e04-59307bc976bmr964639e87.3.1761552386680; 
 Mon, 27 Oct 2025 01:06:26 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41ce8sm2210689e87.6.2025.10.27.01.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 01:06:25 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 27 Oct 2025 09:05:43 +0100
Subject: [PATCH v2 3/6] drm/sitronix/st7571-i2c: move common structures to
 st7571.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251027-st7571-split-v2-3-8352fb278d21@gmail.com>
References: <20251027-st7571-split-v2-0-8352fb278d21@gmail.com>
In-Reply-To: <20251027-st7571-split-v2-0-8352fb278d21@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7890;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=oj5JSSIwffzeqzrjLvw57GX1wzHco1M6GQyX3QdaS3o=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo/yfotsdwL2JDtbBx3/1RqTJkbA+8FY1KPli9n
 I/PzE9iU3yJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaP8n6AAKCRCIgE5vWV1S
 MpvLD/92QqkcZ6aKJTaa83b4u4tqUaO7+BeNnR3XmC3/Kr1Jy4fUBqtKwFIMPLzpeTjvrkUOUZz
 7jX+Gor6w+iiYjZumiEON/PPrRnNUVcCAOdSPpismXuRysLUKXCVB3i4bPs0WEAznRYQ4WsmijS
 dMKVBa5As70LmSeolYw8Rly/1e9Ip/Hg6GcHwdwKfnAxdvLblV/oiwEifTQG2953043a1IeLavI
 WO11TU3SH5qoZW9IyuBEF9Mh9ionSPLoXUHvuyfmg4Qs8fNzaTuafwA98NclvjqdrnIA+TQ+M1q
 S2efMRXlaOUu0jk9bx2v4gxnNMHcJenEFeq579DkC4i3H8wOMWclmgNDYj4g6v1PF/qA8FOLGzg
 wlJ1oQx7pBErIb9UbL+O4LTmqKjgQxpS1mQNsCfXgL+c/qpeFrYQWpOLHCcF8P/5rrcxpESRv8Y
 OT5dR28uAJbZgwpbD5YVnC9sH0QqNojluHEbE36flV7UyS6fI+ngS9IC1IUSyXdz9DdI/gJQV8+
 mSgofGp9osVCY0mcmsptYI1Y/Z+v19U5YwBqX8x8dEgL91sPvVOEaprVkvSDj77uDO2YiSNRvz9
 s+lO9u3GDcYPpxNs7nGHnsNTTv6h2/Q9eHCGnsarlDzahslrNBm57pXI4GQ2ba71qEFM5qCg9PD
 8RA4/YvhX7srcXQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

Move all structures that will be common for all interfaces (SPI/I2C) to
a separate header file.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 MAINTAINERS                           |   1 +
 drivers/gpu/drm/sitronix/st7571-i2c.c |  91 +---------------------------
 drivers/gpu/drm/sitronix/st7571.h     | 108 ++++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+), 89 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc8a7f3f1dabaf402b21f767ecb093a31ade248f..2814faae61eceecae1bccaaf92010e22dca81376 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8083,6 +8083,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/sitronix,st7567.yaml
 F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml
 F:	drivers/gpu/drm/sitronix/st7571-i2c.c
+F:	drivers/gpu/drm/sitronix/st7571.h
 
 DRM DRIVER FOR SITRONIX ST7701 PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index 2b52919d7dd434bb16aa66274eae8730649f62f1..af27658a5e152534d445bc623893eee6b3ca00d5 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -35,6 +35,8 @@
 #include <video/display_timing.h>
 #include <video/of_display_timing.h>
 
+#include "st7571.h"
+
 #define ST7571_COMMAND_MODE			(0x00)
 #define ST7571_DATA_MODE			(0x40)
 
@@ -78,95 +80,6 @@
 #define DRIVER_MAJOR 1
 #define DRIVER_MINOR 0
 
-enum st7571_color_mode {
-	ST7571_COLOR_MODE_GRAY = 0,
-	ST7571_COLOR_MODE_BLACKWHITE = 1,
-};
-
-struct st7571_device;
-
-struct st7571_panel_constraints {
-	u32 min_nlines;
-	u32 max_nlines;
-	u32 min_ncols;
-	u32 max_ncols;
-	bool support_grayscale;
-};
-
-struct st7571_panel_data {
-	int (*init)(struct st7571_device *st7571);
-	int (*parse_dt)(struct st7571_device *st7571);
-	struct st7571_panel_constraints constraints;
-};
-
-struct st7571_panel_format {
-	void (*prepare_buffer)(struct st7571_device *st7571,
-			       const struct iosys_map *vmap,
-			       struct drm_framebuffer *fb,
-			       struct drm_rect *rect,
-			       struct drm_format_conv_state *fmtcnv_state);
-	int (*update_rect)(struct drm_framebuffer *fb, struct drm_rect *rect);
-	enum st7571_color_mode mode;
-	const u8 nformats;
-	const u32 formats[];
-};
-
-struct st7571_device {
-	struct drm_device drm;
-	struct device *dev;
-
-	struct drm_plane primary_plane;
-	struct drm_crtc crtc;
-	struct drm_encoder encoder;
-	struct drm_connector connector;
-
-	struct drm_display_mode mode;
-
-	const struct st7571_panel_format *pformat;
-	const struct st7571_panel_data *pdata;
-	struct i2c_client *client;
-	struct gpio_desc *reset;
-	struct regmap *regmap;
-
-	/*
-	 * Depending on the hardware design, the acknowledge signal may be hard to
-	 * recognize as a valid logic "0" level.
-	 * Therefor, ignore NAK if possible to stay compatible with most hardware designs
-	 * and off-the-shelf panels out there.
-	 *
-	 * From section 6.4 MICROPOCESSOR INTERFACE section in the datasheet:
-	 *
-	 * "By connecting SDA_OUT to SDA_IN externally, the SDA line becomes fully
-	 * I2C interface compatible.
-	 * Separating acknowledge-output from serial data
-	 * input is advantageous for chip-on-glass (COG) applications. In COG
-	 * applications, the ITO resistance and the pull-up resistor will form a
-	 * voltage  divider, which affects acknowledge-signal level. Larger ITO
-	 * resistance will raise the acknowledged-signal level and system cannot
-	 * recognize this level as a valid logic “0” level. By separating SDA_IN from
-	 * SDA_OUT, the IC can be used in a mode that ignores the acknowledge-bit.
-	 * For applications which check acknowledge-bit, it is necessary to minimize
-	 * the ITO resistance of the SDA_OUT trace to guarantee a valid low level."
-	 *
-	 */
-	bool ignore_nak;
-
-	bool grayscale;
-	bool inverted;
-	u32 height_mm;
-	u32 width_mm;
-	u32 startline;
-	u32 nlines;
-	u32 ncols;
-	u32 bpp;
-
-	/* Intermediate buffer in LCD friendly format */
-	u8 *hwbuf;
-
-	/* Row of (transformed) pixels ready to be written to the display */
-	u8 *row;
-};
-
 static inline struct st7571_device *drm_to_st7571(struct drm_device *drm)
 {
 	return container_of(drm, struct st7571_device, drm);
diff --git a/drivers/gpu/drm/sitronix/st7571.h b/drivers/gpu/drm/sitronix/st7571.h
new file mode 100644
index 0000000000000000000000000000000000000000..c6fd6f1d3aa33d6b43330ce8f2cb2d3f2321b29b
--- /dev/null
+++ b/drivers/gpu/drm/sitronix/st7571.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Header file for:
+ * Driver for Sitronix ST7571, a 4 level gray scale dot matrix LCD controller
+ *
+ * Copyright (C) 2025 Marcus Folkesson <marcus.folkesson@gmail.com>
+ */
+
+#ifndef __ST7571_H__
+#define __ST7571_H__
+
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_encoder.h>
+
+#include <linux/regmap.h>
+
+enum st7571_color_mode {
+	ST7571_COLOR_MODE_GRAY = 0,
+	ST7571_COLOR_MODE_BLACKWHITE = 1,
+};
+
+struct st7571_device;
+
+struct st7571_panel_constraints {
+	u32 min_nlines;
+	u32 max_nlines;
+	u32 min_ncols;
+	u32 max_ncols;
+	bool support_grayscale;
+};
+
+struct st7571_panel_data {
+	int (*init)(struct st7571_device *st7571);
+	int (*parse_dt)(struct st7571_device *st7571);
+	struct st7571_panel_constraints constraints;
+};
+
+struct st7571_panel_format {
+	void (*prepare_buffer)(struct st7571_device *st7571,
+			       const struct iosys_map *vmap,
+			       struct drm_framebuffer *fb,
+			       struct drm_rect *rect,
+			       struct drm_format_conv_state *fmtcnv_state);
+	int (*update_rect)(struct drm_framebuffer *fb, struct drm_rect *rect);
+	enum st7571_color_mode mode;
+	const u8 nformats;
+	const u32 formats[];
+};
+
+struct st7571_device {
+	struct drm_device drm;
+	struct device *dev;
+
+	struct drm_plane primary_plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+
+	struct drm_display_mode mode;
+
+	const struct st7571_panel_format *pformat;
+	const struct st7571_panel_data *pdata;
+	struct i2c_client *client;
+	struct gpio_desc *reset;
+	struct regmap *regmap;
+
+	/*
+	 * Depending on the hardware design, the acknowledge signal may be hard to
+	 * recognize as a valid logic "0" level.
+	 * Therefor, ignore NAK if possible to stay compatible with most hardware designs
+	 * and off-the-shelf panels out there.
+	 *
+	 * From section 6.4 MICROPOCESSOR INTERFACE section in the datasheet:
+	 *
+	 * "By connecting SDA_OUT to SDA_IN externally, the SDA line becomes fully
+	 * I2C interface compatible.
+	 * Separating acknowledge-output from serial data
+	 * input is advantageous for chip-on-glass (COG) applications. In COG
+	 * applications, the ITO resistance and the pull-up resistor will form a
+	 * voltage  divider, which affects acknowledge-signal level. Larger ITO
+	 * resistance will raise the acknowledged-signal level and system cannot
+	 * recognize this level as a valid logic “0” level. By separating SDA_IN from
+	 * SDA_OUT, the IC can be used in a mode that ignores the acknowledge-bit.
+	 * For applications which check acknowledge-bit, it is necessary to minimize
+	 * the ITO resistance of the SDA_OUT trace to guarantee a valid low level."
+	 *
+	 */
+	bool ignore_nak;
+
+	bool grayscale;
+	bool inverted;
+	u32 height_mm;
+	u32 width_mm;
+	u32 startline;
+	u32 nlines;
+	u32 ncols;
+	u32 bpp;
+
+	/* Intermediate buffer in LCD friendly format */
+	u8 *hwbuf;
+
+	/* Row of (transformed) pixels ready to be written to the display */
+	u8 *row;
+};
+
+#endif /* __ST7571_H__ */

-- 
2.50.1

