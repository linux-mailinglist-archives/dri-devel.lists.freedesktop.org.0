Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A4E36EE2F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 18:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F466F3CF;
	Thu, 29 Apr 2021 16:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EB16F3D1;
 Thu, 29 Apr 2021 16:31:48 +0000 (UTC)
IronPort-SDR: ItLxkH2xIAw6Cq6nSF3BSMPPwHyYhpALhY/uEyh8LNoq11gAA9cEzTA330jxwLn7LVKnUPYqFH
 7yf4qKf/vByA==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="184179104"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="184179104"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 09:31:47 -0700
IronPort-SDR: 70Jbe94Qy53hIQvxCnrOZ71T6jOREFe1XPQsLjb2pitYYsoXnUik5lazsR+5otf+H3lYxoV8h8
 rSsjleszAyRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="430924338"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 29 Apr 2021 09:31:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 29 Apr 2021 19:31:43 +0300
Date: Thu, 29 Apr 2021 19:31:43 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/overlay: Fix active retire callback alignment
Message-ID: <YIrfb9jvAn/FTt09@intel.com>
References: <20210429083530.849546-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429083530.849546-1-tvrtko.ursulin@linux.intel.com>
X-Patchwork-Hint: comment
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 09:35:29AM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> =

> __i915_active_call annotation is required on the retire callback to ensure
> correct function alignment.
> =

> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: a21ce8ad12d2 ("drm/i915/overlay: Switch to using i915_active track=
ing")
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_overlay.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/d=
rm/i915/display/intel_overlay.c
> index fffbde4256db..428819ba18dd 100644
> --- a/drivers/gpu/drm/i915/display/intel_overlay.c
> +++ b/drivers/gpu/drm/i915/display/intel_overlay.c
> @@ -383,7 +383,7 @@ static void intel_overlay_off_tail(struct intel_overl=
ay *overlay)
>  		i830_overlay_clock_gating(dev_priv, true);
>  }
>  =

> -static void
> +__i915_active_call static void

Am I blind or are we just packing flag bits into a pointer, passing
that to a function, and then immediately unpack the bits again in
said function? Why not just pass the flags explicitly?

Looks like you missed auto_retire()?

>  intel_overlay_last_flip_retire(struct i915_active *active)
>  {
>  	struct intel_overlay *overlay =3D
> -- =

> 2.30.2
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
