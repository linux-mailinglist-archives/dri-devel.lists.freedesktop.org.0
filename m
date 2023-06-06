Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B5572585B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1990D10E495;
	Wed,  7 Jun 2023 08:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FFE10E21E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 11:00:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686048333; cv=none; d=zohomail.in; s=zohoarc; 
 b=O6H/KOG3SmqJkTiaP5FKJxqL1H4uzL8MD9hNG8wMfxd4dHaD4HDtbttuLpVBS2NIL6Ry8P68H9nMHB0YIOyRS3MWXVGQz9ybkgJpJEFu9V5RCYrMhLAgz1c05hYGel04GUKk8v5gKNbgp1xyEfFL+F7MWGJYfsHS7JXRucnwDV0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1686048333;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=s9O0o0htGrfqzQ8ELXa1Emyal3B/SaRlmK5x/4vZFGs=; 
 b=WLBoSGPPmtNcXYLLPsKpiTL3ERBInvrpp+qJiX78FixiTzbiqJPwBI70vQmy4iN6ZW/VOJjpKS79Ql4KSumMV10ZX6dpt2fSS4ftJ2GZHvWv9ypBIa+hm/Ugvk8FbHaPo+V2CFL6dhiLoZLM67/YvrqaQz+8IOI12XwZuJMM3wg=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686048333; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=s9O0o0htGrfqzQ8ELXa1Emyal3B/SaRlmK5x/4vZFGs=;
 b=ifwedn7O8wYrO3Ka4iRb7QJGLDSfbZ/hr13z2DtIuMYVOgh0+aPOdS5G8wDO4enX
 w3S3ZNnvb6EwZ+s0A2O+naTXKPpOcmOGJ5eTneSRPYgv8Cf1BSBz4O9nQH81uJqgLHn
 onykOZk0Ui6vgM2XSQbnIC9ldu5D1sysIAhTwO4A=
Received: from kampyooter.. (122.176.141.156 [122.176.141.156]) by mx.zoho.in
 with SMTPS id 1686048331278880.2000421536817;
 Tue, 6 Jun 2023 16:15:31 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <3b880e4a20b7952b257b896900256fcfff14b153.1686047727.git.code@siddh.me>
Subject: [PATCH v9 6/8] drm: Remove usage of deprecated DRM_DEBUG
Date: Tue,  6 Jun 2023 16:15:20 +0530
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1686047727.git.code@siddh.me>
References: <cover.1686047727.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Mailman-Approved-At: Wed, 07 Jun 2023 08:45:25 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_print.h says DRM_DEBUG is deprecated in favor of drm_dbg_core().

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 drivers/gpu/drm/drm_agpsupport.c  |   4 +-
 drivers/gpu/drm/drm_bufs.c        | 114 +++++++++++++++---------------
 drivers/gpu/drm/drm_context.c     |  14 ++--
 drivers/gpu/drm/drm_dma.c         |  10 +--
 drivers/gpu/drm/drm_drv.c         |  10 +--
 drivers/gpu/drm/drm_gem.c         |   5 +-
 drivers/gpu/drm/drm_hashtab.c     |   6 +-
 drivers/gpu/drm/drm_irq.c         |   4 +-
 drivers/gpu/drm/drm_lease.c       |   2 +-
 drivers/gpu/drm/drm_legacy_misc.c |   4 +-
 drivers/gpu/drm/drm_lock.c        |  20 +++---
 drivers/gpu/drm/drm_mode_object.c |   6 +-
 drivers/gpu/drm/drm_pci.c         |  12 ++--
 drivers/gpu/drm/drm_plane.c       |  12 ++--
 drivers/gpu/drm/drm_scatter.c     |  10 +--
 drivers/gpu/drm/drm_syncobj.c     |   2 +-
 drivers/gpu/drm/drm_sysfs.c       |  14 ++--
 drivers/gpu/drm/drm_vm.c          |  43 ++++++-----
 18 files changed, 150 insertions(+), 142 deletions(-)

diff --git a/drivers/gpu/drm/drm_agpsupport.c b/drivers/gpu/drm/drm_agpsupp=
ort.c
index a4ad6fd13abc..d27686d6e82d 100644
--- a/drivers/gpu/drm/drm_agpsupport.c
+++ b/drivers/gpu/drm/drm_agpsupport.c
@@ -315,8 +315,8 @@ int drm_legacy_agp_bind(struct drm_device *dev, struct =
drm_agp_binding *request)
 =09if (retcode)
 =09=09return retcode;
 =09entry->bound =3D dev->agp->base + (page << PAGE_SHIFT);
-=09DRM_DEBUG("base =3D 0x%lx entry->bound =3D 0x%lx\n",
-=09=09  dev->agp->base, entry->bound);
+=09drm_dbg_core(dev, "base =3D 0x%lx entry->bound =3D 0x%lx\n",
+=09=09     dev->agp->base, entry->bound);
 =09return 0;
 }
 EXPORT_SYMBOL(drm_legacy_agp_bind);
diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index aa66fe16ea6e..a767f51c5369 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -171,8 +171,8 @@ static int drm_addmap_core(struct drm_device *dev, reso=
urce_size_t offset,
 =09=09kfree(map);
 =09=09return -EINVAL;
 =09}
-=09DRM_DEBUG("offset =3D 0x%08llx, size =3D 0x%08lx, type =3D %d\n",
-=09=09  (unsigned long long)map->offset, map->size, map->type);
+=09drm_dbg_core(dev, "offset =3D 0x%08llx, size =3D 0x%08lx, type =3D %d\n=
",
+=09=09     (unsigned long long)map->offset, map->size, map->type);
=20
 =09/* page-align _DRM_SHM maps. They are allocated here so there is no sec=
urity
 =09 * hole created by that and it works around various broken drivers that=
 use
@@ -205,10 +205,10 @@ static int drm_addmap_core(struct drm_device *dev, re=
source_size_t offset,
 =09=09list =3D drm_find_matching_map(dev, map);
 =09=09if (list !=3D NULL) {
 =09=09=09if (list->map->size !=3D map->size) {
-=09=09=09=09DRM_DEBUG("Matching maps of type %d with "
-=09=09=09=09=09  "mismatched sizes, (%ld vs %ld)\n",
-=09=09=09=09=09  map->type, map->size,
-=09=09=09=09=09  list->map->size);
+=09=09=09=09drm_dbg_core(dev, "Matching maps of type %d with "
+=09=09=09=09=09     "mismatched sizes, (%ld vs %ld)\n",
+=09=09=09=09=09     map->type, map->size,
+=09=09=09=09=09     list->map->size);
 =09=09=09=09list->map->size =3D map->size;
 =09=09=09}
=20
@@ -239,9 +239,9 @@ static int drm_addmap_core(struct drm_device *dev, reso=
urce_size_t offset,
 =09=09list =3D drm_find_matching_map(dev, map);
 =09=09if (list !=3D NULL) {
 =09=09=09if (list->map->size !=3D map->size) {
-=09=09=09=09DRM_DEBUG("Matching maps of type %d with "
-=09=09=09=09=09  "mismatched sizes, (%ld vs %ld)\n",
-=09=09=09=09=09  map->type, map->size, list->map->size);
+=09=09=09=09drm_dbg_core(dev, "Matching maps of type %d with "
+=09=09=09=09=09     "mismatched sizes, (%ld vs %ld)\n",
+=09=09=09=09=09     map->type, map->size, list->map->size);
 =09=09=09=09list->map->size =3D map->size;
 =09=09=09}
=20
@@ -250,8 +250,8 @@ static int drm_addmap_core(struct drm_device *dev, reso=
urce_size_t offset,
 =09=09=09return 0;
 =09=09}
 =09=09map->handle =3D vmalloc_user(map->size);
-=09=09DRM_DEBUG("%lu %d %p\n",
-=09=09=09  map->size, order_base_2(map->size), map->handle);
+=09=09drm_dbg_core(dev, "%lu %d %p\n",
+=09=09=09     map->size, order_base_2(map->size), map->handle);
 =09=09if (!map->handle) {
 =09=09=09kfree(map);
 =09=09=09return -ENOMEM;
@@ -308,8 +308,8 @@ static int drm_addmap_core(struct drm_device *dev, reso=
urce_size_t offset,
 =09=09=09kfree(map);
 =09=09=09return -EPERM;
 =09=09}
-=09=09DRM_DEBUG("AGP offset =3D 0x%08llx, size =3D 0x%08lx\n",
-=09=09=09  (unsigned long long)map->offset, map->size);
+=09=09drm_dbg_core(dev, "AGP offset =3D 0x%08llx, size =3D 0x%08lx\n",
+=09=09=09     (unsigned long long)map->offset, map->size);
=20
 =09=09break;
 =09}
@@ -745,13 +745,13 @@ int drm_legacy_addbufs_agp(struct drm_device *dev,
 =09byte_count =3D 0;
 =09agp_offset =3D dev->agp->base + request->agp_start;
=20
-=09DRM_DEBUG("count:      %d\n", count);
-=09DRM_DEBUG("order:      %d\n", order);
-=09DRM_DEBUG("size:       %d\n", size);
-=09DRM_DEBUG("agp_offset: %lx\n", agp_offset);
-=09DRM_DEBUG("alignment:  %d\n", alignment);
-=09DRM_DEBUG("page_order: %d\n", page_order);
-=09DRM_DEBUG("total:      %d\n", total);
+=09drm_dbg_core(dev, "count:      %d\n", count);
+=09drm_dbg_core(dev, "order:      %d\n", order);
+=09drm_dbg_core(dev, "size:       %d\n", size);
+=09drm_dbg_core(dev, "agp_offset: %lx\n", agp_offset);
+=09drm_dbg_core(dev, "alignment:  %d\n", alignment);
+=09drm_dbg_core(dev, "page_order: %d\n", page_order);
+=09drm_dbg_core(dev, "total:      %d\n", total);
=20
 =09if (order < DRM_MIN_ORDER || order > DRM_MAX_ORDER)
 =09=09return -EINVAL;
@@ -766,7 +766,7 @@ int drm_legacy_addbufs_agp(struct drm_device *dev,
 =09=09}
 =09}
 =09if (!list_empty(&dev->agp->memory) && !valid) {
-=09=09DRM_DEBUG("zone invalid\n");
+=09=09drm_dbg_core(dev, "zone invalid\n");
 =09=09return -EINVAL;
 =09}
 =09spin_lock(&dev->buf_lock);
@@ -829,14 +829,15 @@ int drm_legacy_addbufs_agp(struct drm_device *dev,
 =09=09=09return -ENOMEM;
 =09=09}
=20
-=09=09DRM_DEBUG("buffer %d @ %p\n", entry->buf_count, buf->address);
+=09=09drm_dbg_core(dev, "buffer %d @ %p\n", entry->buf_count,
+=09=09=09     buf->address);
=20
 =09=09offset +=3D alignment;
 =09=09entry->buf_count++;
 =09=09byte_count +=3D PAGE_SIZE << page_order;
 =09}
=20
-=09DRM_DEBUG("byte_count: %d\n", byte_count);
+=09drm_dbg_core(dev, "byte_count: %d\n", byte_count);
=20
 =09temp_buflist =3D krealloc(dma->buflist,
 =09=09=09=09(dma->buf_count + entry->buf_count) *
@@ -859,8 +860,8 @@ int drm_legacy_addbufs_agp(struct drm_device *dev,
 =09dma->page_count +=3D byte_count >> PAGE_SHIFT;
 =09dma->byte_count +=3D byte_count;
=20
-=09DRM_DEBUG("dma->buf_count : %d\n", dma->buf_count);
-=09DRM_DEBUG("entry->buf_count : %d\n", entry->buf_count);
+=09drm_dbg_core(dev, "dma->buf_count : %d\n", dma->buf_count);
+=09drm_dbg_core(dev, "entry->buf_count : %d\n", entry->buf_count);
=20
 =09mutex_unlock(&dev->struct_mutex);
=20
@@ -908,8 +909,8 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
 =09order =3D order_base_2(request->size);
 =09size =3D 1 << order;
=20
-=09DRM_DEBUG("count=3D%d, size=3D%d (%d), order=3D%d\n",
-=09=09  request->count, request->size, size, order);
+=09drm_dbg_core(dev, "count=3D%d, size=3D%d (%d), order=3D%d\n",
+=09=09     request->count, request->size, size, order);
=20
 =09if (order < DRM_MIN_ORDER || order > DRM_MAX_ORDER)
 =09=09return -EINVAL;
@@ -971,8 +972,8 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
 =09}
 =09memcpy(temp_pagelist,
 =09       dma->pagelist, dma->page_count * sizeof(*dma->pagelist));
-=09DRM_DEBUG("pagelist: %d entries\n",
-=09=09  dma->page_count + (count << page_order));
+=09drm_dbg_core(dev, "pagelist: %d entries\n",
+=09=09     dma->page_count + (count << page_order));
=20
 =09entry->buf_size =3D size;
 =09entry->page_order =3D page_order;
@@ -1011,9 +1012,9 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
 =09=09}
 =09=09entry->seglist[entry->seg_count++] =3D dmah;
 =09=09for (i =3D 0; i < (1 << page_order); i++) {
-=09=09=09DRM_DEBUG("page %d @ 0x%08lx\n",
-=09=09=09=09  dma->page_count + page_count,
-=09=09=09=09  (unsigned long)dmah->vaddr + PAGE_SIZE * i);
+=09=09=09drm_dbg_core(dev, "page %d @ 0x%08lx\n",
+=09=09=09=09     dma->page_count + page_count,
+=09=09=09=09     (unsigned long)dmah->vaddr + PAGE_SIZE * i);
 =09=09=09temp_pagelist[dma->page_count + page_count++]
 =09=09=09=09=3D (unsigned long)dmah->vaddr + PAGE_SIZE * i;
 =09=09}
@@ -1047,8 +1048,8 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
 =09=09=09=09return -ENOMEM;
 =09=09=09}
=20
-=09=09=09DRM_DEBUG("buffer %d @ %p\n",
-=09=09=09=09  entry->buf_count, buf->address);
+=09=09=09drm_dbg_core(dev, "buffer %d @ %p\n",
+=09=09=09=09     entry->buf_count, buf->address);
 =09=09}
 =09=09byte_count +=3D PAGE_SIZE << page_order;
 =09}
@@ -1136,13 +1137,13 @@ static int drm_legacy_addbufs_sg(struct drm_device =
*dev,
 =09byte_count =3D 0;
 =09agp_offset =3D request->agp_start;
=20
-=09DRM_DEBUG("count:      %d\n", count);
-=09DRM_DEBUG("order:      %d\n", order);
-=09DRM_DEBUG("size:       %d\n", size);
-=09DRM_DEBUG("agp_offset: %lu\n", agp_offset);
-=09DRM_DEBUG("alignment:  %d\n", alignment);
-=09DRM_DEBUG("page_order: %d\n", page_order);
-=09DRM_DEBUG("total:      %d\n", total);
+=09drm_dbg_core(dev, "count:      %d\n", count);
+=09drm_dbg_core(dev, "order:      %d\n", order);
+=09drm_dbg_core(dev, "size:       %d\n", size);
+=09drm_dbg_core(dev, "agp_offset: %lu\n", agp_offset);
+=09drm_dbg_core(dev, "alignment:  %d\n", alignment);
+=09drm_dbg_core(dev, "page_order: %d\n", page_order);
+=09drm_dbg_core(dev, "total:      %d\n", total);
=20
 =09if (order < DRM_MIN_ORDER || order > DRM_MAX_ORDER)
 =09=09return -EINVAL;
@@ -1208,14 +1209,15 @@ static int drm_legacy_addbufs_sg(struct drm_device =
*dev,
 =09=09=09return -ENOMEM;
 =09=09}
=20
-=09=09DRM_DEBUG("buffer %d @ %p\n", entry->buf_count, buf->address);
+=09=09drm_dbg_core(dev, "buffer %d @ %p\n", entry->buf_count,
+=09=09=09     buf->address);
=20
 =09=09offset +=3D alignment;
 =09=09entry->buf_count++;
 =09=09byte_count +=3D PAGE_SIZE << page_order;
 =09}
=20
-=09DRM_DEBUG("byte_count: %d\n", byte_count);
+=09drm_dbg_core(dev, "byte_count: %d\n", byte_count);
=20
 =09temp_buflist =3D krealloc(dma->buflist,
 =09=09=09=09(dma->buf_count + entry->buf_count) *
@@ -1238,8 +1240,8 @@ static int drm_legacy_addbufs_sg(struct drm_device *d=
ev,
 =09dma->page_count +=3D byte_count >> PAGE_SHIFT;
 =09dma->byte_count +=3D byte_count;
=20
-=09DRM_DEBUG("dma->buf_count : %d\n", dma->buf_count);
-=09DRM_DEBUG("entry->buf_count : %d\n", entry->buf_count);
+=09drm_dbg_core(dev, "dma->buf_count : %d\n", dma->buf_count);
+=09drm_dbg_core(dev, "entry->buf_count : %d\n", entry->buf_count);
=20
 =09mutex_unlock(&dev->struct_mutex);
=20
@@ -1340,7 +1342,7 @@ int __drm_legacy_infobufs(struct drm_device *dev,
 =09=09=09++count;
 =09}
=20
-=09DRM_DEBUG("count =3D %d\n", count);
+=09drm_dbg_core(dev, "count =3D %d\n", count);
=20
 =09if (*p >=3D count) {
 =09=09for (i =3D 0, count =3D 0; i < DRM_MAX_ORDER + 1; i++) {
@@ -1349,12 +1351,12 @@ int __drm_legacy_infobufs(struct drm_device *dev,
 =09=09=09if (from->buf_count) {
 =09=09=09=09if (f(data, count, from) < 0)
 =09=09=09=09=09return -EFAULT;
-=09=09=09=09DRM_DEBUG("%d %d %d %d %d\n",
-=09=09=09=09=09  i,
-=09=09=09=09=09  dma->bufs[i].buf_count,
-=09=09=09=09=09  dma->bufs[i].buf_size,
-=09=09=09=09=09  dma->bufs[i].low_mark,
-=09=09=09=09=09  dma->bufs[i].high_mark);
+=09=09=09=09drm_dbg_core(dev, "%d %d %d %d %d\n",
+=09=09=09=09=09     i,
+=09=09=09=09=09     dma->bufs[i].buf_count,
+=09=09=09=09=09     dma->bufs[i].buf_size,
+=09=09=09=09=09     dma->bufs[i].low_mark,
+=09=09=09=09=09     dma->bufs[i].high_mark);
 =09=09=09=09++count;
 =09=09=09}
 =09=09}
@@ -1417,8 +1419,8 @@ int drm_legacy_markbufs(struct drm_device *dev, void =
*data,
 =09if (!dma)
 =09=09return -EINVAL;
=20
-=09DRM_DEBUG("%d, %d, %d\n",
-=09=09  request->size, request->low_mark, request->high_mark);
+=09drm_dbg_core(dev, "%d, %d, %d\n",
+=09=09     request->size, request->low_mark, request->high_mark);
 =09order =3D order_base_2(request->size);
 =09if (order < DRM_MIN_ORDER || order > DRM_MAX_ORDER)
 =09=09return -EINVAL;
@@ -1465,7 +1467,7 @@ int drm_legacy_freebufs(struct drm_device *dev, void =
*data,
 =09if (!dma)
 =09=09return -EINVAL;
=20
-=09DRM_DEBUG("%d\n", request->count);
+=09drm_dbg_core(dev, "%d\n", request->count);
 =09for (i =3D 0; i < request->count; i++) {
 =09=09if (copy_from_user(&idx, &request->list[i], sizeof(idx)))
 =09=09=09return -EFAULT;
@@ -1565,7 +1567,7 @@ int __drm_legacy_mapbufs(struct drm_device *dev, void=
 *data, int *p,
 =09}
       done:
 =09*p =3D dma->buf_count;
-=09DRM_DEBUG("%d buffers, retcode =3D %d\n", *p, retcode);
+=09drm_dbg_core(dev, "%d buffers, retcode =3D %d\n", *p, retcode);
=20
 =09return retcode;
 }
diff --git a/drivers/gpu/drm/drm_context.c b/drivers/gpu/drm/drm_context.c
index bf1fc8bb97de..8b7b925aee97 100644
--- a/drivers/gpu/drm/drm_context.c
+++ b/drivers/gpu/drm/drm_context.c
@@ -274,7 +274,7 @@ static int drm_context_switch(struct drm_device * dev, =
int old, int new)
 =09=09return -EBUSY;
 =09}
=20
-=09DRM_DEBUG("Context switch from %d to %d\n", old, new);
+=09drm_dbg_core(dev, "Context switch from %d to %d\n", old, new);
=20
 =09if (new =3D=3D dev->last_context) {
 =09=09clear_bit(0, &dev->context_flag);
@@ -371,9 +371,9 @@ int drm_legacy_addctx(struct drm_device *dev, void *dat=
a,
 =09=09/* Skip kernel's context and get a new one. */
 =09=09tmp_handle =3D drm_legacy_ctxbitmap_next(dev);
 =09}
-=09DRM_DEBUG("%d\n", tmp_handle);
+=09drm_dbg_core(dev, "%d\n", tmp_handle);
 =09if (tmp_handle < 0) {
-=09=09DRM_DEBUG("Not enough free contexts.\n");
+=09=09drm_dbg_core(dev, "Not enough free contexts.\n");
 =09=09/* Should this return -EBUSY instead? */
 =09=09return tmp_handle;
 =09}
@@ -382,7 +382,7 @@ int drm_legacy_addctx(struct drm_device *dev, void *dat=
a,
=20
 =09ctx_entry =3D kmalloc(sizeof(*ctx_entry), GFP_KERNEL);
 =09if (!ctx_entry) {
-=09=09DRM_DEBUG("out of memory\n");
+=09=09drm_dbg_core(dev, "out of memory\n");
 =09=09return -ENOMEM;
 =09}
=20
@@ -439,7 +439,7 @@ int drm_legacy_switchctx(struct drm_device *dev, void *=
data,
 =09if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 =09=09return -EOPNOTSUPP;
=20
-=09DRM_DEBUG("%d\n", ctx->handle);
+=09drm_dbg_core(dev, "%d\n", ctx->handle);
 =09return drm_context_switch(dev, dev->last_context, ctx->handle);
 }
=20
@@ -462,7 +462,7 @@ int drm_legacy_newctx(struct drm_device *dev, void *dat=
a,
 =09if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 =09=09return -EOPNOTSUPP;
=20
-=09DRM_DEBUG("%d\n", ctx->handle);
+=09drm_dbg_core(dev, "%d\n", ctx->handle);
 =09drm_context_switch_complete(dev, file_priv, ctx->handle);
=20
 =09return 0;
@@ -487,7 +487,7 @@ int drm_legacy_rmctx(struct drm_device *dev, void *data=
,
 =09if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 =09=09return -EOPNOTSUPP;
=20
-=09DRM_DEBUG("%d\n", ctx->handle);
+=09drm_dbg_core(dev, "%d\n", ctx->handle);
 =09if (ctx->handle !=3D DRM_KERNEL_CONTEXT) {
 =09=09if (dev->driver->context_dtor)
 =09=09=09dev->driver->context_dtor(dev, ctx->handle);
diff --git a/drivers/gpu/drm/drm_dma.c b/drivers/gpu/drm/drm_dma.c
index eb6b741a6f99..dac137072c33 100644
--- a/drivers/gpu/drm/drm_dma.c
+++ b/drivers/gpu/drm/drm_dma.c
@@ -94,11 +94,11 @@ void drm_legacy_dma_takedown(struct drm_device *dev)
 =09/* Clear dma buffers */
 =09for (i =3D 0; i <=3D DRM_MAX_ORDER; i++) {
 =09=09if (dma->bufs[i].seg_count) {
-=09=09=09DRM_DEBUG("order %d: buf_count =3D %d,"
-=09=09=09=09  " seg_count =3D %d\n",
-=09=09=09=09  i,
-=09=09=09=09  dma->bufs[i].buf_count,
-=09=09=09=09  dma->bufs[i].seg_count);
+=09=09=09drm_dbg_core(dev, "order %d: buf_count =3D %d,"
+=09=09=09=09     " seg_count =3D %d\n",
+=09=09=09=09     i,
+=09=09=09=09     dma->bufs[i].buf_count,
+=09=09=09=09     dma->bufs[i].seg_count);
 =09=09=09for (j =3D 0; j < dma->bufs[i].seg_count; j++) {
 =09=09=09=09if (dma->bufs[i].seglist[j]) {
 =09=09=09=09=09dmah =3D dma->bufs[i].seglist[j];
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 04246afc934f..7adf10cc6e67 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -166,7 +166,7 @@ static int drm_minor_register(struct drm_device *dev, u=
nsigned int type)
 =09unsigned long flags;
 =09int ret;
=20
-=09DRM_DEBUG("\n");
+=09drm_dbg_core(dev, "\n");
=20
 =09minor =3D *drm_minor_get_slot(dev, type);
 =09if (!minor)
@@ -195,7 +195,7 @@ static int drm_minor_register(struct drm_device *dev, u=
nsigned int type)
 =09=09spin_unlock_irqrestore(&drm_minor_lock, flags);
 =09}
=20
-=09DRM_DEBUG("new minor registered %d\n", minor->index);
+=09drm_dbg_core(dev, "new minor registered %d\n", minor->index);
 =09return 0;
=20
 err_debugfs:
@@ -422,7 +422,7 @@ void drm_minor_release(struct drm_minor *minor)
  */
 void drm_put_dev(struct drm_device *dev)
 {
-=09DRM_DEBUG("\n");
+=09drm_dbg_core(NULL, "\n");
=20
 =09if (!dev) {
 =09=09drm_err(NULL, "cleanup called no dev\n");
@@ -1030,7 +1030,7 @@ static int drm_stub_open(struct inode *inode, struct =
file *filp)
 =09struct drm_minor *minor;
 =09int err;
=20
-=09DRM_DEBUG("\n");
+=09drm_dbg_core(NULL, "\n");
=20
 =09minor =3D drm_minor_acquire(iminor(inode));
 =09if (IS_ERR(minor))
@@ -1099,7 +1099,7 @@ static int __init drm_core_init(void)
=20
 =09drm_core_init_complete =3D true;
=20
-=09DRM_DEBUG("Initialized\n");
+=09drm_dbg_core(NULL, "Initialized\n");
 =09return 0;
=20
 error:
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index e0d52e69df15..3d88f0483fdf 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -705,7 +705,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void =
__user *bo_handles,
=20
 =09if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
 =09=09ret =3D -EFAULT;
-=09=09DRM_DEBUG("Failed to copy in GEM handles\n");
+=09=09drm_dbg_core(filp->minor->dev, "Failed to copy in GEM handles\n");
 =09=09goto out;
 =09}
=20
@@ -760,7 +760,8 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u32 =
handle,
=20
 =09obj =3D drm_gem_object_lookup(filep, handle);
 =09if (!obj) {
-=09=09DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
+=09=09drm_dbg_core(filep->minor->dev,
+=09=09=09     "Failed to look up GEM BO %d\n", handle);
 =09=09return -EINVAL;
 =09}
=20
diff --git a/drivers/gpu/drm/drm_hashtab.c b/drivers/gpu/drm/drm_hashtab.c
index a1ebf8e056c7..357f20d73b43 100644
--- a/drivers/gpu/drm/drm_hashtab.c
+++ b/drivers/gpu/drm/drm_hashtab.c
@@ -67,10 +67,12 @@ void drm_ht_verbose_list(struct drm_open_hash *ht, unsi=
gned long key)
 =09int count =3D 0;
=20
 =09hashed_key =3D hash_long(key, ht->order);
-=09DRM_DEBUG("Key is 0x%08lx, Hashed key is 0x%08x\n", key, hashed_key);
+=09drm_dbg_core(NULL, "Key is 0x%08lx, Hashed key is 0x%08x\n",
+=09=09     key, hashed_key);
 =09h_list =3D &ht->table[hashed_key];
 =09hlist_for_each_entry(entry, h_list, head)
-=09=09DRM_DEBUG("count %d, key: 0x%08lx\n", count++, entry->key);
+=09=09drm_dbg_core(NULL, "count %d, key: 0x%08lx\n",
+=09=09=09     count++, entry->key);
 }
=20
 static struct hlist_node *drm_ht_find_key(struct drm_open_hash *ht,
diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
index d327638e15ee..e70d6975310c 100644
--- a/drivers/gpu/drm/drm_irq.c
+++ b/drivers/gpu/drm/drm_irq.c
@@ -78,7 +78,7 @@ static int drm_legacy_irq_install(struct drm_device *dev,=
 int irq)
 =09=09return -EBUSY;
 =09dev->irq_enabled =3D true;
=20
-=09DRM_DEBUG("irq=3D%d\n", irq);
+=09drm_dbg_core(dev, "irq=3D%d\n", irq);
=20
 =09/* Before installing handler */
 =09if (dev->driver->irq_preinstall)
@@ -146,7 +146,7 @@ int drm_legacy_irq_uninstall(struct drm_device *dev)
 =09if (!irq_enabled)
 =09=09return -EINVAL;
=20
-=09DRM_DEBUG("irq=3D%d\n", dev->irq);
+=09drm_dbg_core(dev, "irq=3D%d\n", dev->irq);
=20
 =09if (drm_core_check_feature(dev, DRIVER_LEGACY))
 =09=09vga_client_unregister(to_pci_dev(dev->dev));
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 150fe1555068..af72fc38bb7c 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -677,7 +677,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 =09=09count++;
 =09}
=20
-=09DRM_DEBUG("lease holds %d objects\n", count);
+=09drm_dbg_core(dev, "lease holds %d objects\n", count);
 =09if (ret =3D=3D 0)
 =09=09arg->count_objects =3D count;
=20
diff --git a/drivers/gpu/drm/drm_legacy_misc.c b/drivers/gpu/drm/drm_legacy=
_misc.c
index d4c5434062d7..ad0eef292cb0 100644
--- a/drivers/gpu/drm/drm_legacy_misc.c
+++ b/drivers/gpu/drm/drm_legacy_misc.c
@@ -70,7 +70,7 @@ int drm_legacy_setup(struct drm_device * dev)
 =09=09return ret;
=20
=20
-=09DRM_DEBUG("\n");
+=09drm_dbg_core(dev, "\n");
 =09return 0;
 }
=20
@@ -95,7 +95,7 @@ void drm_legacy_dev_reinit(struct drm_device *dev)
 =09dev->last_context =3D 0;
 =09dev->if_version =3D 0;
=20
-=09DRM_DEBUG("lastclose completed\n");
+=09drm_dbg_core(dev, "lastclose completed\n");
 }
=20
 void drm_master_legacy_init(struct drm_master *master)
diff --git a/drivers/gpu/drm/drm_lock.c b/drivers/gpu/drm/drm_lock.c
index 411f75a1ee14..fea573dcb016 100644
--- a/drivers/gpu/drm/drm_lock.c
+++ b/drivers/gpu/drm/drm_lock.c
@@ -180,10 +180,10 @@ int drm_legacy_lock(struct drm_device *dev, void *dat=
a,
 =09=09return -EINVAL;
 =09}
=20
-=09DRM_DEBUG("%d (pid %d) requests lock (0x%08x), flags =3D 0x%08x\n",
-=09=09  lock->context, task_pid_nr(current),
-=09=09  master->lock.hw_lock ? master->lock.hw_lock->lock : -1,
-=09=09  lock->flags);
+=09drm_dbg_core(dev, "%d (pid %d) requests lock (0x%08x), flags =3D 0x%08x=
\n",
+=09=09     lock->context, task_pid_nr(current),
+=09=09     master->lock.hw_lock ? master->lock.hw_lock->lock : -1,
+=09=09     lock->flags);
=20
 =09add_wait_queue(&master->lock.lock_queue, &entry);
 =09spin_lock_bh(&master->lock.spinlock);
@@ -219,8 +219,8 @@ int drm_legacy_lock(struct drm_device *dev, void *data,
 =09__set_current_state(TASK_RUNNING);
 =09remove_wait_queue(&master->lock.lock_queue, &entry);
=20
-=09DRM_DEBUG("%d %s\n", lock->context,
-=09=09  ret ? "interrupted" : "has lock");
+=09drm_dbg_core(dev, "%d %s\n", lock->context,
+=09=09     ret ? "interrupted" : "has lock");
 =09if (ret) return ret;
=20
 =09/* don't set the block all signals on the master process for now=20
@@ -234,8 +234,8 @@ int drm_legacy_lock(struct drm_device *dev, void *data,
 =09if (dev->driver->dma_quiescent && (lock->flags & _DRM_LOCK_QUIESCENT))
 =09{
 =09=09if (dev->driver->dma_quiescent(dev)) {
-=09=09=09DRM_DEBUG("%d waiting for DMA quiescent\n",
-=09=09=09=09  lock->context);
+=09=09=09drm_dbg_core(dev, "%d waiting for DMA quiescent\n",
+=09=09=09=09     lock->context);
 =09=09=09return -EBUSY;
 =09=09}
 =09}
@@ -345,8 +345,8 @@ void drm_legacy_lock_release(struct drm_device *dev, st=
ruct file *filp)
 =09=09return;
=20
 =09if (drm_legacy_i_have_hw_lock(dev, file_priv)) {
-=09=09DRM_DEBUG("File %p released, freeing lock for context %d\n",
-=09=09=09  filp, _DRM_LOCKING_CONTEXT(file_priv->master->lock.hw_lock->loc=
k));
+=09=09drm_dbg_core(dev, "File %p released, freeing lock for context %d\n",
+=09=09=09     filp, _DRM_LOCKING_CONTEXT(file_priv->master->lock.hw_lock->=
lock));
 =09=09drm_legacy_lock_free(&file_priv->master->lock,
 =09=09=09=09     _DRM_LOCKING_CONTEXT(file_priv->master->lock.hw_lock->loc=
k));
 =09}
diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_o=
bject.c
index ba1608effc0f..6e5a970043fc 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -192,7 +192,8 @@ EXPORT_SYMBOL(drm_mode_object_find);
 void drm_mode_object_put(struct drm_mode_object *obj)
 {
 =09if (obj->free_cb) {
-=09=09DRM_DEBUG("OBJ ID: %d (%d)\n", obj->id, kref_read(&obj->refcount));
+=09=09drm_dbg_core(NULL, "OBJ ID: %d (%d)\n", obj->id,
+=09=09=09     kref_read(&obj->refcount));
 =09=09kref_put(&obj->refcount, obj->free_cb);
 =09}
 }
@@ -209,7 +210,8 @@ EXPORT_SYMBOL(drm_mode_object_put);
 void drm_mode_object_get(struct drm_mode_object *obj)
 {
 =09if (obj->free_cb) {
-=09=09DRM_DEBUG("OBJ ID: %d (%d)\n", obj->id, kref_read(&obj->refcount));
+=09=09drm_dbg_core(NULL, "OBJ ID: %d (%d)\n", obj->id,
+=09=09=09     kref_read(&obj->refcount));
 =09=09kref_get(&obj->refcount);
 =09}
 }
diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 7dfb837d1325..485ec407a115 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -85,8 +85,8 @@ static int drm_legacy_pci_irq_by_busid(struct drm_device =
*dev, struct drm_irq_bu
=20
 =09p->irq =3D pdev->irq;
=20
-=09DRM_DEBUG("%d:%d:%d =3D> IRQ %d\n", p->busnum, p->devnum, p->funcnum,
-=09=09  p->irq);
+=09drm_dbg_core(dev, "%d:%d:%d =3D> IRQ %d\n",
+=09=09     p->busnum, p->devnum, p->funcnum, p->irq);
 =09return 0;
 }
=20
@@ -151,12 +151,12 @@ static int drm_legacy_get_pci_dev(struct pci_dev *pde=
v,
 =09struct drm_device *dev;
 =09int ret;
=20
-=09DRM_DEBUG("\n");
-
 =09dev =3D drm_dev_alloc(driver, &pdev->dev);
 =09if (IS_ERR(dev))
 =09=09return PTR_ERR(dev);
=20
+=09drm_dbg_core(dev, "\n");
+
 =09ret =3D pci_enable_device(pdev);
 =09if (ret)
 =09=09goto err_free;
@@ -203,7 +203,7 @@ int drm_legacy_pci_init(const struct drm_driver *driver=
,
 =09const struct pci_device_id *pid;
 =09int i;
=20
-=09DRM_DEBUG("\n");
+=09drm_dbg_core(NULL, "\n");
=20
 =09if (WARN_ON(!(driver->driver_features & DRIVER_LEGACY)))
 =09=09return -EINVAL;
@@ -247,7 +247,7 @@ void drm_legacy_pci_exit(const struct drm_driver *drive=
r,
 {
 =09struct drm_device *dev, *tmp;
=20
-=09DRM_DEBUG("\n");
+=09drm_dbg_core(NULL, "\n");
=20
 =09if (!(driver->driver_features & DRIVER_LEGACY)) {
 =09=09WARN_ON(1);
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index fc11efd5e560..1e8727b7bce9 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1260,17 +1260,19 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev=
,
 =09=09switch (page_flip->flags & DRM_MODE_PAGE_FLIP_TARGET) {
 =09=09case DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE:
 =09=09=09if ((int)(target_vblank - current_vblank) > 1) {
-=09=09=09=09DRM_DEBUG("Invalid absolute flip target %u, "
-=09=09=09=09=09  "must be <=3D %u\n", target_vblank,
-=09=09=09=09=09  current_vblank + 1);
+=09=09=09=09drm_dbg_core(dev,
+=09=09=09=09=09     "Invalid absolute flip target %u, "
+=09=09=09=09=09     "must be <=3D %u\n", target_vblank,
+=09=09=09=09=09     current_vblank + 1);
 =09=09=09=09drm_crtc_vblank_put(crtc);
 =09=09=09=09return -EINVAL;
 =09=09=09}
 =09=09=09break;
 =09=09case DRM_MODE_PAGE_FLIP_TARGET_RELATIVE:
 =09=09=09if (target_vblank !=3D 0 && target_vblank !=3D 1) {
-=09=09=09=09DRM_DEBUG("Invalid relative flip target %u, "
-=09=09=09=09=09  "must be 0 or 1\n", target_vblank);
+=09=09=09=09drm_dbg_core(dev,
+=09=09=09=09=09     "Invalid relative flip target %u, "
+=09=09=09=09=09     "must be 0 or 1\n", target_vblank);
 =09=09=09=09drm_crtc_vblank_put(crtc);
 =09=09=09=09return -EINVAL;
 =09=09=09}
diff --git a/drivers/gpu/drm/drm_scatter.c b/drivers/gpu/drm/drm_scatter.c
index 5b0b2140d535..08b3eb586484 100644
--- a/drivers/gpu/drm/drm_scatter.c
+++ b/drivers/gpu/drm/drm_scatter.c
@@ -82,7 +82,7 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *dat=
a,
 =09struct drm_sg_mem *entry;
 =09unsigned long pages, i, j;
=20
-=09DRM_DEBUG("\n");
+=09drm_dbg_core(dev, "\n");
=20
 =09if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 =09=09return -EOPNOTSUPP;
@@ -101,7 +101,7 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *d=
ata,
 =09=09return -ENOMEM;
=20
 =09pages =3D (request->size + PAGE_SIZE - 1) / PAGE_SIZE;
-=09DRM_DEBUG("size=3D%ld pages=3D%ld\n", request->size, pages);
+=09drm_dbg_core(dev, "size=3D%ld pages=3D%ld\n", request->size, pages);
=20
 =09entry->pages =3D pages;
 =09entry->pagelist =3D kcalloc(pages, sizeof(*entry->pagelist), GFP_KERNEL=
);
@@ -132,8 +132,8 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *d=
ata,
=20
 =09entry->handle =3D ScatterHandle((unsigned long)entry->virtual);
=20
-=09DRM_DEBUG("handle  =3D %08lx\n", entry->handle);
-=09DRM_DEBUG("virtual =3D %p\n", entry->virtual);
+=09drm_dbg_core(dev, "handle  =3D %08lx\n", entry->handle);
+=09drm_dbg_core(dev, "virtual =3D %p\n", entry->virtual);
=20
 =09for (i =3D (unsigned long)entry->virtual, j =3D 0; j < pages;
 =09     i +=3D PAGE_SIZE, j++) {
@@ -213,7 +213,7 @@ int drm_legacy_sg_free(struct drm_device *dev, void *da=
ta,
 =09if (!entry || entry->handle !=3D request->handle)
 =09=09return -EINVAL;
=20
-=09DRM_DEBUG("virtual  =3D %p\n", entry->virtual);
+=09drm_dbg_core(dev, "virtual  =3D %p\n", entry->virtual);
=20
 =09drm_sg_cleanup(entry);
=20
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 0c2be8360525..e84957a0f319 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -298,7 +298,7 @@ void drm_syncobj_add_point(struct drm_syncobj *syncobj,
 =09prev =3D drm_syncobj_fence_get(syncobj);
 =09/* You are adding an unorder point to timeline, which could cause paylo=
ad returned from query_ioctl is 0! */
 =09if (prev && prev->seqno >=3D point)
-=09=09DRM_DEBUG("You are adding an unorder point to timeline!\n");
+=09=09drm_dbg_core(NULL, "You are adding an unorder point to timeline!\n")=
;
 =09dma_fence_chain_init(chain, prev, fence, point);
 =09rcu_assign_pointer(syncobj->fence, &chain->base);
=20
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index f62767ff34b2..b7c6754b4688 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -383,8 +383,8 @@ int drm_sysfs_connector_add(struct drm_connector *conne=
ctor)
 =09if (r)
 =09=09goto err_free;
=20
-=09DRM_DEBUG("adding \"%s\" to sysfs\n",
-=09=09  connector->name);
+=09drm_dbg_core(dev, "adding \"%s\" to sysfs\n",
+=09=09     connector->name);
=20
 =09r =3D device_add(kdev);
 =09if (r) {
@@ -422,8 +422,8 @@ void drm_sysfs_connector_remove(struct drm_connector *c=
onnector)
 =09if (dev_fwnode(connector->kdev))
 =09=09component_del(connector->kdev, &typec_connector_ops);
=20
-=09DRM_DEBUG("removing \"%s\" from sysfs\n",
-=09=09  connector->name);
+=09drm_dbg_core(connector->dev, "removing \"%s\" from sysfs\n",
+=09=09     connector->name);
=20
 =09device_unregister(connector->kdev);
 =09connector->kdev =3D NULL;
@@ -434,7 +434,7 @@ void drm_sysfs_lease_event(struct drm_device *dev)
 =09char *event_string =3D "LEASE=3D1";
 =09char *envp[] =3D { event_string, NULL };
=20
-=09DRM_DEBUG("generating lease event\n");
+=09drm_dbg_core(dev, "generating lease event\n");
=20
 =09kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
 }
@@ -455,7 +455,7 @@ void drm_sysfs_hotplug_event(struct drm_device *dev)
 =09char *event_string =3D "HOTPLUG=3D1";
 =09char *envp[] =3D { event_string, NULL };
=20
-=09DRM_DEBUG("generating hotplug event\n");
+=09drm_dbg_core(dev, "generating hotplug event\n");
=20
 =09kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
 }
@@ -511,7 +511,7 @@ void drm_sysfs_connector_status_event(struct drm_connec=
tor *connector,
 =09snprintf(prop_id, ARRAY_SIZE(prop_id),
 =09=09 "PROPERTY=3D%u", property->base.id);
=20
-=09DRM_DEBUG("generating connector status event\n");
+=09drm_dbg_core(dev, "generating connector status event\n");
=20
 =09kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
 }
diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
index 03c0a4e6e77b..966ba9e46034 100644
--- a/drivers/gpu/drm/drm_vm.c
+++ b/drivers/gpu/drm/drm_vm.c
@@ -168,12 +168,11 @@ static vm_fault_t drm_vm_fault(struct vm_fault *vmf)
 =09=09get_page(page);
 =09=09vmf->page =3D page;
=20
-=09=09DRM_DEBUG
-=09=09    ("baddr =3D 0x%llx page =3D 0x%p, offset =3D 0x%llx, count=3D%d\=
n",
-=09=09     (unsigned long long)baddr,
-=09=09     agpmem->memory->pages[offset],
-=09=09     (unsigned long long)offset,
-=09=09     page_count(page));
+=09=09drm_dbg_core(dev, "baddr =3D 0x%llx page =3D 0x%p, offset =3D 0x%llx=
, count=3D%d\n",
+=09=09=09     (unsigned long long)baddr,
+=09=09=09     agpmem->memory->pages[offset],
+=09=09=09     (unsigned long long)offset,
+=09=09=09     page_count(page));
 =09=09return 0;
 =09}
 vm_fault_error:
@@ -215,7 +214,7 @@ static vm_fault_t drm_vm_shm_fault(struct vm_fault *vmf=
)
 =09get_page(page);
 =09vmf->page =3D page;
=20
-=09DRM_DEBUG("shm_fault 0x%lx\n", offset);
+=09drm_dbg_core(NULL, "shm_fault 0x%lx\n", offset);
 =09return 0;
 }
=20
@@ -236,8 +235,8 @@ static void drm_vm_shm_close(struct vm_area_struct *vma=
)
 =09struct drm_map_list *r_list;
 =09int found_maps =3D 0;
=20
-=09DRM_DEBUG("0x%08lx,0x%08lx\n",
-=09=09  vma->vm_start, vma->vm_end - vma->vm_start);
+=09drm_dbg_core(dev, "0x%08lx,0x%08lx\n",
+=09=09     vma->vm_start, vma->vm_end - vma->vm_start);
=20
 =09map =3D vma->vm_private_data;
=20
@@ -319,7 +318,7 @@ static vm_fault_t drm_vm_dma_fault(struct vm_fault *vmf=
)
 =09get_page(page);
 =09vmf->page =3D page;
=20
-=09DRM_DEBUG("dma_fault 0x%lx (page %lu)\n", offset, page_nr);
+=09drm_dbg_core(dev, "dma_fault 0x%lx (page %lu)\n", offset, page_nr);
 =09return 0;
 }
=20
@@ -391,8 +390,8 @@ static void drm_vm_open_locked(struct drm_device *dev,
 {
 =09struct drm_vma_entry *vma_entry;
=20
-=09DRM_DEBUG("0x%08lx,0x%08lx\n",
-=09=09  vma->vm_start, vma->vm_end - vma->vm_start);
+=09drm_dbg_core(dev, "0x%08lx,0x%08lx\n",
+=09=09     vma->vm_start, vma->vm_end - vma->vm_start);
=20
 =09vma_entry =3D kmalloc(sizeof(*vma_entry), GFP_KERNEL);
 =09if (vma_entry) {
@@ -417,8 +416,8 @@ static void drm_vm_close_locked(struct drm_device *dev,
 {
 =09struct drm_vma_entry *pt, *temp;
=20
-=09DRM_DEBUG("0x%08lx,0x%08lx\n",
-=09=09  vma->vm_start, vma->vm_end - vma->vm_start);
+=09drm_dbg_core(dev, "0x%08lx,0x%08lx\n",
+=09=09     vma->vm_start, vma->vm_end - vma->vm_start);
=20
 =09list_for_each_entry_safe(pt, temp, &dev->vmalist, head) {
 =09=09if (pt->vma =3D=3D vma) {
@@ -466,8 +465,8 @@ static int drm_mmap_dma(struct file *filp, struct vm_ar=
ea_struct *vma)
=20
 =09dev =3D priv->minor->dev;
 =09dma =3D dev->dma;
-=09DRM_DEBUG("start =3D 0x%lx, end =3D 0x%lx, page offset =3D 0x%lx\n",
-=09=09  vma->vm_start, vma->vm_end, vma->vm_pgoff);
+=09drm_dbg_core(dev, "start =3D 0x%lx, end =3D 0x%lx, page offset =3D 0x%l=
x\n",
+=09=09     vma->vm_start, vma->vm_end, vma->vm_pgoff);
=20
 =09/* Length must match exact page count */
 =09if (!dma || (length >> PAGE_SHIFT) !=3D dma->page_count) {
@@ -528,8 +527,8 @@ static int drm_mmap_locked(struct file *filp, struct vm=
_area_struct *vma)
 =09resource_size_t offset =3D 0;
 =09struct drm_hash_item *hash;
=20
-=09DRM_DEBUG("start =3D 0x%lx, end =3D 0x%lx, page offset =3D 0x%lx\n",
-=09=09  vma->vm_start, vma->vm_end, vma->vm_pgoff);
+=09drm_dbg_core(dev, "start =3D 0x%lx, end =3D 0x%lx, page offset =3D 0x%l=
x\n",
+=09=09     vma->vm_start, vma->vm_end, vma->vm_pgoff);
=20
 =09if (!priv->authenticated)
 =09=09return -EACCES;
@@ -600,10 +599,10 @@ static int drm_mmap_locked(struct file *filp, struct =
vm_area_struct *vma)
 =09=09=09=09       vma->vm_end - vma->vm_start,
 =09=09=09=09       vma->vm_page_prot))
 =09=09=09return -EAGAIN;
-=09=09DRM_DEBUG("   Type =3D %d; start =3D 0x%lx, end =3D 0x%lx,"
-=09=09=09  " offset =3D 0x%llx\n",
-=09=09=09  map->type,
-=09=09=09  vma->vm_start, vma->vm_end, (unsigned long long)(map->offset + =
offset));
+=09=09drm_dbg_core(dev,
+=09=09=09     "   Type =3D %d; start =3D 0x%lx, end =3D 0x%lx, offset =3D =
0x%llx\n",
+=09=09=09     map->type, vma->vm_start, vma->vm_end,
+=09=09=09     (unsigned long long)(map->offset + offset));
=20
 =09=09vma->vm_ops =3D &drm_vm_ops;
 =09=09break;
--=20
2.39.2


