Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E1F998CA3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 18:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C7510E977;
	Thu, 10 Oct 2024 16:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MvAL+uNv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9350010E982
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 16:02:37 +0000 (UTC)
Received: from isaac-ThinkPad-T16-Gen-2.local
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C4775B2;
 Thu, 10 Oct 2024 18:00:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1728576058;
 bh=KhA0gYg5VUfw5DHzzgGl3/r3aURyGAfYLNM0yGYOk5A=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=MvAL+uNv1IXtghhJfCryGO+cueOv6MmfA6O01VG/gM47kFTDppvsmqlIjlTxSN+GD
 I2AE70rbe5szYyjTViGtCf9vM1qnkfmzXujMED0bUPonAahmdAmud57fKIKZ2YHitW
 mIevxDZjatVngZsvg3Zfq4qlYOgUX40pfCRlyN7M=
Message-ID: <20731d987e60f2a8651629a6067ee80748a5ee9b.camel@ideasonboard.com>
Subject: Re: [PATCH] drm: lcdif: Use adjusted_mode .clock instead of
 .crtc_clock
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: Liu Ying <victor.liu@nxp.com>, Marek Vasut <marex@denx.de>, Alexander
 Stein	 <alexander.stein@ew.tq-group.com>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, "Lukas
 F . Hartmann"	 <lukas@mntmn.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer	
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner	
 <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, 	kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, 	kieran.bingham@ideasonboard.com
Date: Thu, 10 Oct 2024 17:02:31 +0100
In-Reply-To: <2ba45defc820d0441cde11b2eabeff16d7400da6.camel@ideasonboard.com>
References: <20240531202813.277109-1-marex@denx.de>
 <1897634.CQOukoFCf9@steina-w>
 <ab2eb32e-a458-4c9b-8324-27ccb00336c5@denx.de>
 <7ae0cd7774f4b3e30cc033a7e543546732dbced0.camel@ideasonboard.com>
 <de285fc0-728f-4ba0-86e0-0069d2cc9a35@denx.de>
 <64e18ceed5279a9346a6a1141f02ead93383bd1e.camel@ideasonboard.com>
 <84f505af-1066-4fcf-84b7-28c152c09b89@denx.de>
 <a7143bd9-a5e0-4afc-98ed-2d4d58171a32@nxp.com>
 <2ba45defc820d0441cde11b2eabeff16d7400da6.camel@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0 (by Flathub.org) 
MIME-Version: 1.0
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

On Thu, 2024-10-10 at 16:54 +0100, Isaac Scott wrote:

To be clear, my reply applies to the patch referenced by [1]

Tested-by: Isaac Scott <isaac.scott@ideasonboard.com>

> On Thu, 2024-10-10 at 13:31 +0800, Liu Ying wrote:
> > On 10/09/2024, Marek Vasut wrote:
> > > On 10/8/24 12:07 PM, Isaac Scott wrote:
> > > > On Mon, 2024-10-07 at 20:06 +0200, Marek Vasut wrote:
> > > > > On 10/7/24 7:01 PM, Isaac Scott wrote:
> > > > > > Hi Marek,
> > > > >=20
> > > > > Hi,
> > > > >=20
> > > > > > On Sat, 2024-07-06 at 02:16 +0200, Marek Vasut wrote:
> > > > > > > On 6/24/24 11:19 AM, Alexander Stein wrote:
> > > > > > > > Am Freitag, 31. Mai 2024, 22:27:21 CEST schrieb Marek
> > > > > > > > Vasut:
> > > > > > > > > In case an upstream bridge modified the required
> > > > > > > > > clock
> > > > > > > > > frequency
> > > > > > > > > in its .atomic_check callback by setting
> > > > > > > > > adjusted_mode.clock
> > > > > > > > > ,
> > > > > > > > > make sure that clock frequency is generated by the
> > > > > > > > > LCDIFv3
> > > > > > > > > block.
> > > > > > > > >=20
> > > > > > > > > This is useful e.g. when LCDIFv3 feeds DSIM which
> > > > > > > > > feeds
> > > > > > > > > TC358767
> > > > > > > > > with (e)DP output, where the TC358767 expects precise
> > > > > > > > > timing
> > > > > > > > > on
> > > > > > > > > its input side, the precise timing must be generated
> > > > > > > > > by
> > > > > > > > > the
> > > > > > > > > LCDIF.
> > > > > > > > >=20
> > > > > > > > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > > > > > >=20
> > > > > > > > With the other rc358767 patches in place, this does the
> > > > > > > > trick.
> > > > > > > > Reviewed-by: Alexander Stein
> > > > > > > > <alexander.stein@ew.tq-group.com>
> > > > > > >=20
> > > > > > > I'll pick this up next week if there is no objection.
> > > > > >=20
> > > > > > Unfortunately, this has caused a regression that is present
> > > > > > in
> > > > > > v6.12-
> > > > > > rc1 on the i.MX8MP PHYTEC Pollux using the
> > > > > > arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-
> > > > > > rdk.dts.
> > > > > > The
> > > > > > display is the edt,etml1010g3dra panel, as per the upstream
> > > > > > dts. We
> > > > > > bisected to this commit, and reverting this change fixed
> > > > > > the
> > > > > > screen.
> > > > > >=20
> > > > > > We then tried to retest this on top of v6.12-rc2, and found
> > > > > > we also
> > > > > > had
> > > > > > to revert commit ff06ea04e4cf3ba2f025024776e83bfbdfa05155
> > > > > > ("clk:
> > > > > > imx:
> > > > > > clk-imx8mp: Allow media_disp pixel clock reconfigure parent
> > > > > > rate")
> > > > > > alongside this. Reverting these two commits makes the
> > > > > > display
> > > > > > work
> > > > > > again at -rc2.
> > > > > >=20
> > > > > > Do you have any suggestions on anything we might be missing
> > > > > > on our
> > > > > > end?
> > > > > > Please let me know if there's anything you'd like me to
> > > > > > test
> > > > > > as I'm
> > > > > > not
> > > > > > sure what the underlying fault was here.
> > > > > I believe what is going on is that the LCDIF cannot configure
> > > > > its
> > > > > upstream clock because something else is already using those
> > > > > clock
> > > > > and
> > > > > it set those clock to a specific frequency. LCDIF is now
> > > > > trying
> > > > > to
> > > > > configure those clock to match the LVDS panel, and it fails,
> > > > > so
> > > > > it
> > > > > tries
> > > > > to set some approximate clock and that is not good enough for
> > > > > the
> > > > > LVDS
> > > > > panel.
> > > > >=20
> > > > > Can you share dump of /sys/kernel/debug/clk/clk_summary on
> > > > > failing
> > > > > and
> > > > > working system ? You might see the difference around the
> > > > > "video"
> > > > > clock.
> > > > >=20
> > > > > (I have seen this behavior before, the fix was usually a
> > > > > matter
> > > > > of
> > > > > moving one of the LCDIFs to another upstream clock like PLL3,
> > > > > so it
> > > > > can
> > > > > pick well matching output clock instead of some horrid
> > > > > approximation
> > > > > which then drives the panel likely out of specification)
> > > >=20
> > > > Hi Marek,
> > > >=20
> > > > Please find attached the clk_summary for v6.12-rc2 before and
> > > > after the
> > > > reversion (the one after the reversion is 6.12-
> > > > rc2_summary_postfix).
> > > Thank you, this helped greatly.
> > >=20
> > > I believe I know why it used to kind-of work for you, but I'm
> > > afraid this used to work by sheer chance and it does not really
> > > work correctly for the panel you use, even if the panel likely
> > > does
> > > show the correct content. But, there is a way to make it work
> > > properly for the panel you use.
> > >=20
> > > First of all, the pixel clock never really matched the panel-
> > > simple.c pixel clock for the edt_etml1010g3dra_timing:
> > >=20
> > > $ grep '\<media_disp2_pix\>' 6.12-rc2_summary_postfix
> > > =C2=A0 media_disp2_pix=C2=A0 1=C2=A0 1=C2=A0 0=C2=A0 74250000 ...
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ^^^^^^^^
> > >=20
> > > $ grep -A 1 edt_etml1010g3dra_timing drivers/gpu/drm/panel/panel-
> > > simple.c
> > > static const struct display_timing edt_etml1010g3dra_timing =3D {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pixelclock =3D { 66300000=
, 72400000, 78900000 },
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^
> > >=20
> > > The pixel clock are within tolerance, but there is a discrepancy
> > > 74250000 !=3D 72400000 .
> > >=20
> > > Since commit 94e6197dadc9 ("arm64: dts: imx8mp: Add LCDIF2 & LDB
> > > nodes") the IMX8MP_VIDEO_PLL1_OUT is set to a very specific
> > > frequency of 1039500000 Hz, which tidily divides by 2 to
> > > 519750000
> > > Hz (which is your LVDS serializer frequency) and divides by 7 to
> > > 74250000 Hz which is your LCDIF pixel clock.
> > >=20
> > > This Video PLL1 configuration since moved to &media_blk_ctrl {} ,
> > > but it is still in the imx8mp.dtsi . Therefore, to make your
> > > panel
> > > work at the correct desired pixel clock frequency instead of some
> > > random one inherited from imx8mp.dtsi, add the following to the
> > > pollux DT, I believe that will fix the problem and is the correct
> > > fix:
> > >=20
> > > &media_blk_ctrl {
> > > =C2=A0=C2=A0 // 506800000 =3D 72400000 * 7 (for single-link LVDS, thi=
s is
> > > enough)
> > > =C2=A0=C2=A0 // there is no need to multiply the clock by * 2
> > > =C2=A0=C2=A0 assigned-clock-rates =3D <500000000>, <200000000>, <0>, =
<0>,
> > > <500000000>, <506800000>;
> >=20
> > This assigns "video_pll1" clock rate to 506.8MHz which is currently
> > not
> > listed in imx_pll1443x_tbl[].
> >=20
> > Does the below patch[1] fix the regression issue? It explicitly
> > sets
> > the clock frequency of the panel timing to 74.25MHz.
> >=20
> > [1]
> > https://patchwork.freedesktop.org/patch/616905/?series=3D139266&rev=3D1
> >=20
> > > };
> > >=20
> > > Can you please test whether this works and the pixel clock are
> > > accurate in /sys/kernel/debug/clk/clk_summary ?
> > >=20
> > > Now ... as for the LVDS serializer clock ... that is more
> > > complicated.
> > >=20
> > > The LCDIF driver does its .atomic_enable first , configures the
> > > pixel clock (and the Video PLL now) and enables the clock. The
> > > LVDS
> > > LDB serializer driver does its .atomic_enable second and cannot
> > > reconfigure the clock anymore, the Video PLL is stuck at /7 rate
> > > set by LCDIF driver and won't budge because the clock are already
> > > enabled. I'm currently trying to figure out if this can be
> > > improved
> > > somehow, but I believe that would be material for next release.
> > >=20
> >=20
>=20
> This patch also fixes the regression!
> Tested-by: Isaac Scott <isaac.scott@ideasonboard.com>

