Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA985154C9B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 21:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C09C6E32E;
	Thu,  6 Feb 2020 20:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDCE6E32E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 20:04:30 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Feb 2020 12:04:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,410,1574150400"; d="scan'208";a="279773914"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 06 Feb 2020 12:04:28 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 06 Feb 2020 22:04:27 +0200
Date: Thu, 6 Feb 2020 22:04:27 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mauro Rossi <issor.oruam@gmail.com>
Subject: Re: [PATCH] drm/edid: fix building error
Message-ID: <20200206200427.GU13686@intel.com>
References: <20200203213113.28183-1-issor.oruam@gmail.com>
 <20200204144116.GR13686@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204144116.GR13686@intel.com>
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

On Tue, Feb 04, 2020 at 04:41:16PM +0200, Ville Syrj=E4l=E4 wrote:
> On Mon, Feb 03, 2020 at 10:31:13PM +0100, Mauro Rossi wrote:
> > Fixes the following building error:
> > =

> > CC [M] =A0drivers/gpu/drm/drm_edid.o
> > ~/pie-x86_kernel/kernel/drivers/gpu/drm/drm_edid.c: In function 'cea_mo=
de_alternate_timings':
> > ~/pie-x86_kernel/kernel/drivers/gpu/drm/drm_edid.c:3275:2: error: call =
to '__compiletime_assert_3282'
> > declared with attribute error: BUILD_BUG_ON failed: cea_mode_for_vic(8)=
->vtotal !=3D 262 || cea_mode_for_vic(9)->vtotal !=3D 262 || cea_mode_for_v=
ic(12)->vtotal !=3D 262 || cea_mode_for_vic(13)->vtotal !=3D 262 || cea_mod=
e_for_vic(23)->vtotal !=3D 312 || cea_mode_for_vic(24)->vtotal !=3D 312 || =
cea_mode_for_vic(27)->vtotal !=3D 312 || cea_mode_for_vic(28)->vtotal !=3D =
312
> > make[4]: *** [~/pie-x86_kernel/kernel/scripts/Makefile.build:265: drive=
rs/gpu/drm/drm_edid.o] Error 1
> > =

> > Fixes: 7befe62 ("drm/edid: Abstract away cea_edid_modes[]")
> > Signed-off-by: Mauro Rossi <issor.oruam@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 99769d6c9f84..805fb004c8eb 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -3211,7 +3211,7 @@ static u8 *drm_find_cea_extension(const struct ed=
id *edid)
> >  	return cea;
> >  }
> >  =

> > -static const struct drm_display_mode *cea_mode_for_vic(u8 vic)
> > +static __always_inline const struct drm_display_mode *cea_mode_for_vic=
(u8 vic)
> =

> Thanks for the fix. I've had another few reports of this fail on ia64
> at least. Hoping to get an answer whether this fixes that one as well.
> If not we need to do something else.

Got word that this fixes ia64 as well -> pushed to drm-misc-next-fixes.
Thanks.

PS. I bumped the Fixes sha1 up to the recommended 12 characters.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
