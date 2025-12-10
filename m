Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706CACB33CF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 16:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5D410E699;
	Wed, 10 Dec 2025 15:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FBVKl0GQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2549010E262;
 Wed, 10 Dec 2025 15:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765378916;
 bh=FTxDmILWZKByIw//KW3Bb5wdfTrbrKdINwI+mXvEOkQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FBVKl0GQl7AWep2KgvLWrEzvaEScSPb/Z+BosXWvlV34kxq5Z3QASXbLzwZaeiC2S
 C0G9OBI4wTVJYULECARbOheeuAueBNISWxq20jDRxRuhTCH/fULp3df7ea8z5EV2xm
 FwEv1EpU1JhXPqW2lw3KSSQXp/F54DIsiutMZPf7pDztv9gh1dqJjuGA0JSgVk68hQ
 /EbyPZbwaarFPjw4RPYKHKFtchWNqxtZIOgMNJDxT7INzXkLyyPjfqNLNf1tI/DJ6h
 dquwki2xNrax+s4LgR57kAzQgxB/kgao+ReCuhqS9vhtjXZIQaWbg0N4UHAvXDOXuh
 3/nNJDV1hUMTg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FBE517E0F05;
 Wed, 10 Dec 2025 16:01:56 +0100 (CET)
Date: Wed, 10 Dec 2025 16:01:50 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?B?TWlrb8WCYWo=?= Wasiak <mikolaj.wasiak@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Christopher Healy <healych@amazon.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernel@collabora.com, Chaitanya Kumar
 Borah <chaitanya.kumar.borah@intel.com>
Subject: Re: [PATCH] drm/i915: Fix BO alloc flags
Message-ID: <20251210160150.4dc8f146@fedora>
In-Reply-To: <ad82a9af-eb79-47ef-a5d3-662cff3c0ee2@ursulin.net>
References: <20251210110952.691446-1-loic.molinari@collabora.com>
 <ad82a9af-eb79-47ef-a5d3-662cff3c0ee2@ursulin.net>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 10 Dec 2025 15:08:02 +0100
Tvrtko Ursulin <tursulin@ursulin.net> wrote:

> On 10/12/2025 12:09, Lo=C3=AFc Molinari wrote:
> > I915_BO_ALLOC_NOTHP must be added to the I915_BO_ALLOC_FLAGS mask in
> > order to pass GEM_BUG_ON() valid flags checks.
> >
> > Reported-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > Closes: https://lore.kernel.org/intel-gfx/d73adfa8-d61b-46b3-9385-dde53=
d8db8ad@intel.com/
> > Fixes: a8a9a590221c ("drm/i915: Use huge tmpfs mountpoint helpers")
> > Suggested-by: Tvrtko Ursulin <tursulin@ursulin.net>
> > Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_object_types.h | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers=
/gpu/drm/i915/gem/i915_gem_object_types.h
> > index f94409e8ec4c..35d4c7d0c579 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > @@ -363,6 +363,7 @@ struct drm_i915_gem_object {
> >   			     I915_BO_ALLOC_PM_EARLY | \
> >   			     I915_BO_ALLOC_GPU_ONLY | \
> >   			     I915_BO_ALLOC_CCS_AUX | \
> > +			     I915_BO_ALLOC_NOTHP | \
> >   			     I915_BO_PREALLOC)
> >   #define I915_BO_READONLY          BIT(10)
> >   #define I915_TILING_QUIRK_BIT     11 /* unknown swizzling; do not rel=
ease! */ =20
>=20
> Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> It is passing BAT so I think it is fine to go ahead and merge it. Of=20
> course via the same branch where the breakage is ie. drm-misc.

Pushed to drm-misc-next.
