Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 548949D277D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 14:58:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B7610E64B;
	Tue, 19 Nov 2024 13:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENRO+tIt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567A210E64B;
 Tue, 19 Nov 2024 13:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732024683; x=1763560683;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eJGxFPrJFE9ky8X0fUqCbGk3IETc2/JOKdAFFUkp2Fg=;
 b=ENRO+tItX+te9912BqxGwFnyg/vGH0kEpIyPfQpx2GMMjdYHZb9fGcRY
 eHVnSF0ESe02Lqq26ZOmzDNir1Nrn5q4kLIrnHWDvVD8LK05q5anApZqQ
 tS+/asOYaKCWGEf5wVQzAVQUXWt1yswx/wlCU0q7EPqJxB2pmeojmBpA2
 uPptLZZLF6a2shbR0v80zw3/afHotEXOLhLqflzohV5w90UN/g3E+14od
 xAWuR2lBr5zfOs7hn/fTVQJtnX/9Q1AkkEQamqNl90nUiLGUKynSmmbft
 FnnioGaLYddTsCRImEAwWnynOhhXjRwq+/OdDfKqzwzIyjKtxx/+csGf9 g==;
X-CSE-ConnectionGUID: giN6q99bTYi3ixo92bXLIg==
X-CSE-MsgGUID: UFszo9AbTDi4EtZ+QG3kRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="42538201"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="42538201"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 05:58:03 -0800
X-CSE-ConnectionGUID: elVXTJssQL+2wz9wcoCCrA==
X-CSE-MsgGUID: BbsyZj8KQS6+Lk70xSF7Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="89496798"
Received: from smoticic-mobl.ger.corp.intel.com (HELO [10.245.246.223])
 ([10.245.246.223])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 05:58:00 -0800
Message-ID: <e1a00a4f6ea93f63da3e255d442257c4708105ca.camel@linux.intel.com>
Subject: Re: [PATCH v2 10/29] drm/gpuvm: Add DRM_GPUVA_OP_USER
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Tue, 19 Nov 2024 14:57:56 +0100
In-Reply-To: <20241016032518.539495-11-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-11-matthew.brost@intel.com>
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

On Tue, 2024-10-15 at 20:24 -0700, Matthew Brost wrote:
> Add DRM_GPUVA_OP_USER which allows driver to define their own gpuvm
> ops.
>=20
> Cc: Danilo Krummrich <dakr@redhat.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0include/drm/drm_gpuvm.h | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 00d4e43b76b6..cc3f8ed5113b 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -812,6 +812,11 @@ enum drm_gpuva_op_type {
> =C2=A0	 * @DRM_GPUVA_OP_PREFETCH: the prefetch op type
> =C2=A0	 */
> =C2=A0	DRM_GPUVA_OP_PREFETCH,
> +
> +	/**
> +	 * @DRM_GPUVA_OP_USER: the user defined op type
> +	 */
> +	DRM_GPUVA_OP_USER,

Perhaps _OP_DRIVER, But Danilo might want to chime in.

Otherwise LGTM.
Thanks,
Thomas



> =C2=A0};
> =C2=A0
> =C2=A0/**

