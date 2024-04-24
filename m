Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 638AE8B1077
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C06F113C85;
	Wed, 24 Apr 2024 17:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="BzBXZVBn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A739F113C7E;
 Wed, 24 Apr 2024 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713978037; x=1714582837; i=friedrich.vock@gmx.de;
 bh=FsCN5JZy4Gk/a3hNXMYjit3VoRRF7a2Y6fIOALfs5oU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BzBXZVBnSCSLYg0gaM9bfqNAoRqvzBo0OqDuzub7Gp7DVeaQSab86G05W0scvABI
 SPdZl31Ve+Trf6xCWcXWvju9I7au+2qFmVTDvLyPyOjpZ6YIQjqFqQxkM+W4fYsz9
 wRKKqirKfKzteqiGvAXT+MjwRBXDqF1hMQ6tXbMAUkYn9P0KixpuuH3xMBXJpx6OP
 kzaut4pHMdz1Q5/CHfKcJWMgClZR9LcSrPMFqDRreoOFddo4DvAdhY+rS7H9i1EtV
 zQNw8hwLUYFPpXoZYGl5oM7qBwOJl8+TFCUjW2neWNh5wLZ5hCTIM9wM5h/ZKOLNv
 qEpATylxShuPO1m94g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from arch.fritz.box ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzQg6-1sv3rB0CJ6-00x8xF; Wed, 24
 Apr 2024 19:00:37 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 03/18] drm/ttm: Implement BO eviction tracking
Date: Wed, 24 Apr 2024 18:56:53 +0200
Message-ID: <20240424165937.54759-4-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2+RNyK8NhFATRu2jik5k00mGmFkyBnRBXgbjQoWBef/TksvvbCy
 AntRyXNf6GAnsqjF3B/jOp56yoKo59sgm6UeqcPox8pFyhCEbR3lSWwJEBwHdf2LaPuicOt
 utojTIcjlr27he0KQ54FYQ6R0DrtbF5Ogu96mptwaCRW989IqCg4Y4WJZbNwJxKzHEGBqZR
 IrzgdqK1nc0HDZQCSVn0g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/xygCpP2LZQ=;NBFwCzvS9Y0RzV9PF4GWtb06oou
 KAKbUDgRhqJgWNBNN+EvxWXwttbi73MTRqWYvyyphnydU/ZkuwkPMi0R+P8Hvk2mTv+g61eWA
 6gP9knC1ntd79JptkOPK30LWy/nInwB1PvpY0Lz2ypapiBe4TRVWasEnPNpeb0Nl4rd7U2vrS
 Ph9O+c/T2GGuznJEaiQUA1DcoGQbDsuQQKOlA2J9pSdT957rDjrWwiJly/eog2G9dEjE4PUCp
 txUR7mjh2wwL2qAM/NjR6+H8+3lpRN9nbMeOVWjq4e8ric5eGNqZj0Exiq6vbef03yzEZyBC3
 uzJ+L7E3eI6tZxmvL1hOCzgUXCwwCVpsYwzYM9Z+apdhM3TGU6OBcA8Qwi7vYkkXqZrzxroMh
 r2RED9UhPhVO+TlVvxOCkq9KZfhWBEgHKtvePY+ifG1YOz8IJb37ulTSAe5fW9lPk2/00iUD6
 4t0W4dsTFadPKweXQ/7I0i9ZTPObMOBf1Y1wW2O2vgaAujavSk+aNs5f64VgccHBsuN2z6M7H
 iU9oqK/O/PeCZdyfPFNP8avD2dNWyOTa0osbsls1LvdJCTTCND7PdzYMe2PiIMhOQlKYg0X71
 G+Z1h9NoDF6EDkg2yrFYmaDp9z/DXzYPHp6RjZROLuiMRxGYkqCEbXb5pcWWhnypBxt6SiVJP
 /30IOt742nbHAD94KuixyS+gGqKVjH7ghEpkLjm1OYBS7wf7MUDk1HZch4cjFLzVCESYW/N7Z
 dfWDKUjw9VUt+1eEJlMdHaw0LRdLNy4s7Lr32QJcnfXgzWjJiVY2TusyWxdtS/RO0LSwkzInG
 MOuxkpMrmOuk4u426leL6B9r60KO6LdSnMBRx9KV1qMqw=
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

For each buffer object, remember evictions and try undoing them if
memory pressure gets lower again.

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 drivers/gpu/drm/ttm/ttm_bo.c      | 28 +++++++++++++++++++++++++++-
 drivers/gpu/drm/ttm/ttm_bo_util.c |  3 +++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 3968b17453569..9a0efbf79316c 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -178,6 +178,12 @@ static void ttm_bo_cleanup_memtype_use(struct ttm_buf=
fer_object *bo)
 {
 	if (bo->bdev->funcs->delete_mem_notify)
 		bo->bdev->funcs->delete_mem_notify(bo);
+	if (bo->evicted_type !=3D TTM_NUM_MEM_TYPES) {
+		spin_lock(&bo->bdev->unevict_lock);
+		list_del_init(&bo->evicted);
+		man->evicted_bytes -=3D bo->base.size;
+		spin_unlock(&bo->bdev->unevict_lock);
+	}

 	ttm_bo_tt_destroy(bo);
 	ttm_resource_free(bo, &bo->resource);
@@ -429,7 +435,9 @@ static int ttm_bo_bounce_temp_buffer(struct ttm_buffer=
_object *bo,
 static int ttm_bo_evict(struct ttm_buffer_object *bo,
 			struct ttm_operation_ctx *ctx)
 {
+	int evicted_type =3D bo->resource->mem_type;
 	struct ttm_device *bdev =3D bo->bdev;
+	struct ttm_resource_manager *man;
 	struct ttm_resource *evict_mem;
 	struct ttm_placement placement;
 	struct ttm_place hop;
@@ -438,6 +446,7 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 	memset(&hop, 0, sizeof(hop));

 	dma_resv_assert_held(bo->base.resv);
+	man =3D ttm_manager_type(bdev, evicted_type);

 	placement.num_placement =3D 0;
 	placement.num_busy_placement =3D 0;
@@ -477,6 +486,14 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 		ttm_resource_free(bo, &evict_mem);
 		if (ret !=3D -ERESTARTSYS && ret !=3D -EINTR)
 			pr_err("Buffer eviction failed\n");
+	} else if (bo->evicted_type =3D=3D TTM_NUM_MEM_TYPES &&
+		   bo->bdev->funcs->uneviction_valuable &&
+		   bo->bdev->funcs->uneviction_valuable(bo)) {
+		bo->evicted_type =3D evicted_type;
+		spin_lock(&bo->bdev->unevict_lock);
+		list_add_tail(&bo->evicted, &man->evicted);
+		man->evicted_bytes +=3D bo->base.size;
+		spin_unlock(&bo->bdev->unevict_lock);
 	}
 out:
 	return ret;
@@ -845,6 +862,7 @@ static int ttm_bo_move_buffer(struct ttm_buffer_object=
 *bo,
 			      struct ttm_placement *placement,
 			      struct ttm_operation_ctx *ctx)
 {
+	struct ttm_resource_manager *man;
 	struct ttm_resource *mem;
 	struct ttm_place hop;
 	int ret;
@@ -873,8 +891,16 @@ static int ttm_bo_move_buffer(struct ttm_buffer_objec=
t *bo,
 		goto bounce;
 	}
 out:
-	if (ret)
+	if (ret) {
 		ttm_resource_free(bo, &mem);
+	} else if (bo->evicted_type !=3D TTM_NUM_MEM_TYPES) {
+		man =3D ttm_manager_type(bo->bdev, bo->evicted_type);
+		spin_lock(&bo->bdev->unevict_lock);
+		list_del_init(&bo->evicted);
+		man->evicted_bytes -=3D bo->base.size;
+		spin_unlock(&bo->bdev->unevict_lock);
+		bo->evicted_type =3D TTM_NUM_MEM_TYPES;
+	}
 	return ret;
 }

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_b=
o_util.c
index fd9fd3d15101c..119291c5ed85e 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -262,6 +262,9 @@ static int ttm_buffer_object_transfer(struct ttm_buffe=
r_object *bo,
 		fbo->base.bulk_move =3D NULL;
 	}

+	INIT_LIST_HEAD(&fbo->base.evicted);
+	fbo->base.evicted_type =3D TTM_NUM_MEM_TYPES;
+
 	ret =3D dma_resv_reserve_fences(&fbo->base.base._resv, 1);
 	if (ret) {
 		kfree(fbo);
=2D-
2.44.0

