Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BFFA63797
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 22:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE62710E14A;
	Sun, 16 Mar 2025 21:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Jzmb8SO4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7A010E103
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 21:53:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742161960; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Kv2Cv4vpik/j+OEvF9mZ0YidfvENvnjzVEFCR5ufXdaoOdcgvbWXsn2DOHeYF3OEtjooSlbzwCaArB5Kh+o2y6Y2DmPkmWisi68nKLAwR9PflHb0DHOiTyvcSwljLf13yW1I6jwVvfBTCy9UmNfycr51lw+HtkhboHoyjV0EXBI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742161960;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7d7KId3eYtW4KxggvAfj0Ppw7ovEqEyqSgz/eR3xla8=; 
 b=kH0jH7NZdKuuOncD3Q4ME5zBe+Pk6IjmXEnaF2QkQTxJuWTK+OFS49L2EWMDWHaY7fyUi7zKO6m94xi2Bif+cq1rolz5jrnbQTfLN44wDfeGAv9pGKeZVRMpYL/4rF5DAkWjoG6ufOUziPlhnAeNDSWZbMNtYDEKms3HRSWw9ZQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742161960; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=7d7KId3eYtW4KxggvAfj0Ppw7ovEqEyqSgz/eR3xla8=;
 b=Jzmb8SO4HRmFqRQhMGwQk+G2MN082zroHITg6EUjjBMUohtzCryVDwy7hGnuYm65
 vYUdK7xOB9TycwHHNUD9021LAegaMyVnRaK0DYpmjNd+9dnRHZEmJzrfVCZqRe4LrdP
 SM6ZK+sUZz3YxPOR/67isuw7QzL+yr+ArE/7Hm5Q=
Received: by mx.zohomail.com with SMTPS id 1742161957836488.8141758461478;
 Sun, 16 Mar 2025 14:52:37 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/panthor: Display heap chunk entries in DebugFS GEMS
 file
Date: Sun, 16 Mar 2025 21:51:35 +0000
Message-ID: <20250316215139.3940623-5-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316215139.3940623-1-adrian.larumbe@collabora.com>
References: <20250316215139.3940623-1-adrian.larumbe@collabora.com>
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

Expand the driver's DebugFS GEMS file to display entries for the heap
chunks' GEM objects, both those allocated at heap creation time through an
ioctl(), or in response to a tiler OOM event.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_heap.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index db0285ce5812..520d1fcf5c36 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -139,6 +139,10 @@ static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
 	struct panthor_heap_chunk *chunk;
 	struct panthor_heap_chunk_header *hdr;
 	int ret;
+#ifdef CONFIG_DEBUG_FS
+	struct panthor_gem_object *obj;
+	const char *label;
+#endif
 
 	chunk = kmalloc(sizeof(*chunk), GFP_KERNEL);
 	if (!chunk)
@@ -180,6 +184,17 @@ static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
 	heap->chunk_count++;
 	mutex_unlock(&heap->lock);
 
+#ifdef CONFIG_DEBUG_FS
+	obj = to_panthor_bo(chunk->bo->obj);
+
+	mutex_lock(&ptdev->gems_lock);
+	list_add_tail(&obj->gems_node, &ptdev->gems);
+	mutex_unlock(&ptdev->gems_lock);
+
+	label = kstrdup_const("\"Tiler heap chunk\"", GFP_KERNEL);
+	panthor_gem_label_bo(chunk->bo->obj, label);
+#endif
+
 	return 0;
 
 err_destroy_bo:
-- 
2.48.1

