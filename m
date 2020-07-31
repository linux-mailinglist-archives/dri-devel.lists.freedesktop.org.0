Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D273234637
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 14:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1B56EA8C;
	Fri, 31 Jul 2020 12:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3266EA87;
 Fri, 31 Jul 2020 12:51:21 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t23so8800291ljc.3;
 Fri, 31 Jul 2020 05:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=802wLPAiJOjYAF20z0XA9+ti0fbeGRnp8uxtEVqZ2cw=;
 b=XUpNekScbM7pVkILHss15SrZ149Lm5AtQfG+6vzsprcdirumI53ZN4t6VgSMIYCR07
 9skaHVlkX7NcNFlcoaIjMIYSSo7VYBaJxeFKKYA+1ThMAmgeCAorx2b8WQDzWH/EGcSL
 ZACMLyTvq9p49NUdDZQJ+C+6q75OV7U/dPqL0HqWZKTCJ09TgWEz8ZiW5LPhvz2Zln7Y
 qLR/h+WuI938pTe27pXqjPod/3HJqe4kl8HPpgANJKQL9Fx2Abd50/Qurj9uH4ULNMGa
 JFm0yWYg0IArPZxrohxFHuEZSdW3ZFfFWjH48CxRSNPSLbf6dahnKvy02/L1oQOkzkQl
 xcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=802wLPAiJOjYAF20z0XA9+ti0fbeGRnp8uxtEVqZ2cw=;
 b=P9f56WjJt8lKjs3ag3xc6OVRCoIkdw34Mf/KVvynWMRDeu+fHonlNV0E59+l8n35Qw
 JKKNUW2pgBUKD5oOD/gWqYaCqE9ZaJM8DpqRjOTsI6S2poT1BatHSbmMyiyCxTQs7cQH
 jQ4goIjIfxsuykbCZsRTkxRrd0Qx3uLPlNgHs9Vw/1sDfkhSGqpQNUL9XWl9eMfsDKqx
 mTWDLtH4xOw9gXq8AekVHzRJHt6grC0iv6j/qKg4Po4Vos4b1+bJly2DunKFA2xwa9Fh
 6tnj0lmQTWPPGZ/cRHpOLPRmzO8dP9LE4rPUlxGm7N+IE9eqepPRU7uci05Os9CH5vfG
 DVgQ==
X-Gm-Message-State: AOAM533qXQ+gPeh/mhl9qDjw79QY9bXnVF+yEXbF3fEpt/vXJldjq/fg
 lR7i+hkfvaeUoVSPz68WzaU=
X-Google-Smtp-Source: ABdhPJxCBCQqGvpy9XgTgM7mttEVb5TQWPTSAYYjB8mKwaVorgp/Gu6H2+I5YwJsHP9dUUFce4OPrw==
X-Received: by 2002:a2e:b610:: with SMTP id r16mr1841475ljn.439.1596199879842; 
 Fri, 31 Jul 2020 05:51:19 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id s2sm1923362lfs.4.2020.07.31.05.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:51:19 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 5/6] drm/xen-front: Pass dumb buffer data offset to the backend
Date: Fri, 31 Jul 2020 15:51:08 +0300
Message-Id: <20200731125109.18666-6-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731125109.18666-1-andr2000@gmail.com>
References: <20200731125109.18666-1-andr2000@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, sstabellini@kernel.org,
 dan.carpenter@oracle.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

While importing a dmabuf it is possible that the data of the buffer
is put with offset which is indicated by the SGT offset.
Respect the offset value and forward it to the backend.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 drivers/gpu/drm/xen/xen_drm_front.c     | 6 ++++--
 drivers/gpu/drm/xen/xen_drm_front.h     | 2 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c | 3 ++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 88db2726e8ce..013c9e0e412c 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -157,7 +157,8 @@ int xen_drm_front_mode_set(struct xen_drm_front_drm_pipeline *pipeline,
 
 int xen_drm_front_dbuf_create(struct xen_drm_front_info *front_info,
 			      u64 dbuf_cookie, u32 width, u32 height,
-			      u32 bpp, u64 size, struct page **pages)
+			      u32 bpp, u64 size, u32 offset,
+			      struct page **pages)
 {
 	struct xen_drm_front_evtchnl *evtchnl;
 	struct xen_drm_front_dbuf *dbuf;
@@ -194,6 +195,7 @@ int xen_drm_front_dbuf_create(struct xen_drm_front_info *front_info,
 	req->op.dbuf_create.gref_directory =
 			xen_front_pgdir_shbuf_get_dir_start(&dbuf->shbuf);
 	req->op.dbuf_create.buffer_sz = size;
+	req->op.dbuf_create.data_ofs = offset;
 	req->op.dbuf_create.dbuf_cookie = dbuf_cookie;
 	req->op.dbuf_create.width = width;
 	req->op.dbuf_create.height = height;
@@ -408,7 +410,7 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
 	ret = xen_drm_front_dbuf_create(drm_info->front_info,
 					xen_drm_front_dbuf_to_cookie(obj),
 					args->width, args->height, args->bpp,
-					args->size,
+					args->size, 0,
 					xen_drm_front_gem_get_pages(obj));
 	if (ret)
 		goto fail_backend;
diff --git a/drivers/gpu/drm/xen/xen_drm_front.h b/drivers/gpu/drm/xen/xen_drm_front.h
index f92c258350ca..54486d89650e 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.h
+++ b/drivers/gpu/drm/xen/xen_drm_front.h
@@ -145,7 +145,7 @@ int xen_drm_front_mode_set(struct xen_drm_front_drm_pipeline *pipeline,
 
 int xen_drm_front_dbuf_create(struct xen_drm_front_info *front_info,
 			      u64 dbuf_cookie, u32 width, u32 height,
-			      u32 bpp, u64 size, struct page **pages);
+			      u32 bpp, u64 size, u32 offset, struct page **pages);
 
 int xen_drm_front_fb_attach(struct xen_drm_front_info *front_info,
 			    u64 dbuf_cookie, u64 fb_cookie, u32 width,
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index 4ec8a49241e1..39ff95b75357 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -210,7 +210,8 @@ xen_drm_front_gem_import_sg_table(struct drm_device *dev,
 
 	ret = xen_drm_front_dbuf_create(drm_info->front_info,
 					xen_drm_front_dbuf_to_cookie(&xen_obj->base),
-					0, 0, 0, size, xen_obj->pages);
+					0, 0, 0, size, sgt->sgl->offset,
+					xen_obj->pages);
 	if (ret < 0)
 		return ERR_PTR(ret);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
