Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACEF8B108C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C512113C88;
	Wed, 24 Apr 2024 17:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="Nweod4Q0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BE5113C88;
 Wed, 24 Apr 2024 17:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713978039; x=1714582839; i=friedrich.vock@gmx.de;
 bh=Nk7gng7Z1DKu4g8B79dnaCw+5SH6ersr6shXg9m/kZM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Nweod4Q0do/FQ4wTwwI3EU37MehFe7ORaR6ZhAKcKjH8BLFVLI8xBUHjzeIEW5hD
 hEDRkjwNHeVUF0akAQthtU96MUooQpfYOeFe/WKJLzk+NW6FEX85mQ8E4ln3mRjD9
 V7p/As3HliUrQmG4Qgj2w5qnxTpJ+zRewioYwpQt67VlVlp8gfvwakBY7wch704aq
 5B+bydhVHorr3Tjh5fPj6InKX8cLd4qmf7p8bnMb/piAS6HMt2TrqY9Co7gOoIClz
 ez4wkSi4u9rnj63bQ6jl/9tcXanjEpPZLb8FBJ56sDS80p9+stfAtCZb1zPiIYwEz
 gdER6BRhVt71Utpzag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from arch.fritz.box ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfYLa-1sbBWh06Mi-00hp1t; Wed, 24
 Apr 2024 19:00:39 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 07/18] drm/amdgpu: Add TTM uneviction control functions
Date: Wed, 24 Apr 2024 18:56:57 +0200
Message-ID: <20240424165937.54759-8-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CzIRNVfxema9WV3cQUwowAAn757mGRb/nJyHyAFWi8Gd7XWpoau
 Jt5OzKKc/5Q3zz+pAgLs5oIB8S0cyN8y8oX74WGZ/mjMg67M8uUNZQYWEIKzy+Oj8dgmf5M
 paONhEhvmpD0vALOvGaKUjemLofbDk4dPtXL2brrsnJ/CRtdX9ENihIMJihGIcA66OkBH7u
 6fcfd17XxTLYCRyzisdrA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jHvQD48aIAI=;ULHkvBQa8Wfb6AsouFW9dCEwMQZ
 RMOGJ+MzMHH5EhhkXq8qhpx69cZPe6MJvYFYLPueURhq2OcqkJVUlqkqdjuiynKmr5lEphA7S
 F7yCPS9aJ42dZjjdkcGUjvBiuiip4ITO+IF1KTIfBg+y0oElQjTK6chZKRvInjxoNaVJtXWLP
 ACix76jDfYiZXHE43wlAwB3FPnFV6tLijfKzu5Il6FRBnyYwRHcEtDnYt9osByH7fFuGQww29
 mERf2VOiCvsNByFdd6S4Bg6uHyx0AY4iIhc9xlZWQwEM9R64hqmoEwveu7saepZmedpMS8cC0
 cb17e5vHCZNYbRSg43VulCT0luhN8wZYsTjJreyGKRiODU/SlgN182ZY3HkGIwUdarde2f7Ei
 UyBsaqrsNn7ImxLOQGEv08z5QezkONpwSfLAlOZe6rIGm7RMPA2P5oyHvpSibjuowbTQifsWC
 MP7wOrBr1Fp2JsB7Js6mUfD1/AtGpJNj1etE9mHGV4YsEnlTr0RpL/rd5yZ9pz199a6V3pPLF
 w8uo9ve2ntW42Yvf9G0gQahqPUAwbq4gD+W2n6WHjAbke93maVatrlUuqWO4zGgvm0E/EvjCG
 Lxv33qOAl56EPGuzcIfKCACFK1P8hE8l0KKI5Tvm0KQRt86sQg83Ae9dV6pygh7GNer7QcObt
 Gx/WO9s5wewOH2AYZrdg9s4Sgb1U4La1+DjGuBZdLye8S7Qqd7B/PazmyQUexd5b9Iy9mNLPI
 fblgN120EFI2/AfcWnfRbrLbGdu6gC5KTrYd6zwl/y4VO68R4/IPWvK9gfTczErmVqr9eN/sS
 9nxwwntsWlHyROgwN6NTNwqYvE9mLJrfEdNiPO90nn2rg=
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

Try unevicting only VRAM/GTT BOs.

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 50 +++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_ttm.c
index 64f5001a7dc5d..98e8a40408804 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -166,6 +166,31 @@ static void amdgpu_evict_flags(struct ttm_buffer_obje=
ct *bo,
 	*placement =3D abo->placement;
 }

+/**
+ * amdgpu_unevict_flags - Compute placement flags
+ *
+ * @bo: The buffer object to unevict
+ * @dest: Destination for unevicted BO
+ *
+ * Fill in placement data when for restoring evicted BOs
+ */
+static void amdgpu_unevict_flags(struct ttm_buffer_object *bo,
+				 struct ttm_placement *dest)
+{
+	struct amdgpu_bo *abo =3D ttm_to_amdgpu_bo(bo);
+
+	WARN_ON(bo->evicted_type =3D=3D AMDGPU_PL_GDS ||
+		bo->evicted_type =3D=3D AMDGPU_PL_GWS ||
+		bo->evicted_type =3D=3D AMDGPU_PL_OA ||
+		bo->evicted_type =3D=3D AMDGPU_PL_DOORBELL);
+	WARN_ON(bo->evicted_type =3D=3D TTM_NUM_MEM_TYPES);
+
+	amdgpu_bo_placement_from_domain(abo, abo->preferred_domains);
+	*dest =3D abo->placement;
+	dest->num_placement =3D 1;
+	dest->num_busy_placement =3D 1;
+}
+
 /**
  * amdgpu_ttm_map_buffer - Map memory into the GART windows
  * @bo: buffer object to map
@@ -1424,6 +1449,29 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct =
ttm_buffer_object *bo,
 	return ttm_bo_eviction_valuable(bo, place);
 }

+/*
+ * amdgpu_ttm_bo_uneviction_valuable - Check to see if we can unevict a
+ * buffer object.
+ *
+ * Return true if uneviction is sensible. Called by ttm_bo_evict to
+ * decide whether to consider the buffer object for uneviction later.
+ */
+static bool amdgpu_ttm_bo_uneviction_valuable(struct ttm_buffer_object *b=
o)
+{
+	struct amdgpu_bo *abo;
+
+	if (!amdgpu_bo_is_amdgpu_bo(bo))
+		return false;
+
+	abo =3D ttm_to_amdgpu_bo(bo);
+
+	if (bo->type !=3D ttm_bo_type_device)
+		return false;
+
+	return (abo->preferred_domains &
+		(AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM_DOMAIN_GTT)) !=3D 0;
+}
+
 static void amdgpu_ttm_vram_mm_access(struct amdgpu_device *adev, loff_t =
pos,
 				      void *buf, size_t size, bool write)
 {
@@ -1581,6 +1629,8 @@ static struct ttm_device_funcs amdgpu_bo_driver =3D =
{
 	.ttm_tt_destroy =3D &amdgpu_ttm_backend_destroy,
 	.eviction_valuable =3D amdgpu_ttm_bo_eviction_valuable,
 	.evict_flags =3D &amdgpu_evict_flags,
+	.uneviction_valuable =3D &amdgpu_ttm_bo_uneviction_valuable,
+	.unevict_flags =3D &amdgpu_unevict_flags,
 	.move =3D &amdgpu_bo_move,
 	.delete_mem_notify =3D &amdgpu_bo_delete_mem_notify,
 	.release_notify =3D &amdgpu_bo_release_notify,
=2D-
2.44.0

