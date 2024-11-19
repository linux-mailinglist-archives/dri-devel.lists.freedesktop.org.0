Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CE79D2B06
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 17:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB90610E683;
	Tue, 19 Nov 2024 16:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DYaNypj1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670E688EFF;
 Tue, 19 Nov 2024 16:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732034070; x=1763570070;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=AMA/7XGjB5qc2pcjMBbnp9KBeA+LEa9Y8nKeiOreQs0=;
 b=DYaNypj1Kacpo0L/Vtyg6GGPs8sTs73dxvclU5iLKXb2xwX2ykuMHV6w
 dgXJXlj4fhqKHi0++PhjQcmAvUBWScd2RnSANZcThwROEUNzmva7kkR0P
 i82YmURrofAuxe9FawG+vBrnpP3Y0O+KNyfcVK6rfV2GfHWTpCMntghfr
 bx1dM9gYB8iP/Eo/sUYrmHUYShhi5J6x7jOno0r4dCLETVmjXbW3C7sBz
 bt7/foROr9LNtiqpax+hJ/vZuqM6BkpWaNX6yuVKmVOHj2X8oZ7sgbBNM
 HKTHcc0G0w0S4LBsXB4WvUbPnFzTjVGWh2FJQqnSxUB6oy8PuhVf6bDmc A==;
X-CSE-ConnectionGUID: 7TUg5jYhTOSgD6oNabns+w==
X-CSE-MsgGUID: txBzQp0hTdysbR3TQACqkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31903640"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="31903640"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 08:34:30 -0800
X-CSE-ConnectionGUID: mtma/IQxRhSZ/6iXQEwxJw==
X-CSE-MsgGUID: nuLReshfTZaWYx+P4+mMNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="120483456"
Received: from smoticic-mobl.ger.corp.intel.com (HELO [10.245.246.223])
 ([10.245.246.223])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 08:34:26 -0800
Message-ID: <d90bf82d1d9ed0220804e064f2604812ed60c738.camel@linux.intel.com>
Subject: Re: [PATCH v2 15/29] drm/xe: Enable system allocator uAPI
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Tue, 19 Nov 2024 17:34:22 +0100
In-Reply-To: <20241016032518.539495-16-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-16-matthew.brost@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-3.fc39) 
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

On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> Support for system allocator bindings in SRAM fully in place, enable
> the
> implementation.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c | 6 ------
> =C2=A01 file changed, 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 158fbb1c3f28..8eed820079ba 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2962,12 +2962,6 @@ static int vm_bind_ioctl_check_args(struct
> xe_device *xe,
> =C2=A0		u16 pat_index =3D (*bind_ops)[i].pat_index;
> =C2=A0		u16 coh_mode;
> =C2=A0
> -		/* FIXME: Disabling system allocator for now */
> -		if (XE_IOCTL_DBG(xe, is_system_allocator)) {
> -			err =3D -EOPNOTSUPP;
> -			goto free_bind_ops;
> -		}
> -
> =C2=A0		if (XE_IOCTL_DBG(xe, pat_index >=3D xe-
> >pat.n_entries)) {
> =C2=A0			err =3D -EINVAL;
> =C2=A0			goto free_bind_ops;

