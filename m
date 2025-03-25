Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CDFA6FF38
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 14:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9E610E03A;
	Tue, 25 Mar 2025 13:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCxS9D6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF6110E03A;
 Tue, 25 Mar 2025 13:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742907698; x=1774443698;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=dPD/lTBoHDyO/iIQkGC2f6SMotGir4vCNGWWJlAH2gk=;
 b=bCxS9D6ypMjix65HThTEZKbJxCTeC4AAPK1VoyAGIY8awEdzxfMBazhu
 Nm6YstMoxmoiI8guE0d565cIhxWOaDziB7llcfaIpwfIa5Nuzgs0p2AFd
 LRSovD1NcrbuKhil/DPiV7TCUJkp3DI6OipIuxgj1WMQszgHbOLX73tlI
 uZSoEtCjjlnI80eRamdLR1zSHXhOCYbIHMqyuU0HMxkAVVm4/oqEfwdO4
 hJdkiZs7EoTkGNCM8kwrc5VS7bV3XMalld6JV5gxpp4ytuf8uyMQnhzu4
 cPvhpw8ceL6qYw2m1eKbGzG/wMZD9CLCQ2jh3V2y6e2CGrjCfs3jn9q03 A==;
X-CSE-ConnectionGUID: inicmQF4RG+UUi4k0fb/6g==
X-CSE-MsgGUID: ZHpMFJkyRKunouLpp+WrMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="61543584"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="61543584"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 06:01:38 -0700
X-CSE-ConnectionGUID: TGaUN9YwTn6Lt5h4DPdsJg==
X-CSE-MsgGUID: PsN2bxZDQHS8uOnDc2M8NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="124893231"
Received: from dev-409.igk.intel.com (HELO localhost) ([10.211.128.109])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 06:01:37 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250325120137.1302748-1-andi.shyti@linux.intel.com>
References: <20250325120137.1302748-1-andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gt: Avoid duplicating CCS mode workaround
From: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Arshad Mehmood <arshad.mehmood@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Date: Tue, 25 Mar 2025 13:57:42 +0100
Message-ID: <174290746252.1245393.5239853097693701739@DEV-409>
User-Agent: alot/0.10
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

Quoting Andi Shyti (2025-03-25 13:01:37)
> When generating workarounds for the CCS engine, specifically for
> setting the CCS mode related to compute load balancing, the
> function 'ccs_engine_wa_mode()' is called twice: once for the
> render engine and once for the compute engine.
>=20
> Add a check to ensure the engine class is compute before applying
> the workaround to avoid redundant programming.
>=20
> Suggested-by: Arshad Mehmood <arshad.mehmood@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/dr=
m/i915/gt/intel_workarounds.c
> index 116683ebe074..37251546b755 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2897,7 +2897,9 @@ engine_init_workarounds(struct intel_engine_cs *eng=
ine, struct i915_wa_list *wal
>          */
>         if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE) {
>                 general_render_compute_wa_init(engine, wal);
> -               ccs_engine_wa_mode(engine, wal);
> +
> +               if (engine->class =3D=3D COMPUTE_CLASS)
> +                       ccs_engine_wa_mode(engine, wal);

FIRST_RENDER_COMPUTE is meant to only be on the first engine of either
rcs or ccs (which share certain register domains), one engine.

It looks like that was broken by

	commit 1bfc03b1375244f9029bb448ee8224b3b6dae99f
	Author: Lucas De Marchi <lucas.demarchi@intel.com>
	Date:   Tue Mar 19 23:03:03 2024 -0700

	    drm/i915: Remove special handling for !RCS_MASK()

-Chris
