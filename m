Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1553A3A2297
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 05:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CA56E438;
	Thu, 10 Jun 2021 03:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 308 seconds by postgrey-1.36 at gabe;
 Thu, 10 Jun 2021 03:10:05 UTC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D1C6E438
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 03:10:05 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-tDKqY80oNDq6R7TVDWSJew-1; Wed, 09 Jun 2021 23:03:48 -0400
X-MC-Unique: tDKqY80oNDq6R7TVDWSJew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA627100C610;
 Thu, 10 Jun 2021 03:03:46 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com
 (fdacunha.bne.redhat.com [10.64.0.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D94715D9C6;
 Thu, 10 Jun 2021 03:03:45 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: use correct rounding macro for 64-bit
Date: Thu, 10 Jun 2021 13:03:44 +1000
Message-Id: <20210610030344.117897-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This fixes 32-bit arm build due to lack of 64-bit divides.

Fixes: cb1c81467af3 ("drm/ttm: flip the switch for driver allocated resourc=
es v2")
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_vram_mgr.c
index 9a6df02477ce..436ec246a7da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -407,7 +407,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_mana=
ger *man,
 #endif
 =09=09pages_per_node =3D max_t(uint32_t, pages_per_node,
 =09=09=09=09       tbo->page_alignment);
-=09=09num_nodes =3D DIV_ROUND_UP(PFN_UP(mem_bytes), pages_per_node);
+=09=09num_nodes =3D DIV_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
 =09}
=20
 =09node =3D kvmalloc(struct_size(node, mm_nodes, num_nodes),
--=20
2.25.4

