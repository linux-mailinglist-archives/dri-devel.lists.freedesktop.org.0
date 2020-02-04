Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D573151C6A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 15:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC656EC86;
	Tue,  4 Feb 2020 14:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF006EC86
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 14:41:19 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Feb 2020 06:41:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,402,1574150400"; d="scan'208";a="249362452"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 04 Feb 2020 06:41:17 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 04 Feb 2020 16:41:16 +0200
Date: Tue, 4 Feb 2020 16:41:16 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mauro Rossi <issor.oruam@gmail.com>
Subject: Re: [PATCH] drm/edid: fix building error
Message-ID: <20200204144116.GR13686@intel.com>
References: <20200203213113.28183-1-issor.oruam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200203213113.28183-1-issor.oruam@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 03, 2020 at 10:31:13PM +0100, Mauro Rossi wrote:
> Fixes the following building error:
> =

> CC [M] =A0drivers/gpu/drm/drm_edid.o
> ~/pie-x86_kernel/kernel/drivers/gpu/drm/drm_edid.c: In function 'cea_mode=
_alternate_timings':
> ~/pie-x86_kernel/kernel/drivers/gpu/drm/drm_edid.c:3275:2: error: call to=
 '__compiletime_assert_3282'
> declared with attribute error: BUILD_BUG_ON failed: cea_mode_for_vic(8)->=
vtotal !=3D 262 || cea_mode_for_vic(9)->vtotal !=3D 262 || cea_mode_for_vic=
(12)->vtotal !=3D 262 || cea_mode_for_vic(13)->vtotal !=3D 262 || cea_mode_=
for_vic(23)->vtotal !=3D 312 || cea_mode_for_vic(24)->vtotal !=3D 312 || ce=
a_mode_for_vic(27)->vtotal !=3D 312 || cea_mode_for_vic(28)->vtotal !=3D 312
> make[4]: *** [~/pie-x86_kernel/kernel/scripts/Makefile.build:265: drivers=
/gpu/drm/drm_edid.o] Error 1
> =

> Fixes: 7befe62 ("drm/edid: Abstract away cea_edid_modes[]")
> Signed-off-by: Mauro Rossi <issor.oruam@gmail.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 99769d6c9f84..805fb004c8eb 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3211,7 +3211,7 @@ static u8 *drm_find_cea_extension(const struct edid=
 *edid)
>  	return cea;
>  }
>  =

> -static const struct drm_display_mode *cea_mode_for_vic(u8 vic)
> +static __always_inline const struct drm_display_mode *cea_mode_for_vic(u=
8 vic)

Thanks for the fix. I've had another few reports of this fail on ia64
at least. Hoping to get an answer whether this fixes that one as well.
If not we need to do something else.

>  {
>  	BUILD_BUG_ON(1 + ARRAY_SIZE(edid_cea_modes_1) - 1 !=3D 127);
>  	BUILD_BUG_ON(193 + ARRAY_SIZE(edid_cea_modes_193) - 1 !=3D 219);
> -- =

> 2.20.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
