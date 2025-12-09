Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF4ACAEDF5
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 05:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4570A10E47E;
	Tue,  9 Dec 2025 04:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i1m5oA02";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DCF10E47E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 04:28:22 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-29555415c5fso59789005ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 20:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765254502; x=1765859302; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DoV8ebquCT6L/RZ0AqbPbGv9Gx9G1WrRRbUTSZpd9fE=;
 b=i1m5oA02OjhUPkGpkkp+No28AlzUacZ+CLps4U1rPDICoUlXcmztsNiTZhXLP18qAW
 2ky7CgCAOmm5qukGFhrZWPhlaGMIF/n/T3SAWU2GZBnJB2MN5t0NXt2ZygvTc91mS//P
 emvEXqaDsKrQu5hLNwZ0rAq5vZ3yc7gyzn8CSNHWmIxJCUlo2XMK7P/97TZyMHSBts2G
 sNlB1jRLkwLAb3LJ1Q3BzGsGIabJ/qX2GBcsK+v/0B71NE+uWUvR10/6A9uC1D2gRAw3
 DU4LL+i6fnh7K+hwKO8/QyXevzWQrxkeR0NSPRoI3c/mCeLNvtk05XUk86YwqCIDt+z3
 saPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765254502; x=1765859302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DoV8ebquCT6L/RZ0AqbPbGv9Gx9G1WrRRbUTSZpd9fE=;
 b=sI4lIdqI41hQa/W/w0YUy+dDA8TqsV3zd/RC7ZzMX+s3ZTbJpSTF5r2z54KPcEQNBo
 Kwauaj2Y0iO4f1VHCW4gsqW9a2bKisNQT54M9s2alQF+v+k85IpfzaD0AAy48ZHt62Fo
 Hm7o/ducuwvuSFCU3q1FKc3w0pjyqiw3zt8SnyhLlY/BApmI7peQo7FNWLJEk5RDe4tT
 7XvVndPiZp4Ub6M8PjPLS9npPg6UDRbNMLlMU9kI3e+vCkgDFJFttvLXW+rv1p7hm9fl
 Av/7eFa0wi1qN+9DcvSdLs+OJk/JEn+z2exJrxs3BV057u3JYqWFJ3RcpyMMjPMOF9ja
 FYdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWa0rpd78kBQ6MTVW/EM28i8qJFuynWliFB7+cNGWX+rCiUldO88pNKXBhHisPbhtLOKun6qyImOqQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHaSK+tsAtaJpXsEtYA6rzPivkJprKT2s+DZF5xcwZEvBddU5S
 K5Pd1GF1GypMUfRFdGS1pkjQyodN0pTEiAMDioHmCj/2sY/SX6fCURQs
X-Gm-Gg: ASbGncvbr0d9vxhuR8bgZJZeAf1S0y3raH3JyR9ko6bKJmf9PC5RsqfnHA7XVQEDgFf
 rmuYo1h1tI37P86Jkgb760lUgv4zH6ECcJSiAVcaJqj2e2N+igImxcObiaF4L006KPT+GnjMAPM
 ztCKhl5LGRImpLShu17/xgAyH0Rn3E0PxKNQIj35NiOW/Ooe1a+ho0ON0BDWxlsQT+kT/18MO5N
 dOSa/uCStCRbGWMemTenGqiVgRyRG9QaXiIJ+ZXem2FwKx8SODD8d+lO5+1YZGtwQlEz6C81o9L
 yCfzzLRHUGA+aoydZqgDE64h7JIFPF3l3UbG4gsJ10WwHLU3Xbc0gmWSv3l3PwPIi+G0gCSMHru
 WIffjmLD4h4vpRXBKlqGY5OOta/RiCctUE3hL/Rt9kOZJ2v4PrIklnWDuFYRde+7W4V/PiYfF35
 T91+nLQ9Ij1U4/LdoPSrA+2EkTsCF0rfFQc9os3oXs/M8=
X-Google-Smtp-Source: AGHT+IGhZ172wJMCe8Y+hl9H/FCCQtSdsSpkHLmThykFWMzH/YAfrcNiqXS6r43YyTp5Eyv9aHLeZg==
X-Received: by 2002:a17:90b:1a8b:b0:343:f509:aa4a with SMTP id
 98e67ed59e1d1-349a260a9d0mr7994609a91.36.1765254501596; 
 Mon, 08 Dec 2025 20:28:21 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:b455:298d:48bb:1784])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34a49b90fd5sm765185a91.10.2025.12.08.20.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 20:28:21 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH 2/3] omapfb: Guard sysfs code under CONFIG_FB_DEVICE
Date: Mon,  8 Dec 2025 20:27:43 -0800
Message-ID: <20251209042744.7875-3-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209042744.7875-1-chintanlike@gmail.com>
References: <20251209042744.7875-1-chintanlike@gmail.com>
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

omapfb implements multiple sysfs attributes for framebuffer rotation,
overlays, and debug information. These interfaces depend on FB_DEVICE
being enabled.

This patch wraps all sysfs attribute definitions, registration, and
removal in #ifdef CONFIG_FB_DEVICE. For FB_DEVICE=n, lightweight stub
functions are provided so that the driver builds and runs without
exposing sysfs interfaces.

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/Kconfig        |  2 +-
 drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/Kconfig b/drivers/video/fbdev/omap2/omapfb/Kconfig
index f4cdf999a080..ee664decbb64 100644
--- a/drivers/video/fbdev/omap2/omapfb/Kconfig
+++ b/drivers/video/fbdev/omap2/omapfb/Kconfig
@@ -5,7 +5,6 @@ config OMAP2_VRFB
 menuconfig FB_OMAP2
 	tristate "OMAP2+ frame buffer support"
 	depends on FB
-	depends on FB_DEVICE
 	depends on DRM_OMAP = n
 	depends on GPIOLIB
 	select FB_OMAP2_DSS
@@ -13,6 +12,7 @@ menuconfig FB_OMAP2
 	select FB_IOMEM_HELPERS
 	help
 	  Frame buffer driver for OMAP2+ based boards.
+	  Selecting FB_DEVICE enables additional sysfs interfaces.
 
 if FB_OMAP2
 
diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
index 831b2c2fbdf9..0a340f69484f 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
@@ -24,6 +24,7 @@
 
 #include "omapfb.h"
 
+#ifdef CONFIG_FB_DEVICE
 static ssize_t show_rotate_type(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -585,4 +586,14 @@ void omapfb_remove_sysfs(struct omapfb2_device *fbdev)
 					&omapfb_attrs[t]);
 	}
 }
+#else
+int omapfb_create_sysfs(struct omapfb2_device *fbdev)
+{
+	return 0;
+}
+
+void omapfb_remove_sysfs(struct omapfb2_device *fbdev)
+{
+}
+#endif
 
-- 
2.43.0

