Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA968B1088
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037F9113C9A;
	Wed, 24 Apr 2024 17:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="DAWwQjDx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFB4113C95;
 Wed, 24 Apr 2024 17:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713978036; x=1714582836; i=friedrich.vock@gmx.de;
 bh=GGCBb+pzAx6oM1WHiEHk3wJf7oWdJZUwB7yKYQh3Qtw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=DAWwQjDxkN1IDNj+VC2Wv91sL2tQQvEKvMxI4Yj1ieFBC+QLcD1WzMpgcDaYqKt6
 7safQBsKM01Yb27vKqQg7VgLotFq5TCDA1vlEmXnvRs+pBl3XfszaRNAwEsD7vtMZ
 hzWX31HlvteBrqK0JssC8I8LpZoM2T1alDueDa2uvjkD5HfvwQKCyyrE6xaHCpsGN
 FYRxPh62oT9EzdimuO03oERzZOoGugGrMrshIDgYlS4UPxvntQUfFUFYbGIji9Bsb
 JR9zUKiX4m44n7pIR44qFeumdHI5OLcPKAqU+QVkkiTT/+o8ugY3k1YnAXFnYVA7h
 3bVlhIAY0lKZkRHdXQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from arch.fritz.box ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N49lD-1shZSP06BV-011HgO; Wed, 24
 Apr 2024 19:00:36 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 01/18] drm/ttm: Add tracking for evicted memory
Date: Wed, 24 Apr 2024 18:56:51 +0200
Message-ID: <20240424165937.54759-2-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3A/UFtTwEymJIuR6R8hV9aPx9tNP9L1fkblX1dTobTUP8ODeKpR
 ld1okkTQHCXks5V0Uiy4XFq0lOWSli1xDC9z/h5CjLJom2tvwwX5N6pUDbtRvm4FMvN3Y4k
 41AD1gI7+DcmK6TLtg34y+Q6+vx4M6mLOrQwgJspZ46eBwiUstD3ZunQOCuuaafkz6k2/cf
 NkSUM3+vUMdhKsbQqrDWg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KzCXhVYLhZE=;Xbau6rqZeHdtDBIS2iaYeAlL3B1
 kKSiL63rZbf4vgwk8sHlp0A6PheYvBFBx1ohH/vRqKx9oI4Pp+zudhkj0bKliQ1Bxb5bSi2jE
 Od8Ngdv866o4vqK2ze06H19udoXvgOfpHUwsq/DU07cNBB2RAc9dd6zJQ2sQ5wX3RSYBWH6Gc
 kD+neIqZ1AWWP+33ycDYxE4b3ecVAD3iMXVYz1F3G9Mqgmsx+LONWb0SqR4sk4NZF7/+S2AC4
 tKByEIK54zoTwtiVyzgZD5zRAYZx7ge/rYBl9o2uR0ofdEjcspHX9LzrG1Wz7WBKVKzs/TT9I
 smt5CbqFQCySidcoR+mIBDN8+en5es5j7ajFhB6DeuANIA+KXr7O85yFslDJyPoN+5tqxo4PE
 sF4dfA281eWcxuCeGGk123y+Q2NKOP7BBX7vHqTL5gf2dXsXK97HIyS6ANw05SrNxXwZUpbRk
 uJnWoVhZ3CKSuZIZqfLMI+JN9yII0n0Ucwf47XcRuZ3PToQLEY8kJCvtP5jbld4U+IGlfsbTn
 kDCRJYCjc6nrSr4gZooXFQoTLwLHo4pF8Mu05nrgzQYo3iMeK46rDMRvnKbWcVdYY773WcUaO
 VEfOgc7mVo1wGigY1EXp2Z1hnoTg+cpr/2WCZ+B1W5V3/R7NGLfw26LGCMFebOBAcQ+FsOvIH
 IQjIiFJdbdeROSVPmae0yp9t7vz9pS/DMjqwqqdJogx6oqoyEBz6iJT/th99QLHY/c0q3Bkoc
 BfBZs1aGJfUTg/Qf1Z3ETRP0gkxnEkuXNPE6zE5HA8bt3WfZMC52O+gOcHBKVzMhYh+LBcRfM
 rEa/VADa132mzaZ2wKFCi4hdbfB5JmTOyUjfxEdaoBjHE=
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

These utilities will be used to keep track of what buffers have been
evicted from any particular place, to try and decide when to try undoing
the eviction.

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 drivers/gpu/drm/ttm/ttm_device.c   |  1 +
 drivers/gpu/drm/ttm/ttm_resource.c | 14 ++++++++++++++
 include/drm/ttm/ttm_device.h       |  5 +++++
 include/drm/ttm/ttm_resource.h     |  9 +++++++++
 4 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_de=
vice.c
index f5187b384ae9a..969d627ba06c0 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -219,6 +219,7 @@ int ttm_device_init(struct ttm_device *bdev, const str=
uct ttm_device_funcs *func

 	bdev->vma_manager =3D vma_manager;
 	spin_lock_init(&bdev->lru_lock);
+	spin_lock_init(&bdev->unevict_lock);
 	INIT_LIST_HEAD(&bdev->pinned);
 	bdev->dev_mapping =3D mapping;
 	mutex_lock(&ttm_global_mutex);
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_=
resource.c
index 46ff9c75bb124..1d6755a1153b1 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -25,6 +25,7 @@
 #include <linux/iosys-map.h>
 #include <linux/io-mapping.h>
 #include <linux/scatterlist.h>
+#include <linux/list.h>

 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
@@ -392,9 +393,11 @@ void ttm_resource_manager_init(struct ttm_resource_ma=
nager *man,
 	man->bdev =3D bdev;
 	man->size =3D size;
 	man->usage =3D 0;
+	man->evicted_bytes =3D 0;

 	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		INIT_LIST_HEAD(&man->lru[i]);
+	INIT_LIST_HEAD(&man->evicted);
 	man->move =3D NULL;
 }
 EXPORT_SYMBOL(ttm_resource_manager_init);
@@ -470,6 +473,17 @@ uint64_t ttm_resource_manager_usage(struct ttm_resour=
ce_manager *man)
 }
 EXPORT_SYMBOL(ttm_resource_manager_usage);

+uint64_t ttm_resource_manager_evicted_bytes(struct ttm_resource_manager *=
man)
+{
+	uint64_t evicted;
+
+	spin_lock(&man->bdev->unevict_lock);
+	evicted =3D man->evicted_bytes;
+	spin_unlock(&man->bdev->unevict_lock);
+	return evicted;
+}
+EXPORT_SYMBOL(ttm_resource_manager_evicted_bytes);
+
 /**
  * ttm_resource_manager_debug
  *
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index c22f30535c848..baa264efe483d 100644
=2D-- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -251,6 +251,11 @@ struct ttm_device {
 	 */
 	spinlock_t lru_lock;

+	/**
+	 * @unevict_lock: Protection for per-manager uneviction tracking
+	 */
+	spinlock_t unevict_lock;
+
 	/**
 	 * @pinned: Buffer objects which are pinned and so not on any LRU list.
 	 */
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource=
.h
index 78a226eba953c..7d1ce059c8805 100644
=2D-- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -145,6 +145,7 @@ struct ttm_resource_manager_func {
  * @move_lock: lock for move fence
  * @move: The fence of the last pipelined move operation.
  * @lru: The lru list for this memory type.
+ * @evicted: List of bos evicted from this memory type
  *
  * This structure is used to identify and manage memory types for a devic=
e.
  */
@@ -163,6 +164,7 @@ struct ttm_resource_manager {
 	 * Protected by @move_lock.
 	 */
 	struct dma_fence *move;
+	struct list_head evicted;

 	/*
 	 * Protected by the bdev->lru_lock.
@@ -174,6 +176,12 @@ struct ttm_resource_manager {
 	 * bdev->lru_lock.
 	 */
 	uint64_t usage;
+
+	/**
+	 * @evicted_bytes: How many bytes are evicted from this manager,
+	 * protexted by bdev->unevict_lock
+	 */
+	uint64_t evicted_bytes;
 };

 /**
@@ -382,6 +390,7 @@ int ttm_resource_manager_evict_all(struct ttm_device *=
bdev,
 				   struct ttm_resource_manager *man);

 uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man);
+uint64_t ttm_resource_manager_evicted_bytes(struct ttm_resource_manager *=
man);
 void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 				struct drm_printer *p);

=2D-
2.44.0

