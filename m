Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8588A5B2EAF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7884810EBDB;
	Fri,  9 Sep 2022 06:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA24610EB44
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 15:53:00 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e16so7583012wrx.7
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 08:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mathembedded-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Id2LT9k8G/ueokdbdHl7YXqytu8/y6ruSySCO+cIye4=;
 b=FbGJ0HnY4ZWiobqMTTrJue3DCqjoaHBrQak+nZQCY+tJLvNVkKIwjOui5eJjViNsui
 uQAe+7gXaPenOLZjT5PvgVgaJx8IVvUBgn13j6h8ZykUi+HvID7YFTqvb9uBJaaWhV/E
 VUwv3Oy8VJRgZ9rP4FJlaiqSKst4oRigwRG+M4942x6FyBPJURlkrI+GqoJ33QkZaC95
 /yozL6BpULlb5IDwselUfaCAoYm6DqQ0UbxT2NrgTEmyT6LbRAP13aQhohoGp74VqY5V
 nnHxgwYCz2bcPrgIOn2Z7foXQNJp665D0zffWhCbJ0gpeK4FvRQkPsefIsYubuS68euH
 pKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Id2LT9k8G/ueokdbdHl7YXqytu8/y6ruSySCO+cIye4=;
 b=30w/OZN5qc/uWrXImD3p3pyZxyc7X8IvKiybbTKPm2w2RaTSz9ZWvZ+22UIDk8yYof
 EdkXV4OtjJE4RVlb+s7R2MHAFn0w5uEkdkCelEIob3Su7R9xMjynBlA5BpwySiDl0wAe
 itzqGr+hkZe/TWQDVc+tOw+pCSERoazCSZxIGK0dxBH78CkBLU+8a4VPdY7XaDfZ2fqK
 GxP9b6/5oWRQw0FRmxtOI5wwEgLHaHFQsnHFp3nfrZVJKmoa3OcxnZQLLM+b29IBbCk9
 gOzxAdX1G0ERTGlLQoXpR4veVTKB0M6pwdMRSqqzP0OIWz59m0b6Hj8YeXViVmQb+Lnd
 v44g==
X-Gm-Message-State: ACgBeo31IL3nW1UtbGjpe4Latil7xI2MHWlHvVOTKLGL5sSHrskZ5hye
 xuyNBrG88useLE+RflVzJnfgzA==
X-Google-Smtp-Source: AA6agR6uJvDyNQbO1hDU/VqkhLQhPvaLY4b6d5vG9v7he13nxHtrQpwcSj76LjhNXSy4cKJXysQ0qA==
X-Received: by 2002:a5d:434a:0:b0:21d:aa7e:b1bb with SMTP id
 u10-20020a5d434a000000b0021daa7eb1bbmr5876689wrr.619.1662652379494; 
 Thu, 08 Sep 2022 08:52:59 -0700 (PDT)
Received: from opal.home ([2a00:23c6:200d:d301:4971:140c:41b9:e178])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a05600c3b8d00b003a845621c5bsm3793665wms.34.2022.09.08.08.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 08:52:59 -0700 (PDT)
From: Stuart Menefy <stuart.menefy@mathembedded.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH] drm/meson: Fix OSD1 RGB to YCbCr coefficient
Date: Thu,  8 Sep 2022 16:52:43 +0100
Message-Id: <20220908155243.687143-1-stuart.menefy@mathembedded.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 09 Sep 2022 06:19:19 +0000
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
Cc: Stuart Menefy <stuart.menefy@mathembedded.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VPP_WRAP_OSD1_MATRIX_COEF22.Coeff22 is documented as being bits 0-12,
not 16-28.

Without this the output tends to have a pink hue, changing it results
in better color accuracy.

The vendor kernel doesn't use this register. However the code which
sets VIU2_OSD1_MATRIX_COEF22 also uses bits 0-12. There is a slightly
different style of registers for configuring some of the other matrices,
which do use bits 16-28 for this coefficient, but those have names
ending in MATRIX_COEF22_30, and this is not one of those.

Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
---
 drivers/gpu/drm/meson/meson_viu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
index 51df4de..876ffe0 100644
--- a/drivers/gpu/drm/meson/meson_viu.c
+++ b/drivers/gpu/drm/meson/meson_viu.c
@@ -94,7 +94,7 @@ static void meson_viu_set_g12a_osd1_matrix(struct meson_drm *priv,
 		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_COEF11_12));
 	writel(((m[9] & 0x1fff) << 16) | (m[10] & 0x1fff),
 		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_COEF20_21));
-	writel((m[11] & 0x1fff) << 16,
+	writel((m[11] & 0x1fff),
 		priv->io_base +	_REG(VPP_WRAP_OSD1_MATRIX_COEF22));
 
 	writel(((m[18] & 0xfff) << 16) | (m[19] & 0xfff),
-- 
2.7.4

