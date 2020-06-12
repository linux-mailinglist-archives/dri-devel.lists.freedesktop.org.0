Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF8F1F71C2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 03:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A13F6E0F2;
	Fri, 12 Jun 2020 01:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B44A6E0F2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 01:36:30 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id d66so3529066pfd.6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 18:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VJXjbn0Abhyz2aIJ70BlGOdwvizcrNhcVe7oRHFpvnI=;
 b=YIkCBNJDLFVU2RnuFH7uRXS06GfUZgvZe0YKrK5PfR3oj16uwRqRH3BIQ5V/+XbKmC
 uD3gbHmNhJS3NKGYaCV+hdgKBbpaCqcGeVhy35gZiomyVL7S7sQbhIhwVuAplfMjqFcG
 Qf9SSuOP6uu7+zC+PAryM+UVdIMZMpAocuQPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VJXjbn0Abhyz2aIJ70BlGOdwvizcrNhcVe7oRHFpvnI=;
 b=Q6lO2zTnLJVpZZm7kmn+le/uGDD9iDQmzon6l0R84ZNTfkuuxVsdrzV9TIdD3/hJKv
 cY5XOGlJJLR2Px4Hp7meaO/u6gylWd229cfmo/dCXrYNgMek1yL3rYRKejc3o2F+JKTs
 YveFFUhUZG5UDi7qtyltcKFVDuUWfjTr8wsKrszCcek7PrJTUMPAAy3n9blhMNJrmFJ+
 YDwSKg8fwPXiRccTartlxOXlUrc+lM8/DQRQpYLvqr+vM358i2yDpOqS2OKEoON+xIiM
 KlAwoKVQPMoCEoQLzCAFNLLR1iwX8NeDkKzIZx1WrppkPgLAzZa+w7YSMFHbYAUWlKmy
 WkGg==
X-Gm-Message-State: AOAM532My5+LSEukoTXj11UJfjgHAE8LrmC3/zTAkTEPsWAXL7/qbVDL
 VbXopaAqqCHnhY6WCkix6AdNSUZdxb4=
X-Google-Smtp-Source: ABdhPJwfp7i34/Isdmoe8xYzYz+xLuaGraUhv+TgPIpLXpdkJuhWleYXpOcMfTWW7AW7WwPpxcxOwg==
X-Received: by 2002:a62:3806:: with SMTP id f6mr9604840pfa.102.1591925789089; 
 Thu, 11 Jun 2020 18:36:29 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id c2sm4331535pfi.71.2020.06.11.18.36.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 11 Jun 2020 18:36:28 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/shmem: add support for per object dma api operations
Date: Thu, 11 Jun 2020 18:36:24 -0700
Message-Id: <20200612013625.547-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: daniel.vetter@ffwll.ch, kraxel@redhat.com, tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is useful for the next patch.  Also, should we only unmap the
amount entries that we mapped with the dma-api?

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 16 +++++++++++-----
 include/drm/drm_gem_shmem_helper.h     | 10 ++++++++++
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 0a7e3b664bc2..d439074ad7b5 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -124,8 +124,10 @@ void drm_gem_shmem_free_object(struct drm_gem_object *obj)
 		drm_prime_gem_destroy(obj, shmem->sgt);
 	} else {
 		if (shmem->sgt) {
-			dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
-				     shmem->sgt->nents, DMA_BIDIRECTIONAL);
+			if (!shmem->skip_dma_api)
+				dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
+					     shmem->dma_map_count,
+					     DMA_BIDIRECTIONAL);
 			sg_free_table(shmem->sgt);
 			kfree(shmem->sgt);
 		}
@@ -422,8 +424,9 @@ void drm_gem_shmem_purge_locked(struct drm_gem_object *obj)
 
 	WARN_ON(!drm_gem_shmem_is_purgeable(shmem));
 
-	dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
-		     shmem->sgt->nents, DMA_BIDIRECTIONAL);
+	if (!shmem->skip_dma_api)
+		dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
+			     shmem->dma_map_count, DMA_BIDIRECTIONAL);
 	sg_free_table(shmem->sgt);
 	kfree(shmem->sgt);
 	shmem->sgt = NULL;
@@ -695,7 +698,10 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_object *obj)
 		goto err_put_pages;
 	}
 	/* Map the pages for use by the h/w. */
-	dma_map_sg(obj->dev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL);
+	if (!shmem->skip_dma_api)
+		shmem->dma_map_count = dma_map_sg(obj->dev->dev, sgt->sgl,
+						  sgt->nents,
+						  DMA_BIDIRECTIONAL);
 
 	shmem->sgt = sgt;
 
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 5381f0c8cf6f..2669d87cbfdd 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -101,6 +101,16 @@ struct drm_gem_shmem_object {
 	 * @map_cached: map object cached (instead of using writecombine).
 	 */
 	bool map_cached;
+
+	/**
+	 * @skip_dma_api: skip using dma api in certain places.
+	 */
+	bool skip_dma_api;
+
+	/**
+	 * @skip_dma_api: number of pages mapped by dma-api.
+	 */
+	bool dma_map_count;
 };
 
 #define to_drm_gem_shmem_obj(obj) \
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
