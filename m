Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19533416CAD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 09:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D896EE02;
	Fri, 24 Sep 2021 07:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CE36EE01;
 Fri, 24 Sep 2021 07:18:05 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id t28so10952587wra.7;
 Fri, 24 Sep 2021 00:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AwV7Dzo05G1M7WPSGSE6Kp0r0Hu8Z0RNZajG98cvzrU=;
 b=TcWzDxVPitl7PsTMHPQzSbrHYAaqa7eBcAS4tjndb/ae1uaATmnfCtiUNJX27R0ID/
 36oXWGGY3NYz5Hip5qeHa+LXuTONWIXStYv7iSEUXjf8UOe7HtcSSMQ3HPeh3SyZ9Kcv
 whnKZDfRvDMpfLyF5sNzum8K7PSkDXRw8oJMioPKBlOCjWg1vUj0s9hifEOT0zS6V2A8
 pvzkJmdCnXi4tmf1uc87NRXWySBgKgzSkNJ+0dyph5mtMIdgU+8Y9wWOxsGwZioTD0iT
 E/4xGVth2IkloMy9lNzYNI9n6a6Tbv+SD3eV0XNjL646jBamcgxoRbHkELXBSq5oX3g8
 xFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AwV7Dzo05G1M7WPSGSE6Kp0r0Hu8Z0RNZajG98cvzrU=;
 b=RuI6SsBiUE7WHQJPH1wj3JP5EJFP4W7EBjrN+FLQSzvWB5X+OtXc2jPTV+xvnSb22d
 DK777jiOcNOzSm9suXTucUVGfrdtwzTQyzLSdZdR2kJfXfyRDYbNwtWejRokU5e2aRd5
 o0U5YwEl+99JaLswbauAyCfh+f1gnrWDQBPQcbPK7jjBvJjVvvEk4Of1p2KyLzRlxHDI
 /UNN5QYhhEbdEkP2sGe4wsP8nFLhE9+BjGVU2A0Y8JZ18LhfjKc6ah7ZT67IpRZOY5cY
 OwV3twyI80jlswpK87E5tpYmZ086XY5rLef6UiwgVITsMmSw1r4F1LGxj3PZX3O5+soy
 1Xfg==
X-Gm-Message-State: AOAM530J+WRiWLm/sxV1cCTrpVpArlkkVIGz8S7+96DwOmsfMnr/atv4
 9eW1azgTS4oa7sW+cxphTsKQ8nVWTIY=
X-Google-Smtp-Source: ABdhPJxxTY5kzWJ30+okdI1Hp4dxwBDgVKVNeDPsnbdYr7Z1xmwPQhhUFBtxUi+JI6t45GtcLNW0rw==
X-Received: by 2002:a7b:c7c6:: with SMTP id z6mr473499wmk.34.1632467884025;
 Fri, 24 Sep 2021 00:18:04 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 b7sm9200070wrm.9.2021.09.24.00.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 00:18:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, etnaviv@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Cc: l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 linux+etnaviv@armlinux.org.uk, robdclark@gmail.com, sean@poorly.run
Subject: [PATCH 3/4] drm/msm: use the new dma_resv_describe
Date: Fri, 24 Sep 2021 09:17:58 +0200
Message-Id: <20210924071759.22659-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924071759.22659-1-christian.koenig@amd.com>
References: <20210924071759.22659-1-christian.koenig@amd.com>
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

