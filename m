Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742CB96A21D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 17:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B30210E584;
	Tue,  3 Sep 2024 15:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JRKmEs6r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AB710E1A5;
 Tue,  3 Sep 2024 15:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725376958; x=1756912958;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3V8+zDEL4f+IoOS5p5kVnCZrn3C2iFsUOwPOCr41bn0=;
 b=JRKmEs6rzCzFwZ0SnkNZK0wbRzmVUqcJp1o2cdaG93Hf15HibHS9s6gO
 OjB+FjTbEt7lxHTtNnIqYznSUkTltaqK+Ss5hHDKU89QkaNMh8HPFDhxE
 dDwnBF8QQe6RSEvzmjc4I40nDQE66RxLN0MUe3q3vNpTAo4rkChuOizvz
 87QzTdrf7vTS2p9ZeUiXWTtf8n6nWPUez+ykYqycYlg2Z8arjcsKK2R+C
 6QlvzIxUMzruHoHqbgJYJczSCgeKxziUOKGUj9iEEgNiU/oZYVxRZKAPg
 0uGb3BeywgwPbZ7KET3di5Lrh9ksQT1lR1mCE9/dnz74HzdVitKBe8gzy w==;
X-CSE-ConnectionGUID: ylEVv0wBTMmG1ym+471wuA==
X-CSE-MsgGUID: eiC9XqONShClAH6dZtd3HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34592908"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="34592908"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 08:22:38 -0700
X-CSE-ConnectionGUID: y16oAKngTKm/qCDsYCtNAg==
X-CSE-MsgGUID: dnfK2h+pQsqnmicgRjDxgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="65164849"
Received: from olympicsflex1.amr.corp.intel.com (HELO [10.245.245.35])
 ([10.245.245.35])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 08:22:36 -0700
Message-ID: <4b47f5829ea3e4a2e55b983775c775a9735f7fc5.camel@linux.intel.com>
Subject: Re: [RFC PATCH] drm/ttm: Forward -ENOSPC to drivers requesting it
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Date: Tue, 03 Sep 2024 17:22:34 +0200
In-Reply-To: <60e8310d-5f8d-41d9-b889-58bc7cbaa395@amd.com>
References: <20240903133849.17119-1-thomas.hellstrom@linux.intel.com>
 <60e8310d-5f8d-41d9-b889-58bc7cbaa395@amd.com>
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

On Tue, 2024-09-03 at 17:14 +0200, Christian K=C3=B6nig wrote:
> Am 03.09.24 um 15:38 schrieb Thomas Hellstr=C3=B6m:
> > Some user-space APIs distinguison between graphics memory OOMs and
> > system (host) memory OOMs. To aid UMDs in determining the type of
> > OOM, allow forwarding the ENOSPC from resource managers to drivers
> > on calls to ttm_bo_validate().
> >=20
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> Ah yes that was on my TODO list as well.
>=20
> > ---
> > =C2=A0 drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
> > =C2=A0 include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
> > =C2=A0 2 files changed, 4 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > b/drivers/gpu/drm/ttm/ttm_bo.c
> > index dd867b5e744c..d9a320dc8130 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -836,7 +836,7 @@ int ttm_bo_validate(struct ttm_buffer_object
> > *bo,
> > =C2=A0=C2=A0	} while (ret && force_space);
> > =C2=A0=20
> > =C2=A0=C2=A0	/* For backward compatibility with userspace */
> > -	if (ret =3D=3D -ENOSPC)
> > +	if (ret =3D=3D -ENOSPC && !ctx->forward_enospc)
>=20
> Mhm, couldn't we put that into the bdev? I would rather like to keep
> the=20
> UAPI consistent at least per driver.

Yes, we could probably do that, although that means changing
ttm_device_init() in all drivers.

And if doing that, then I think we should coalesce all bool arguments
to a flags argument to make the callers more readable.

What do you think?

/Thomas



>=20
> Christian.
>=20
> > =C2=A0=C2=A0		return -ENOMEM;
> > =C2=A0=20
> > =C2=A0=C2=A0	/*
> > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > index 5804408815be..d3e12318d336 100644
> > --- a/include/drm/ttm/ttm_bo.h
> > +++ b/include/drm/ttm/ttm_bo.h
> > @@ -174,6 +174,8 @@ struct ttm_bo_kmap_obj {
> > =C2=A0=C2=A0 * BOs share the same reservation object.
> > =C2=A0=C2=A0 * @force_alloc: Don't check the memory account during susp=
end or
> > CPU page
> > =C2=A0=C2=A0 * faults. Should only be used by TTM internally.
> > + * @forward_enospc: Don't translate -ENOSPC errors from resource
> > managers to
> > + * -ENOMEM, but forward them to the driver.
> > =C2=A0=C2=A0 * @resv: Reservation object to allow reserved evictions wi=
th.
> > =C2=A0=C2=A0 * @bytes_moved: Statistics on how many bytes have been mov=
ed.
> > =C2=A0=C2=A0 *
> > @@ -185,6 +187,7 @@ struct ttm_operation_ctx {
> > =C2=A0=C2=A0	bool no_wait_gpu;
> > =C2=A0=C2=A0	bool gfp_retry_mayfail;
> > =C2=A0=C2=A0	bool allow_res_evict;
> > +	bool forward_enospc;
> > =C2=A0=C2=A0	bool force_alloc;
> > =C2=A0=C2=A0	struct dma_resv *resv;
> > =C2=A0=C2=A0	uint64_t bytes_moved;
>=20

