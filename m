Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6352D8D7E95
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 11:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F027210E130;
	Mon,  3 Jun 2024 09:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="boiaGY5Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333AA10E130
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 09:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717407013; x=1748943013;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=z/4n4juULjoAOzmA15rZ2VK5Lx+KwThw7dk1nomMXlI=;
 b=boiaGY5Yfvv+v1RfC6FNEgdGwroeCvEVrXymZYQZWEJAVnNEu4fw5+O5
 N3dWV54oMFl6VpOU+pApnR3/4dQJcj+lMRWPMnkIyMJN/C6urf+xaYq38
 nmGRemFIE6uQG6ZML8T/PJKOYs5nBjYTEzzrHvkpj6ItMkmXdUcXMZMq/
 mWMyaFuaIXFxT4bklGmPrdPVJhPtD1Io3jtikQdbLyPcPsg+S/CeOk/jP
 Juaazh3jWY/Mlid0bd+VQJ4mkrhEp2RtD+cW6QQDdizFWdyi0tA4hwDkM
 5q/GLD5O9sZzSFXnj1nKPoxX+JHVqk1NS3hswFgv1bsuROgVo+G89/GKr A==;
X-CSE-ConnectionGUID: GEm9Il57Rp6KmtoiH/rtDA==
X-CSE-MsgGUID: 1Ijci4uTRFmN2v87UPygQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="17681566"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="17681566"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 02:30:12 -0700
X-CSE-ConnectionGUID: U55y+ZKySZeMs1NWnWELVg==
X-CSE-MsgGUID: DgT3E/Q1TPuiuaZkVKFRqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="41267477"
Received: from unknown (HELO [10.245.245.174]) ([10.245.245.174])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 02:30:10 -0700
Message-ID: <7ba3ffaa4c05692ecb10b0b3b2f16ab973b05d64.camel@linux.intel.com>
Subject: Re: [PATCH v12 06/10] drm/ttm/tests: Add tests with mock resource
 managers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>, 
 dri-devel@lists.freedesktop.org
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, Amaranath Somalapuram <asomalap@amd.com>
Date: Mon, 03 Jun 2024 11:30:07 +0200
In-Reply-To: <aedb4864-afbc-4261-9618-3489a1755f0d@intel.com>
References: <cover.1715767062.git.karolina.stolarek@intel.com>
 <fc62475ddc5ee32f9be197ee72b146209f31972e.1715767062.git.karolina.stolarek@intel.com>
 <43d9493358353fc40df56023e474ae827dbfd2ec.camel@linux.intel.com>
 <5be44989-d259-4ede-90db-297046776cb8@intel.com>
 <780eccefb82b08c3e87185d510f8e99ee6a174da.camel@linux.intel.com>
 <aedb4864-afbc-4261-9618-3489a1755f0d@intel.com>
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

On Mon, 2024-06-03 at 10:28 +0200, Karolina Stolarek wrote:
> > > > > diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> > > > > b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> > > > > index 2f590bae53f8..2a2585b37118 100644
> > > > > --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> > > > > +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> > > > > @@ -27,8 +27,42 @@ static int mock_move(struct
> > > > > ttm_buffer_object
> > > > > *bo,
> > > > > bool evict,
> > > > > =C2=A0=C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource =
*new_mem,
> > > > > =C2=A0=C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_place *ho=
p)
> > > > > =C2=A0=C2=A0=C2=A0{
> (...)
> > > > > +
> > > > > +		if (ret)
> > > > > +			return ret;
> > > > > +
> > > > > +		ttm_resource_free(bo, &bo->resource);
> > > > > +		ttm_bo_assign_mem(bo, new_mem);
> > > > > +		return 0;
> > > > > +	}
> > > > > +
> > > > > +	return ttm_bo_move_memcpy(bo, ctx, new_mem);
> > > >=20
> > > > Do we hit this move_memcpy()? Since the mock manager doesn't
> > > > actually
> > > > reserve any memory to manager, I'd expect this to run into
> > > > problems?
> > >=20
> > > We do. The mock manager has use_tt=3Dtrue, so on move, we'd use
> > > ttm_kmap_iter_tt_init() for src and dest and copy the pages. I'm
> > > not
> > > sure if that's the right approach, but it enables me to test if
> > > ttm_operation_ctx's bytes_moved is correctly updated.
> >=20
> > Ah, ok. It's probably not a common use-case since with both src and
> > dst
> > having use_tt, IIRC ttm should keep the pages and their content
> > mostly
> > intact across a move. So you would memcpy the source on itself?
> >=20
> > But it would give some coverage of the copy code though.
>=20
> I dug around and it looks like, in the current scenario,=20
> ttm_bo_move_memcpy() is just ttm_bo_move_sync_cleanup()=20
> (ttm_resource_free + ttm_bo_assign_mem). That means I should revisit
> the=20
> definitions of move and mock manager... I'll try to simplify them.
>=20
> Do I understand correctly that we'd prefer to have a mock manager
> with=20
> user_tt=3Dfalse?

Yes, but then you need to allocate a chunk of contigous memory for the
mock manager to manage. And instead of using drm_buddy you'd have to
use drm_mm to manage it, since the ttm_kmap_iter default iterators can
only handle either
a) Contigous memory regions as returned from the drm_mm manager.
b) Fragmented memory regions as returned from the drm_buddy manager,
but in that case, they currently only handle pci io memory.

So I'd suggest to go with the current code and mark as a TODO: to
implement a) above.

/Thomas


>=20
> All the best,
> Karolina
>=20
> >=20
> > /Thomas

