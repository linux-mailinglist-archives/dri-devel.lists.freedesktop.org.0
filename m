Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B54E3416CAF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 09:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2356EE03;
	Fri, 24 Sep 2021 07:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A056EE02;
 Fri, 24 Sep 2021 07:18:06 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d21so24211571wra.12;
 Fri, 24 Sep 2021 00:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zdiCR57I2VQ9UbAgMh1ATN9FWtSQnQ+P4kUe0ofzWJM=;
 b=WspNFDBd3YguRCkegjfpIkoKi4mAXUIwY99A+hOeTdLBMvPRUA9/jI58DgAO/njnJY
 ii/ubXUaX2Qn8rRaIyWHkgcv8Kkwiw2ZK1z9c4a8WgZBD/Aqp1vzvUkYPlHE02QtcLqA
 +Jv6C15obv9SgvSg/+Kw/S17D+QfEOaCxsBA1H88TKwIwKQ05a7r8JHgqaGiKgGWiDIw
 tg357eFJuakgqnK87Fh7KGLUVQO/gENGj7NJi5QSFNUliujrUKjxhaqA9+V6gGjp4MG+
 BflL7igpt/0w98+v14C/TwblWBJyW2n/PVOkTn+IITMcrj5MRHf+pfOiQkDsCmCiciRs
 Yjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zdiCR57I2VQ9UbAgMh1ATN9FWtSQnQ+P4kUe0ofzWJM=;
 b=uWdDW+m+KzrFfLn81zNrNz6DesU8YnPnFfK5WQbhwPwDHWQCp2tzZECPcQrZ9LubQj
 c+f1KYA/tKOVCiu4QEzvY+nrtGRf/dJ+Dj1wKsxVQzd3kKHsRy9Lt2/UtZeIqnafLqVb
 lYuPjUx995XIE0bCMimqAxZo1SD8zwvPkpRJR51k/CABGm1FCd7+Uocl1Y1FIUUyqLGU
 eULqVHGEAlC6acPZxTF0jvNp5vGdSJV3LGFOVs6rMu1zXqn6LtdwPk04IlmMRa8ZU5/0
 dQXBHzeUD7FT+2StI6cAjSE5oeFNOKkYbELX8Lr/fTRq489JMHhSyZoaEu88tcwEnVJA
 PfJw==
X-Gm-Message-State: AOAM533A7CYBJa1pciLBbLOzFF/XbRhPPxG2/pnZHn3NwQhqwhEhkRGH
 Mktrlay4ojxm5BRpaL7u3Hyrie2rBSM=
X-Google-Smtp-Source: ABdhPJztLdLXtRY+dHAnQxKC62ECEE/JQBUNN3kIlTaempf7aLIH0KHkHYPSRCQaVQiQyzq2faqTlA==
X-Received: by 2002:adf:cf04:: with SMTP id o4mr9280410wrj.352.1632467885212; 
 Fri, 24 Sep 2021 00:18:05 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 b7sm9200070wrm.9.2021.09.24.00.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 00:18:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, etnaviv@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Cc: l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 linux+etnaviv@armlinux.org.uk, robdclark@gmail.com, sean@poorly.run
Subject: [PATCH 4/4] drm/etnaviv: use dma_resv_describe
Date: Fri, 24 Sep 2021 09:17:59 +0200
Message-Id: <20210924071759.22659-4-christian.koenig@amd.com>
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

Instead of dumping the fence info manually.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 0eeb33de2ff4..304b006e86bb 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -425,36 +425,24 @@ int etnaviv_gem_wait_bo(struct etnaviv_gpu *gpu, struct drm_gem_object *obj,
 }
 
 #ifdef CONFIG_DEBUG_FS
-static void etnaviv_gem_describe_fence(struct dma_fence *fence,
-	const char *type, struct seq_file *m)
-{
-	seq_printf(m, "\t%9s: %s %s seq %llu\n", type,
-		   fence->ops->get_driver_name(fence),
-		   fence->ops->get_timeline_name(fence),
-		   fence->seqno);
-}
-
 static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
 	unsigned long off = drm_vma_node_start(&obj->vma_node);
+	int r;
 
 	seq_printf(m, "%08x: %c %2d (%2d) %08lx %p %zd\n",
 			etnaviv_obj->flags, is_active(etnaviv_obj) ? 'A' : 'I',
 			obj->name, kref_read(&obj->refcount),
 			off, etnaviv_obj->vaddr, obj->size);
 
-	dma_resv_iter_begin(&cursor, robj, true);
-	dma_resv_for_each_fence_unlocked(&cursor, fence) {
-		if (dma_resv_iter_is_exclusive(&cursor))
-			etnaviv_gem_describe_fence(fence, "Exclusive", m);
-		else
-			etnaviv_gem_describe_fence(fence, "Shared", m);
-	}
-	dma_resv_iter_end(&cursor);
+	r = dma_resv_lock(robj, NULL);
+	if (r)
+		return;
+
+	dma_resv_describe(robj, m);
+	dma_resv_unlock(robj);
 }
 
 void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
-- 
2.25.1

