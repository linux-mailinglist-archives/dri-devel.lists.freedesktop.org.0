Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F72866B0B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 08:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B48D89167;
	Mon, 26 Feb 2024 07:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382668911A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 07:38:46 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-C3qOJPHCNt2Gs1YDRX-nuQ-1; Mon, 26 Feb 2024 02:38:42 -0500
X-MC-Unique: C3qOJPHCNt2Gs1YDRX-nuQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E3B085A596;
 Mon, 26 Feb 2024 07:38:42 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 891C6C185C0;
 Mon, 26 Feb 2024 07:38:41 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH] nouveau: report byte usage in VRAM usage.
Date: Mon, 26 Feb 2024 17:38:39 +1000
Message-ID: <20240226073839.2329938-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
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

From: Dave Airlie <airlied@redhat.com>

Turns out usage is always in bytes not shifted.

Fixes: 72fa02fdf833 ("nouveau: add an ioctl to report vram usage")
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouv=
eau/nouveau_abi16.c
index cd14f993bdd1..80f74ee0fc78 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -269,7 +269,7 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 =09=09break;
 =09case NOUVEAU_GETPARAM_VRAM_USED: {
 =09=09struct ttm_resource_manager *vram_mgr =3D ttm_manager_type(&drm->ttm=
.bdev, TTM_PL_VRAM);
-=09=09getparam->value =3D (u64)ttm_resource_manager_usage(vram_mgr) << PAG=
E_SHIFT;
+=09=09getparam->value =3D (u64)ttm_resource_manager_usage(vram_mgr);
 =09=09break;
 =09}
 =09default:
--=20
2.43.2

