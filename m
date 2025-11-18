Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F28C68F5E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 12:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBFC10E345;
	Tue, 18 Nov 2025 11:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V7GiluVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00AB10E345
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 11:02:03 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-29555b384acso54849855ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 03:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763463723; x=1764068523; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=na4DhkN/5BRqSU3K/p/l3xB54l4eKEIWl6YEImlS290=;
 b=V7GiluVXFOaXMGg4DTmj7p4Y9An6hl6t8ovynuoC3hVAUav6869QmakWahXXvJOQWX
 ROBSC7mRzxMBYbBecmA/eVjO87ScgALXE+2nK3zmlfK+yWZ/xMjY/SUdAz1Uol6iSgsB
 m3OwZT5sZJO9xK1esT3gFrHHvNAFygRjduQ7X0NRhRln/Hoxwc69C9cRcRRTu4h1bMU1
 C7G7ziNJfQV+R2S4JRpjegKFnuU64NaZVYOAonti/v6DB5xuqiF0Byl++8kXJQVVnD4U
 cXdBZXfDb+k11JPWbzxrJat/oyjkG+3r2CeoZHo10u6HnF5wz33QxxqPp8z1ZK2biD22
 Mhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763463723; x=1764068523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=na4DhkN/5BRqSU3K/p/l3xB54l4eKEIWl6YEImlS290=;
 b=qUfRSdFaZyAswQBcRdKuc8q4S1EqK4u+Tq/ejQ2/j6koaYgY9or6heBCuCT/HAS0ci
 V9V+ILU5SnvV3Io7YbJ9VHy7m4YzMDv/0lQgG4ZNKFouS9C3ezm+2TTabq3j/csPanmY
 0hVV/xqmwC3uRGuVnE1DbTX6n3sxAhP6Yq1GLKz2wk5LIjzyn76Oqr7PYuMtomb60tSC
 ajQdrWKcpEXSGf93iWHyIJeh8kiqCiE3k4sI7u2N7ChIiPVieS6qZHGAyqjCL24/mugz
 Pm2IHhwe5owJqpJc9l94GyN2nRHqJAZfc8TFAg16gvuH9oRoCycBu5td9sBmKM3HPUOb
 u+yQ==
X-Gm-Message-State: AOJu0YyIGYoesuCnL1iT+367DZPE2jK8YxiYoVbN1kynZCIZAdGKuCaT
 o80u9Obl99AL32tZPBnQMbouey+haw8UZE4PTPbMGNh9c68KYIej2aWi
X-Gm-Gg: ASbGnctxqCyUOf8rZlUQs0dIVPmFA6ITaBgonhX3VPP/shK5rQzrzmAuuJfmtp+L4E0
 O524Uc8TI9QKlEHYNWC0jRTmhhIU4wOcqvV9aVQY3wDC2MHkZqJrjWmW2AxVqQgeyAz1n78zc8r
 L1XNCM06jDKDkHfQg6TLDeen4e2xy4xD3kgG3odVrCdR/gqPblxp3kkfZycAWsk6pLv/irLSgss
 Om4+ThoZJ651EWmPqSW1KjSHNTpioKgDi4y6NjT6RI0/Kl0MpbXnXGjSFaDQMYD6Asgcn3bhiJN
 +LEpSlQ8NCSFAxY58Uqqdp7lVXMFsgEQ5BUf+9FK+XIJhFBT4RLGY2tJf81ltXbaaAkkSWzT+3b
 SY/F7cOIxXqbiJGiD2Go8rFp2oaOB0gMuefXR2mE5sKzgJylqIUvipl68SWCb4gSo6J88KseiJj
 T9BCmqSWJCk/TgogeJOalA7YTb
X-Google-Smtp-Source: AGHT+IE6YrPAVjfDpiLLsFnYKJeDdAmdTRc9703k5Np/K4dcdP4WFnn2nsey6vdWdlf/71DWDVaJWQ==
X-Received: by 2002:a17:903:178e:b0:298:1013:b8d8 with SMTP id
 d9443c01a7336-2986a76a111mr166893485ad.57.1763463723279; 
 Tue, 18 Nov 2025 03:02:03 -0800 (PST)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c241f89sm168012035ad.28.2025.11.18.03.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 03:02:03 -0800 (PST)
From: Rahul Kumar <rk0006818@gmail.com>
To: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rk0006818@gmail.com
Subject: [PATCH v2 3/3] drm/komeda: Convert logging in d71_dev.c to drm_* with
 drm_device parameter
Date: Tue, 18 Nov 2025 16:29:34 +0530
Message-ID: <20251118105934.748955-4-rk0006818@gmail.com>
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

Replace DRM_DEBUG() and DRM_ERROR() calls in
drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c with the
drm_dbg() and drm_err() helpers in functions where a drm_device
parameter is available.

The drm_*() logging macros require a struct drm_device * parameter,
which allows the DRM core to prefix log messages with the device
instance. This improves debugging clarity when multiple Komeda or
other DRM devices are present.

Logging in early hardware probing functions such as d71_identify()
is intentionally left unchanged because they do not have access to
a drm_device pointer at that stage of initialization.

This conversion follows the DRM TODO entry:
"Convert logging to drm_* functions with drm_device parameter".

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
Changes since v1:
- Fixed incorrect use of dev_get_drvdata(): it returns struct komeda_drv *,
  not struct komeda_kms_dev *, as pointed out by Liviu Dudau.
- Updated DRM device pointer retrieval to use drv->kms.
- Combined both changes into a 0/3 series.
Link to v1:
https://lore.kernel.org/all/aRdT1qscQqO7-U6h@e110455-lin.cambridge.arm.com/
---
 .../gpu/drm/arm/display/komeda/d71/d71_dev.c  | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
index 80973975bfdb..39c51bbe2bb9 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
@@ -9,6 +9,7 @@
 #include <drm/drm_print.h>
 #include "d71_dev.h"
 #include "malidp_io.h"
+#include "komeda_drv.h"
 
 static u64 get_lpu_event(struct d71_pipeline *d71_pipeline)
 {
@@ -348,6 +349,9 @@ static void d71_cleanup(struct komeda_dev *mdev)
 
 static int d71_enum_resources(struct komeda_dev *mdev)
 {
+	struct komeda_drv *drv = dev_get_drvdata(mdev->dev);
+	struct komeda_kms_dev *kms = drv->kms;
+	struct drm_device *drm = &kms->base;
 	struct d71_dev *d71;
 	struct komeda_pipeline *pipe;
 	struct block_header blk;
@@ -366,7 +370,7 @@ static int d71_enum_resources(struct komeda_dev *mdev)
 
 	err = d71_reset(d71);
 	if (err) {
-		DRM_ERROR("Fail to reset d71 device.\n");
+		drm_err(drm, "Fail to reset d71 device.\n");
 		goto err_cleanup;
 	}
 
@@ -376,8 +380,8 @@ static int d71_enum_resources(struct komeda_dev *mdev)
 	d71->num_pipelines = (value >> 8) & 0x7;
 
 	if (d71->num_pipelines > D71_MAX_PIPELINE) {
-		DRM_ERROR("d71 supports %d pipelines, but got: %d.\n",
-			  D71_MAX_PIPELINE, d71->num_pipelines);
+		drm_err(drm, "d71 supports %d pipelines, but got: %d.\n",
+			D71_MAX_PIPELINE, d71->num_pipelines);
 		err = -EINVAL;
 		goto err_cleanup;
 	}
@@ -455,8 +459,8 @@ static int d71_enum_resources(struct komeda_dev *mdev)
 		offset += D71_BLOCK_SIZE;
 	}
 
-	DRM_DEBUG("total %d (out of %d) blocks are found.\n",
-		  i, d71->num_blocks);
+	drm_dbg(drm, "total %d (out of %d) blocks are found.\n",
+		i, d71->num_blocks);
 
 	return 0;
 
@@ -555,6 +559,9 @@ static void d71_init_fmt_tbl(struct komeda_dev *mdev)
 
 static int d71_connect_iommu(struct komeda_dev *mdev)
 {
+	struct komeda_drv *drv = dev_get_drvdata(mdev->dev);
+	struct komeda_kms_dev *kms = drv->kms;
+	struct drm_device *drm = &kms->base;
 	struct d71_dev *d71 = mdev->chip_data;
 	u32 __iomem *reg = d71->gcu_addr;
 	u32 check_bits = (d71->num_pipelines == 2) ?
@@ -569,7 +576,7 @@ static int d71_connect_iommu(struct komeda_dev *mdev)
 	ret = dp_wait_cond(has_bits(check_bits, malidp_read32(reg, BLK_STATUS)),
 			100, 1000, 1000);
 	if (ret < 0) {
-		DRM_ERROR("timed out connecting to TCU!\n");
+		drm_err(drm, "timed out connecting to TCU!\n");
 		malidp_write32_mask(reg, BLK_CONTROL, 0x7, INACTIVE_MODE);
 		return ret;
 	}
@@ -582,6 +589,9 @@ static int d71_connect_iommu(struct komeda_dev *mdev)
 
 static int d71_disconnect_iommu(struct komeda_dev *mdev)
 {
+	struct komeda_drv *drv = dev_get_drvdata(mdev->dev);
+	struct komeda_kms_dev *kms = drv->kms;
+	struct drm_device *drm = &kms->base;
 	struct d71_dev *d71 = mdev->chip_data;
 	u32 __iomem *reg = d71->gcu_addr;
 	u32 check_bits = (d71->num_pipelines == 2) ?
@@ -593,7 +603,7 @@ static int d71_disconnect_iommu(struct komeda_dev *mdev)
 	ret = dp_wait_cond(((malidp_read32(reg, BLK_STATUS) & check_bits) == 0),
 			100, 1000, 1000);
 	if (ret < 0) {
-		DRM_ERROR("timed out disconnecting from TCU!\n");
+		drm_err(drm, "timed out disconnecting from TCU!\n");
 		malidp_write32_mask(reg, BLK_CONTROL, 0x7, INACTIVE_MODE);
 	}
 
-- 
2.43.0

