Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBE71DF64C
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240976E1A4;
	Sat, 23 May 2020 09:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8286EA3E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 22:30:45 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id z80so12373122qka.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 15:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+SSfZ9IdBClHLXK3pfg1yXkNX5wz/8jpNFyfhF/pEsw=;
 b=MtLePMPE37iKUqsdbm0WI0hZpMobQwNowF1YqzxZnkYGg8jCoFbmpzz0//yIRCnLGN
 w46JzPzlw6YLUbAFhFo3jYibwkOrEugtULj1tlH7wBQjj/NoLByH3rRDMOhpf4QCu2OC
 7vZXitKqyXM/mbgU713y0LHxjS4tP93m47sM+O6mfGxVs/2uyN9A2Ag1pVMtPZjy+lXY
 jJ/z2rxdpJI7w0vjRkHx03Qav8Pi1+S2eNs84TeqOaWV90KpnNUapsPnmu7bsV++CVgR
 bWGaiVyay3ePM2ReDShlAmJb6wnY5Og1MZXP0CKM0vAoYvJDIG5AYA7ZS7UfkSu/uhCf
 ppqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+SSfZ9IdBClHLXK3pfg1yXkNX5wz/8jpNFyfhF/pEsw=;
 b=txeN58A2vGIB3sYDxTLD8oOj1yHzzUhcWIXmdmydy5VU7AEg2MEReQNm0IDQ53rI5h
 u4x5A+7+38KXcIVKDmtw0xZNKVZ7VEyQLVH15cWtSvcopQ/rLnBJlXCGHCn/28QXdqWv
 VVA8qKoYW9vg/+FSB135Qdk6sdh8Rsvv22AgkPR4J6jX7qIRbny1yZHZ0jg3rWnQxcGD
 yRqQIhm2USmo9kL0fcqihvDkcC3951ceCS1BO4vlqkIl12OyhZ/gwTB+h4IjAhtPY347
 7Ccro3tEW+pAvAZuSHm6TKo6AdeNd8DLm7GESCQhy1ISAd9W9uonq+U8E5OkHHVbrJQn
 nJvQ==
X-Gm-Message-State: AOAM532An2C+lPMS11IvWd89y6vHo8ezad/0MG2uLH8ZICxPiq+4QGNs
 0EdUFrns4XT/CxD9qwTsTuVPxQ==
X-Google-Smtp-Source: ABdhPJzAnLLFpegQtoCoMHFW91a6ZzaBMIso6a0e2wpumt9qbPxo0WGAnu7uCpmn8mWsPKd33gg68Q==
X-Received: by 2002:a37:b3c7:: with SMTP id
 c190mr16615709qkf.466.1590186644182; 
 Fri, 22 May 2020 15:30:44 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id l184sm8416876qkf.84.2020.05.22.15.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 15:30:43 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedreno.org
Subject: [PATCH v2] drm/msm/a6xx: skip HFI set freq if GMU is powered down
Date: Fri, 22 May 2020 18:29:08 -0400
Message-Id: <20200522222909.27260-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200522221159.GA20960@jcrouse1-lnx.qualcomm.com>
References: <20200522221159.GA20960@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 23 May 2020 09:33:36 +0000
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also skip the newly added HFI set freq path if the GMU is powered down,
which was missing because of patches crossing paths.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 67c58345b26a..9851367a88cd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -110,13 +110,6 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
 	struct msm_gpu *gpu = &adreno_gpu->base;
 	int ret;
 
-	/*
-	 * This can get called from devfreq while the hardware is idle. Don't
-	 * bring up the power if it isn't already active
-	 */
-	if (pm_runtime_get_if_in_use(gmu->dev) == 0)
-		return;
-
 	gmu_write(gmu, REG_A6XX_GMU_DCVS_ACK_OPTION, 0);
 
 	gmu_write(gmu, REG_A6XX_GMU_DCVS_PERF_SETTING,
@@ -141,7 +134,6 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
 	 * for now leave it at max so that the performance is nominal.
 	 */
 	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
-	pm_runtime_put(gmu->dev);
 }
 
 void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
@@ -159,13 +151,21 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
 			break;
 
 	gmu->current_perf_index = perf_index;
+	gmu->freq = gmu->gpu_freqs[perf_index];
+
+	/*
+	 * This can get called from devfreq while the hardware is idle. Don't
+	 * bring up the power if it isn't already active
+	 */
+	if (pm_runtime_get_if_in_use(gmu->dev) == 0)
+		return;
 
 	if (gmu->legacy)
 		__a6xx_gmu_set_freq(gmu, perf_index);
 	else
 		a6xx_hfi_set_freq(gmu, perf_index);
 
-	gmu->freq = gmu->gpu_freqs[perf_index];
+	pm_runtime_put(gmu->dev);
 }
 
 unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
