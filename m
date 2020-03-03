Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE82178BCE
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108F56EAEC;
	Wed,  4 Mar 2020 07:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31206E875
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 12:26:44 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 7F1A83E8F4;
 Tue,  3 Mar 2020 12:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
 s=default; t=1583238403;
 bh=mtPGmy1L7WcfEjO7BfSeAsKz/xTekY/o/erK8btynjI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XLyhAZd8CO/ZXv+Cr4y1/x9Ar6c3oo77eVlBFaauGixI9bUMDWMOi8xJ8VXMKm5h6
 iMGXrSXFDy+FTJRQ+lqm7PZz+TyerwHbifi9Dty9k3dQOzdKVGK8M+Wd+rITOLwtik
 KL3LuL78Cfdm1lTxwnD4/5ymH6lZw9w4J5nG2xK4=
Date: Tue, 3 Mar 2020 07:26:43 -0500
From: Brian Masney <masneyb@onstation.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 33/33] drm/panel-simple: Fix dotclock for LG ACX467AKM-7
Message-ID: <20200303122643.GA10088@onstation.org>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-34-ville.syrjala@linux.intel.com>
 <db82d02d-c484-2bcd-3c6c-205c8655262b@marek.ca>
 <20200303031335.GA7208@onstation.org>
 <8f47109f-796e-8cd5-d05e-8cdf2d0665ed@marek.ca>
 <836f8308-b648-52ff-aa71-448ff0130931@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <836f8308-b648-52ff-aa71-448ff0130931@marek.ca>
X-Mailman-Approved-At: Wed, 04 Mar 2020 07:47:28 +0000
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

On Mon, Mar 02, 2020 at 10:36:54PM -0500, Jonathan Marek wrote:
> Another thing: did you verify that the panel still runs at 60hz (and not
> dropping frames to 30hz)? IIRC that was the behavior with lower clock.

Yes, the panel is running at 60 HZ according to the Xorg log with
Ville's patch applied:

    modeset(0): Modeline "1080x1920"x60.0  125.50  1080 1082 1084 1086
    1920 1922 1924 1926 (115.6 kHz eP)

I verified there's no underflow errors in dmesg.

If I recall correctly, the clock speeds that was in your tree was set
too low for the gpu_opp_table (that wouldn't cause this issue), but I
seem to recall there were some other clock speed mismatches. The
bandwidth requests weren't set on the RPM as well, so maybe that
contributed to the problem. That's done upstream with the msm8974
interconnect driver:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/interconnect/qcom/msm8974.c

There's a separate known issue with 'pp done time out' errors that
occur on the framebuffer that started upstream several months ago with
the introduction of async commit support in the MSM driver. I tried
working around this by enabling the autorefresh feature but it's not
fully working yet and I hit a dead end since there's no docs available
publicly for this. The grim details are at:

https://lore.kernel.org/lkml/20191230020053.26016-2-masneyb@onstation.org/

So I'm still OK with Ville's patch going in.

Brian


> =

> On 3/2/20 10:28 PM, Jonathan Marek wrote:
> > =

> > On 3/2/20 10:13 PM, Brian Masney wrote:
> > > On Mon, Mar 02, 2020 at 03:48:22PM -0500, Jonathan Marek wrote:
> > > > Hi,
> > > > =

> > > > This is a command mode panel and the the msm/mdp5 driver uses
> > > > the vrefresh
> > > > field for the actual refresh rate, while the dotclock field is
> > > > used for the
> > > > DSI clocks. The dotclock needed to be a bit higher than
> > > > necessary otherwise
> > > > the panel would not work.
> > > > =

> > > > If you want to get rid of the separate clock/vrefresh fields there =
would
> > > > need to be some changes to msm driver.
> > > > =

> > > > (note I hadn't made the patch with upstreaming in mind, the
> > > > 150000 value is
> > > > likely not optimal, just something that worked, this is something t=
hat
> > > > should have been checked with the downstream driver)
> > > =

> > > Is this the right clock frequency in the downstream MSM 3.4 kernel th=
at
> > > you're talking about?
> > > =

> > > https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/arch/arm/mach=
-msm/clock-8974.c#L3326
> > > =

> > > =

> > =

> > No, I'm talking about the DSI clock (the driver for it is in
> > drm/msm/dsi/). For a command mode panel the front/back porches aren't
> > relevant, but the dsi pixel/byte clock need to be a bit higher than
> > 1920x1080x60. Since 125498 is a little higher than 124416 that might be
> > enough (there is also rounding of the clock values to consider).
> > =

> > > I don't see any obvious clock values in the downstream command mode
> > > panel configuration:
> > > =

> > > https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/arch/arm/boot=
/dts/msm8974-hammerhead/msm8974-hammerhead-panel.dtsi#L591
> > > =

> > > =

> > > Anyways, I tried Ville's patch with the framebuffer, kmscube, and X11
> > > and everything appears to be working fine. You can add my Tested-by if
> > > you end up applying this.
> > > =

> > > Tested-by: Brian Masney <masneyb@onstation.org>
> > > =

> > > Brian
> > > =

> > > =

> > > > On 3/2/20 3:34 PM, Ville Syrjala wrote:
> > > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > > =

> > > > > The currently listed dotclock disagrees with the currently
> > > > > listed vrefresh rate. Change the dotclock to match the vrefresh.
> > > > > =

> > > > > Someone tell me which (if either) of the dotclock or vreresh is
> > > > > correct?
> > > > > =

> > > > > Cc: Jonathan Marek <jonathan@marek.ca>
> > > > > Cc: Brian Masney <masneyb@onstation.org>
> > > > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > > ---
> > > > > =A0=A0 drivers/gpu/drm/panel/panel-simple.c | 2 +-
> > > > > =A0=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > =

> > > > > diff --git a/drivers/gpu/drm/panel/panel-simple.c
> > > > > b/drivers/gpu/drm/panel/panel-simple.c
> > > > > index b24fdf239440..f958d8dfd760 100644
> > > > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > > > @@ -3996,7 +3996,7 @@ static const struct panel_desc_dsi
> > > > > panasonic_vvx10f004b00 =3D {
> > > > > =A0=A0 };
> > > > > =A0=A0 static const struct drm_display_mode lg_acx467akm_7_mode =
=3D {
> > > > > -=A0=A0=A0 .clock =3D 150000,
> > > > > +=A0=A0=A0 .clock =3D 125498,
> > > > > =A0=A0=A0=A0=A0=A0 .hdisplay =3D 1080,
> > > > > =A0=A0=A0=A0=A0=A0 .hsync_start =3D 1080 + 2,
> > > > > =A0=A0=A0=A0=A0=A0 .hsync_end =3D 1080 + 2 + 2,
> > > > > =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
