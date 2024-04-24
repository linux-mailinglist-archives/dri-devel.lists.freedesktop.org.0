Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8968B107E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8F4113CB2;
	Wed, 24 Apr 2024 17:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="awFamVbL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246A2113C8E;
 Wed, 24 Apr 2024 17:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713978042; x=1714582842; i=friedrich.vock@gmx.de;
 bh=v1EbVgOMiqUXagB/y/cMZLK1xcQnLlZIpQIszhLMlrk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=awFamVbL0koHnPaIicXmtGcKH2CCwscGO3BadBsMDT+eh145T2I6vF0GqqXTyy0N
 or6g7jeqZwX3qDkr4mtPLqNcx58iFeifO3VkrQMztHw0+lIcLzzjXitv8Wcqd8//L
 /+0Fx/RFivn86YLET7HCBywcSPS127AUGDQ6oDHH4cKCaaVf1E+QpHjEdEK8fsTlE
 sUTlsKw2DSjCkOwYJZrwpy0QmRFnBDCYwetiQXHHfz6AbZLe9pMebwPYlF+3vesNf
 TxeZqZKM40KdX19/YGcaV05jJiI9tXZCzBXzm/ib5EqUY47Oo9//UOWrsVEZudYWx
 k2m9oSIgn9Oo2msv+g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from arch.fritz.box ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MaJ7v-1sDism43Mr-00VXIS; Wed, 24
 Apr 2024 19:00:42 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 13/18] drm/ttm: Implement ttm_bo_update_priority
Date: Wed, 24 Apr 2024 18:57:03 +0200
Message-ID: <20240424165937.54759-14-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZAaSNzUaY+QqjHlYyHPyUjkrF6rMvq32hm+AlziChmc6KNewZ4F
 YliItUwcoXXaBfcGbYDTaZPvG1KYZJkisxIidetdfERnH+DnVtQCJFIo3zW/MSVjvGuQFEw
 Z9i/UNAlJDN4A0MhwCmU2GX5K04aXll9top6g7sg+dpJJ8NtYA/QKXdpsWA6/6mkYKqt8Yh
 HbanuTec3uaYkcADhOQ0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Rbh3TRHnxbI=;htBDbhryNDhyJ955ohgsaqwDOTY
 mhD+hbGC6gJqWwIW6qSRR47BocSWlSgHqpKyMicKw0JBU0QEwYTmgzjEx+ayIueu4TJBx42iY
 TCqs/LKLMVJ0Rc0yrU7bZWBRABbk/QnXqYI2meWejvtvsAfGdTGqRUEsm9L7HNkmyASyw8If8
 Drrj38rYvlQUPAjM4mlftqxPglir+BuLyGQDR0iLcX0JSEqhAVy1B0A2KQy2SBkVtkzwlQvJ6
 Og1h814KqR0nLcYTSx0c8O8bB9rU3nQ6sgItz+cHZOSsdQ8br+kKA8VX65eGcy+lt0UcFB+ek
 Ndj+0/mXvGM/AxMmE2V1falVVMIRFkz3I5E8u7JbRaYwLrTwr1MLklemkiQTmue5EatSdxpvj
 H30DPPmZXcY5TNcVgy2vaW/GvU2DlNf1bRJs+WU8avrcNelv3dxamqrm2uh0qNJfUsVY/17Ku
 jUOVpvspiHfURgjvktTw0i1EcN8RMqUH4u4aUNLLMH59HI0B3nAxZMPPpilYdG4XIwc2wsik7
 9JJVx0H9E20tT/2CvYrXOGYpUxzzhvymBk3PweM1PYauROydq/rGW8wCxlB5TU2nTQBdO4mxG
 glTwuKokvKwwCI/k66Ngwk+DQtmG9vXf6WCM6W1ryqhcnQSp9Zg6Hf6+22gTnd7bkMHzWFqSp
 B9x6E+OY/dhOAUDMLpd9nwxBlDJAARlPKfI3xY4eXRRPHsLXWw8gSGTzwgBTxLH0TWg6GaCda
 u1xceh4vCFjJHfai1aLdy1oYqIx3KskJbs+n8vHqSX7RhNtI0hqgS4QC8RmPc5F6izAP6l3et
 1HLzHLYQReNCvGnq+V6jChh63CND2drspEw7qddOGPMBM=
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

Used to dynamically adjust priorities of buffers at runtime, to react to
changes in memory pressure/usage patterns.

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 drivers/gpu/drm/ttm/ttm_bo.c | 17 +++++++++++++++++
 include/drm/ttm/ttm_bo.h     |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index eae54cd4a7ce9..6ac939c58a6b8 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -112,6 +112,23 @@ void ttm_bo_set_bulk_move(struct ttm_buffer_object *b=
o,
 }
 EXPORT_SYMBOL(ttm_bo_set_bulk_move);

+void ttm_bo_update_priority(struct ttm_buffer_object *bo, unsigned int ne=
w_prio)
+{
+	struct ttm_resource_manager *man;
+
+	if (!bo->resource)
+		return;
+
+	man =3D ttm_manager_type(bo->bdev, bo->resource->mem_type);
+
+	spin_lock(&bo->bdev->lru_lock);
+	ttm_resource_del_bulk_move(bo->resource, bo);
+	bo->priority =3D new_prio;
+	ttm_resource_add_bulk_move(bo->resource, bo);
+	spin_unlock(&bo->bdev->lru_lock);
+}
+EXPORT_SYMBOL(ttm_bo_update_priority);
+
 static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 				  struct ttm_resource *mem, bool evict,
 				  struct ttm_operation_ctx *ctx,
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 91299a3b6fcfa..51040bc443ea0 100644
=2D-- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -359,6 +359,8 @@ static inline void *ttm_kmap_obj_virtual(struct ttm_bo=
_kmap_obj *map,
 	return map->virtual;
 }

+void ttm_bo_update_priority(struct ttm_buffer_object *bo,
+			    unsigned int new_prio);

 int ttm_bo_wait_ctx(struct ttm_buffer_object *bo,
 		    struct ttm_operation_ctx *ctx);
=2D-
2.44.0

