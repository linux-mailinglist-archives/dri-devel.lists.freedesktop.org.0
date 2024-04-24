Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAF68B107C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F22113CA2;
	Wed, 24 Apr 2024 17:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="brC1TjHT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23A3113C8B;
 Wed, 24 Apr 2024 17:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713978043; x=1714582843; i=friedrich.vock@gmx.de;
 bh=ZHxm4e4BKlDt3g/OuZIJ+Bxa1wcUho2Fc/9cnNxPoQc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=brC1TjHTfYPQa1+rGrCT+OOU1c549n6GynUUdCdZrohVrwwQ4ruLz5H9iX3GFGRN
 Jl1d5PisbDmccpR7kit9Ske7PXmJuzWtqZPzVIu7ofoeXqU1nGPocoxoBL8hwJST/
 t8Go9vg/zm35uAVJDvglUjiGE1wV1e9H02KW7LgPVY24d+BjkcJ99hzQSsqx78oJV
 scH6Iflwjmxa/I+Pzy146KLE9p4voJMh5sSJGc/UDS2Z8aa3dx0rPJ56b91F8q4vG
 10AA491XIm1wDE78YOnyDVpCvMjZg0WXFrYp77lqX5aYKc/7T0y07KUDCx0hyhYRp
 higgWeudgzxeKbJUAw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from arch.fritz.box ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1fis-1sfdVy4BBo-013liz; Wed, 24
 Apr 2024 19:00:43 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 15/18] drm/amdgpu: Set a default priority for user/kernel
 BOs
Date: Wed, 24 Apr 2024 18:57:05 +0200
Message-ID: <20240424165937.54759-16-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+2jx7HC7i8HHO2c70tVkhyyYN80yjf031Qi96QlKJrZ0clmZ3p4
 wADbmFIbD5W1xpWLtGgeyeWa11e2ekpWovWx5/0GMUvoKjw9JLuxLgn+9tvwuEFvG0AxXM/
 nENrtd7rYcX104rGpsM2A3rJ2TJJk/zltMimya+gd+UXERrYw6pKtTXtgxlCncDfckLhYjf
 jY8J01PV8Gy/VDnur3i8g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:h9audP43sV8=;hSjdEzFdSB8ERv0M0DF9ok1EeO+
 0ATfU3ytuE+8f4ocMy1k4M0onBDa0vcrOrku4/2/ELIfDMaQqWuavhVxKKMXztM0EOjTsWH4C
 bj3ZYheYp/HszZHq7bANgdcrMyFF/zwQhYXXu5RNG2G7Gq27iQpb3thtG7dpeDRoAB5u1KfU5
 hoMpzzmY0eTsL/a10mAr3PVqDs0c9kKuluiOxj0Mk9PFYtzetqA0PzZSYTbT9qRQct21L9HCh
 1Q8/5k1100JdFY+pzj0vhWOQyFZPhpGRdUHpI4MWKDPC6ErkPJ1WhlPttBPjrFYdemkE7FHpB
 tUGJO/SpEVxWipeYS06CQh1zQ0Zg2dxFFUfMnjGxOtmlhp6qcKMpVIyeKzR/OZKR8UJOv1Jj6
 uBuVnaYmMiXRhngGJkLRABfb0YGRX/UqL81uXZztYoh9boa1bNlv+yajn+UYa9YQUsUGNBE4I
 PV3O79eL1pKuJ9Z5PR734K4bOyxF4Hw8HldXHshV7GAGjbJRce2gJCGLvas4P8xBHQ/0yBzlY
 eqFc5AlNUZIB+bKt7sdQSGNgLMdt3p8VBoRnYAQ5xFemhlBkSSQXpuoPeu7+qmHt3Dhm+J+KM
 jgwqgZF34MAGOff91W0P4RYfhnZAAoQRnaS3Btc6tKuVqdAhb2FUp+Aivobwxd23AVtjT0g/f
 MOkEPA5A+lU6+srZ/5SDQZna9R7U3eJRu2Bp/u/UGCIKXuYTpOk/1hrLs3u1CMiTteQ4srm/0
 E5gY+YM555w2Trpj16gH443PYzB3AEsBC5Ar2q3vDUJMnYburNMcz4W93FpRtUwnoSjyXgwLl
 41q105CuaPob5zKYvJtytZwznBKyr0QVwZYkYIP5fXAuc=
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

Reserve the highest priority for the kernel, and choose a balanced value
as userspace default. Userspace is intended to be able to modify these
later to mark buffers as important/unimportant.

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h | 4 ++++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_gem.c
index aea3770d3ea2e..5ca13e2e50f50 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -114,6 +114,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *ade=
v, unsigned long size,
 	bp.type =3D type;
 	bp.resv =3D resv;
 	bp.preferred_domain =3D initial_domain;
+	bp.priority =3D 4;
 	bp.flags =3D flags;
 	bp.domain =3D initial_domain;
 	bp.bo_ptr_size =3D sizeof(struct amdgpu_bo);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_object.c
index 9978b85ed6f40..0e9ea11a873ef 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -621,9 +621,9 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	else
 		amdgpu_bo_placement_from_domain(bo, bo->allowed_domains);
 	if (bp->type =3D=3D ttm_bo_type_kernel)
-		bo->tbo.priority =3D 2;
+		bo->tbo.priority =3D AMDGPU_BO_PRIORITY_KERNEL;
 	else if (!(bp->flags & AMDGPU_GEM_CREATE_DISCARDABLE))
-		bo->tbo.priority =3D 1;
+		bo->tbo.priority =3D bp->priority;

 	if (!bp->destroy)
 		bp->destroy =3D &amdgpu_bo_destroy;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_object.h
index 0f277bc6a2e32..36513da0ec767 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -42,6 +42,9 @@
 /* BO flag to indicate a KFD userptr BO */
 #define AMDGPU_AMDKFD_CREATE_USERPTR_BO	(1ULL << 63)

+#define AMDGPU_BO_PRIORITY_KERNEL    (TTM_MAX_BO_PRIORITY - 1)
+#define AMDGPU_BO_PRIORITY_MAX_USER  (TTM_MAX_BO_PRIORITY - 2)
+
 #define to_amdgpu_bo_user(abo) container_of((abo), struct amdgpu_bo_user,=
 bo)
 #define to_amdgpu_bo_vm(abo) container_of((abo), struct amdgpu_bo_vm, bo)

@@ -52,6 +55,7 @@ struct amdgpu_bo_param {
 	u32				domain;
 	u32				preferred_domain;
 	u64				flags;
+	unsigned int                    priority;
 	enum ttm_bo_type		type;
 	bool				no_wait_gpu;
 	struct dma_resv			*resv;
=2D-
2.44.0

