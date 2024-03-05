Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C93871A59
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 11:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B42F10F47A;
	Tue,  5 Mar 2024 10:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k2zfjYIC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B80610F47A;
 Tue,  5 Mar 2024 10:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709633699; x=1741169699;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:cc:from:subject:to:message-id:date;
 bh=IfD+qDLgLczsyuWim2FnqlLcEdRE5l9kc0iYiLLTlhc=;
 b=k2zfjYICd47N8nbn+ufusDXFyUAPJqTcE4Q2a2G6CSvlx/RnUM7HVaMh
 loOQhxXwjWRUZVMM/51pIOJLUxu9+e3u/PyNHp9ActJSYyRdP3mkx+61L
 /JPDXk2NhFrqkXp/WTYSB0khWfFBZvvcYgwHAqYDQE3ruBAtwb/MF6fex
 rfB9J+Q5rSyUM57vac4VCUGV0xZfFoaCpxtO1mdjmjbCCPClmwgacSu/J
 4AJEPluVrm9drNLO+FIvrzHArZXXKzzJi6FBCuuKYk6f7NoLto/7Kk5I3
 IhHKRXZ6EAenBzK7veuzR7YVgtUDanI40lF2FOjWA0s7lW87U6GKNv++G Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21629492"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="21629492"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 02:14:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9740489"
Received: from unknown (HELO localhost) ([10.245.244.116])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 02:14:53 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240229232859.70058-2-andi.shyti@linux.intel.com>
References: <20240229232859.70058-1-andi.shyti@linux.intel.com>
 <20240229232859.70058-2-andi.shyti@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v3 1/4] drm/i915/gt: Refactor uabi engine class/instance
 list creation
To: Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <170963369058.35653.11240745207600457716@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Tue, 05 Mar 2024 12:14:50 +0200
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

Quoting Andi Shyti (2024-03-01 01:28:56)
> For the upcoming changes we need a cleaner way to build the list
> of uabi engines.
>=20
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_user.c | 29 ++++++++++++---------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/dr=
m/i915/gt/intel_engine_user.c
> index 833987015b8b..cf8f24ad88f6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> @@ -203,7 +203,7 @@ static void engine_rename(struct intel_engine_cs *eng=
ine, const char *name, u16
> =20
>  void intel_engines_driver_register(struct drm_i915_private *i915)
>  {
> -       u16 name_instance, other_instance =3D 0;
> +       u16 class_instance[I915_LAST_UABI_ENGINE_CLASS + 1] =3D { };

Do you mean this to be size I915_LAST_UABI_ENGINE_CLASS + 2? Because ...

<SNIP>

> @@ -222,15 +224,14 @@ void intel_engines_driver_register(struct drm_i915_=
private *i915)
> =20
>                 GEM_BUG_ON(engine->class >=3D ARRAY_SIZE(uabi_classes));
>                 engine->uabi_class =3D uabi_classes[engine->class];
> -               if (engine->uabi_class =3D=3D I915_NO_UABI_CLASS) {
> -                       name_instance =3D other_instance++;
> -               } else {
> -                       GEM_BUG_ON(engine->uabi_class >=3D
> -                                  ARRAY_SIZE(i915->engine_uabi_class_cou=
nt));
> -                       name_instance =3D
> -                               i915->engine_uabi_class_count[engine->uab=
i_class]++;
> -               }
> -               engine->uabi_instance =3D name_instance;
> +
> +               if (engine->uabi_class =3D=3D I915_NO_UABI_CLASS)
> +                       uabi_class =3D I915_LAST_UABI_ENGINE_CLASS + 1;

.. otherwise this ...

> +               else
> +                       uabi_class =3D engine->uabi_class;
> +
> +               GEM_BUG_ON(uabi_class >=3D ARRAY_SIZE(class_instance));

.. will trigger this assertion?

Regards, Joonas
