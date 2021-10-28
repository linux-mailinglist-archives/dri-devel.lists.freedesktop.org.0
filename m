Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 200A543E20B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 15:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB676E987;
	Thu, 28 Oct 2021 13:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8876E97B;
 Thu, 28 Oct 2021 13:26:35 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 j128-20020a1c2386000000b003301a98dd62so1013610wmj.5; 
 Thu, 28 Oct 2021 06:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+ZOGlam3ZY615eG+CpWfufQSgg3eEwqr3uZmKnHNPog=;
 b=kL4LO01axEADDFgKoypKI5W3+0I51DQJlfaqAybcnrgDt7QcmKegUIZCTfzOrrgOnd
 WCLywig0D6KfHtiKzJBpknJctlOCbyW35Nrm3Csy5y9v0efZYhAPPc06nWaZyMMhxfWL
 B7xBEvGtltHfS947NahYNpNJoe1tu/bheIOzESB9djQht1XOYwb+IiEiFpIm7GhDKPwH
 hn5sMtvQjIUChX3cT6Fb1Uoe1G3KtDnrt0/tIKsZkpgfllbKQa28pZB6o5kXUh2FU84n
 3R8xdd4aRZE57lgKL8wkgKDmJPz3eDGi0NUhJq94Po1F3tURR3HXfzWuCx4p/vTlJZpn
 bgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ZOGlam3ZY615eG+CpWfufQSgg3eEwqr3uZmKnHNPog=;
 b=Nr1m5yPJdjjcE2No9JYGlNGzkh2QalczjellYlN9z4JNN00/x3PwGKALdv3qxmHCW1
 tJ1LNua8FFWOtcYYv+sRb20TcTSuV16Sqsuap/u9cb6Vsb61Q3DBjDBYDCLfQdFFhFuG
 k27ZN+87ytLHLQyJDXxLhUePm+YL3jC7Bq9H9gQQ+0/6QkrTzeUtKYrKP8viAT5Svkeu
 0T5FP4wJ6+ieWiESXOSlp+FDXyO4jZgKFCMwLn6W3Npm4eEySf1IsjxvvpbC5x4YH1Qs
 pjtr/i/rXH5Si/LrJzdr7yTP9vKhyH1wBaelVJL5bT0xht2fyVWKoOzWA+1TuuUU6NKE
 ahwQ==
X-Gm-Message-State: AOAM530MmixL93yWCp4ARhIl0iYhzd8e89Z/ExCpszHSf0NNZS7S36GT
 TRdki4ymetkf2cSo77T3jQyB4XPdrM4=
X-Google-Smtp-Source: ABdhPJwhMpsL5tAuu5HCCIQ8uQ0zuJwI57WPFv2ZZVxa4Y++aF7AwdEm+jlfxuSci85VLFZEpY5Inw==
X-Received: by 2002:a05:600c:4293:: with SMTP id
 v19mr4468381wmc.187.1635427594441; 
 Thu, 28 Oct 2021 06:26:34 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l11sm2935695wrt.49.2021.10.28.06.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 06:26:34 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/etnaviv: stop getting the excl fence separately here
Date: Thu, 28 Oct 2021 15:26:27 +0200
Message-Id: <20211028132630.2330-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028132630.2330-1-christian.koenig@amd.com>
References: <20211028132630.2330-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Just grab all fences in one go.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 8dc93863bf96..b5e8ce86dbe7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -189,7 +189,7 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 			continue;
 
 		if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
-			ret = dma_resv_get_fences(robj, &bo->excl,
+			ret = dma_resv_get_fences(robj, NULL,
 						  &bo->nr_shared,
 						  &bo->shared);
 			if (ret)
-- 
2.25.1

