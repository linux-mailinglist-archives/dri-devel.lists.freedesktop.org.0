Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0E6178BDA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1545D6EAD1;
	Wed,  4 Mar 2020 07:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F656E115
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 02:16:25 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 86C0F3E89F;
 Wed,  4 Mar 2020 02:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
 s=default; t=1583288185;
 bh=JYnuO9sWqK/7Oj9BU5qWPuV0vBAgKliy8Neugt5FcD4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vKBnQiAeSV0d3u+gEalt17bFRfjVIzCRVK2LSpIf+BZ9wnlVmQNdoq9GM4ggr8An9
 yYc6gJROtbX+aB5xCcNMBLMf5KRW/edTvGzR2gh3+j73s/0GxM4hVERlzVLXqpFZGe
 4eUfNXgadoDQVO5ba/o5fwFHha6Ap9qM0Bq4Iti8=
Date: Tue, 3 Mar 2020 21:16:24 -0500
From: Brian Masney <masneyb@onstation.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 33/33] drm/panel-simple: Fix dotclock for LG ACX467AKM-7
Message-ID: <20200304021624.GA16870@onstation.org>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-34-ville.syrjala@linux.intel.com>
 <db82d02d-c484-2bcd-3c6c-205c8655262b@marek.ca>
 <20200303031335.GA7208@onstation.org>
 <8f47109f-796e-8cd5-d05e-8cdf2d0665ed@marek.ca>
 <836f8308-b648-52ff-aa71-448ff0130931@marek.ca>
 <20200303122643.GA10088@onstation.org>
 <a565b44c-4562-f3da-82dc-e0f47683acb2@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a565b44c-4562-f3da-82dc-e0f47683acb2@marek.ca>
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

On Tue, Mar 03, 2020 at 08:04:05AM -0500, Jonathan Marek wrote:
> What Xorg prints doesn't mean anything. I don't think there will be errors
> in dmesg, you need to run something that does pageflips as fast as possib=
le
> and see that the refresh rate is still 60. (modetest with -v, glmark-drm =
are
> examples)

I assume that you mean modetest from
https://gitlab.freedesktop.org/mesa/drm/tree/master/tests/modetest ?
Here's the modeset connector information:

id   encoder status      name    size (mm)  modes   encoders
32   31      connected   DSI-1   62x110     1       31
  modes:
        index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
  #0 1080x1920 71.71 1080 1082 1084 1086 1920 1922 1924 1926 150000
  flags: ; type: preferred, driver

And the page flip results...

$ modetest -v -s 32:1080x1920
trying to open device 'msm'...done
setting mode 1080x1920-71.71Hz@XR24 on connectors 32, crtc 50
failed to set gamma: Function not implemented
freq: 13.50Hz
freq: 13.51Hz
freq: 13.51Hz

It's the same results with and without Ville's patch.

Here's the beginning of the glmark2 results with the x11-gl flavor:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    glmark2 2017.07
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    OpenGL Information
    GL_VENDOR:     freedreno
    GL_RENDERER:   FD330
    GL_VERSION:    3.1 Mesa 20.0.0-devel
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[build] use-vbo=3Dfalse: FPS: 26 FrameTime: 38.462 ms
[build] use-vbo=3Dtrue: FPS: 26 FrameTime: 38.462 ms
[texture] texture-filter=3Dnearest: FPS: 26 FrameTime: 38.462 ms
[texture] texture-filter=3Dlinear: FPS: 26 FrameTime: 38.462 ms
[texture] texture-filter=3Dmipmap: FPS: 27 FrameTime: 37.037 ms
[shading] shading=3Dgouraud: FPS: 27 FrameTime: 37.037 ms
[shading] shading=3Dblinn-phong-inf: FPS: 27 FrameTime: 37.037 ms
[shading] shading=3Dphong: FPS: 27 FrameTime: 37.037 ms
[shading] shading=3Dcel: FPS: 26 FrameTime: 38.462 ms
[bump] bump-render=3Dhigh-poly: FPS: 27 FrameTime: 37.037 ms
[bump] bump-render=3Dnormals: FPS: 27 FrameTime: 37.037 ms
[bump] bump-render=3Dheight: FPS: 27 FrameTime: 37.037 ms
[effect2d] kernel=3D0,1,0;1,-4,1;0,1,0;: FPS: 25 FrameTime: 40.000 ms
[effect2d] kernel=3D1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 26 FrameTime:
 38.462 ms
[pulsar] light=3Dfalse:quads=3D5:texture=3Dfalse: FPS: 26 FrameTime: 38.462=
 ms
[desktop] blur-radius=3D5:effect=3Dblur:passes=3D1:separable=3Dtrue:windows=
=3D4:
 FPS: 26 FrameTime: 38.462 ms
[desktop] effect=3Dshadow:windows=3D4: FPS: 27 FrameTime: 37.037 ms
...

Brian


> =

> On 3/3/20 7:26 AM, Brian Masney wrote:
> > On Mon, Mar 02, 2020 at 10:36:54PM -0500, Jonathan Marek wrote:
> > > Another thing: did you verify that the panel still runs at 60hz (and =
not
> > > dropping frames to 30hz)? IIRC that was the behavior with lower clock.
> > =

> > Yes, the panel is running at 60 HZ according to the Xorg log with
> > Ville's patch applied:
> > =

> >      modeset(0): Modeline "1080x1920"x60.0  125.50  1080 1082 1084 1086
> >      1920 1922 1924 1926 (115.6 kHz eP)
> > =

> > I verified there's no underflow errors in dmesg.
> > =

> > If I recall correctly, the clock speeds that was in your tree was set
> > too low for the gpu_opp_table (that wouldn't cause this issue), but I
> > seem to recall there were some other clock speed mismatches. The
> > bandwidth requests weren't set on the RPM as well, so maybe that
> > contributed to the problem. That's done upstream with the msm8974
> > interconnect driver:
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/interconnect/qcom/msm8974.c
> > =

> > There's a separate known issue with 'pp done time out' errors that
> > occur on the framebuffer that started upstream several months ago with
> > the introduction of async commit support in the MSM driver. I tried
> > working around this by enabling the autorefresh feature but it's not
> > fully working yet and I hit a dead end since there's no docs available
> > publicly for this. The grim details are at:
> > =

> > https://lore.kernel.org/lkml/20191230020053.26016-2-masneyb@onstation.o=
rg/
> > =

> > So I'm still OK with Ville's patch going in.
> > =

> > Brian
> > =

> > =

> > > =

> > > On 3/2/20 10:28 PM, Jonathan Marek wrote:
> > > > =

> > > > On 3/2/20 10:13 PM, Brian Masney wrote:
> > > > > On Mon, Mar 02, 2020 at 03:48:22PM -0500, Jonathan Marek wrote:
> > > > > > Hi,
> > > > > > =

> > > > > > This is a command mode panel and the the msm/mdp5 driver uses
> > > > > > the vrefresh
> > > > > > field for the actual refresh rate, while the dotclock field is
> > > > > > used for the
> > > > > > DSI clocks. The dotclock needed to be a bit higher than
> > > > > > necessary otherwise
> > > > > > the panel would not work.
> > > > > > =

> > > > > > If you want to get rid of the separate clock/vrefresh fields th=
ere would
> > > > > > need to be some changes to msm driver.
> > > > > > =

> > > > > > (note I hadn't made the patch with upstreaming in mind, the
> > > > > > 150000 value is
> > > > > > likely not optimal, just something that worked, this is somethi=
ng that
> > > > > > should have been checked with the downstream driver)
> > > > > =

> > > > > Is this the right clock frequency in the downstream MSM 3.4 kerne=
l that
> > > > > you're talking about?
> > > > > =

> > > > > https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/arch/arm/=
mach-msm/clock-8974.c#L3326
> > > > > =

> > > > > =

> > > > =

> > > > No, I'm talking about the DSI clock (the driver for it is in
> > > > drm/msm/dsi/). For a command mode panel the front/back porches aren=
't
> > > > relevant, but the dsi pixel/byte clock need to be a bit higher than
> > > > 1920x1080x60. Since 125498 is a little higher than 124416 that migh=
t be
> > > > enough (there is also rounding of the clock values to consider).
> > > > =

> > > > > I don't see any obvious clock values in the downstream command mo=
de
> > > > > panel configuration:
> > > > > =

> > > > > https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/arch/arm/=
boot/dts/msm8974-hammerhead/msm8974-hammerhead-panel.dtsi#L591
> > > > > =

> > > > > =

> > > > > Anyways, I tried Ville's patch with the framebuffer, kmscube, and=
 X11
> > > > > and everything appears to be working fine. You can add my Tested-=
by if
> > > > > you end up applying this.
> > > > > =

> > > > > Tested-by: Brian Masney <masneyb@onstation.org>
> > > > > =

> > > > > Brian
> > > > > =

> > > > > =

> > > > > > On 3/2/20 3:34 PM, Ville Syrjala wrote:
> > > > > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > > > > =

> > > > > > > The currently listed dotclock disagrees with the currently
> > > > > > > listed vrefresh rate. Change the dotclock to match the vrefre=
sh.
> > > > > > > =

> > > > > > > Someone tell me which (if either) of the dotclock or vreresh =
is
> > > > > > > correct?
> > > > > > > =

> > > > > > > Cc: Jonathan Marek <jonathan@marek.ca>
> > > > > > > Cc: Brian Masney <masneyb@onstation.org>
> > > > > > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > > > > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.c=
om>
> > > > > > > ---
> > > > > > >  =A0=A0 drivers/gpu/drm/panel/panel-simple.c | 2 +-
> > > > > > >  =A0=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > =

> > > > > > > diff --git a/drivers/gpu/drm/panel/panel-simple.c
> > > > > > > b/drivers/gpu/drm/panel/panel-simple.c
> > > > > > > index b24fdf239440..f958d8dfd760 100644
> > > > > > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > > > > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > > > > > @@ -3996,7 +3996,7 @@ static const struct panel_desc_dsi
> > > > > > > panasonic_vvx10f004b00 =3D {
> > > > > > >  =A0=A0 };
> > > > > > >  =A0=A0 static const struct drm_display_mode lg_acx467akm_7_m=
ode =3D {
> > > > > > > -=A0=A0=A0 .clock =3D 150000,
> > > > > > > +=A0=A0=A0 .clock =3D 125498,
> > > > > > >  =A0=A0=A0=A0=A0=A0 .hdisplay =3D 1080,
> > > > > > >  =A0=A0=A0=A0=A0=A0 .hsync_start =3D 1080 + 2,
> > > > > > >  =A0=A0=A0=A0=A0=A0 .hsync_end =3D 1080 + 2 + 2,
> > > > > > > =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
