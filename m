Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39B294D1A4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 15:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2162510E90E;
	Fri,  9 Aug 2024 13:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RrzpVtRE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA4010E90B;
 Fri,  9 Aug 2024 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723211642; x=1754747642;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HKCBa32ax2IqSlbKwZ588yNgdKaXC2+ejCZBHAL8PCY=;
 b=RrzpVtREFomoBXnEU1OF3CrU6v21TK9QspJR1S71rORXkev1K1DUQpv+
 iarVuRyrAqgKUCPXB6IHgCxnMFk2BE9/MyqCiqgtpbP6+horOq3z+0eUT
 apqVWPBkSiKexMSoxUo+ie0hGriINJXSCsdBCUFdRgEPNjiW85C0uHTM5
 wJqhMXR8ASxrkrvCak3qDhtLj0GUPhmCMenfFJUWZMnPOSk7+VBdMTYJb
 NmwPbm3EUradv63Jtch+U7qKZgiedqKX3s5u7XLD1qg+r1ptHkAHF+c0T
 HKb9yD8BBE2/xJfNKAb+ieN7aC0cQx2iCyZDgP0ztxAjHCzdRo7oOgs41 Q==;
X-CSE-ConnectionGUID: ZfKw0E9LQcah/2KT2yHYCg==
X-CSE-MsgGUID: DIowxMJTSN6Ngn/0dc1FUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21359047"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21359047"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 06:54:02 -0700
X-CSE-ConnectionGUID: w1iB9DHYQdmiXJ4/TQn6ZA==
X-CSE-MsgGUID: 9j49b05nSvGqq7hcUmKsrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="62529262"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.245.150])
 ([10.245.245.150])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 06:54:00 -0700
Message-ID: <a1acfa3f9333e6917f7de85706db00e84abda68a.camel@linux.intel.com>
Subject: Re: [PATCH v6 12/12] drm/xe: Increase the XE_PL_TT watermark
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org
Date: Fri, 09 Aug 2024 15:53:57 +0200
In-Reply-To: <ZrQG4l9I1KTZZwwl@DUT025-TGLU.fm.intel.com>
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-13-thomas.hellstrom@linux.intel.com>
 <ZrQG4l9I1KTZZwwl@DUT025-TGLU.fm.intel.com>
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

On Wed, 2024-08-07 at 23:44 +0000, Matthew Brost wrote:
> On Wed, Jul 03, 2024 at 05:38:13PM +0200, Thomas Hellstr=C3=B6m wrote:
> > The XE_PL_TT watermark was set to 50% of system memory.
> > The idea behind that was unclear since the net effect is that
> > TT memory will be evicted to TTM_PL_SYSTEM memory if that
> > watermark is exceeded, requiring PPGTT rebinds and dma
> > remapping. But there is no similar watermark for TTM_PL_SYSTEM
> > memory.
> >=20
> > The TTM functionality that tries to swap out system memory to
> > shmem objects if a 50% limit of total system memory is reached
> > is orthogonal to this, and with the shrinker added, it's no
> > longer in effect.
> >=20
> > Replace the 50% TTM_PL_TT limit with a 100% limit, in effect
> > allowing all graphics memory to be bound to the device unless it
> > has been swapped out by the shrinker.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks for reviewing!
/Thomas


>=20
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 3 +--
> > =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > index 9844a8edbfe1..d38b91872da3 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > @@ -108,9 +108,8 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
> > =C2=A0	u64 gtt_size;
> > =C2=A0
> > =C2=A0	si_meminfo(&si);
> > +	/* Potentially restrict amount of TT memory here. */
> > =C2=A0	gtt_size =3D (u64)si.totalram * si.mem_unit;
> > -	/* TTM limits allocation of all TTM devices by 50% of
> > system memory */
> > -	gtt_size /=3D 2;
> > =C2=A0
> > =C2=A0	man->use_tt =3D true;
> > =C2=A0	man->func =3D &xe_ttm_sys_mgr_func;
> > --=20
> > 2.44.0
> >=20

