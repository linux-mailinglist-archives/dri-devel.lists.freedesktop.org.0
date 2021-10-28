Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBDC43DD54
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 10:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9995F6E93E;
	Thu, 28 Oct 2021 08:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88C26E935;
 Thu, 28 Oct 2021 08:58:33 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k7so8790935wrd.13;
 Thu, 28 Oct 2021 01:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HJ3FVZIBonOhulw4j97XZ+WDT4N0aGjKYTEFgdMl2bY=;
 b=WQOumxgn7tGakSu5vcFCNz4PF9zeeT7h3I8Fd5JCGr5QZqH9JuEQyee3u4RXZGM0JF
 2qN9vGoreHgP4GYf2DuuIWa0T5YJtrIjdkKqScRQQGRVFsJ2M2AfsM41iVpgKVRDCueh
 Tks011F8LfrX+O1yMnW5bFWqClwA7jYDsmR/iR3B/5s76ze7QSARIDNZKO72bW+Cz4Dr
 27p3x8eS+GwsOvLd8Tcvj4PQ+cL/HvSnuLggXHzvet7PJ6dJlTbzduHVqRr+IYCNYsI8
 93WjSD51yaDQXPMEfIcawmO+bE/gzd41qk001w5HDk0VO+PRPmdrdbleWlHNxZLJkLyu
 Ehhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HJ3FVZIBonOhulw4j97XZ+WDT4N0aGjKYTEFgdMl2bY=;
 b=H6NsuN+H7EbNMwZ8+dV42tgZ3Rv/PVECFsUjgLiiw7hB4Gj4GaP7RuatyXPp/h1K9O
 Z/CWQNfnELdq6ckNJPxM85MYC5LOw3ZldzQYiBsee04MMypek4XC4SmDMkJA4yKyj4dx
 cR30odOEzwJGUYIDziYIzWF2Q3r/fmC7v0cS1+pQZCg90fxMFyUpGzAHLdUoRda8unEK
 M+wnNVAxCr2Jw+syc0cwVPVGUfz99bdmFXryxYFmsmsVlfFQWZ9gZ5rAR+o7Hn6x5cS7
 JPsr5Z6YAEJF4sJfFyc7H3289e2bJqvJJXEQrZhcnAduSIl3tXslpDD/rB6eLxnCg93R
 BZ1g==
X-Gm-Message-State: AOAM5339+Qq4iD9V0Oup7K0WDO72LmiTPBJb1JsX2liL18fEVEI9l330
 KgdPVp/2dryshN4vcAjFDtL1y2m2QQs=
X-Google-Smtp-Source: ABdhPJy81fvykOcidGCavoYOA0fRG5j8hjfU8RE6GPqMrh5VHEL6jayQ/XCd5S8AoFEBgDmg04fTgw==
X-Received: by 2002:adf:ea81:: with SMTP id s1mr3884320wrm.59.1635411512271;
 Thu, 28 Oct 2021 01:58:32 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 k22sm2412143wrd.59.2021.10.28.01.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 01:58:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org
Cc: etnaviv@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/msm: use the new dma_resv_describe
Date: Thu, 28 Oct 2021 10:58:27 +0200
Message-Id: <20211028085829.1726-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028085829.1726-1-christian.koenig@amd.com>
References: <20211028085829.1726-1-christian.koenig@amd.com>
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

Instead of hand rolling pretty much the same code.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5bd511f07c07..3878b8dc2d59 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -865,23 +865,11 @@ int msm_gem_cpu_fini(struct drm_gem_object *obj)
 }
 
 #ifdef CONFIG_DEBUG_FS
-static void describe_fence(struct dma_fence *fence, const char *type,
-		struct seq_file *m)
-{
-	if (!dma_fence_is_signaled(fence))
-		seq_printf(m, "\t%9s: %s %s seq %llu\n", type,
-				fence->ops->get_driver_name(fence),
-				fence->ops->get_timeline_name(fence),
-				fence->seqno);
-}
-
 void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 		struct msm_gem_stats *stats)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
 	struct msm_gem_vma *vma;
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
@@ -955,13 +943,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 		seq_puts(m, "\n");
 	}
 
-	dma_resv_for_each_fence(&cursor, robj, true, fence) {
-		if (dma_resv_iter_is_exclusive(&cursor))
-			describe_fence(fence, "Exclusive", m);
-		else
-			describe_fence(fence, "Shared", m);
-	}
-
+	dma_resv_describe(robj, m);
 	msm_gem_unlock(obj);
 }
 
-- 
2.25.1

