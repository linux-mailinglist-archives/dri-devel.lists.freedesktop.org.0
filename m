Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F04C68F1F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 12:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A714610E1B2;
	Tue, 18 Nov 2025 11:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kd341o31";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8456B10E1B2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 11:00:17 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-29555b384acso54829375ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 03:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763463617; x=1764068417; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XD0Uvi09F5xrS/FB++rhpCWlK2g6Pa+B2XRikM448Nc=;
 b=Kd341o31KtaROptyJmFrBIyp5lHjuSQi3iKZU4W8nkuyWKncleG7Bwgl64NgSd5coR
 3pHpu3wN7XlT2+XbX48HimNrXqvuMZv7ZVp9UMOtMbgyMSK/zCbQHqi367u+BHKXWTPN
 HJA/6OokU9QONMWbkdxv2eVBy2Cpq/hubJJhzLkt4OiKXK18N9jnJY5rfGd4KqcLyC1I
 AmJ64LcDTa5RNBvtmuSNOGqRL2hpL4/rUA6EKm+avijiz7vvB8M8Zcg7v5eqWE4ef7Fl
 IntKXuVa+iDw0b3fvPcUsolhNwqg9qrtC/txL2X5+PpiCrYbBSsckIMRQw5uKbPqDxQr
 cOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763463617; x=1764068417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XD0Uvi09F5xrS/FB++rhpCWlK2g6Pa+B2XRikM448Nc=;
 b=wNI3xwynpxOI61Yn+LaGYmi6u1TG+sO1DTWR2Sdp/qou2Xiqvsti/CCXtS3/o9A7pG
 aQL/kG562uGM9YtwbyY4ZepqEi5bTEDBlpLN6A9n7yo/7RGYG1LV7STcFmCoW1TA9jY7
 9LGUcTdpZggE5wKFT3Xgfsbr7+EvFAS9TtTNv5JMZh4Q43Dv8Y3FykbF7KTBYVzCusy4
 zSWSEv2ZAO/MJGr6E+HSaresZqZGArefirlzVQ5bGj6d+QikE+i8fFz3IHX3Q42p/GM5
 uf2CMGWTdidgo6c5mQ+5t/1wFR85F8ty7+7IGwRrHq7fqBjliF10qgwOsrmNU1kFUxsU
 X73w==
X-Gm-Message-State: AOJu0YyfnGudCftLPW4HjnH2hTJdQlEvyfRWMtdOH9ng7h7z+xeAP8vZ
 NN0C2oZ1Uz+Lqefez6vQyAit5X7lYf1T29AvjmVEc3a7klHL9f+jYP5H
X-Gm-Gg: ASbGncu8EQNGbh0tYDrrDfjvfiFZzNQhdDCHoXuvbn0FxmPBv0c0AciwRX/udZV5D1Z
 aMRYm2ceXvjDizpRjfJYuugtP9yLBc3HwoDvIlJbq0vVJiyUvNtuVY3WeUFkBCPK0XoNEJ+xGzr
 TRiAtTenz8nqsAzhE2gVXBEjfVHyNtMAqFUzGg9LUl4RBQh7MAG+Fl/uSvrAYZop0K/m8heEn4x
 J6C6n7z2TUcQ7GLBEorsMIhcJE+qi2fLxKNgkdwSkstpmTnCjz3cstXvn3rkJw8G6u7wITKjpAi
 IC/R/RN1KqlpLkO7ofr33ImxaiYHWYykNWPJsnmkRlaKtWXh7KOH2SjjqIfav4M2E3csZojTCzM
 g0PocVfhsXFcfq0DjHL6XqF5IaKyHyJVsaZJtATb93LtjbyW+iGNM/5s3cWNA2pAHXbGYLu4w9h
 Nby2zSr9buda0RTg==
X-Google-Smtp-Source: AGHT+IE/hTpI8doSjS9T9+BdiRKS+Fqy7JWtOV/ShXxfGCg+E17MWdRddGKPixXlk2g4WhY0vV6Jiw==
X-Received: by 2002:a17:903:1104:b0:295:9b39:4533 with SMTP id
 d9443c01a7336-2986a73b30emr198677895ad.30.1763463616274; 
 Tue, 18 Nov 2025 03:00:16 -0800 (PST)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c241f89sm168012035ad.28.2025.11.18.03.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 03:00:15 -0800 (PST)
From: Rahul Kumar <rk0006818@gmail.com>
To: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rk0006818@gmail.com
Subject: [PATCH v2 1/3] drm/komeda: Add komeda_drv.h to make struct komeda_drv
 available
Date: Tue, 18 Nov 2025 16:29:32 +0530
Message-ID: <20251118105934.748955-2-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118105934.748955-1-rk0006818@gmail.com>
References: <20251118105934.748955-1-rk0006818@gmail.com>
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

struct komeda_drv was defined only inside komeda_drv.c and not visible
to other Komeda components. Add a new header file, komeda_drv.h, to
make this structure available across the driver.

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 .../gpu/drm/arm/display/komeda/komeda_drv.c   |  6 +----
 .../gpu/drm/arm/display/komeda/komeda_drv.h   | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/arm/display/komeda/komeda_drv.h

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index 358c1512b087..aff3cf1f134b 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -14,11 +14,7 @@
 #include <drm/drm_of.h>
 #include "komeda_dev.h"
 #include "komeda_kms.h"
-
-struct komeda_drv {
-	struct komeda_dev *mdev;
-	struct komeda_kms_dev *kms;
-};
+#include "komeda_drv.h"
 
 struct komeda_dev *dev_to_mdev(struct device *dev)
 {
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.h b/drivers/gpu/drm/arm/display/komeda/komeda_drv.h
new file mode 100644
index 000000000000..b105255a798c
--- /dev/null
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Komeda top-level driver structure
+ *
+ * (C) COPYRIGHT 2025 Rahul Kumar <rk0006818@gmail.com>
+ */
+#ifndef _KOMEDA_DRV_H_
+#define _KOMEDA_DRV_H_
+
+#include "komeda_dev.h"
+#include "komeda_kms.h"
+
+/**
+ * struct komeda_drv - Komeda high-level driver glue
+ *
+ * This structure links the core Komeda hardware device (struct komeda_dev)
+ * with the DRM/KMS integration layer (struct komeda_kms_dev).
+ */
+struct komeda_drv {
+	struct komeda_dev     *mdev;
+	struct komeda_kms_dev *kms;
+};
+
+#endif /* !_KOMEDA_DRV_H_ */
-- 
2.43.0

