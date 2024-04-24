Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CD38B1079
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C86113C90;
	Wed, 24 Apr 2024 17:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="c7gwoqUh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F13113C7C;
 Wed, 24 Apr 2024 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713978038; x=1714582838; i=friedrich.vock@gmx.de;
 bh=YEoEwdZBTeDletyFf2XrgVi0oLfeiNH6JddFRwgtZks=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=c7gwoqUhnT7GMve27XXstn9u+1BBqzgUXdCjgm9rHSO7L+0cCcyeTWsfJtL0be1R
 yNRHClZda+gFqdsRufJYeh8OcOrTxt0nm35cJoDzZa3wAF/nxrPxFMIhQXMTFIHoW
 GrAcCFmHCm9xL+Ur+dNlCSi8Y1wwEuS0htKCFSbDkOJ9WxwyDPoRyR54X8UXLJvR0
 ZeK+tChpD5br3RmdUXgH0gHB6AFtrXE5rk0D3UxbhLeoxKanVj48bm0hH8CQrYd18
 YVKRcWR0KLPxp1NYc3d0ZCOp85HIGto7GjfLviKxQrEOzq+ZWHfbzR45JUcwrO63R
 Wzr4QDzqut/YwapPMA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from arch.fritz.box ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRTRH-1sMYaJ2G0b-00Mhbo; Wed, 24
 Apr 2024 19:00:38 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 06/18] drm/ttm: Add public buffer eviction/uneviction
 functions
Date: Wed, 24 Apr 2024 18:56:56 +0200
Message-ID: <20240424165937.54759-7-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0/0NKfU26JPp92TtRupJLBEu1L6rO0vcTTmoElTHWE06tJXlemG
 K+i9R9YvCgtscOrrQrqJFCAyTqC0bZuDbjyZ1dq2So0/ZcMsYSS5mL/vPxnVYTeBNfO8RSf
 oNz7Fv6O86ZwU0xXxkxuHSdi+uWrT5afDkHU/rnBa0WB4HaLS3XQnBbLevGUsDFfxfUGnUT
 /yOMM67/MB0JpsR5Pd9GQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zzxLZerOn/Q=;cqOIDMG1GWJjPDQ0iQ2KIMC48et
 TIfbpCj46f6GRwNcnw58cp+ajjzTmgoLOl4a0sfmJr2GIt8g97Ki8vYgOMhtKTyCu/KvIohs5
 bI6ulPi/kQcErq7SMw3CG3+BtlTdOK/t1XCpQqE+COyVohpERNqUcWFUgpojYz9rvvTyu/R2C
 4Whm0rGn33C2sT/BLpssZUBYGNzmT+2zZVQ+cTeRbwGrOvug1b1L/XiTz/AlFrWmRujDrz5xR
 Bx/snOsNV/r2QbvfyzwEDafR/WXCCCXmreTxoUjDQeeSYfK2uXRjBF1fjk3eHWZ+LASqyTpY6
 ZyIq4ebTAa5Xi2Sd4jsziziWiK9CFwzXC+O8vpUzeHjF9RVvl9qNUXm+RkANxXlqlVbqb02BU
 Ji8STQ8/CCxafckBHTh47TsdRSPwEtOv3LUstEV2mi0H3a7B3hSBi0VMAb8trHjgtTZJyHvHf
 hpDGucqnvhwhZCJBcAz5wXZuYWvQ/zROZ+lBdONn2IEZOmxWAshj2q1rQUnaflhKHjt5K7Z/f
 OyUtdO/hr9539HDnvaR8W4buQxgFrnS0YfKl+DvwP9Z847oee+SUuNvU/vs3kWvQS5EsnaaeF
 tXng4f/FE1JrgxsvTPiUKW7zVjVWmK8EUG+WwTL5Wtmdip5dnZjMdJuLwpXN8xR6fMi7VW9zu
 xYXNn7DW+1wuBgK4NgEttG9JlNQNMnhd/aJZso5Wom77zyYFrHRRFCCm7ESrRLgCI9fg9XLZb
 bNXJFsuEbezZZWcpaxnIvnarURRxdCrCdVGAk2ReVuCzhshE51X/cFU+6Ow8JbszPJxrMjf8Z
 J/xaA7jGa1mjug06vnHthAsF+XEBbN3pd9Na5ti0+3BY8=
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

For now, they are only used internally inside TTM, but this will change
with the introduction of dynamic buffer priorities.

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 drivers/gpu/drm/ttm/ttm_bo.c | 168 ++++++++++++++++++++++++++++++++++-
 include/drm/ttm/ttm_bo.h     |   6 ++
 2 files changed, 172 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 3b89fabc2f00a..3047c763eb4eb 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -166,6 +166,111 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_=
object *bo,
 	return ret;
 }

+/**
+ * Fetches the next BO from the manager's list of evicted BOs.
+ * bdev->unevict_lock should be held when calling this function.
+ */
+static struct ttm_buffer_object *ttm_next_evicted_bo(struct ttm_device *b=
dev,
+						     struct ttm_resource_manager *man,
+						     struct ttm_buffer_object *cursor)
+{
+	struct ttm_buffer_object *bo =3D NULL;
+
+	if (cursor)
+		cursor =3D list_next_entry(cursor, evicted);
+	else
+		cursor =3D list_first_entry(&man->evicted, struct ttm_buffer_object, ev=
icted);
+
+	if (!list_entry_is_head(cursor, &man->evicted, evicted))
+		bo =3D ttm_bo_get_unless_zero(cursor);
+	return bo;
+}
+
+void ttm_mem_unevict_evicted(struct ttm_device *bdev,
+			     struct ttm_resource_manager *man,
+			     bool interruptible)
+{
+	struct ttm_buffer_object *evicted_bo =3D NULL, *next_evicted_bo =3D NULL=
;
+	struct ttm_operation_ctx ctx;
+	int ret;
+
+	memset(&ctx, 0, sizeof(ctx));
+	ctx.interruptible =3D interruptible;
+	ctx.no_evict =3D true;
+
+	spin_lock(&bdev->unevict_lock);
+	evicted_bo =3D ttm_next_evicted_bo(bdev, man, NULL);
+	spin_unlock(&bdev->unevict_lock);
+
+	while (evicted_bo) {
+		if (interruptible)
+			ret =3D dma_resv_lock_interruptible(
+					evicted_bo->base.resv, NULL);
+		else
+			ret =3D dma_resv_lock(evicted_bo->base.resv,
+					    NULL);
+		if (ret) {
+			ttm_bo_put(evicted_bo);
+			break;
+		}
+
+		/* If we raced with another thread (and lost), the
+		 * other thread already removed the buffer from the
+		 * list. In that case, we need to start over because
+		 * our current cursor got removed.
+		 */
+		if (evicted_bo->evicted_type =3D=3D TTM_NUM_MEM_TYPES)
+			ret =3D 0;
+		else
+			ret =3D ttm_bo_try_unevict(evicted_bo, &ctx);
+
+		next_evicted_bo =3D ret ? evicted_bo : NULL;
+
+		spin_lock(&bdev->unevict_lock);
+		next_evicted_bo =3D ttm_next_evicted_bo(bdev, man,
+						      next_evicted_bo);
+		spin_unlock(&bdev->unevict_lock);
+
+		dma_resv_unlock(evicted_bo->base.resv);
+		ttm_bo_put(evicted_bo);
+
+		evicted_bo =3D next_evicted_bo;
+	}
+}
+EXPORT_SYMBOL(ttm_mem_unevict_evicted);
+
+struct ttm_mem_unevict_work {
+	struct work_struct work;
+	struct ttm_device *bdev;
+	struct ttm_resource_manager *man;
+};
+
+static void ttm_mem_unevict_work(struct work_struct *work)
+{
+	struct ttm_mem_unevict_work *unevict_work;
+
+	unevict_work =3D container_of(work, typeof(*unevict_work), work);
+
+	ttm_mem_unevict_evicted(unevict_work->bdev, unevict_work->man,
+				false);
+}
+
+static void ttm_mem_queue_unevict(struct ttm_device *bdev,
+				  struct ttm_resource_manager *man)
+{
+	struct ttm_mem_unevict_work *work;
+
+	work =3D kzalloc(sizeof(*work), GFP_KERNEL);
+
+	if (!work)
+		return;
+
+	INIT_WORK(&work->work, ttm_mem_unevict_work);
+	work->bdev =3D bdev;
+	work->man =3D man;
+	queue_work_node(bdev->pool.nid, bdev->wq, &work->work);
+}
+
 /*
  * Call bo::reserved.
  * Will release GPU memory type usage on destruction.
@@ -176,6 +281,12 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_o=
bject *bo,

 static void ttm_bo_cleanup_memtype_use(struct ttm_buffer_object *bo)
 {
+	struct ttm_resource_manager *man =3D NULL;
+	struct ttm_device *bdev =3D bo->bdev;
+
+	if (bo->resource)
+		man =3D ttm_manager_type(bo->bdev, bo->resource->mem_type);
+
 	if (bo->bdev->funcs->delete_mem_notify)
 		bo->bdev->funcs->delete_mem_notify(bo);
 	if (bo->evicted_type !=3D TTM_NUM_MEM_TYPES) {
@@ -187,6 +298,9 @@ static void ttm_bo_cleanup_memtype_use(struct ttm_buff=
er_object *bo)

 	ttm_bo_tt_destroy(bo);
 	ttm_resource_free(bo, &bo->resource);
+
+	if (man)
+		ttm_mem_queue_unevict(bdev, man);
 }

 static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
@@ -432,8 +546,7 @@ static int ttm_bo_bounce_temp_buffer(struct ttm_buffer=
_object *bo,
 	return 0;
 }

-static int ttm_bo_evict(struct ttm_buffer_object *bo,
-			struct ttm_operation_ctx *ctx)
+int ttm_bo_evict(struct ttm_buffer_object *bo, struct ttm_operation_ctx *=
ctx)
 {
 	int evicted_type =3D bo->resource->mem_type;
 	struct ttm_device *bdev =3D bo->bdev;
@@ -499,6 +612,57 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 	return ret;
 }

+int ttm_bo_try_unevict(struct ttm_buffer_object *bo,
+		       struct ttm_operation_ctx *ctx)
+{
+	struct ttm_resource_manager *man;
+	struct ttm_device *bdev =3D bo->bdev;
+	struct ttm_resource *unevict_mem;
+	struct ttm_placement placement;
+	struct ttm_place hop;
+	int ret =3D 0;
+
+	dma_resv_assert_held(bo->base.resv);
+
+	man =3D ttm_manager_type(bdev, bo->evicted_type);
+
+	if (bo->deleted)
+		goto out;
+
+	placement.num_placement =3D 0;
+	placement.num_busy_placement =3D 0;
+	bdev->funcs->unevict_flags(bo, &placement);
+
+	if (!placement.num_placement && !placement.num_busy_placement)
+		return -ENOSPC;
+
+	ret =3D ttm_bo_mem_space(bo, &placement, &unevict_mem, ctx);
+	if (ret)
+		return ret;
+
+	do {
+		ret =3D ttm_bo_handle_move_mem(bo, unevict_mem, true, ctx, &hop);
+		if (ret !=3D -EMULTIHOP)
+			break;
+
+		ret =3D ttm_bo_bounce_temp_buffer(bo, &unevict_mem, ctx, &hop);
+	} while (!ret);
+
+	if (ret)
+		ttm_resource_free(bo, &unevict_mem);
+
+out:
+	if (!ret) {
+		spin_lock(&bdev->unevict_lock);
+		list_del_init(&bo->evicted);
+		man->evicted_bytes -=3D bo->base.size;
+		spin_unlock(&bdev->unevict_lock);
+		bo->evicted_type =3D TTM_NUM_MEM_TYPES;
+	}
+	return ret;
+}
+EXPORT_SYMBOL(ttm_bo_try_unevict);
+
 /**
  * ttm_bo_eviction_valuable
  *
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index a8f21092403d6..8f4e6366c0417 100644
=2D-- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -370,6 +370,9 @@ void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo=
,
 			  struct ttm_lru_bulk_move *bulk);
 bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 			      const struct ttm_place *place);
+int ttm_bo_evict(struct ttm_buffer_object *bo, struct ttm_operation_ctx *=
ctx);
+int ttm_bo_try_unevict(struct ttm_buffer_object *bo,
+		       struct ttm_operation_ctx *ctx);
 int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_objec=
t *bo,
 			 enum ttm_bo_type type, struct ttm_placement *placement,
 			 uint32_t alignment, struct ttm_operation_ctx *ctx,
@@ -395,6 +398,9 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 			const struct ttm_place *place,
 			struct ttm_operation_ctx *ctx,
 			struct ww_acquire_ctx *ticket);
+void ttm_mem_unevict_evicted(struct ttm_device *bdev,
+			     struct ttm_resource_manager *man,
+			     bool interruptible);
 vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 			     struct vm_fault *vmf);
 vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
=2D-
2.44.0

