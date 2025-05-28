Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E462AC7A6C
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 10:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE17310E046;
	Thu, 29 May 2025 08:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b="mJX0QcR6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377AA10E63E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 15:43:26 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so246715e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 08:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems-org.20230601.gappssmtp.com; s=20230601; t=1748447005;
 x=1749051805; darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6yl6vUzUKKmJBwsdJArAjkBP/TBHxNgwshqS0VE0gt4=;
 b=mJX0QcR6YyETwQ11AzVsK2064oUni1eY9FXrPsxqW3zeQ3qeRYLSjQvpIqqoPJ8vbb
 pf4NhfYR+t+k+49NwVCKzuaKHivWgcSS/osaUMg1KerCC9xTULDFUfL9SPKKYtL4+tZr
 yYCDvz2u2cACL9ZBLwgwf6Plz3yS6MriVY8vsqqFzupcW9XepJCI0UeBEbll5QuVGluM
 bSsV5weVriallYGzwhPJRPv5gJxNoieXJFpdaBvgXbK8tTbIKFNp+owJ8qbqf/TZZZR2
 0q74ubvtwCtZBAk3OdSLAYC8Dsf84dZn7iaw7vo45cmPFJmqahabqmz+rPFB2txeC63J
 meKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748447005; x=1749051805;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6yl6vUzUKKmJBwsdJArAjkBP/TBHxNgwshqS0VE0gt4=;
 b=aBTOL/DIg6tgLRWmMzPWtsY+f60hc0OV6px4NsLny4VMN/h7saaX95rwcLlUD9PbyA
 oVUeiaYSon6bND8CD+ovprQDWF5LDMuFcGnEZiR+h9EgLSOOfMM0MmKVdUDMd9UhOoyg
 sXxA12DjOzy9lajIE+y5yjoUO7g3Q44ViyHewPv3zDtIHvzJEBw3snqNFb68H4srp5qV
 /QJuGhzy9U9yZMp6Cndbdfhw54QgFgkt/W04JwLVLyBjTBuUFbTB6vSWzj2enikuznBb
 BFGTbrgVY6zJit8/QAhvlNkU8yOgS4sCvT1zyJvfEFYfIWVP1RmAOiK9q8PujIJAcTbG
 DkvQ==
X-Gm-Message-State: AOJu0YwLrNO/3GCAvd4trW0odvVkyIszXZfYQdyhOjBtMuYpIPEjyIf2
 ZpiEsxTWtMdkuphd3Z7duh7Cr/L22mVc+LlwWV3NbUkky1a9S0fmbTHiK1CKhIrSX9E=
X-Gm-Gg: ASbGnct+uUj5ZjyJpk9NSj8cv2Op/tFZmObecBwjQOUAr2WzTAjaqrXT1WTQsu8fHQ6
 NW73GIsiF6LKxO4aqg1ebbsMOkRhCWceKC1T/sPMtipkws0FX7VZ/I1RATcB2dIAZSRY3NTtgH6
 5pr+pubZbL5iom6D/AvBvsgBM2+AMQ82rwuUDAwazz2vLjUk8KoNdjxKdcirQp3HK2yUBk2jAQk
 k0KvfSmG3S6IaGWGRBE8LLNs0ys0uaL7bN8F8zpHAzgaL7eX05XruwcjGt+Hx3zBrDRBHTHgkBo
 ZT4qZz0C1ctaXFIG6BsoSOEn0JOhxQVDwYC+NaBQPl/ZmIXYkw2EnbI20JlrtH9+a6Apy1uY+Fu
 bI+H0ZUu3H8FV84vtuslG9mjdaWuMMFl1t7v2VFaBwdo=
X-Google-Smtp-Source: AGHT+IFbbv0BZAtT3+HnJDyyTNgCMRJZb9KZLNLH4dIHpFGSJZsnxop7uFuUlZaFtez53aVT2kI+Hg==
X-Received: by 2002:a05:600c:6214:b0:43c:e467:d6ce with SMTP id
 5b1f17b1804b1-44cc05358b3mr170613645e9.4.1748447004994; 
 Wed, 28 May 2025 08:43:24 -0700 (PDT)
Received: from [10.0.12.41] (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4eacd6f1bsm1769856f8f.80.2025.05.28.08.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 08:43:24 -0700 (PDT)
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Date: Wed, 28 May 2025 17:42:30 +0200
Subject: [PATCH] staging: fbtft: add invert display parameter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-ili9341-invert-dtb-v1-1-080202809332@openpixelsystems.org>
X-B4-Tracking: v=1; b=H4sIAOUuN2gC/x3MTQqAIBBA4avErBswS/u5SrSoHGsgLFQiCO+et
 PwW770QyDMFGIoXPN0c+HQZVVnAus9uI2STDVJIJZTskA/u66ZCdjf5iCYuKNpZaaVJG2sgh5c
 ny88/HaeUPolD9bRkAAAA
X-Change-ID: 20250528-ili9341-invert-dtb-07a5656e6dfd
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Bram Vlerick <bram.vlerick@openpixelsystems.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2995;
 i=bram.vlerick@openpixelsystems.org; h=from:subject:message-id;
 bh=BMRUJzr0/HLa3ogV5/HusC1YamEdyusN8YfIZyUZixE=;
 b=owEBbQKS/ZANAwAIAblauka9BQbwAcsmYgBoNy8chB2y8w5nbK9+RztKsMs3unwb1aVwo2U36
 FwTbirKHOeJAjMEAAEIAB0WIQQO7PtG7b77XLxuay25WrpGvQUG8AUCaDcvHAAKCRC5WrpGvQUG
 8GvpD/9SsZFzhvQs0gQHp72J5bWBgaHGOAaSW43Xne+PZMAjdUCH4O23F2Syc387TEDUe/FTeWZ
 kp5HtOO3HdadO8z0wT6nXXINzJfFLkXufNXmxFbHQ8x2VuSGTlIKYhuzla4BlFV+dJJ60/83RRX
 DKADQ1s4itlnkqEVyeD3cJad734FHh6ZjaqG7sZobZxqcZcGRO7LBBO2SSveqlUZO502Tp9b0MM
 LHZwjVFPUcDWZpBoJZUTg0Bw5calTX2Mh/Ibwzr1yERYLUO01KqWi2/01IGvu01G3ucNGq0RR2A
 n7LHuRVOZkJFaBjUx2XPi7bPBYD47fgBMRT5/uIeCM5gh/W/DXFUU+t6j5A6vOE7SF61jWbGrsY
 wBC3xLx+WDXCvrFhj9xAmV5L+TRjvCEWIsuOy7q88ge/SI7t4d913AWKAEvdvhnhllg+mOSH7Dc
 BZOo5wTDep2WxoScD9VgeqMv4v8QwkOGCv9H1fDhWZY1fxNCwvpQU9bH111ZD8aSHZPAEHgTdQN
 eKx6hZNtBFIjq40TAQ5zQnGnAa2NfisLBqVqKAFgaqFahnwB3bRj6EXC4ME4wuCKH1g2O8+xQKY
 LLKmSqiMsu+UM56ihNwxQ4hVpy5WeDercM0s+Fc2UdFzPNnzrSr1G4BS1YhpzNousCBK7vnlKwX
 dOZ+YVluePM0Drg==
X-Developer-Key: i=bram.vlerick@openpixelsystems.org; a=openpgp;
 fpr=0EECFB46EDBEFB5CBC6E6B2DB95ABA46BD0506F0
X-Mailman-Approved-At: Thu, 29 May 2025 08:52:55 +0000
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

Add devicetree parameter to enable or disable the invert feature of the
ili9341 display

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
---
 drivers/staging/fbtft/fb_ili9341.c | 3 +++
 drivers/staging/fbtft/fbtft-core.c | 2 ++
 drivers/staging/fbtft/fbtft.h      | 3 +++
 3 files changed, 8 insertions(+)

diff --git a/drivers/staging/fbtft/fb_ili9341.c b/drivers/staging/fbtft/fb_ili9341.c
index 47e72b87d76d996111aaadcf5e56dfdfc1c331ab..a184f57df12b5ad6612a2e83b664a8911c7c79be 100644
--- a/drivers/staging/fbtft/fb_ili9341.c
+++ b/drivers/staging/fbtft/fb_ili9341.c
@@ -103,6 +103,9 @@ static int set_var(struct fbtft_par *par)
 		break;
 	}
 
+	if (par->invert)
+		write_reg(par, 0x21);
+
 	return 0;
 }
 
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index da9c64152a606dc4a176f5a37fa59f6a7d3a2af3..4e827e9899e32313f2e4a9bf12ff49283a63fed3 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -641,6 +641,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	par->buf = buf;
 	spin_lock_init(&par->dirty_lock);
 	par->bgr = pdata->bgr;
+	par->invert = pdata->invert;
 	par->startbyte = pdata->startbyte;
 	par->init_sequence = init_sequence;
 	par->gamma.curves = gamma_curves;
@@ -1107,6 +1108,7 @@ static struct fbtft_platform_data *fbtft_properties_read(struct device *dev)
 	pdata->display.bpp = fbtft_property_value(dev, "bpp");
 	pdata->display.debug = fbtft_property_value(dev, "debug");
 	pdata->rotate = fbtft_property_value(dev, "rotate");
+	pdata->invert = device_property_read_bool(dev, "invert");
 	pdata->bgr = device_property_read_bool(dev, "bgr");
 	pdata->fps = fbtft_property_value(dev, "fps");
 	pdata->txbuflen = fbtft_property_value(dev, "txbuflen");
diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 317be17b95c1672404fc6aecda24d0a1f563685d..71c9c35e7548de314088ac3aeb160d6c6aaf75c9 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -125,6 +125,7 @@ struct fbtft_display {
  * @display: Display properties
  * @gpios: Pointer to an array of pinname to gpio mappings
  * @rotate: Display rotation angle
+ * @invert: Invert display colors
  * @bgr: LCD Controller BGR bit
  * @fps: Frames per second (this will go away, use @fps in @fbtft_display)
  * @txbuflen: Size of transmit buffer
@@ -135,6 +136,7 @@ struct fbtft_display {
 struct fbtft_platform_data {
 	struct fbtft_display display;
 	unsigned int rotate;
+	bool invert;
 	bool bgr;
 	unsigned int fps;
 	int txbuflen;
@@ -229,6 +231,7 @@ struct fbtft_par {
 	bool first_update_done;
 	ktime_t update_time;
 	bool bgr;
+	bool invert;
 	void *extra;
 	bool polarity;
 };

---
base-commit: 914873bc7df913db988284876c16257e6ab772c6
change-id: 20250528-ili9341-invert-dtb-07a5656e6dfd

Best regards,
-- 
Bram Vlerick <bram.vlerick@openpixelsystems.org>

