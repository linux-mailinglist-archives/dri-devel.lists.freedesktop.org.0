Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D14744AA8
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 19:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3C510E067;
	Sat,  1 Jul 2023 17:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F20510E067;
 Sat,  1 Jul 2023 17:15:18 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1b7f223994fso22659025ad.3; 
 Sat, 01 Jul 2023 10:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688231717; x=1690823717;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ei/8L0t9EkW/T7NE/RnPGm0ESza/Gag4xS4IJm8ctpE=;
 b=moTU25TCS8jpc8mJf8bUb9W8RE36Z6rUEkOvwnEIrwnRmqlNta4UBUxaIw8zRTX8cD
 Lu52dtqSBb2CZd7dSmYdwyNdd+Mv4ul4YJnirxVwrkew0MBB1jgHO/T5czqWDUyOWESG
 sJ90OyZGaUfRW5GanBKOnp2o52QW2rTOSSUdD12iXsKzcoyX+PSR9RfQvpOc971d1j/1
 A2GrZU5M7trdzda5by0X5/Qad0VJ/8YTiOl03A8ZYBVT2rvJKJ0eb5Bx5h2dZuECIE8b
 Wdb/7fr83oBgvzqbflNuXpCsYxjWsNdY81Dz1f84ZsYjyttg8oebHvxpBLJu78otivoF
 aRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688231717; x=1690823717;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ei/8L0t9EkW/T7NE/RnPGm0ESza/Gag4xS4IJm8ctpE=;
 b=GSQD8rpP2eraMicAC4g3zgvV0ymVtQfBMeBz+nhc1uU394TdmuefeZUzdgTVLQbWSH
 +Xt+TMc9XGROFy2IBvie1xB3H5V2YrjPb2NTQ3aTeLM5XTkACxeQQDKhxpkrRqaN8Ywe
 95LAS8Sc3SY8c/7tEsIE7ncov5c7hCQbfU/OyNASSuTqsDuc8DQUUoN/rNJKrQ9/SET6
 c/ko79tacORiHQ1tx6yxOf0FTKJz8ed5yBQ5lhn64h5HESkKclPTH7AbokGeXWU1GMpy
 icR2Q6a5Vrv6TaWYYm6bUzbbBJBC/+ypnuI5sM3ch+i7FsaRsGprazL3HW3H0Hy9eezB
 DUpQ==
X-Gm-Message-State: ABy/qLbKfmpDiMfeueDHuSVnJYHDXuKydXkcBL9ecJ6rSASC+ATZ695K
 dzl265T/xklM0ic5Y5AzD6h5oe6P1Qs=
X-Google-Smtp-Source: APBJJlFq53XeQS8uScjrDfsb60AjQ/iAfZRL2V1Uwv9NzTZMRZNMHYO3gSh37R5Y+6IX2UOTyK4yyQ==
X-Received: by 2002:a17:902:b90a:b0:1b6:9fec:8134 with SMTP id
 bf10-20020a170902b90a00b001b69fec8134mr5571169plb.46.1688231717263; 
 Sat, 01 Jul 2023 10:15:17 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:ae1c:de46:682a:206])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a170902b94300b001ae3f73b9c1sm12550422pls.101.2023.07.01.10.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 10:15:16 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/adreno: warn if GPU revision is not known yet
Date: Sat,  1 Jul 2023 10:15:01 -0700
Message-ID: <20230701171501.3701-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The commit 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno
510") tried to check GPU's revn before revn being set. Add WARN_ON_ONCE
to prevent such bugs from happening again. A separate helper is
necessary so that the warning is displayed really just once instead of
being displayed for each of comparisons.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 70 +++++++++++++++----------
 1 file changed, 42 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 506001080374..eb31c83582e6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -145,143 +145,155 @@ struct adreno_platform_config {
 
 bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
 
+static inline const struct adreno_info
+gpu_info(struct adreno_gpu *gpu)
+{
+	if (WARN_ON_ONCE(!gpu->info))
+		return (struct adreno_info) {};
+	return *gpu->info;
+}
+
 static inline bool adreno_is_a2xx(struct adreno_gpu *gpu)
 {
-	return (gpu->revn < 300);
+	return (gpu_info(gpu).revn < 300);
 }
 
 static inline bool adreno_is_a20x(struct adreno_gpu *gpu)
 {
-	return (gpu->revn < 210);
+	return (gpu_info(gpu).revn < 210);
 }
 
 static inline bool adreno_is_a225(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 225;
+	return gpu_info(gpu).revn == 225;
 }
 
 static inline bool adreno_is_a305(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 305;
+	return gpu_info(gpu).revn == 305;
 }
 
 static inline bool adreno_is_a306(struct adreno_gpu *gpu)
 {
 	/* yes, 307, because a305c is 306 */
-	return gpu->revn == 307;
+	return gpu_info(gpu).revn == 307;
 }
 
 static inline bool adreno_is_a320(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 320;
+	return gpu_info(gpu).revn == 320;
 }
 
 static inline bool adreno_is_a330(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 330;
+	return gpu_info(gpu).revn == 330;
 }
 
 static inline bool adreno_is_a330v2(struct adreno_gpu *gpu)
 {
-	return adreno_is_a330(gpu) && (gpu->rev.patchid > 0);
+	return adreno_is_a330(gpu) && (gpu_info(gpu).rev.patchid > 0);
 }
 
 static inline int adreno_is_a405(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 405;
+	return gpu_info(gpu).revn == 405;
 }
 
 static inline int adreno_is_a420(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 420;
+	return gpu_info(gpu).revn == 420;
 }
 
 static inline int adreno_is_a430(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 430;
+	return gpu_info(gpu).revn == 430;
 }
 
 static inline int adreno_is_a506(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 506;
+	return gpu_info(gpu).revn == 506;
 }
 
 static inline int adreno_is_a508(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 508;
+	return gpu_info(gpu).revn == 508;
 }
 
 static inline int adreno_is_a509(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 509;
+	return gpu_info(gpu).revn == 509;
 }
 
 static inline int adreno_is_a510(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 510;
+	return gpu_info(gpu).revn == 510;
 }
 
 static inline int adreno_is_a512(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 512;
+	return gpu_info(gpu).revn == 512;
 }
 
 static inline int adreno_is_a530(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 530;
+	return gpu_info(gpu).revn == 530;
 }
 
 static inline int adreno_is_a540(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 540;
+	return gpu_info(gpu).revn == 540;
 }
 
 static inline int adreno_is_a618(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 618;
+	return gpu_info(gpu).revn == 618;
 }
 
 static inline int adreno_is_a619(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 619;
+	return gpu_info(gpu).revn == 619;
 }
 
 static inline int adreno_is_a630(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 630;
+	return gpu_info(gpu).revn == 630;
 }
 
 static inline int adreno_is_a640_family(struct adreno_gpu *gpu)
 {
-	return (gpu->revn == 640) || (gpu->revn == 680);
+	return (gpu_info(gpu).revn == 640) ||
+		(gpu_info(gpu).revn == 680);
 }
 
 static inline int adreno_is_a650(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 650;
+	return gpu_info(gpu).revn == 650;
 }
 
 static inline int adreno_is_7c3(struct adreno_gpu *gpu)
 {
 	/* The order of args is important here to handle ANY_ID correctly */
-	return adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), gpu->rev);
+	return adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), gpu_info(gpu).rev);
 }
 
 static inline int adreno_is_a660(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 660;
+	return gpu_info(gpu).revn == 660;
 }
 
 static inline int adreno_is_a690(struct adreno_gpu *gpu)
 {
 	/* The order of args is important here to handle ANY_ID correctly */
-	return adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), gpu->rev);
+	return adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), gpu_info(gpu).rev);
 };
 
 /* check for a615, a616, a618, a619 or any derivatives */
 static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 615 || gpu->revn == 616 || gpu->revn == 618 || gpu->revn == 619;
+	return gpu_info(gpu).revn == 615 ||
+		gpu_info(gpu).revn == 616 ||
+		gpu_info(gpu).revn == 618 ||
+		gpu_info(gpu).revn == 619;
 }
 
 static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
@@ -292,7 +304,9 @@ static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
 /* check for a650, a660, or any derivatives */
 static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 650 || gpu->revn == 620  || adreno_is_a660_family(gpu);
+	return gpu_info(gpu).revn == 650 ||
+		gpu_info(gpu).revn == 620 ||
+		adreno_is_a660_family(gpu);
 }
 
 u64 adreno_private_address_space_size(struct msm_gpu *gpu);
-- 
2.41.0

