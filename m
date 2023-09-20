Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F267A8AB7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 19:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8CB10E517;
	Wed, 20 Sep 2023 17:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97AB10E517;
 Wed, 20 Sep 2023 17:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695231605; x=1726767605;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=uDX9/nqSC9pHxD0vJh8X6LLyWdaKxMDcJfC+wR/V9q4=;
 b=NXwfJkHMOaBxNlFDFROK7y3BUbhikqgVtA0gwumWAqXXtiQZjvfuuzCL
 gLcBpgVsOX6GXKOBAHLpO0+FUbRgR7ZKYcM5TSNApfNlC9UB5yzcipl3W
 gPrDeLkXKjZJHvBexg4PtRnZrat7Ke3RPsBmYtVTrm/dbVdf3tpoiPaom
 o1oVCMY+LGFAe6Sjbv0i/lrCW4x1cGgHQXYAPeSetCQgxyVZA+yDU7eQy
 GiNburOrzCPtKxiTPIbNgpn4BuTHFi4OuL/bgnU9YRWufJqQl3T17XeNt
 hh5Qj88jnd9vIMVba4KiMyPqF/kFXEOehhx/v93iEW3NC3AAsHFRo9G5B A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="379178407"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="379178407"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 10:40:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="890021035"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="890021035"
Received: from ptelkov-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.38.103])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 10:39:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/edid: Fixup h/vsync_end instead of
 h/vtotal
In-Reply-To: <20230914112258.27156-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230914112258.27156-1-ville.syrjala@linux.intel.com>
Date: Wed, 20 Sep 2023 20:40:00 +0300
Message-ID: <87jzskrbf3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Sep 2023, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> There are some weird EDIDs floating around that have the sync
> pulse extending beyond the end of the blanking period.
>
> On the currently problemtic machine (HP Omni 120) EDID reports
> the following mode:
> "1600x900": 60 108000 1600 1780 1860 1800 900 910 913 1000 0x40 0x5
> which is then "corrected" to have htotal=3D1861 by the current drm_edid.c
> code.
>
> The fixup code was originally added in commit 7064fef56369 ("drm: work
> around EDIDs with bad htotal/vtotal values"). Googling around we end up in
> https://bugs.launchpad.net/ubuntu/hardy/+source/xserver-xorg-video-intel/=
+bug/297245
> where we find an EDID for a Dell Studio 15, which reports:
> (II) VESA(0): clock: 65.0 MHz   Image Size:  331 x 207 mm
> (II) VESA(0): h_active: 1280  h_sync: 1328  h_sync_end 1360 h_blank_end 1=
337 h_border: 0
> (II) VESA(0): v_active: 800  v_sync: 803  v_sync_end 809 v_blanking: 810 =
v_border: 0
>
> Note that if we use the hblank size (as opposed of the hsync_end)
> from the DTD to determine htotal we get exactly 60Hz refresh rate in
> both cases, whereas using hsync_end to determine htotal we get a
> slightly lower refresh rates. This makes me believe the using the
> hblank size is what was intended even in those cases.
>
> Also note that in case of the HP Onmi 120 the VBIOS boots with these:
>   crtc timings: 108000 1600 1780 1860 1800 900 910 913 1000, type: 0x40 f=
lags: 0x5
> ie. it just blindly stuffs the bogus hsync_end and htotal from the DTD
> into the transcoder timing registers, and the display works. I believe
> the (at least more modern) hardware will automagically terminate the hsync
> pulse when the timing generator reaches htotal, which again points that we
> should use the hblank size to determine htotal. Unfortunatley the old bug
> reports for the Dell machines are extremely lacking in useful details so
> we have no idea what kind of timings the VBIOS programmed into the
> hardware :(
>
> Let's just flip this quirk around and reduce the length of the sync
> pulse instead of extending the blanking period. This at least seems
> to be the correct thing to do on more modern hardware. And if any
> issues crop up on older hardware we need to debug them properly.
>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8895
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 39dd3f694544..0c5563b4d21e 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3497,11 +3497,11 @@ static struct drm_display_mode *drm_mode_detailed=
(struct drm_connector *connecto
>  	mode->vsync_end =3D mode->vsync_start + vsync_pulse_width;
>  	mode->vtotal =3D mode->vdisplay + vblank;
>=20=20
> -	/* Some EDIDs have bogus h/vtotal values */
> +	/* Some EDIDs have bogus h/vsync_end values */
>  	if (mode->hsync_end > mode->htotal)
> -		mode->htotal =3D mode->hsync_end + 1;
> +		mode->hsync_end =3D mode->htotal;
>  	if (mode->vsync_end > mode->vtotal)
> -		mode->vtotal =3D mode->vsync_end + 1;
> +		mode->vsync_end =3D mode->vtotal;

I wonder if we shouldn't debug log these to help our future selves?

Anyway,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>=20=20
>  	drm_mode_do_interlace_quirk(mode, pt);

--=20
Jani Nikula, Intel
