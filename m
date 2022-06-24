Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D9D5594A4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 10:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62464112C01;
	Fri, 24 Jun 2022 08:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28144112C23;
 Fri, 24 Jun 2022 08:04:57 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z19so2278930edb.11;
 Fri, 24 Jun 2022 01:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=693VGEXA19r817fSkp2HQ7yboKFhWxOFXyjV0CxaoD8=;
 b=bPO2J7WjvzBcNpfIHv7dl25KdodmC5owqOj/ao7wNhAnd3KqvnC/BclTClPISp0FIg
 ErmyDY0AnX0VgWurEGxdWOwwQCER5PQ8tiXh8uXejlJ71JfTDxMflFOmlfyeUtCgpzYl
 GCNQ6a3+oelf8dKov7UIjW0o/PNElo5JTYQYT16G+EdOs+rFrzp8MWQJaRzfStUeqoJU
 MAaIvGG9hQ1CJqJB/mBg7bHcQtPQ4wHEK/inBzbq6m/eeuM3S02aw2kKyDLmLsG/efiK
 hoTfCJ2TyZ5SBAvoWyQg6Igc48Som98fLO9wcbofHL1PNn01cJ6620JB+zhOQQSTbm9Y
 3eGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=693VGEXA19r817fSkp2HQ7yboKFhWxOFXyjV0CxaoD8=;
 b=R4Q7C94+9yywfvHJypZbyKQCgM1qSImkSmoedDisw3KdTJ/Q/VIShm7G4a4GONGEzS
 DYKmMHev6nXVpEP/skQLY0T+OfbvgO8W/NTZsxHXqSf0H4MfXlD9fDybLzfmR0hWCEGC
 5cBoRZTG7VtTrchOLkNGiKYaEi5ptbwOmA1Ec83eDg/lIh7sF3lQ1E8RN9MhV5RLKdeS
 wLuZ+tq+q203Syxpo/CKvrAmI5qXVOCnMFHH8QXlPOVrHVBHLZayT31QWEdy7n4pUTGT
 YYBPAqq454NqBxm0vS2nFEO26T/LISG6TM0So3DEbzgdtkkI7UFEExCVHLfly98LpxEt
 i/6Q==
X-Gm-Message-State: AJIora/JR/TNvIqdJgC8uKAjJdT30O1WYd/OHV6Ppz3Fy7w/30EvXDHx
 W9rWQJpggwOb4ReJaOf4wAc=
X-Google-Smtp-Source: AGRyM1sUzCXIERY4xHIb6/DBgczJUjRT28k1Ye0d5toII0cbHGJ1AwKeLvxpb+HA2e+MaKqALcspsA==
X-Received: by 2002:a05:6402:5188:b0:437:618c:c124 with SMTP id
 q8-20020a056402518800b00437618cc124mr290922edd.233.1656057895213; 
 Fri, 24 Jun 2022 01:04:55 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170906155300b006fea43db5c1sm697779ejd.21.2022.06.24.01.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:04:54 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 06/14] drm/gem: adjust per file RSS on handling buffers
Date: Fri, 24 Jun 2022 10:04:36 +0200
Message-Id: <20220624080444.7619-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624080444.7619-1-christian.koenig@amd.com>
References: <20220624080444.7619-1-christian.koenig@amd.com>
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
Cc: mhocko@suse.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Large amounts of VRAM are usually not CPU accessible, so they are not mapped
into the processes address space. But since the device drivers usually support
swapping buffers from VRAM to system memory we can still run into an out of
memory situation when userspace starts to allocate to much.

This patch gives the OOM killer another hint which process is
holding references to memory resources.

A GEM helper is provided and automatically used for all drivers using the
DEFINE_DRM_GEM_FOPS() and DEFINE_DRM_GEM_CMA_FOPS() macros.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/drm_file.c       | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/drm_gem.c        |  5 +++++
 include/drm/drm_file.h           |  9 +++++++++
 include/drm/drm_gem.h            |  1 +
 include/drm/drm_gem_cma_helper.h |  1 +
 5 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ed25168619fc..b60795c5067c 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -1049,3 +1049,27 @@ unsigned long drm_get_unmapped_area(struct file *file,
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 EXPORT_SYMBOL_GPL(drm_get_unmapped_area);
 #endif /* CONFIG_MMU */
+
+
+/**
+ * drm_file_rss() - get number of pages held by struct drm_file
+ * @f: struct drm_file to get the number of pages for
+ *
+ * Return how many pages are allocated for this client.
+ */
+long drm_file_rss(struct file *f)
+{
+
+	struct drm_file *file_priv = f->private_data;
+
+	if (!file_priv)
+		return 0;
+
+	/*
+	 * Since DRM file descriptors are often DUP()ed divide by the file count
+	 * reference so that each descriptor gets an equal share.
+	 */
+	return DIV_ROUND_UP(atomic_long_read(&file_priv->f_rss),
+			    file_count(f));
+}
+EXPORT_SYMBOL(drm_file_rss);
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index eb0c2d041f13..69b3e93db816 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -256,6 +256,7 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
 	drm_gem_remove_prime_handles(obj, file_priv);
 	drm_vma_node_revoke(&obj->vma_node, file_priv);
 
+	atomic_long_sub(obj->size >> PAGE_SHIFT, &file_priv->f_rss);
 	drm_gem_object_handle_put_unlocked(obj);
 
 	return 0;
@@ -291,6 +292,8 @@ drm_gem_handle_delete(struct drm_file *filp, u32 handle)
 	idr_remove(&filp->object_idr, handle);
 	spin_unlock(&filp->table_lock);
 
+	atomic_long_sub(obj->size >> PAGE_SHIFT, &filp->f_rss);
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_gem_handle_delete);
@@ -399,6 +402,8 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
 	}
 
 	*handlep = handle;
+
+	atomic_long_add(obj->size >> PAGE_SHIFT, &file_priv->f_rss);
 	return 0;
 
 err_revoke:
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index e0a73a1e2df7..7c6ca13d8549 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -366,6 +366,13 @@ struct drm_file {
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
 	unsigned long lock_count; /* DRI1 legacy lock count */
 #endif
+
+	/**
+	 * @f_rss:
+	 *
+	 * How many pages are allocated through this driver connection.
+	 */
+	atomic_long_t		f_rss;
 };
 
 /**
@@ -430,4 +437,6 @@ unsigned long drm_get_unmapped_area(struct file *file,
 #endif /* CONFIG_MMU */
 
 
+long drm_file_rss(struct file *f);
+
 #endif /* _DRM_FILE_H_ */
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 9d7c61a122dc..b64cad26e9e9 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -338,6 +338,7 @@ struct drm_gem_object {
 		.read		= drm_read,\
 		.llseek		= noop_llseek,\
 		.mmap		= drm_gem_mmap,\
+		.file_rss	= drm_file_rss,\
 	}
 
 void drm_gem_object_release(struct drm_gem_object *obj);
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index fbda4ce5d5fb..8c56cbc8d10f 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -273,6 +273,7 @@ unsigned long drm_gem_cma_get_unmapped_area(struct file *filp,
 		.read		= drm_read,\
 		.llseek		= noop_llseek,\
 		.mmap		= drm_gem_mmap,\
+		.file_rss	= drm_file_rss,\
 		DRM_GEM_CMA_UNMAPPED_AREA_FOPS \
 	}
 
-- 
2.25.1

