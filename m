Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE7874A5A3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 23:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304FF10E4DD;
	Thu,  6 Jul 2023 21:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706ED10E4CD;
 Thu,  6 Jul 2023 21:11:14 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1b890e2b9b7so6225375ad.3; 
 Thu, 06 Jul 2023 14:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688677873; x=1691269873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KE/HRYJUOwz46737Zy2ObEKXxP27JaI6CDUPzYPq7g0=;
 b=eyiCDb6DseoefFt0ZKXZL5H68R3nBUdg8Vrz7cvGEZfTIfi7dmy5XcwkzluURuafAw
 VqQCHIMAAuHQsr3II8jknIIoYvlltl1p+QKLVieyZ4u3W5TXG068mnc/a1XMaG6dkoo9
 /ryB/Z7nJFgVbhQ+SSy+MfP0u2NX1K+UUxJRJO9cyh6XElm7g1sQVLuyLDwwbX7O2AqL
 X8iCaV4P5K3EuR0PUur20BzPih0Rxm8upfAMr+TUky7ufxFkRwh2BQ/VaAVaSC8LBrrm
 5XVshLfePtcU68umqBGk49ChTNLKPyTh1Z0zua/KCNy5grZQUPsyW6bGK2XJgfGUFICE
 uvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688677873; x=1691269873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KE/HRYJUOwz46737Zy2ObEKXxP27JaI6CDUPzYPq7g0=;
 b=RvKKemp1lqmd7FSUs8ee7jbhVHVtUrRca8KpgnGes52FwPP2kGi3olS0i7X7XAhIMr
 chZaqVeirrBQsPFk9wDS8t5iUjR1w7m44itoKZmL4PC5do8Ko/nUdAkKYwIX4dsg76sh
 e0M2jL4/X9x7Ukr8o+FXu6jvvtwJrh+Di8gIPfKCLPajyqC39Kuw47KhMhUqFAPyqTEi
 aatf/5N/JsrmJhMS1DMYGTG3PxtB3IYCavr8qyoG5Ik2uMNwSAlPowtSDp4vV8glqo/G
 Nv6npOXmiGLgYh/9OhGAqT8acwwvKUXKIitU82J5K3NzWr9Soeaxz6l3tCCW0Ygh1v9V
 UYcQ==
X-Gm-Message-State: ABy/qLaxp54VhFyuf6ez0vvyOETz9RGJ9tOKXrS/YGGF5ExvoFTeodJM
 5bmrXKSa00Rdu6rFk/OcBHL7sZsfFqg=
X-Google-Smtp-Source: APBJJlEJFBA3x0Ya3PZPHVy7BtH2LbjmFHSPj+Fu//78cBPxZ7VhDZjTPZ7sf86h3jgHkNmFziM8bA==
X-Received: by 2002:a17:90a:c292:b0:263:f5fa:cf1b with SMTP id
 f18-20020a17090ac29200b00263f5facf1bmr2299944pjt.30.1688677873373; 
 Thu, 06 Jul 2023 14:11:13 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a17090aaa8400b00262fc3d911esm209033pjq.28.2023.07.06.14.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 14:11:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/12] drm/msm/adreno: Bring the a630 family together
Date: Thu,  6 Jul 2023 14:10:41 -0700
Message-ID: <20230706211045.204925-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706211045.204925-1-robdclark@gmail.com>
References: <20230706211045.204925-1-robdclark@gmail.com>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

All of these are derivatives of a630.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 5deb79924897..f1bb20574018 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1617,7 +1617,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 			SZ_256K - SZ_16K, 0x44000, "dcache");
 		if (ret)
 			goto err_memory;
-	} else if (adreno_is_a630(adreno_gpu) || adreno_is_a615_family(adreno_gpu)) {
+	} else if (adreno_is_a630_family(adreno_gpu)) {
 		/* HFI v1, has sptprac */
 		gmu->legacy = true;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 994ac26ce731..6066cfaaea52 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -335,10 +335,11 @@ static inline int adreno_is_a690(const struct adreno_gpu *gpu)
 	/* The order of args is important here to handle ANY_ID correctly */
 	return adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), gpu->rev);
 };
-/* check for a615, a616, a618, a619 or any derivatives */
-static inline int adreno_is_a615_family(const struct adreno_gpu *gpu)
+/* check for a615, a616, a618, a619 or any a630 derivatives */
+static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)
 {
-	return adreno_is_revn(gpu, 615) ||
+	return adreno_is_revn(gpu, 630) ||
+		adreno_is_revn(gpu, 615) ||
 		adreno_is_revn(gpu, 616) ||
 		adreno_is_revn(gpu, 618) ||
 		adreno_is_revn(gpu, 619);
-- 
2.41.0

