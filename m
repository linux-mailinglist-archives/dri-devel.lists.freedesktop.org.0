Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F88637FC53
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 19:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3ACF6EDAA;
	Thu, 13 May 2021 17:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E302C6ED8A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 17:18:02 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id k127so26213516qkc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 10:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vmggi1tOrZ/7NREacuaxcgryuSU/S1q+fl+YG5PANN4=;
 b=rbAflgboFf16SgYS+ys5CR+VSAB/JtRdCzBTbZQAwWW03Fv95nQDuCAaqv8IqsBIf/
 jLnU6oNbTj4urKlDmcbOImMWSGeuYXhVphoffBvMQ0AA5VXYTrbqn7rZCyFOQ97ru4p4
 4AhRiACQH8Es1QsyWFA3iZ3b8EMB60HkwsTDQ8CwrmJEDbqZGQt6nJ5/d1tOSnvicONj
 wLi4jkWdHdSnzDNAjQhJmBo8g6fUALqMIvszfEGFXE3Lenu1inRKVrMWA+ng1pUFdxfI
 L41RRPA2KZmcBUVVhTZDGmdcg7uVgifU9ouwvhtk5ghWuSHrHaZcTqbUK8gqgi/Nlwcc
 zxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vmggi1tOrZ/7NREacuaxcgryuSU/S1q+fl+YG5PANN4=;
 b=hN/hFb5Rqfa3knBsbe7vorvm8H2cTuUo6lGiBAMcWiGYU8MjcKSlu3XATXYlZf4RB4
 /qKJS12opL/6PpbtMkHex+pilkwgTIKVHF2fxR9kIOR6F8RhV9yBcIu6FU2XHTHoFtvn
 wE60bMfyywrMKlKveHa6VJOuc1SmZX2o7VmjJdjkdJ8sPB9zpzp2WdsE8AxP6JtpfhJZ
 yqPpW75/LQ49aHU4yp8dLslehQqVe3pFZS38FvCnEPtBjsc93cn+SH47SpCXYiNfTOr/
 +Fhb8jgImdu3qpD2C284h1oxkI6fA9sFcu0Q9JODN9vFB0dfTAai5F0Jyep+d467p+2e
 DbNw==
X-Gm-Message-State: AOAM530iJgjzMtmqVxi4/rCXK8ShXvUe5mL2Z548KBXx0YCPs4gxS6pT
 0dX86TiqV8kw0dB8umQPtbOQ6A==
X-Google-Smtp-Source: ABdhPJwZ22eRt74l/hlI57Q4bM8PkfOSVTk500ebvRw6wWYM5yMzFkF7M3Vgmbr2uXsAuCtTa1ox0w==
X-Received: by 2002:a37:b947:: with SMTP id j68mr39397620qkf.108.1620926282029; 
 Thu, 13 May 2021 10:18:02 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id f132sm2971117qke.104.2021.05.13.10.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 10:18:01 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 7/8] drm/msm/a6xx: update a6xx_ucode_check_version for a660
Date: Thu, 13 May 2021 13:14:02 -0400
Message-Id: <20210513171431.18632-8-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210513171431.18632-1-jonathan@marek.ca>
References: <20210513171431.18632-1-jonathan@marek.ca>
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Accept all SQE firmware versions for A660.

Re-organize the function a bit and print an error message for unexpected
GPU IDs instead of failing silently.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 36 +++++++++++++--------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3cc23057b11d..ec66a24fc37e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -697,6 +697,11 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 	 * Targets up to a640 (a618, a630 and a640) need to check for a
 	 * microcode version that is patched to support the whereami opcode or
 	 * one that is new enough to include it by default.
+	 *
+	 * a650 tier targets don't need whereami but still need to be
+	 * equal to or newer than 0.95 for other security fixes
+	 *
+	 * a660 targets have all the critical security fixes from the start
 	 */
 	if (adreno_is_a618(adreno_gpu) || adreno_is_a630(adreno_gpu) ||
 		adreno_is_a640(adreno_gpu)) {
@@ -720,27 +725,20 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 		DRM_DEV_ERROR(&gpu->pdev->dev,
 			"a630 SQE ucode is too old. Have version %x need at least %x\n",
 			buf[0] & 0xfff, 0x190);
-	}  else {
-		/*
-		 * a650 tier targets don't need whereami but still need to be
-		 * equal to or newer than 0.95 for other security fixes
-		 */
-		if (adreno_is_a650(adreno_gpu)) {
-			if ((buf[0] & 0xfff) >= 0x095) {
-				ret = true;
-				goto out;
-			}
-
-			DRM_DEV_ERROR(&gpu->pdev->dev,
-				"a650 SQE ucode is too old. Have version %x need at least %x\n",
-				buf[0] & 0xfff, 0x095);
+	} else if (adreno_is_a650(adreno_gpu)) {
+		if ((buf[0] & 0xfff) >= 0x095) {
+			ret = true;
+			goto out;
 		}
 
-		/*
-		 * When a660 is added those targets should return true here
-		 * since those have all the critical security fixes built in
-		 * from the start
-		 */
+		DRM_DEV_ERROR(&gpu->pdev->dev,
+			"a650 SQE ucode is too old. Have version %x need at least %x\n",
+			buf[0] & 0xfff, 0x095);
+	} else if (adreno_is_a660(adreno_gpu)) {
+		ret = true;
+	} else {
+		DRM_DEV_ERROR(&gpu->pdev->dev,
+			"unknown GPU, add it to a6xx_ucode_check_version()!!\n");
 	}
 out:
 	msm_gem_put_vaddr(obj);
-- 
2.26.1

