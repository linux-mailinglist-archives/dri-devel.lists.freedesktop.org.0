Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10709986DB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 14:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8ABE10E8E1;
	Thu, 10 Oct 2024 12:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lOg8+E/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C526210E8E1;
 Thu, 10 Oct 2024 12:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728565077; x=1760101077;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=T3JPdNWgqvuOuTKAeftYpFlj5uZXKBpVl1V80k/cnn0=;
 b=lOg8+E/6ORm1RvRjh67TBPeeU9Ws7SWr40YC6/TS9R296eLcQ1Eli4EV
 SwY6fdrJQRHHPc9DM4UOySbNisnnkKzwoe92kks9TfLY6bnzvXK6tpYsB
 sbxB3I6ut7JCLFREI6kBxReGy/EAzrJc3T7XVdAKzqyOHjGV1uE6HKXGB
 O0ZtS3cea24zE1c9Jhncq0rmcw6QXEtbanEzHPiQ9xkEPlYjSTzzof5MM
 enR0tN4bpIyveM+c2E5fUAdEiFADipjIl6SiWJkb90Lp8Ct59xqDJt661
 0YNPVMPi2NvDnuWbdcLQVlCSu9UEcYnIpt49eU2kj3EnM3PAdcSbhLuSr w==;
X-CSE-ConnectionGUID: +PNnxozpTbWrBX5HjLb1UQ==
X-CSE-MsgGUID: Dp00lJZvSYiAU1WOMqq+Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31617174"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="31617174"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 05:57:57 -0700
X-CSE-ConnectionGUID: 7jc+Nv4dRmuik6D1op2Ydg==
X-CSE-MsgGUID: BvLH9yeESWelwBLj91QW5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="114049337"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.227])
 ([10.245.244.227])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 05:57:55 -0700
Message-ID: <648981da5fcf3118b10932eabc07b74c99bf53f4.camel@linux.intel.com>
Subject: Re: [PATCH][next] drm/xe/guc: Fix inverted logic on snapshot->copy
 check
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>, Colin Ian King
 <colin.i.king@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Julia Filipchuk
 <julia.filipchuk@intel.com>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 10 Oct 2024 14:57:52 +0200
In-Reply-To: <7feb0520-0cd3-46fc-8b44-a78d1c3a65bf@intel.com>
References: <20241009160510.372195-1-colin.i.king@gmail.com>
 <7feb0520-0cd3-46fc-8b44-a78d1c3a65bf@intel.com>
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

On Wed, 2024-10-09 at 09:32 -0700, John Harrison wrote:
> On 10/9/2024 09:05, Colin Ian King wrote:
> > Currently the check to see if snapshot->copy has been allocated is
> > inverted and ends up dereferencing snapshot->copy when free'ing
> > objects in the array when it is null or not free'ing the objects
> > when snapshot->copy is allocated. Fix this by using the correct
> > non-null pointer check logic.
> >=20
> > Fixes: d8ce1a977226 ("drm/xe/guc: Use a two stage dump for GuC logs
> > and add more info")
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
>=20
> Thanks for the fix.

Pushed to drm-xe-next. Thanks.

/Thomas



>=20
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_guc_log.c | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c
> > b/drivers/gpu/drm/xe/xe_guc_log.c
> > index 93921f04153f..cc70f448d879 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > @@ -122,7 +122,7 @@ void xe_guc_log_snapshot_free(struct
> > xe_guc_log_snapshot *snapshot)
> > =C2=A0=C2=A0	if (!snapshot)
> > =C2=A0=C2=A0		return;
> > =C2=A0=20
> > -	if (!snapshot->copy) {
> > +	if (snapshot->copy) {
> > =C2=A0=C2=A0		for (i =3D 0; i < snapshot->num_chunks; i++)
> > =C2=A0=C2=A0			kfree(snapshot->copy[i]);
> > =C2=A0=C2=A0		kfree(snapshot->copy);
>=20

