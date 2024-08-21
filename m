Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A847295953B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 09:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C4E10E582;
	Wed, 21 Aug 2024 07:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="faEa5gU3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAE910E45A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 07:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724223738; x=1755759738;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=RD8gV2OSwGHgnTwYIfCdN8q5uQCWcvqLlYZUfDcxERk=;
 b=faEa5gU3dv0zBmN6QK7PplPj0Lqo1hG+X8ARXarrE8kp1Z08MDOG1Oxe
 SIzg7B9+ZBEZRv0Z3IPMTfLrFNK8WXLQczPoNf0VF2NMrzsYyNqsnG/8R
 evs0CmQWMWeWxdr244tipre4opJ8TSffe+QqEYGpzcnCTwcVEspKTOCN2
 mVLUhQ8FqwpW33FkdsVqrl3WJ4aePdsFBTc+4kj4pEsHH5kqlkHjrwyEq
 V/yCxpH2klT+XCSzlsnEPlG0xpXxSX/Md9sC8YpTPrKvm0qzVvbJ5dm3y
 9FjQuaiSf00WNBmitORSMxcCiUlpxdch31gEX0paNQvVpWCSmMAZgQhnN A==;
X-CSE-ConnectionGUID: Fne8bH4zTf+yy19t4rRZNQ==
X-CSE-MsgGUID: qiJ2W6QTRqytrnuI8gpeiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22705984"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22705984"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 00:02:17 -0700
X-CSE-ConnectionGUID: +ityBOU8TumGJXAmhPToHQ==
X-CSE-MsgGUID: GsKmle81R/mnPQzFX26l4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="91778242"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO [10.245.245.182])
 ([10.245.245.182])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 00:02:15 -0700
Message-ID: <dabacdc0d85291a57910d40a4889ef4939ee2c95.camel@linux.intel.com>
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Date: Wed, 21 Aug 2024 09:02:13 +0200
In-Reply-To: <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
References: <20240710124301.1628-1-christian.koenig@amd.com>
 <20240710124301.1628-5-christian.koenig@amd.com>
 <Zo7QpJKtVNw4RvUd@DUT025-TGLU.fm.intel.com>
 <14b70a4d-dc65-4886-940c-ffc1a8197821@gmail.com>
 <77995ffc6de401bc8ed2f4181848dffb18540666.camel@linux.intel.com>
 <20bceb24-8cae-4f0a-897e-326dbf8dc186@amd.com>
 <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
 <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
 <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
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

Hi, Christian,

On Tue, 2024-08-20 at 17:45 +0200, Christian K=C3=B6nig wrote:
> Am 20.08.24 um 12:37 schrieb Thomas Hellstr=C3=B6m:

...

>=20
> > I don't really care wether we do
> > this as an explicit loop or whether we use the LRU walker, but I
> > think
> > from a maintainability point-of-view it is better to keep LRU
> > walking
> > in a single place.
> >=20
> > If we return an unlocked object, we'd need to refcount and drop the
> > lru
> > lock, but maybe that's not a bad thing.
> >=20
> > But what's the main drawback of exporting the existing helper.
>=20
> Well that we re-creates exactly the mid-layer mess I worked so hard
> to=20
> remove from TTM.
>=20
> > > >=20

So could you please answer whether a solution with an iterator and a
loop macro to de-midlayer is an OK solution form your POW, or suggest
an alternative solution that you find acceptable that also allows bo
shrinking with LRU traversal similar to how it's done elsewhere in DRM?

Thanks,
Thomas

