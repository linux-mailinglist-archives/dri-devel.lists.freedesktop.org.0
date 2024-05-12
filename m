Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE428C3527
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 07:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9756810E0B5;
	Sun, 12 May 2024 05:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j68OD5pz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E001710E0B5;
 Sun, 12 May 2024 05:50:36 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3504f34a086so1803763f8f.1; 
 Sat, 11 May 2024 22:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715493035; x=1716097835; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3P87QNQI1cdzXKDd3JYfTiYCdS5DbA/31YPlGfdPOLE=;
 b=j68OD5pzEtNy8XtAC3ooEY+9XKKxpTU9WOIh4L+q/BIumYUTG3N6YRjposfBEPiUF8
 mabyj9WEbUzu71jLho4OnYhWqI46IvXiYPbZO2zHUk/Y22q8XgYKSv93W3jKpo5fiegY
 Rh51sjUk70czUhZ70z/B9MrVmAXXqbfR8pA5HqCzfT7VZPcYJW7JjzcaZ+8MLYvbw8NM
 q6kWT9RTeD0o31WtMQNaiB4BJF7KlPAxfgLVdl9787xQJONTVRS6NsDreGkwchxB8tW2
 3JwkrtGhMwu0avfy/MGb6We0+CatGA+s8Eo5mkxP1M2Dr8Ui3p6AXx6inFEqWdU8UF1r
 NuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715493035; x=1716097835;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3P87QNQI1cdzXKDd3JYfTiYCdS5DbA/31YPlGfdPOLE=;
 b=dBoKNfFWlqNq+/CqaoxCrcnKAIm89g0Iq5qHZwD18Bs6ocXwRYi20xkUi9q+cBPjSK
 fXobK5+51Gs+UHFsP/qISwksKrIwFpPhOZk7NZcpzycxRl13NsWJEdb70+QB0ZDOAJnZ
 qR/WAYYz56Es9cKbvb58G/Z0wl2bVzCzsmJjjYQQwPNLHbq3VwePMvIH7Hpe7nQ5YFxW
 H2UvKinWH6hFqW+zGM+mFIGW0fx1G1IHLW1HV8+VlsRIUxx0G0N/zPmhGwQE2aWsVxfP
 JTOAmyyCSKKoszsetzsX6ZVU0LEtW63eQCOf6a1m4d5VdlB9yXPGcdhjG3g1nm1KwAHL
 hVYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvYunjg8/CYjtaHjJPDmqNJN7kNJUmtJxnKkEWqJ+tLtuVHFaQhA+zoJtF20BVUHfF4OpqvbI+rzApmbMvFMyWHqORE5ua1uSjeF9fXcW3YS4md33Np2TVP6HSlxuU9A24a4XwL4lF+eg60BEqmmUl
X-Gm-Message-State: AOJu0YwGUjilQ3O2ePFiJklTGM3MrQ1sbxcnRsISk7OGyEzJyfWOhTOw
 h7G+sRQGQHcEdg2Uvv/rdqvaN3/07gm5nM2zirlF84MTxEwctaIN
X-Google-Smtp-Source: AGHT+IF04Ds5tvXV4Cg/hI3Oyl/H3/3cE837ElBsfTF9KwyluX0RHqTIK53+1bMLv6gpxAE6fO6PAw==
X-Received: by 2002:a5d:52d1:0:b0:34e:4105:b3f6 with SMTP id
 ffacd0b85a97d-3504a73ee8dmr4703871f8f.39.1715493035057; 
 Sat, 11 May 2024 22:50:35 -0700 (PDT)
Received: from kali.localhost ([5.208.126.127])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbbde1sm8233658f8f.97.2024.05.11.22.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 May 2024 22:50:34 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
Date: Sun, 12 May 2024 01:49:38 -0400
Subject: [PATCH v3 1/2] drm/msm/a6xx: request memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-msm-adreno-memory-region-v3-1-0a728ad45010@gmail.com>
References: <20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com>
In-Reply-To: <20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kiarash Hajian <kiarash8112hajian@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715493029; l=2001;
 i=kiarash8112hajian@gmail.com; s=20240409; h=from:subject:message-id;
 bh=pqxwzpqjeLaRI5EDxNPTtTBb3Tu0jXn7ELZFMBQ3ty8=;
 b=H1PJF04vum4qJtdfIWyr9687LM2NkNqG5XOS95rodZCI9HFRySOf6DcwRQtOabGfvstM9AaKi
 r9xxWalD41rCsDelS/PxoRH6imO3T1D+OApZolw/o4IT8w570QCekh/
X-Developer-Key: i=kiarash8112hajian@gmail.com; a=ed25519;
 pk=ehVBr28gPcA8cMB/wneVh0Mj6WGkqZoyYRdRNi5+aI0=
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

The driver's memory regions are currently just ioremap()ed, but not
reserved through a request. That's not a bug, but having the request is
a little more robust.

Implement the region-request through the corresponding managed
devres-function.

Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 8bea8ef26f77..aa83cb461a75 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -636,9 +636,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 
 err:
 	if (!IS_ERR_OR_NULL(pdcptr))
-		iounmap(pdcptr);
+		devm_iounmap(&pdev->dev,pdcptr);
 	if (!IS_ERR_OR_NULL(seqptr))
-		iounmap(seqptr);
+		devm_iounmap(&pdev->dev,seqptr);
 }
 
 /*
@@ -1503,7 +1503,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = ioremap(res->start, resource_size(res));
+	ret = devm_ioremap_resource(&pdev->dev, res);
 	if (!ret) {
 		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
 		return ERR_PTR(-EINVAL);
@@ -1646,7 +1646,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	dev_pm_domain_detach(gmu->cxpd, false);
 
 err_mmio:
-	iounmap(gmu->mmio);
+	devm_iounmap(gmu->dev ,gmu->mmio);
 
 	/* Drop reference taken in of_find_device_by_node */
 	put_device(gmu->dev);
@@ -1825,9 +1825,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	dev_pm_domain_detach(gmu->cxpd, false);
 
 err_mmio:
-	iounmap(gmu->mmio);
+	devm_iounmap(gmu->dev ,gmu->mmio);
 	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
-		iounmap(gmu->rscc);
+		devm_iounmap(gmu->dev ,gmu->rscc);
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
 

-- 
2.43.0

