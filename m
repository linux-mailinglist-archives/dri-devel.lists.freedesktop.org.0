Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221A4ABEAC9
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 06:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E1310E6A7;
	Wed, 21 May 2025 04:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gaVWtqpY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D41A10E6B4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 04:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1747800799;
 bh=IuQzXp6oBU+GS2kSc9VjQ4GodVMmVBCGt7StEo3adBU=;
 h=Date:From:To:Cc:Subject:From;
 b=gaVWtqpYkCq7jaoP8OqYHZBGokPd6sgvLQS/IZtirlpTF0VBe7R2R/AODa27DI3P+
 c16lCbpBddOzK0Jr/NHEtllhzlIQM4SFiCqcJkjF2LnKlxtOFNmNaI8dDib648uFOi
 J9O/NFAq9eCQMSHv7qNzAkaZDp60pba7SDooOvB1QwcRdDJ3PauuO5GMYHGvJFxeZ2
 rQlsfo9wAJYhczULE2WhOsTwLveSThVRoGzBlAYOWvXFLmRZQOZ0rkdNpKE2HH18yT
 47awjW4Ec6PaUtFLRcnhdWt2H0dxTsYbtbtvZhaDFr7VYu/Gc/SOze39F7FAXgjEYO
 kLwJvIlfCfaTA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2J1p6xBTz4x8f;
 Wed, 21 May 2025 14:13:18 +1000 (AEST)
Date: Wed, 21 May 2025 14:13:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Francois Dugast <francois.dugast@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20250521141318.59a76e45@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SP7c+4K614WChixKf9IiO7b";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/SP7c+4K614WChixKf9IiO7b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_svm.c

between commit:

  794f5493f518 ("drm/xe: Strict migration policy for atomic SVM faults")

from Linus' tree and commit:

  80bcbdfc8cf5 ("drm/xe/svm: Add stats for SVM page faults")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/xe_svm.c
index 975094c1a582,d25f02c8d7fc..000000000000
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@@ -654,18 -650,12 +659,19 @@@ void xe_svm_fini(struct xe_vm *vm
  }
 =20
  static bool xe_svm_range_is_valid(struct xe_svm_range *range,
 -				  struct xe_tile *tile)
 +				  struct xe_tile *tile,
 +				  bool devmem_only)
  {
 -	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
 +	/*
 +	 * Advisory only check whether the range currently has a valid mapping,
 +	 * READ_ONCE pairs with WRITE_ONCE in xe_pt.c
 +	 */
 +	return ((READ_ONCE(range->tile_present) &
 +		 ~READ_ONCE(range->tile_invalidated)) & BIT(tile->id)) &&
 +		(!devmem_only || xe_svm_range_in_vram(range));
  }
 =20
+ #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
  static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
  {
  	return &tile->mem.vram;
@@@ -727,37 -717,15 +733,45 @@@ unlock
 =20
  	return err;
  }
+ #else
+ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+ 			     struct xe_svm_range *range,
+ 			     const struct drm_gpusvm_ctx *ctx)
+ {
+ 	return -EOPNOTSUPP;
+ }
+ #endif
 =20
 +static bool supports_4K_migration(struct xe_device *xe)
 +{
 +	if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 +		return false;
 +
 +	return true;
 +}
 +
 +static bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range,
 +					       struct xe_vma *vma)
 +{
 +	struct xe_vm *vm =3D range_to_vm(&range->base);
 +	u64 range_size =3D xe_svm_range_size(range);
 +
 +	if (!range->base.flags.migrate_devmem)
 +		return false;
 +
 +	if (xe_svm_range_in_vram(range)) {
 +		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
 +		return false;
 +	}
 +
 +	if (range_size <=3D SZ_64K && !supports_4K_migration(vm->xe)) {
 +		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n=
");
 +		return false;
 +	}
 +
 +	return true;
 +}
 +
  /**
   * xe_svm_handle_pagefault() - SVM handle page fault
   * @vm: The VM.
@@@ -790,7 -754,7 +804,8 @@@ int xe_svm_handle_pagefault(struct xe_v
  	struct drm_gpusvm_range *r;
  	struct drm_exec exec;
  	struct dma_fence *fence;
 +	int migrate_try_count =3D ctx.devmem_only ? 3 : 1;
+ 	struct xe_tile *tile =3D gt_to_tile(gt);
  	ktime_t end =3D 0;
  	int err;
 =20

--Sig_/SP7c+4K614WChixKf9IiO7b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtUt4ACgkQAVBC80lX
0Gyb5wf/VNW+ePzF80Nzg4o+F1jCHbso53TJqAGkv2if8EP4+83G9QpoCIF2yUhk
O3HKUDCfX3auMko2/nxzZ1iH7NoM1whZMxaTe3wRiIkTZnsQDozYKqOuPjZrMN7J
O9GSqFQTerzJaCL6ttG/64oTw8wkn0HawZVU9r5qNQUFCfbIv44AoMnaGgWmYgjj
CWMW39WtAy0jH/v7BqstdMY0pLG39jcLTJWvxzrGKqYVjrb/vzq/IeVEo9Kh0wTt
IF22WgIolB2QNxbAiDRXG0e39ln4AWNDnDDw8xyfI3+ZMb+7LPfTdqlLFXAGRR8G
ZEt9G3FsTtsTycm8NtIDFbFuEU44Rg==
=ubG4
-----END PGP SIGNATURE-----

--Sig_/SP7c+4K614WChixKf9IiO7b--
