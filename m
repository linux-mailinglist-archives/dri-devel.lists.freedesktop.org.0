Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E0286A89D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 07:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DF510E0D4;
	Wed, 28 Feb 2024 06:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="pjSiOcEz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3581F10E0D4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 06:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1709103560; x=1740639560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ikwrsScvsjir7tppFS7Vodgwt8ZO4tWkBRKFYXv4xCM=;
 b=pjSiOcEzdOV44sPXN0x2FG2okmKdpkSdSSl551tw+YdSqG+jwUkUDz99
 3ISbiD5A+hEv/KC0qRrIb1rmZ0dZ/e6r0vNqAfLzLBZzOl3w88NM5yOQA
 mq6h+b8Ipaha2IjIxw5l9mJHNA4/OfkHutG0EtbFEIxmp8brZQooyyaFL
 /B6lvD3n1GkSLokbNzg+dFPQiBDBNyIlWuBqoRBOO5sQ69jgzphFfRlOO
 f3Aa7w37pw1rGLbXgwEFnZkZFcr1mIl99NuPqiX/QM8KwCNILBMuFemBJ
 dA3VTxgrFH2/WAZXIoiCk3OmfABi+6WF6Dknc/bxhuui2oYioMAlE4RYt g==;
X-IronPort-AV: E=Sophos;i="6.06,190,1705359600"; d="scan'208";a="35630903"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 28 Feb 2024 07:59:17 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 04FD6280071;
 Wed, 28 Feb 2024 07:59:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/1] drm/bridge: ti-sn65dsi83: Fix enable error path
Date: Wed, 28 Feb 2024 07:59:17 +0100
Message-ID: <2930550.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240227184144.19729521@booty>
References: <20230504065316.2640739-1-alexander.stein@ew.tq-group.com>
 <1885005.tdWV9SEqCh@steina-w> <20240227184144.19729521@booty>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Hi Luca,

Am Dienstag, 27. Februar 2024, 18:41:44 CET schrieb Luca Ceresoli:
> Hi Alexander,
>=20
> thanks for your feedback!
>=20
> On Tue, 27 Feb 2024 13:05:46 +0100
> Alexander Stein <alexander.stein@ew.tq-group.com> wrote:
>=20
> > Hi Luca,
> >=20
> > Am Donnerstag, 22. Februar 2024, 16:36:37 CET schrieb Luca Ceresoli:
> > > Hello Alexander,
> > >=20
> > > On Thu,  4 May 2023 08:53:16 +0200
> > > Alexander Stein <alexander.stein@ew.tq-group.com> wrote:
> > >  =20
> > > > If PLL locking failed, the regulator needs to be disabled again.
> > > >=20
> > > > Fixes: 5664e3c907e2 ("drm/bridge: ti-sn65dsi83: Add vcc supply regu=
lator support")
> > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > ---
> > > >  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/dr=
m/bridge/ti-sn65dsi83.c
> > > > index 75286c9afbb9..1f5c07989e2b 100644
> > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > @@ -478,6 +478,7 @@ static void sn65dsi83_atomic_enable(struct drm_=
bridge *bridge,
> > > >  		dev_err(ctx->dev, "failed to lock PLL, ret=3D%i\n", ret);
> > > >  		/* On failure, disable PLL again and exit. */
> > > >  		regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
> > > > +		regulator_disable(ctx->vcc);
> > > >  		return;
> > > >  	} =20
> > >=20
> > > I'm reviving this thread as I've been investigating a bug that appears
> > > related to this patch.
> > >=20
> > > Symptom: with a v6.8-rc5 kernel, if PLL fails locking, later on during
> > > atomic disable I get:
> > >=20
> > > [   41.065198] ------------[ cut here ]------------
> > > [   41.069823] unbalanced disables for DOCK_SYS_1V8
> > > [   41.074482] WARNING: CPU: 0 PID: 58 at drivers/regulator/core.c:29=
99 _regulator_disable+0xf8/0x1d8
> > > [   41.083457] Modules linked in: smsc smsc95xx usbnet mii imx_cpufre=
q_dt exc3000 imx8mm_thermal snd_soc_tlv320aic3x_spi snd_soc_tlv320aic3x_i2c=
 snd_soc_tlv320aic3x tmp103 snd_soc_simple_card snd_soc_simple_card_utils f=
sl_ldb rtc_snvs snvs_pwrkey snd_soc_fsl_sai imx8mp_interconnect snd_soc_fsl=
_utils imx_interconnect imx_pcm_dma rtc_rs5c372 ti_sn65dsi83 pwm_imx27 st_p=
ressure_spi st_sensors_spi st_pressure_i2c st_pressure st_sensors_i2c indus=
trialio_triggered_buffer lm75 kfifo_buf st_sensors opt3001 panel_simple etn=
aviv gpu_sched iio_hwmon governor_userspace imx_bus imx8mp_hdmi_tx dw_hdmi =
drm_display_helper samsung_dsim imx_sdma imx_lcdif drm_dma_helper imx8mp_hd=
mi_pvi drm_kms_helper drm drm_panel_orientation_quirks fsl_imx8_ddr_perf ca=
am error sbs_battery pwm_bl backlight ltc2497 ltc2497_core crct10dif_ce
> > > [   41.157281] CPU: 0 PID: 58 Comm: kworker/0:2 Not tainted 6.8.0-rc5=
+ #7
> > > [   41.170339] Workqueue: events drm_mode_rmfb_work_fn [drm]
> > > [   41.175798] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS =
BTYPE=3D--)
> > > [   41.182762] pc : _regulator_disable+0xf8/0x1d8
> > > [   41.187209] lr : _regulator_disable+0xf8/0x1d8
> > > [   41.191654] sp : ffff800081aaba90
> > > [   41.194967] x29: ffff800081aaba90 x28: 0000000000000000 x27: ffff0=
00002647e80
> > > [   41.202109] x26: ffff000002d7a180 x25: ffff0000037858a0 x24: ffff8=
00079748ac8
> > > [   41.209250] x23: ffff000002647ed8 x22: ffff00000263f800 x21: ffff0=
0000373d000
> > > [   41.216392] x20: ffff00000373d000 x19: ffff000001de6480 x18: 00000=
00000000006
> > > [   41.223533] x17: 0000000000000000 x16: 1fffe000003423e1 x15: ffff8=
00081aab520
> > > [   41.230674] x14: 0000000000000000 x13: 3856315f5359535f x12: 4b434=
f4420726f66
> > > [   41.237815] x11: 2073656c62617369 x10: ffff8000814647a0 x9 : ffff8=
000801b10e0
> > > [   41.244957] x8 : ffff8000814bc7a0 x7 : 0000000000017fe8 x6 : ffff8=
000814bc7a0
> > > [   41.252098] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000=
00000000000
> > > [   41.259239] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0=
000011b6600
> > > [   41.266380] Call trace:
> > > [   41.268826]  _regulator_disable+0xf8/0x1d8
> > > [   41.272925]  regulator_disable+0x4c/0x98
> > > [   41.276850]  sn65dsi83_atomic_disable+0x70/0xc0 [ti_sn65dsi83]
> > > [   41.282692]  drm_atomic_bridge_chain_disable+0x78/0x110 [drm]
> > > [   41.288481]  disable_outputs+0x100/0x350 [drm_kms_helper]
> > > [   41.293902]  drm_atomic_helper_commit_tail_rpm+0x2c/0xb0 [drm_kms_=
helper]
> > > [   41.300705]  commit_tail+0xac/0x1a0 [drm_kms_helper]
> > > [   41.305685]  drm_atomic_helper_commit+0x16c/0x188 [drm_kms_helper]
> > > [   41.311881]  drm_atomic_commit+0xac/0xf0 [drm]
> > > [   41.316365]  drm_framebuffer_remove+0x464/0x550 [drm]
> > > [   41.321458]  drm_mode_rmfb_work_fn+0x84/0xb0 [drm]
> > > [   41.326291]  process_one_work+0x148/0x3b8
> > > [   41.330309]  worker_thread+0x32c/0x450
> > > [   41.334061]  kthread+0x11c/0x128
> > > [   41.337292]  ret_from_fork+0x10/0x20
> > > [   41.340873] ---[ end trace 0000000000000000 ]---
> > >=20
> > > The reason is clear from the code flow, which looks like this (after
> > > removing unrelated code):
> > >=20
> > > static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
> > >                                         struct drm_bridge_state *old_=
bridge_state)
> > > {
> > >         regulator_enable(ctx->vcc);
> > >=20
> > >         if (PLL failed locking) {
> > >                 regulator_disable(ctx->vcc);
> > >                 return;
> > >         }
> > > }
> > >=20
> > > static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
> > >                                      struct drm_bridge_state *old_bri=
dge_state)
> > > {
> > >         regulator_disable(ctx->vcc);
> > > }
> > >=20
> > > So when the PLL fails locking, the vcc regulator is disable twice,
> > > leading to "unbalanced disables".
> > >=20
> > > I initially removed the regulator_disable() line in sn65dsi83_atomic_=
pre_enable()
> > > locally and it worked fine. Then I did some git log and found you add=
ed this line on
> > > purpose (even though it was in sn65dsi83_atomic_enable() initially), =
so my question
> > > is whether you can explain exactly what was wrong before your patch. =
I have been
> > > working for a few weeks with the regulator_disable() line removed and=
 found no issue. =20
> >=20
> > Unfortunately I' cant tell the details anymore, but I do remember hitti=
ng
> > some bug regarding failed PLL lock. I do remember having a lock failure
> > from time to time as well.
>=20
> Too bad, and unfortunately the commit message is not providing an
> example. However...
>=20
> > I wont be able to test this bridge at the moment, but you seem to be ri=
ght.
>=20
> ...if you could test it soonish and report back that would be great.
> Otherwise to move forward from the current situation I see two options:
>=20
>  * remove the regulator_disable() in the PLL failure case, de facto
>    reverting commit 8a91b29f1f50 ("drm/bridge: ti-sn65dsi83: Fix enable
>    error path"), and see if any problem happens again
>  * add a flag to take not of whether we enabled the regulator or not,
>    and in sn65dsi83_atomic_disable() call regulator_disable()
>    conditionally based on that
>=20
> The first approach is simpler. It also means that in the window between
> atomic_pre_enable and atomic_disable the regulator would be enabled
> without need. I don't think this is a relevant problem as the video
> output is not working without a PLL, so people will fix that soon I
> guess.
>=20
> The second approach means introducing a little more complexity and we
> are not sure whether it is needed or not.
>=20
> So I have some preference for the first proposal unless there is a
> valid example where the added regulator_disable() is surely needed.
> This is what is running here singe several weeks, and it didn't show
> other issues.

=46eel free to go the first version, my platform still has DSI problems so
there is no board which might break right now.

> > On a general side, IMHO enabling the PLL in atomic_pre_enable is a bit =
late
> > anyway, because you can't bail out if enabling fails.
>=20
> True. However I don't see what we can do about that without changes to
> the DRM core, which would not be quick to do. So in the short term we
> need a fix in this driver.

Indeed, I was just mentioning, no need to address this right now.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


