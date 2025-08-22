Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2637B31B86
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 16:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F61B10EB1B;
	Fri, 22 Aug 2025 14:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="px2i2WYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1261610EB0E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 14:30:10 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-4b109c5ac7bso25105741cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 07:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1755873009; x=1756477809;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XJJT40q8ZB8LEatdX2xuvqjdy7O8Of4ZP0NR7CIyTUg=;
 b=px2i2WYHb4+tFm6iA5JXB7GHnTDPruquml5KwIqtWEkTOL3gwK/Q37a79RkXtMuQd/
 lfXG4HaYzgWiRAtUosbFpqfKYCn/rkJuLOzKJxnqUfUE/2m3uVWYq0ZTuTVFUeNvi3uQ
 anIh8OoG91DE9ahwiaAj4XMwxBvMaX/8k42UfrUb3wQAZ26+lTTkUFx8Co3EdwMuL0My
 m3YKRMiNXWXkK/bawkMK9ny/ToURMqlnZyLqP6wiJ7Bmv3QtHswG/qt3f9hhQrudj91P
 9uX3S2G4CaUX/bF09xVcSkP0SUB85jg1hJcyv3bM+S8gW3kYjk2C4DGxwy3kKAmYhqoD
 0a+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755873009; x=1756477809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XJJT40q8ZB8LEatdX2xuvqjdy7O8Of4ZP0NR7CIyTUg=;
 b=FyENZnyoW3UUKkxnQCyX+cYzJrj9achBxFE6KQFy1HHcubfw6uFZVwsjCpo9gmQJfg
 XbsySrhFBIf9qboPjAotmW+xx8OomsxyHj/efVJxMMz2iu2NbJqMXIfckhPC/kAkNgVD
 JpyofgMsP+AHASgFGQnkeZnEWO5o/qyyNUGos6NQmM2EADiGHhvQ0AUrJc/Oxy0A7ZuY
 sCBQku+1nyNydk/IMrzfdLoCrasK4eVF44HPKRXIDrT982uDJhWh+GesC6mnyBjtK08n
 vIldPjjvV7RRE326mFERKhkXpVt3sjoYJwtwsmurpRvMb/uhO1a6Ld23Z3p+Pj0aS4lN
 9rgg==
X-Gm-Message-State: AOJu0YzP5C9YCivmyIXllRfqbawPSwIP0/DOvX7bKMwPf88plaheMbkD
 ncQc/lP68UT0/VwJgCtbjFJI5VOXEXhWGRsk0FoStbTI7fKjdpYg2YmBzOb5YY6vUEc40Y+epPe
 it1lGKWw=
X-Gm-Gg: ASbGnctCS8bNgK10u/PivXBgeNNVMi0TCr21X50d58Kg/4UDb42aAkje75xGtakuCrk
 ifEha0rKnSR1233cczBx2KKPtGrALwKR/yuMw3oQrO8D8c6EkPwAqKnpqO2rbEfrncPbU3LvGu+
 nvdPkr9mdfy10qZth50SifjOMRRHUhYAJ6uKdoe8CjDgJ2LEYHKhEAdqMjgS9lc4xDifkM0CNfw
 JsKKqQeesOcKmdLPmgHU7YqtWEKrbtZUnzY7V59lyruE2q2hHBBF/Wk0UU8pNYxs4fxTepdT52Z
 UYEkMFURXjeJG1t7uiAE0fIuRPkXxtNtoeGgpv+F7Q3qBi2SSkkWYIW2ZTKQNc8YYXv/lRAsyNf
 KLH7HwMlvhFgHHVeoBp8aEhks/q19Odc=
X-Google-Smtp-Source: AGHT+IFxrvT8ZnRKLuXoviBR/x/W7rfPgqZKGKDnOi01nbciLgTvG4hlYGtij9JyVBMwXOAk60jrEw==
X-Received: by 2002:ac8:5f4f:0:b0:4b0:8c29:f6e1 with SMTP id
 d75a77b69052e-4b2aaa0593cmr36838341cf.7.1755873008686; 
 Fri, 22 Aug 2025 07:30:08 -0700 (PDT)
Received: from kermit.lan ([65.93.159.244]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b2b8e6023asm420131cf.53.2025.08.22.07.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 07:30:07 -0700 (PDT)
From: Faith Ekstrand <faith@gfxstrand.net>
X-Google-Original-From: Faith Ekstrand <faith.ekstrand@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: [PATCH 1/7] drm/shmem: Add a drm_gem_shmem_sync_mmap() helper
Date: Fri, 22 Aug 2025 10:29:10 -0400
Message-ID: <20250822142954.902402-2-faith.ekstrand@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822142954.902402-1-faith.ekstrand@collabora.com>
References: <20250822142954.902402-1-faith.ekstrand@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This enables syncing mapped GEM objects between the CPU and GPU via calls
to dma_sync_*().  It's a bit annoying as it requires walking the sg_table
so it's best if every driver doesn't hand-roll it.

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 64 ++++++++++++++++++++++++++
 include/drm/drm_gem_shmem_helper.h     |  3 ++
 2 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 8ac0b1fa5287..50907c1fa11f 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -658,6 +658,70 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);
 
+/**
+ * drm_gem_shmem_sync_mmap - Sync memor-mapped data to/from the device
+ * @shmem: shmem GEM object
+ * @offset: Offset into the GEM object
+ * @size: Size of the area to sync
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int
+drm_gem_shmem_sync_mmap(struct drm_gem_shmem_object *shmem,
+			size_t offset, size_t size,
+			enum dma_data_direction dir)
+{
+	struct drm_device *dev = shmem->base.dev;
+	struct sg_table *sgt;
+	struct scatterlist *sgl;
+	unsigned int count;
+
+	if (dir == DMA_NONE)
+		return 0;
+
+	/* Don't bother if it's WC-mapped */
+	if (shmem->map_wc)
+		return 0;
+
+	if (size == 0)
+		return 0;
+
+	if (offset + size < offset || offset + size > shmem->base.size)
+		return -EINVAL;
+
+	sgt = drm_gem_shmem_get_pages_sgt(shmem);
+	if (IS_ERR(sgt))
+		return PTR_ERR(sgt);
+
+	for_each_sgtable_dma_sg(sgt, sgl, count) {
+		if (size == 0)
+			break;
+
+		dma_addr_t paddr = sg_dma_address(sgl);
+		size_t len = sg_dma_len(sgl);
+
+		if (len <= offset) {
+			offset -= len;
+			continue;
+		}
+
+		paddr += offset;
+		len -= offset;
+		len = min_t(size_t, len, size);
+		size -= len;
+		offset = 0;
+
+		if (dir == DMA_FROM_DEVICE)
+			dma_sync_single_for_cpu(dev->dev, paddr, len, dir);
+		else
+			dma_sync_single_for_device(dev->dev, paddr, len, dir);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_sync_mmap);
+
 /**
  * drm_gem_shmem_print_info() - Print &drm_gem_shmem_object info for debugfs
  * @shmem: shmem GEM object
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 92f5db84b9c2..8e057a8e6c83 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -121,6 +121,9 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 				 struct iosys_map *map);
 int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
+int drm_gem_shmem_sync_mmap(struct drm_gem_shmem_object *shmem,
+			    size_t offset, size_t size,
+			    enum dma_data_direction dir);
 
 int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem);
-- 
2.50.1

