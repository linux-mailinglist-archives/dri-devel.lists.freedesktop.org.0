Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 063D3C5D4A4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 14:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AF810EA70;
	Fri, 14 Nov 2025 13:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lWRSZh28";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9602D10EA6F;
 Fri, 14 Nov 2025 13:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763126217; x=1794662217;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=RzE25d2d9v/fSEKhDggTlj9ePRKiOdKbPr8EKVUlmfU=;
 b=lWRSZh28kbdAhx35m7IzI6O2Yq9HE+5FH2Bck8SSc4IJqSXa3lT1SgPA
 AxkUigOMGFPM1noQlmsurIi2Rerqir9ROGu8OSZyKYjjA+QS7yu9o6o36
 kfKUOOqjTOsXTeaPxYkxTggWfle+3u71wZ9H5SaqeDL50ZA9yO+Vl7+WI
 RYXkIAxYDUozE+mdZtVyPiLZLPcta1rR/UNP2hJtnJzlhnmuN1XtD61O0
 MVfbm44rnP4BDQ7s3m0l/YjVIUU4uOTNHPLN/AWDn9FiIIGp7F5Or7GvM
 DHYOYqDXOSKZxo1PrGN0uPq2YUTEMHXB4dQfcxepM0zUYUjnIOUJbrWIg Q==;
X-CSE-ConnectionGUID: 3E+wznmcSzqgF6qmUvEkww==
X-CSE-MsgGUID: xpxBI64OSP+zE47J5qUnAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="82612788"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="82612788"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 05:16:56 -0800
X-CSE-ConnectionGUID: tLpJ9J04REWyET8TY8pkSQ==
X-CSE-MsgGUID: vAIfT8BCT2iy+wMU147Rzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="189620457"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.31])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 05:16:51 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 14 Nov 2025 15:16:48 +0200 (EET)
To: =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
cc: Simon Richter <Simon.Richter@hogyros.de>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
 Bjorn Helgaas <bhelgaas@google.com>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
 =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
 =?ISO-8859-2?Q?Micha=B3_Winiarski?= <michal.winiarski@intel.com>, 
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 08/11] drm/xe: Remove driver side BAR release before
 resize
In-Reply-To: <87ecq0pxos.fsf@draig.linaro.org>
Message-ID: <3dd004b8-6710-e73b-fad9-d7685d2de5cc@linux.intel.com>
References: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
 <20251113162628.5946-9-ilpo.jarvinen@linux.intel.com>
 <87ecq0pxos.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-10488022-1763126168=:1008"
Content-ID: <17787d87-d6d0-c4a6-d47c-0de46448de3d@linux.intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-10488022-1763126168=:1008
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <1f479a4d-2c67-db3b-3dd7-09632eef6845@linux.intel.com>

On Fri, 14 Nov 2025, Alex Benn=E9e wrote:

> Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> writes:
>=20
> > PCI core handles releasing device's resources and their rollback in
> > case of failure of a BAR resizing operation. Releasing resource prior
> > to calling pci_resize_resource() prevents PCI core from restoring the
> > BARs as they were.
> >
> > Remove driver-side release of BARs from the xe driver.
> >
> > Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vram.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.=
c
> > index 00dd027057df..5aacab9358a4 100644
> > --- a/drivers/gpu/drm/xe/xe_vram.c
> > +++ b/drivers/gpu/drm/xe/xe_vram.c
> > @@ -33,9 +33,6 @@ _resize_bar(struct xe_device *xe, int resno, resource=
_size_t size)
> >  =09int bar_size =3D pci_rebar_bytes_to_size(size);
> >  =09int ret;
> > =20
> > -=09if (pci_resource_len(pdev, resno))
> > -=09=09pci_release_resource(pdev, resno);
> > -
> >  =09ret =3D pci_resize_resource(pdev, resno, bar_size, 0);
> >  =09if (ret) {
> >  =09=09drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Conside=
r enabling 'Resizable BAR' support in your BIOS\n",
>=20
> This didn't apply, I assume due to a clash with:
>=20
>   d30203739be79 (drm/xe: Move rebar to be done earlier)

The xe driver changes do not matter if you using only amdgpu.

We know those xe changes in the drm tree conflict as the need for this=20
BAR resizing rework was not know when the xe changes were made. The=20
resolution is just to remove the release_bars() function from xe driver=20
completely as BAR releasing prior to resize is now handled by=20
pci_resize_resource().

--=20
 i.
--8323328-10488022-1763126168=:1008--
