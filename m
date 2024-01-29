Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EC084035C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 12:00:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA29211286D;
	Mon, 29 Jan 2024 11:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322E51127FD;
 Mon, 29 Jan 2024 11:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706526041; x=1738062041;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Z83X2tjOlPB9kC2T18pA5yNyFNX3hzJt+xYcp0zBB9o=;
 b=TmTYipYl4x6pDVqnPNzlN24pHteeopgIcwTaUdfaLCGQ9RZZweoZIhPn
 GoezB42AYOKCrE0+ZFRNDLtAXYMqZxRdy5qrCtLBeYc0uvxJ/8azHWhtc
 fZp9r5veegjoAp02PdcADGDiGtY7V7/G0F2HCysbh0+kEbZdrBzptfPjq
 UrGQEdUVpuAEM4CdXSnBVqHq3goCck73e0DULm9jW2SZdmYlnBmGHcqN6
 YNUtOuoNo3SZQnKxRS92hzWindI5oo0vYmE/uxX0qPm+v9kqyZgSWkqSo
 WBP4RcgZEU0vm6Gy5mELJ7KGNGQT7F+02wqmjapV5p+awmvVnPaK2SUIq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="467181310"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="467181310"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 03:00:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="29478594"
Received: from fvaneerd-mobl1.ger.corp.intel.com (HELO [10.249.254.11])
 ([10.249.254.11])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 03:00:38 -0800
Message-ID: <9e9a3e9788914da0b93b0bda3fb00fc6dd3f4c4e.camel@linux.intel.com>
Subject: Re: Re: Re: [PATCH 3/5] drm/ttm: replace busy placement with flags v6
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Mon, 29 Jan 2024 12:00:35 +0100
In-Reply-To: <gvhkoky553gdmbtllaiyesejzg3xrgmxkoptnk23pev53uacsp@vvm3uh2v5kds>
References: <20240112125158.2748-1-christian.koenig@amd.com>
 <20240112125158.2748-4-christian.koenig@amd.com>
 <0049f12e-ce96-4320-8158-c5a23164261f@linux.intel.com>
 <fe9875a1-1cd5-4b2d-bfbc-9d779e79823a@linux.intel.com>
 <835b15e7-a2c8-4c03-9789-13f78078a024@linux.intel.com>
 <4a2hta7mv3mu4eoobtqtv4kmmdbrlowzbbrwjht73bzb2aoziw@awfcv5vhhnly>
 <gvhkoky553gdmbtllaiyesejzg3xrgmxkoptnk23pev53uacsp@vvm3uh2v5kds>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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
Cc: kherbst@redhat.com, michel.daenzer@mailbox.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2024-01-26 at 16:22 -0600, Lucas De Marchi wrote:
> On Fri, Jan 26, 2024 at 04:16:58PM -0600, Lucas De Marchi wrote:
> > On Thu, Jan 18, 2024 at 05:38:16PM +0100, Thomas Hellstr=C3=B6m wrote:
> > >=20
> > > On 1/17/24 13:27, Thomas Hellstr=C3=B6m wrote:
> > > >=20
> > > > On 1/17/24 11:47, Thomas Hellstr=C3=B6m wrote:
> > > > > Hi, Christian
> > > > >=20
> > > > > Xe changes look good. Will send the series to xe ci to check
> > > > > for=20
> > > > > regressions.
> > > >=20
> > > > Hmm, there are some checkpatch warnings about author / SOB
> > > > email=20
> > > > mismatch,
> > >=20
> > > With those fixed, this patch is
> > >=20
> > > Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >=20
> >=20
> > it actually broke drm-tip now that this is merged:
> >=20
> > ../drivers/gpu/drm/xe/xe_bo.c:41:10: error: =E2=80=98struct ttm_placeme=
nt=E2=80=99
> > has no member named =E2=80=98num_busy_placement=E2=80=99; did you mean
> > =E2=80=98num_placement=E2=80=99
> > =C2=A0 41 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_busy_p=
lacement =3D 1,
> > =C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ^~~~~~~~~~~~~~~~~~
> > =C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 num_placement
> > ../drivers/gpu/drm/xe/xe_bo.c:41:31: error: excess elements in
> > struct initializer [-Werror]
> > =C2=A0 41 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_busy_p=
lacement =3D 1,
> > =C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> >=20
> >=20
> > Apparently a conflict with another patch that got applied a few
> > days
> > ago: a201c6ee37d6 ("drm/xe/bo: Evict VRAM to TT rather than to
> > system")
>=20
> oh, no... apparently that commit is=C2=A0 from a long time ago. The
> problem
> was that drm-misc-next was not yet in sync with drm-next. Thomas, do
> you
> have a fixup for this to put in rerere?
>=20
> Lucas De Marchi

I added this as a manual fixup and ran some quick igt tests.

Seems to work.



