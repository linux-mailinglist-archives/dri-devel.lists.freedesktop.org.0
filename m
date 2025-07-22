Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CC5B0D74C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 12:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31BD10E10E;
	Tue, 22 Jul 2025 10:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Ftjrvg9T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0A4CD10E10E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 10:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=lB
 XlC4JtAXtnVPhmyXizUjaqmuQupzk/Y7wvzszghCU=; b=Ftjrvg9TBeiuY24kr7
 BGQ62H4MvR6tVQkYOJiOlnGEv1bDbl3naT7Pbx++Q6pjyNY0/ONlaN6vuDk5gGYQ
 Rmswb/dBiRf4JKdysheR1DVDjygVozlnPILIAXfHY7NHf8xDJC/6H2s6qfJzqcu0
 eS53lXHoybyQVkz4nARY6kPbI=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id
 _____wDnt9KGZ39oRKU8Gg--.16241S2; 
 Tue, 22 Jul 2025 18:27:20 +0800 (CST)
From: oushixiong1025@163.com
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/shmem-helper: Remove duplicate dma_resv_assert_held
Date: Tue, 22 Jul 2025 18:27:17 +0800
Message-Id: <20250722102717.2247698-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnt9KGZ39oRKU8Gg--.16241S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrZFWfuFWDKry7Kr48Cw4xCrg_yoW8JrW5pF
 ZrA34UKrW8KFZ0qFZ7Zws7Aa45CanaqFW0qFW5W3y3uFn7JFnrtryFkFyDZFy7ArW7ur1Y
 qryDCFWrCryUKF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UWlk-UUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXQWSD2h-YTh75QAAsV
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

From: Shixiong Ou <oushixiong@kylinos.cn>

The call to dma_resv_assert_held(shmem->base.resv) is duplicated
in the vmap() and vunamp() function.

Remove the duplicate call to clean up the code.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 8ac0b1fa5287..10e20209f3b2 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -355,8 +355,6 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 	} else {
 		pgprot_t prot = PAGE_KERNEL;
 
-		dma_resv_assert_held(shmem->base.resv);
-
 		if (refcount_inc_not_zero(&shmem->vmap_use_count)) {
 			iosys_map_set_vaddr(map, shmem->vaddr);
 			return 0;
@@ -415,8 +413,6 @@ void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 	if (drm_gem_is_imported(obj)) {
 		dma_buf_vunmap(obj->dma_buf, map);
 	} else {
-		dma_resv_assert_held(shmem->base.resv);
-
 		if (refcount_dec_and_test(&shmem->vmap_use_count)) {
 			vunmap(shmem->vaddr);
 			shmem->vaddr = NULL;
-- 
2.25.1

