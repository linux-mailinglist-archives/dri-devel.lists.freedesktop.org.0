Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2427637F084
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 02:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A346E7FE;
	Thu, 13 May 2021 00:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952AE6E7FE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 00:39:22 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id f8so14503631qth.6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 17:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nnRvE7q7omrM9Y7M/uG0pQjcGn/zVQ91DdwGZf18JUA=;
 b=iFEOAoOEidpxJv/4U3NRI+KV1cH/GGVonttUSD2VOPM9C7GQV676OVDzVjA8HMmmhC
 JY1GyxO8cKn0g338BG7veWQrpbp9Pi1hr7erSZ+KOebfeoeyCOVGTnvxAitzqWDsC+r8
 wvEdQaRtNr37lgaMcpE9kaPSzoAmMIq+I4uvaDp0hCIPMiIT3bTdu8d/ZDUCp1qKJYG5
 20wGITd/kcLjkgUH6z29AUqhxipV4NGc8rl4QZUs4dg5UQzMR1nCLcREjOlB4AMqzlQm
 SfjD9pYD2oPuhXw1sOXjyET227/Mg8rx3/HHvM47N11pzlPlDKNcpZDY0Eq+XDGVIvNc
 kVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nnRvE7q7omrM9Y7M/uG0pQjcGn/zVQ91DdwGZf18JUA=;
 b=Xo6XdjIg9rsX3AnalxTeJrLNEkeZR5gF/VBuy48NVAHYTYPPKibIemnQY9mnWZfp1i
 jzxINZsdCnjz+RgqvKvhojusZKpUYSzDDc2FPhM1P87VJtqwj+Nk6bfwoWesoq+x1fnN
 /IXAzSTzGm3hWswritegjSYm3Rq1p2kHTFDb1T1GtuqadsBObDgWOMV0iFCtMAilqRuy
 30xSUvUtRQ4Gt6aNGUHEHe3nUtpI6sm9Wk35410iJq7cJUGbmCo6C7CLxgi6vO4A+FGI
 OGh5tmxAtSAg5TsvGy8qb5ngiqyzD6f2isyKmNU3Za0pWH1u+OtZCHJryKbDitFLLrjH
 5uxQ==
X-Gm-Message-State: AOAM532aRoYX45W4DDAxFju56S7EQN5ngiBsvX6BQc511ZwjKAkP8AWx
 nCSPP/2JQD+WDvZoYpC2KHrHbA==
X-Google-Smtp-Source: ABdhPJwZFkdm3qJWYphlBOa4pGjbVWYRWlHXshlrTtHqe59WzZni9+nU4+jmqVdZjXBBVRBn5sIEmA==
X-Received: by 2002:a05:622a:10e:: with SMTP id
 u14mr35186672qtw.229.1620866361837; 
 Wed, 12 May 2021 17:39:21 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id w16sm1204201qts.70.2021.05.12.17.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 17:39:21 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 4/5] drm/msm/a6xx: update a6xx_ucode_check_version for a660
Date: Wed, 12 May 2021 20:37:48 -0400
Message-Id: <20210513003811.29578-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210513003811.29578-1-jonathan@marek.ca>
References: <20210513003811.29578-1-jonathan@marek.ca>
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
index 4467273e66c0..261a20076f9d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -541,6 +541,11 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
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
@@ -564,27 +569,20 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
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

