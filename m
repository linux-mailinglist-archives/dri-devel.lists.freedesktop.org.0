Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B2286B21C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 15:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B5410E1C3;
	Wed, 28 Feb 2024 14:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CEAUOYLB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E7A10E070;
 Wed, 28 Feb 2024 14:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709131462; x=1740667462;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=O4qj41hh1oDquOW8ivaqmmdcFbw1gEzJLv5qu0rkrZg=;
 b=CEAUOYLBqrKiGiIB48J5mo0gO//+iBmyAgM44L+GL8/eRAa3a/kXo3oH
 5qj5GupKOi8lyODslLfghF6Vl1G9OdRv3+5Ji5h/tIAaVRF0O6IcPiOqI
 IwbveD68MVJBp8L3++b8aUxZLmp4UWel+GJrEh5dkiSI7cmzT+wEkzCVo
 ajIiFeNnDcM9hGp4rUiCBR7c8s3d7yMa/c0YDZvSxu5DPBKJ/CyykoUeG
 M9y9dsd4uB5bnOcwCpH9CXcOsunkmfi0rIqFJWk9z3osxAbj+582Br4iQ
 7ho0sEaGtneIWYf5i3tCJnBHrUtM+MQXCWhJX+L7Tuqqxqe56b0MAjmKR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7356032"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7356032"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:44:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7662677"
Received: from badunne-mobl1.ger.corp.intel.com (HELO [10.252.3.58])
 ([10.252.3.58])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:44:17 -0800
Message-ID: <cde2ba78716ae4903f9893f018796c79554bb168.camel@linux.intel.com>
Subject: Re: [PATCH] xe: avoid using writeq() on 32-bit
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>,  Oded Gabbay <ogabbay@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, Michal
 Wajdeczko <michal.wajdeczko@intel.com>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 28 Feb 2024 15:44:14 +0100
In-Reply-To: <20240228122746.3091608-1-arnd@kernel.org>
References: <20240228122746.3091608-1-arnd@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Arnd,

On Wed, 2024-02-28 at 13:27 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> 32-bit kernels do not provide a writeq(), failing the build:
>=20
> drivers/gpu/drm/xe/xe_ggtt.c:78:2: error: use of undeclared
> identifier 'writeq'
> =C2=A0=C2=A0 78 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writeq(=
pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
>=20
> Using lo_hi_writeq() instead will write the lower 32 bits to the
> address
> before writing the upper 32 bits to the following word, which is
> likely
> the correct replacement to do on 32-bit targets.
>=20
> Include the linux/io-64-nonatomic-lo-hi.h header to automatically
> pick
> the regular writeq() on 64-bit machines but fall back to
> lo_hi_writeq()
> on 32-bit ones.
>=20
> Fixes: 237412e45390 ("drm/xe: Enable 32bits build")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the patch.
We have a patch already on the list pending review comments that fixes
this.

https://patchwork.freedesktop.org/patch/579781/?series=3D130347&rev=3D1

/Thomas


> ---
> =C2=A0drivers/gpu/drm/xe/xe_ggtt.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c
> b/drivers/gpu/drm/xe/xe_ggtt.c
> index 5d46958e3144..1ffcc63ca86d 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -6,6 +6,7 @@
> =C2=A0#include "xe_ggtt.h"
> =C2=A0
> =C2=A0#include <linux/sizes.h>
> +#include <linux/io-64-nonatomic-lo-hi.h>
> =C2=A0
> =C2=A0#include <drm/drm_managed.h>
> =C2=A0#include <drm/i915_drm.h>

