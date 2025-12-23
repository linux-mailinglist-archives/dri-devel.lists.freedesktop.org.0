Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68883CDA18F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 18:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CED710E168;
	Tue, 23 Dec 2025 17:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="L6PrntAV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB9110E168
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 17:26:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766510803; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=egWZHmnzc3J7lObUIelC6uYRuB5G5H1ztjVWp70wPsqCaEDHh20yvKA+UyQRuQuz2g9pg6mANmuyBm4MDOY14tKm3TPWCcFxXgOn2cy6EM+yidMW4UUg/ENQD4ij2j34Wr9T4pCXlK7CDwtTlVSXt/24P107zwwfhYEY8X3nzQA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766510803;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=WUBV8oVBo8F9MudR+/uDu6KurkKTKBJOcrGHgxEOma4=; 
 b=evp6GH0c5uznM7qRFjqPwYJNwjdyYcWuX3xETiz6yieKDh0NUBk+GjlUvBMWfHetP5/n9ZwpGrqQa/c/hPdvmPrYDEtaDntQtCES511oILE9bSdAXPQ8gvdsokgxjuU1rJDWlTNx8vd3KI9bs/Y6xPHqgOMP2cGSOMeDVwM+wBM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766510803; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
 bh=WUBV8oVBo8F9MudR+/uDu6KurkKTKBJOcrGHgxEOma4=;
 b=L6PrntAV6hiLwyxZ0t4/T1ldX3shp4tT4eLO/xMrBa4IM/gUKWPZMruoC10e6nDs
 cLT9bWeCDLJyDCXF/J5GJfmxINeEs5jcEJrqVULT4TX9fONtwC69llFbef8zSVHdo96
 FfjjQ3ypAOuIb4yaiC4iUdxcSX/yVlWG4Gj4kteY=
Received: by mx.zohomail.com with SMTPS id 176651080104023.472570699014568;
 Tue, 23 Dec 2025 09:26:41 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 14:26:33 -0300
Subject: [PATCH] drm/vkms: Fix bad matrix offset component multiplication
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-vkms-composer-fix-matrix-v1-1-10a979e06209@collabora.com>
X-B4-Tracking: v=1; b=H4sIAMjQSmkC/yWNwQrDIBBEf0X23IVq4iH5lZKDtZt2KWqqNgRC/
 r2behreDDOzQ6HMVGBUO2RauXCKAvqiwL9cfBLyQxjM1VhtTIfrOxT0KSxJmjjzhsHVLOKc8Xb
 o5t5qC1JfMkn6n75NjTN9vvJQmwl3V+icClxHFWmr2F70ANNx/AALPjNnmwAAAA==
X-Change-ID: 20251223-vkms-composer-fix-matrix-aa2c593f4515
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nfraprado@collabora.com, pekka.paalanen@collabora.com, 
 daniels@collabora.com, kernel@collabora.com, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766510795; l=2339;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=te5JoBOoO2ln/kaCmdP6CNfZrv+kLN9FDHEWyzgmYgk=;
 b=p/5n4Nqjj1yEHjm33jjFef3SBQKScGCzVE/6uPE5jtOLjtMZ6tOkCa/yAQpGJ4o86IMN6QauJ
 Xx12nx0nm37Dllot0SoXx3SuThpEbh619Yj+qWnDplxS7eVbK95Tst6
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
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

Pixels values are packed as 16-bit UNORM values, so the matrix offset
components must be multiplied properly by the idempotent element -i.e.
number 1 encoded as 16-bit UNORM-.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 3cf3f26e0d8ea..efdaf665435d9 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -16,6 +16,8 @@
 #include "vkms_composer.h"
 #include "vkms_luts.h"
 
+#define UNORM_16BIT_ONE			(1ULL << 16)
+
 static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 {
 	u32 new_color;
@@ -138,20 +140,25 @@ VISIBLE_IF_KUNIT void apply_3x4_matrix(struct pixel_argb_s32 *pixel,
 	g = drm_int2fixp(pixel->g);
 	b = drm_int2fixp(pixel->b);
 
+	/*
+	 * Pixels values are packed as 16-bit UNORM values, so the matrix offset
+	 * components must be multiplied properly by the idempotent element -i.e.
+	 * number 1 encoded as 16-bit UNORM-.
+	 */
 	rf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[0]), r) +
 	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[1]), g) +
 	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[2]), b) +
-	     drm_sm2fixp(matrix->matrix[3]);
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[3]), drm_int2fixp(UNORM_16BIT_ONE));
 
 	gf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[4]), r) +
 	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[5]), g) +
 	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[6]), b) +
-	     drm_sm2fixp(matrix->matrix[7]);
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[7]), drm_int2fixp(UNORM_16BIT_ONE));
 
 	bf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[8]), r) +
 	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[9]), g) +
 	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[10]), b) +
-	     drm_sm2fixp(matrix->matrix[11]);
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[11]), drm_int2fixp(UNORM_16BIT_ONE));
 
 	pixel->r = drm_fixp2int_round(rf);
 	pixel->g = drm_fixp2int_round(gf);

---
base-commit: b96bcfba104c65db41378a04f5ccac186f79578f
change-id: 20251223-vkms-composer-fix-matrix-aa2c593f4515

Best regards,
-- 
Ariel D'Alessandro <ariel.dalessandro@collabora.com>

