Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803F094D1A0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 15:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03BA10E90D;
	Fri,  9 Aug 2024 13:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F8tB2DJ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E49B10E90B;
 Fri,  9 Aug 2024 13:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723211605; x=1754747605;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kgh2BivY9iB3ll5RThBQRNwX78D43TUIUWCpMh/ucfg=;
 b=F8tB2DJ2oQkVrvc93gDZfhgkoAnTDCEpsL8MY/Q5VIRhX7HMyGUqJwtY
 G6MYCYqE1VQhqUgsvuMgWzb+MRqujUyM1jquUHGZNWzk38xUCxBNYFrYf
 KfaES0cJ8U6hjoFHRNew9SvPqqYRnlvG836LzR71zj1iDkGDRMkBmXp5o
 7Dz5NoSbgczgbrzOIjtPZG+DiqCF343PT+B/p3y1l3q22IPexx/o2DABL
 n5P0vE/yyi7hQMliDlTlSaB1C0oDcvXpT0vkASDaOiGhxyYpuK/cb/JA+
 /ONhNpZA9LEIG7SJ+w8CHm/o8wn0uAAK1ncubTt4Hxgecdw3wZUL51KzL Q==;
X-CSE-ConnectionGUID: /VMxL91OQYW6R5Dz6v5aTg==
X-CSE-MsgGUID: aLfLt6GjRrGUEw1fdL6bEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="31960598"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="31960598"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 06:53:25 -0700
X-CSE-ConnectionGUID: ufm7nhzpSMOqTcZXfpiIfQ==
X-CSE-MsgGUID: urJ1854OSTumcp3o8XNj6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="95084082"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.245.150])
 ([10.245.245.150])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 06:53:24 -0700
Message-ID: <283acf5a6a3b99a5f3448edbdc00d7cc2bdda17a.camel@linux.intel.com>
Subject: Re: [PATCH v6 10/12] drm/ttm: Use fault-injection to test error paths
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, dri-devel@lists.freedesktop.org
Date: Fri, 09 Aug 2024 15:53:20 +0200
In-Reply-To: <ZrQGoAzeOsQvH4s2@DUT025-TGLU.fm.intel.com>
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-11-thomas.hellstrom@linux.intel.com>
 <ZrQGoAzeOsQvH4s2@DUT025-TGLU.fm.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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

On Wed, 2024-08-07 at 23:43 +0000, Matthew Brost wrote:
> On Wed, Jul 03, 2024 at 05:38:11PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Use fault-injection to test partial TTM swapout and interrupted
> > swapin.
> > Return -EINTR for swapin to test the callers ability to handle and
> > restart the swapin, and on swapout perform a partial swapout to
> > test that
> > the swapin and release_shrunken functionality.
> >=20
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 10 ++++++++++
> > =C2=A0drivers/gpu/drm/ttm/ttm_pool.c | 17 ++++++++++++++++-
> > =C2=A02 files changed, 26 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index fd0749c0c630..9f27271bfab8 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -272,6 +272,16 @@ config DRM_GPUVM
> > =C2=A0	=C2=A0 GPU-VM representation providing helpers to manage a GPUs
> > virtual
> > =C2=A0	=C2=A0 address space
> > =C2=A0
> > +config DRM_TTM_BACKUP_FAULT_INJECT
> > +	bool "Enable fault injection during TTM backup"
> > +	depends on DRM_TTM
> > +	default n
> > +	help
> > +	=C2=A0 Inject recoverable failures during TTM backup and
> > recovery of
> > +	=C2=A0 backed-up objects. For DRM driver developers only.
> > +
> > +	=C2=A0 If in doubt, choose N.
> > +
> > =C2=A0config DRM_BUDDY
> > =C2=A0	tristate
> > =C2=A0	depends on DRM
> > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
> > b/drivers/gpu/drm/ttm/ttm_pool.c
> > index 38e50cf81b0a..d32a1f2e5e50 100644
> > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > @@ -431,6 +431,7 @@ static int ttm_pool_restore_tt(struct
> > ttm_pool_tt_restore *restore,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_backup *backup=
,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx =
*ctx)
> > =C2=A0{
> > +	static unsigned long __maybe_unused swappedin;
> > =C2=A0	unsigned int i, nr =3D 1 << restore->order;
> > =C2=A0	int ret =3D 0;
> > =C2=A0
> > @@ -446,6 +447,13 @@ static int ttm_pool_restore_tt(struct
> > ttm_pool_tt_restore *restore,
> > =C2=A0			if (handle =3D=3D 0)
> > =C2=A0				continue;
> > =C2=A0
> > +			if
> > (IS_ENABLED(CONFIG_DRM_TTM_BACKUP_FAULT_INJECT) &&
> > +			=C2=A0=C2=A0=C2=A0 ctx->interruptible &&
> > +			=C2=A0=C2=A0=C2=A0 ++swappedin % 100 =3D=3D 0) {
> > +				ret =3D -EINTR;
> > +				break;
> > +			}
>=20
> So here this -EINTR would be kicked to the user IOCTL which triggered
> the BO validate and retry? The restore then should be able to
> successfully pick up where it left off?

Yes, that's the point. For the direct swap-cache backend I initially
used (before concluding that the shmem one actually seemed to work
fine), we had an interruptible wait here.

Supporting interrupts is generally a good thing but for the pool code,
this makes the code considerably more complicated. However, this is a
good way to ensure drivers actually support -EINTR for the call chain.
If not, adding interrupt capability "later" will most likely be a PITA.

>=20
> > +
> > =C2=A0			ret =3D backup->ops->copy_backed_up_page
> > =C2=A0				(backup, restore->first_page[i],
> > =C2=A0				 handle, ctx->interruptible);
> > @@ -892,7 +900,14 @@ long ttm_pool_backup_tt(struct ttm_pool *pool,
> > struct ttm_tt *ttm, bool purge,
> > =C2=A0
> > =C2=A0	alloc_gfp =3D GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN |
> > __GFP_RETRY_MAYFAIL;
> > =C2=A0
> > -	for (i =3D 0; i < ttm->num_pages; ++i) {
> > +	num_pages =3D ttm->num_pages;
> > +
> > +	/* Pretend doing fault injection by shrinking only half of
> > the pages. */
> > +
> > +	if (IS_ENABLED(CONFIG_DRM_TTM_BACKUP_FAULT_INJECT))
> > +		num_pages =3D DIV_ROUND_UP(num_pages, 2);
>=20
> So what happens here? Half the pages swapped out, then upon restore
> half
> swapped back in? The shrinker continues to walk until enough pages
> swapped out?

Yes, exactly. Ideally we'd want some intermediate state here so that a
partially swapped out bo is still eligible for further shrinking.

/Thomas


>=20
> Matt
>=20
> > +
> > +	for (i =3D 0; i < num_pages; ++i) {
> > =C2=A0		page =3D ttm->pages[i];
> > =C2=A0		if (unlikely(!page))
> > =C2=A0			continue;
> > --=20
> > 2.44.0
> >=20

