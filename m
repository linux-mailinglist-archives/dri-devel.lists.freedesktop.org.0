Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAF98B107B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF81C113C9E;
	Wed, 24 Apr 2024 17:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="S2ycc8Nj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB7E113C87;
 Wed, 24 Apr 2024 17:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713978041; x=1714582841; i=friedrich.vock@gmx.de;
 bh=toDqG0EtftLVKgwAfYmZDmxHwmiPViX4qpOT8SmMAk0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=S2ycc8NjpeDGRYnt8ElFGl3rd7MxKA+ffafUzSGqJVZL6NAkSK+iUqHnEwzeymyg
 Mt6boTshP2BfCmu5+lDgcuv755tAcUVItcgDINndIllduc0iqR8Eg6QGVBLcnbSoP
 LOZFdXUQiqJVmUxfkSg0LdnVPAYmGJ2evCZutoUidKOyEdpKK1qxDYdPhJeAnAYjF
 Uhpl9D1TczwVKt9Ii55jjCvDQmNSzW9ZI6TzSPkeQn9bS+0Zie18T2+RzThKIrdKM
 3ob2/KxMpW2/Bf0ZOThwpnmiJVHqPEQFBafnCX2j5ZqQQh4MCrErYfPXRk7Wo+8Nl
 5izsN7Odl2Yn40S6pg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from arch.fritz.box ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQe5k-1sNNXD22xK-00MQlD; Wed, 24
 Apr 2024 19:00:41 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 12/18] drm/ttm: Do not evict BOs with higher priority
Date: Wed, 24 Apr 2024 18:57:02 +0200
Message-ID: <20240424165937.54759-13-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VY5VDLev0ESq1+HxUQDvrBZdcGB5VjDEAOUWfKECM8TbODUS+7k
 zh2hj2r6J0stnbGKskRQTsGemcLQb5RtUvv599WdbjgYWB98ioQuNrjHq8fLoCSju96OVmn
 ZSxEx7V6r3kwGQW08jxIt1JScTF0G+BQhHS/Bm9Zj4dLzGjOZ5njU0+cKqz4bzhRD7Mc1jl
 hEq0qFptw1np4f6jZFBrQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2i+Q1BCimCM=;eo3BLJ+xbUfvgH7+iTx2BYTjRta
 IbKS17PpU/asvAzvOo61LG/1e9YwO/CAyZvSmkHdrg63/7T/+xL3OQKLZRLOEbHh3ZnuHro1p
 piUNTB8f9xYc7UI+0B2LjXglxU5Ki0sN8F9iIGjR4yXOJJTqGZZQNUO5Bf8iKI3CawfHn4Zb3
 XKiLZGznKaneXzvO6VRFqnklnTvuiJy5/2nvFBwtxYym0QMzB2p1vhfmb+xnp+nmipUVZoNq8
 mmZrWFILB6mUicuyLf+F5QHZjeYR+Q4lOp6dPsqsh9Tpp9OR8N78NUEv6t3OVCu6bhLD0qCL+
 B8TXcNJ7m7zQHEFPZei+IST/H5fJ+RtMMZohhFmN4UAHM/bZkMFYQ9mEzLa0jPWWxBgGsvRVC
 5sE3yPrs/YXCiZld4lb2yhfHHz4xzsxTbzQO87KDHm8dX2ooPsKOr4BHD7TGwknoXQPQfO7lD
 hlsmpH4aMYd/CSD8p9mChCiWErZsa/+kyBWBJX87bFRzqCAzzK6jQ+/KzdlHQoBAkFNqF5PF/
 DtHavktrBqvn7WIClfqvnZPSYlpaZzgxsFkODOeP4sYJevNEnxmEyEEp6SNZA2BFnGOEwBwPU
 gOtmGWWeyo+hU1oJ/BesJNe4UlKJcPjF4qtbmXJmT5EparFbuY+vheThGSsBS6i+Yn+XHJavb
 Na5gZGuBoq6C8fl9c2U/olbjqbKdCR5p4x9HKjnElXBhpEI5Iwgfzhgy7E+XYQFZIYh1PIYm6
 8933Sj596iNVQDwyZBMVGlgMBGEX4TMuD41hYUKd1bUlvHyG6+aFqHt5EwNICbsuigwS+Q4TE
 Yti/t7XU2EzMujWKS+Z21EAkvHO9OgNAoR3aduAzgiIio=
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

This makes buffer eviction significantly more stable by avoiding
ping-ponging caused by low-priority buffers evicting high-priority
buffers and vice versa.

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 drivers/gpu/drm/ttm/ttm_bo.c       | 9 +++++++--
 drivers/gpu/drm/ttm/ttm_resource.c | 5 +++--
 include/drm/ttm/ttm_bo.h           | 1 +
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 3047c763eb4eb..eae54cd4a7ce9 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -776,6 +776,7 @@ static int ttm_mem_evict_wait_busy(struct ttm_buffer_o=
bject *busy_bo,
 int ttm_mem_evict_first(struct ttm_device *bdev,
 			struct ttm_resource_manager *man,
 			const struct ttm_place *place,
+			unsigned int max_priority,
 			struct ttm_operation_ctx *ctx,
 			struct ww_acquire_ctx *ticket)
 {
@@ -788,6 +789,8 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 	spin_lock(&bdev->lru_lock);
 	ttm_resource_manager_for_each_res(man, &cursor, res) {
 		bool busy;
+		if (res->bo->priority > max_priority)
+			break;

 		if (!ttm_bo_evict_swapout_allowable(res->bo, ctx, place,
 						    &locked, &busy)) {
@@ -930,8 +933,10 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_o=
bject *bo,
 			return ret;
 		if (ctx->no_evict)
 			return -ENOSPC;
-		ret =3D ttm_mem_evict_first(bdev, man, place, ctx,
-					  ticket);
+		if (!bo->priority)
+			return -ENOSPC;
+		ret =3D ttm_mem_evict_first(bdev, man, place, bo->priority - 1,
+					  ctx, ticket);
 		if (unlikely(ret !=3D 0))
 			return ret;
 	} while (1);
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_=
resource.c
index 1d6755a1153b1..63d4371adb519 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -431,8 +431,9 @@ int ttm_resource_manager_evict_all(struct ttm_device *=
bdev,
 	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i) {
 		while (!list_empty(&man->lru[i])) {
 			spin_unlock(&bdev->lru_lock);
-			ret =3D ttm_mem_evict_first(bdev, man, NULL, &ctx,
-						  NULL);
+			ret =3D ttm_mem_evict_first(bdev, man, NULL,
+						  TTM_MAX_BO_PRIORITY,
+						  &ctx, NULL);
 			if (ret)
 				return ret;
 			spin_lock(&bdev->lru_lock);
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 8f4e6366c0417..91299a3b6fcfa 100644
=2D-- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -396,6 +396,7 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
 int ttm_mem_evict_first(struct ttm_device *bdev,
 			struct ttm_resource_manager *man,
 			const struct ttm_place *place,
+			unsigned int max_priority,
 			struct ttm_operation_ctx *ctx,
 			struct ww_acquire_ctx *ticket);
 void ttm_mem_unevict_evicted(struct ttm_device *bdev,
=2D-
2.44.0

