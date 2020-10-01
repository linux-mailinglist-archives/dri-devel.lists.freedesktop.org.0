Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD022802A7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 17:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EFB6E8B9;
	Thu,  1 Oct 2020 15:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A6A6E8B6;
 Thu,  1 Oct 2020 15:23:58 +0000 (UTC)
IronPort-SDR: ElrEQb7tIw4AuL6gyHk8ruE2bOdY11KmVKk4jbwLslbyBKUlwjFrKlVTEnswpayyCG9aFCmf4y
 mZ/3XjwBudSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="163609403"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="163609403"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 08:23:50 -0700
IronPort-SDR: 2LSkLNxDmCaJokfBHHpYAA+Oftl3Eqw7W8OAHLZXSQhkY4vRLUm+E3C/+tTZMJHMamfgML0LEp
 toHry8oB/K+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="325443848"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 01 Oct 2020 08:23:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 01 Oct 2020 18:23:46 +0300
Date: Thu, 1 Oct 2020 18:23:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Stefan Joosten <stefan@atcomputing.nl>
Subject: Re: [Intel-gfx] [PATCH] Revert "drm/i915: Force state->modeset=true
 when distrust_bios_wm==true"
Message-ID: <20201001152346.GR6112@intel.com>
References: <60a804aa6357eb17daa1729f4bce25e762344e9f.camel@atcomputing.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60a804aa6357eb17daa1729f4bce25e762344e9f.camel@atcomputing.nl>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 30, 2020 at 03:47:06PM +0200, Stefan Joosten wrote:
> The fix of flagging state->modeset whenever distrust_bios_wm is set
> causes a regression when initializing display(s) attached to a Lenovo
> USB-C docking station. The display remains blank until the dock is
> reattached. Revert to bring the behavior of the functional v5.6 stable.
> =

> This reverts commit 0f8839f5f323da04a800e6ced1136e4b1e1689a9.
> =

> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1879442
> Signed-off-by: Stefan Joosten <stefan@atcomputing.nl>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 14 --------------
>  1 file changed, 14 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index b18c5ac2934d..ece1c28278f7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -14942,20 +14942,6 @@ static int intel_atomic_check(struct drm_device =
*dev,
>  	if (ret)
>  		goto fail;
>  =

> -	/*
> -	 * distrust_bios_wm will force a full dbuf recomputation
> -	 * but the hardware state will only get updated accordingly
> -	 * if state->modeset=3D=3Dtrue. Hence distrust_bios_wm=3D=3Dtrue &&
> -	 * state->modeset=3D=3Dfalse is an invalid combination which
> -	 * would cause the hardware and software dbuf state to get
> -	 * out of sync. We must prevent that.
> -	 *
> -	 * FIXME clean up this mess and introduce better
> -	 * state tracking for dbuf.
> -	 */
> -	if (dev_priv->wm.distrust_bios_wm)
> -		any_ms =3D true;
> -

Argh. If only I had managed to land the full dbuf rework and nuke this
mess before it came back to bite us...

This is definitely going to break something else, so not great.

Can you file an upstream bug at
https://gitlab.freedesktop.org/drm/intel/issues/new
and attach dmesgs from booting both good and bad kernels with
drm.debug=3D0x1e passed to the kernel cmdline? Bump log_buf_len=3D
if necessary to capture the full log.


>  	intel_fbc_choose_crtc(dev_priv, state);
>  	ret =3D calc_watermark_data(state);
>  	if (ret)
> -- =

> 2.25.4
> =

> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
