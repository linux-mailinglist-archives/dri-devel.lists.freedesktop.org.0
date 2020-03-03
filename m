Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0323D177119
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277766E9FC;
	Tue,  3 Mar 2020 08:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 516 seconds by postgrey-1.36 at gabe;
 Tue, 03 Mar 2020 03:22:12 UTC
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCD36E968
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 03:22:12 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 04F1D3E914;
 Tue,  3 Mar 2020 03:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
 s=default; t=1583205216;
 bh=YxLgEG32SvLZ5FOCk+grOGoV34kSmiprPCXtmlthnxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GwhJyRKTA49Ep7t2HcTqflU95CsOWVRBYbSuMt8Lew62xWIBynG7XO7AOu9doOru6
 uSNTZiO+ArsIg4tCYO8T9EphvzRZk0cfQtByUKjWGeOsJhcPC9OaSWVTh+QnmsicTX
 TXTMJsDnXwve8lhS+XoYKcRxUkBfuNJ8GRIdmQ28=
Date: Mon, 2 Mar 2020 22:13:35 -0500
From: Brian Masney <masneyb@onstation.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 33/33] drm/panel-simple: Fix dotclock for LG ACX467AKM-7
Message-ID: <20200303031335.GA7208@onstation.org>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-34-ville.syrjala@linux.intel.com>
 <db82d02d-c484-2bcd-3c6c-205c8655262b@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db82d02d-c484-2bcd-3c6c-205c8655262b@marek.ca>
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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

On Mon, Mar 02, 2020 at 03:48:22PM -0500, Jonathan Marek wrote:
> Hi,
> =

> This is a command mode panel and the the msm/mdp5 driver uses the vrefresh
> field for the actual refresh rate, while the dotclock field is used for t=
he
> DSI clocks. The dotclock needed to be a bit higher than necessary otherwi=
se
> the panel would not work.
> =

> If you want to get rid of the separate clock/vrefresh fields there would
> need to be some changes to msm driver.
> =

> (note I hadn't made the patch with upstreaming in mind, the 150000 value =
is
> likely not optimal, just something that worked, this is something that
> should have been checked with the downstream driver)

Is this the right clock frequency in the downstream MSM 3.4 kernel that
you're talking about?

https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/arch/arm/mach-msm/c=
lock-8974.c#L3326

I don't see any obvious clock values in the downstream command mode
panel configuration: =


https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/arch/arm/boot/dts/m=
sm8974-hammerhead/msm8974-hammerhead-panel.dtsi#L591

Anyways, I tried Ville's patch with the framebuffer, kmscube, and X11
and everything appears to be working fine. You can add my Tested-by if
you end up applying this.

Tested-by: Brian Masney <masneyb@onstation.org>

Brian


> On 3/2/20 3:34 PM, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > The currently listed dotclock disagrees with the currently
> > listed vrefresh rate. Change the dotclock to match the vrefresh.
> > =

> > Someone tell me which (if either) of the dotclock or vreresh is
> > correct?
> > =

> > Cc: Jonathan Marek <jonathan@marek.ca>
> > Cc: Brian Masney <masneyb@onstation.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >   drivers/gpu/drm/panel/panel-simple.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/pan=
el/panel-simple.c
> > index b24fdf239440..f958d8dfd760 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -3996,7 +3996,7 @@ static const struct panel_desc_dsi panasonic_vvx1=
0f004b00 =3D {
> >   };
> >   static const struct drm_display_mode lg_acx467akm_7_mode =3D {
> > -	.clock =3D 150000,
> > +	.clock =3D 125498,
> >   	.hdisplay =3D 1080,
> >   	.hsync_start =3D 1080 + 2,
> >   	.hsync_end =3D 1080 + 2 + 2,
> > =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
