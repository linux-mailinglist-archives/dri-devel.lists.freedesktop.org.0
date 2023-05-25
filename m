Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3582710B4B
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 13:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801D610E3E3;
	Thu, 25 May 2023 11:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE8A10E0A3;
 Thu, 25 May 2023 11:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685014958; x=1716550958;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:from:subject:to:cc:message-id:date;
 bh=gkRHbifLp7TATQX6Kfw94u0mPWR9yXdhhLROnMrsPGc=;
 b=MzSRM4vH8xAxNdsI9quwm/zp4eKgy256vW6z/AhfpKTl5ULzOwX+fVss
 MItj3brySG0OkrgLi3N8f6jFGkDJHZdc6vT0T4hNwb+QJLRfZ24sCWpB8
 WziGN7GxsfQhTfAe/rfFogA1QWeEumWiJZ61N4feilNVwxogmHzBQ0m2O
 UJcTyGOc3frh9ePDgGpOA8/l9HCiur4fJOEnw2ddOceQsNd1/q3RYKpfi
 O8/kTds7FH4iVzpo1y32xo+HQvELNgTyppM1F00sO36rOTfd92fBOulMd
 NbplT+w4D52H2lwrqGsFBFHGCS7+jPQWlKpEq7lY+96bl4RPbbIiaggE3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="357089956"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="357089956"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 04:42:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="829004028"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="829004028"
Received: from unknown (HELO localhost) ([10.252.45.101])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 04:42:35 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <168464345246.1509813.13613662359356255520@jljusten-skl>
References: <20230519051103.3404990-1-fei.yang@intel.com>
 <20230519051103.3404990-3-fei.yang@intel.com>
 <168464345246.1509813.13613662359356255520@jljusten-skl>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Extension detection by enumeration vs attempt to use extension (Was:
 Re: [Intel-gfx] [PATCH v10 2/2] drm/i915: Allow user to set cache at BO
 creation)
To: Jordan Justen <jordan.l.justen@intel.com>, fei.yang@intel.com,
 intel-gfx@lists.freedesktop.org
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <168501495283.20532.12866043493846974500@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Thu, 25 May 2023 14:42:32 +0300
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Jordan Justen (2023-05-21 07:30:52)
> On 2023-05-18 22:11:03,  wrote:
> > From: Fei Yang <fei.yang@intel.com>
> >=20
> > To comply with the design that buffer objects shall have immutable
> > cache setting through out their life cycle, {set, get}_caching ioctl's
> > are no longer supported from MTL onward. With that change caching
> > policy can only be set at object creation time. The current code
> > applies a default (platform dependent) cache setting for all objects.
> > However this is not optimal for performance tuning. The patch extends
> > the existing gem_create uAPI to let user set PAT index for the object
> > at creation time.
> > The new extension is platform independent, so UMD's can switch to using
> > this extension for older platforms as well, while {set, get}_caching are
> > still supported on these legacy paltforms for compatibility reason.
> >=20
> > Test igt@gem_create@create_ext_set_pat posted at
> > https://patchwork.freedesktop.org/series/117695/
> >=20
> > Tested with https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/2=
2878
> >=20
> > Signed-off-by: Fei Yang <fei.yang@intel.com>
> > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Acked-by: Jordan Justen <jordan.l.justen@intel.com>
>=20
> Nevertheless, I'm still disappointed my suggestion was so quickly shot
> down.

Sorry to hear that you feel that your suggestion was shot down quickly.
The intent was not to be rude. Attempt was just to make sure we're not
blocking an important patch due to repeat of an orthogonal discussion
which has been discussed to exhaustion in past.

There are pros and cons to both solutions, some of which were recapped
in the thread quickly. We can surely continue the discussion on the
details now that the patch is not blocked.

> I tried to look over our usage Mesa of i915 extensions, and found
> this:
>=20
> I915_GEM_CREATE_EXT_MEMORY_REGIONS:
>=20
>  * If DRM_I915_QUERY_MEMORY_REGIONS is found
>=20
> I915_GEM_CREATE_EXT_PROTECTED_CONTENT:
>=20
>  * Probed via the current "robust" method. Resulted in 8s driver
>    startup delay in some bad scenarios.

I think this is an another orthogonal topic. Just listing the existence
of that extension in the kernel codebase would not really help.

The fact that an uAPI is known at compile time by kernel doesn't mean it
would not be defunctional / disabled / fused out on the specific system.

>  * Will be guarded by I915_PARAM_PXP_STATUS when available in future
>=20
> I915_CONTEXT_CREATE_EXT_SETPARAM (I915_CONTEXT_PARAM_ENGINES):
>=20
>  * If DRM_I915_QUERY_ENGINE_INFO is found
>=20
> I915_GEM_CREATE_EXT_SET_PAT:
>=20
>  * When platform is mtl or newer
>=20
> I think we will continue to try to find workarounds that imply the
> extension's existence,

You're not supposed to just probe for existence of an extension in the
kernel codebase, but also check that the extension works on that system.

So probing for the extension array is just half the work. If the KMD
started to block out extensions from the array dynamically, then we
would be doing that based on adding heuristics that are better added in
the userspace. Ultimately you need to have the error handling for the
initialization added anyway to userspace, so there should not be that
much new code that needs adding.

Regards, Joonas

> but it could be nice to have a generic way to
> find out what extensions the kernel knows about.
>=20
> -Jordan
