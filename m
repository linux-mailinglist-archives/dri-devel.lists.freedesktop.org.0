Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E94889504EA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 14:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AB210E32D;
	Tue, 13 Aug 2024 12:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MKpgsM2K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D62B10E32C;
 Tue, 13 Aug 2024 12:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723552238; x=1755088238;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Bf03kCzunxvLWSpf5AoDKMwIkfakEX5Ko3m/LNWbTWo=;
 b=MKpgsM2KrFWh1kMk/GxB68ih7fxdTNlz6gm0bCtZEwtBW7OSzMc+368D
 B0adR0oQU+W23IGZQLwLqKQSo2a4wnzXEWqFypbi4H/cgY+oA6nEl1jr4
 aD/5CEdyfJ7JjThmq84gmrMKSGfIaB4nokYWeCWqz8VcG4roTrMv+sLxK
 EAC0SG9ki3WC9pn/Z+JxRiXIzES6Cd+PAkjH+Rrpt93VKxIEjXXLvuYvb
 y8OTulhU/hqQ+QVhUxNhRkg3GVZ274lMxQkb9bDEDioEIXaZBGBg6jEka
 6Hlm2h2K7FjvoR2kV3msrkXytc+2yYcDqkTPt+1plp/2QRLapP0zZxPAM A==;
X-CSE-ConnectionGUID: Hpd4OBi+TYe4Bf2K5XT+Rg==
X-CSE-MsgGUID: FZ1zJbvnTpaR7O2Qe4MPTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="39221323"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="39221323"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:30:38 -0700
X-CSE-ConnectionGUID: qtWjaBwERFa10eHsS3v7EQ==
X-CSE-MsgGUID: fPfimmAFQNCwxlU9l7N0XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="63598538"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.169])
 ([10.245.244.169])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:30:35 -0700
Message-ID: <45b355b96bab31ac1c28a24c82d3edabf081ada7.camel@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/msm: clean up fault injection usage
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, akinobu.mita@gmail.com, 
 akpm@linux-foundation.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com,  robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org
Date: Tue, 13 Aug 2024 14:30:32 +0200
In-Reply-To: <20240813121237.2382534-2-jani.nikula@intel.com>
References: <20240813121237.2382534-1-jani.nikula@intel.com>
 <20240813121237.2382534-2-jani.nikula@intel.com>
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

On Tue, 2024-08-13 at 15:12 +0300, Jani Nikula wrote:
> With the proper stubs in place in linux/fault-inject.h, we can remove
> a
> bunch of conditional compilation for CONFIG_FAULT_INJECTION=3Dn.
>=20
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM.
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/msm/msm_debugfs.c | 2 --
> =C2=A0drivers/gpu/drm/msm/msm_drv.c=C2=A0=C2=A0=C2=A0=C2=A0 | 2 --
> =C2=A0drivers/gpu/drm/msm/msm_drv.h=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ----
> =C2=A03 files changed, 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c
> b/drivers/gpu/drm/msm/msm_debugfs.c
> index 4494f6d1c7cb..7ab607252d18 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -357,12 +357,10 @@ void msm_debugfs_init(struct drm_minor *minor)
> =C2=A0	if (priv->kms && priv->kms->funcs->debugfs_init)
> =C2=A0		priv->kms->funcs->debugfs_init(priv->kms, minor);
> =C2=A0
> -#ifdef CONFIG_FAULT_INJECTION
> =C2=A0	fault_create_debugfs_attr("fail_gem_alloc", minor-
> >debugfs_root,
> =C2=A0				=C2=A0 &fail_gem_alloc);
> =C2=A0	fault_create_debugfs_attr("fail_gem_iova", minor-
> >debugfs_root,
> =C2=A0				=C2=A0 &fail_gem_iova);
> -#endif
> =C2=A0}
> =C2=A0#endif
> =C2=A0
> diff --git a/drivers/gpu/drm/msm/msm_drv.c
> b/drivers/gpu/drm/msm/msm_drv.c
> index 9c33f4e3f822..6938410f4fc7 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -58,10 +58,8 @@ static bool modeset =3D true;
> =C2=A0MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=3Don
> (default), 0=3Ddisable)");
> =C2=A0module_param(modeset, bool, 0600);
> =C2=A0
> -#ifdef CONFIG_FAULT_INJECTION
> =C2=A0DECLARE_FAULT_ATTR(fail_gem_alloc);
> =C2=A0DECLARE_FAULT_ATTR(fail_gem_iova);
> -#endif
> =C2=A0
> =C2=A0static int msm_drm_uninit(struct device *dev)
> =C2=A0{
> diff --git a/drivers/gpu/drm/msm/msm_drv.h
> b/drivers/gpu/drm/msm/msm_drv.h
> index be016d7b4ef1..9b953860131b 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -33,12 +33,8 @@
> =C2=A0#include <drm/msm_drm.h>
> =C2=A0#include <drm/drm_gem.h>
> =C2=A0
> -#ifdef CONFIG_FAULT_INJECTION
> =C2=A0extern struct fault_attr fail_gem_alloc;
> =C2=A0extern struct fault_attr fail_gem_iova;
> -#else
> -#=C2=A0 define should_fail(attr, size) 0
> -#endif
> =C2=A0
> =C2=A0struct msm_kms;
> =C2=A0struct msm_gpu;

