Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBA299E79F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 13:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2959310E023;
	Tue, 15 Oct 2024 11:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="O3McmPWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 48314 seconds by postgrey-1.36 at gabe;
 Tue, 15 Oct 2024 11:55:52 UTC
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA8410E023
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 11:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1728993348; x=1729252548;
 bh=MX/N7vk3bqMF001Ac4h1KzNgTyN6djS5bXMm9aexelM=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=O3McmPWyS5hBkvnkZPJooet9846ckXDmWsVzbbX4vnEaBZ8pQSN3B/8j+Zg9sYhWM
 18EGJ3ABYAyA0h7OWAUSoak+0MMv5E2H4JInXzLEIY14ySVBx/lYHFzujicHML19Pw
 Ua1I0QgzCabgmYFEoNIwNwgCGBiXRPxDoTK2oXJsJyqiRilTZRncohVt9BJ0i4UCx0
 NWxLT0mUSECWRccuxbi1CLoH5+L1fUaIG+jyjLwKDBgxW7phRBR3HYl8Dq2nq6ZDKF
 foaEoU6nQSOzBSG32NZH7myjhsgPxV7Wue3SROIIprgVOhsLBwPMklxGCh4z+c5YUn
 X4GsqK1z0pFag==
Date: Tue, 15 Oct 2024 11:55:44 +0000
To: Andy Yan <andyshrk@163.com>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 Daniel Stone <daniel@fooishbar.org>, Dragan Simic <dsimic@manjaro.org>,
 Diederik de Haas <didi.debian@cknow.org>
Subject: Re:[PATCH v5] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <o_Cyz_ARcHj4zNlovv75MBwslIRhn3YWlscoNrlpLVobh7eWIMEQR5bNv0yhHx2KEx_gbYi_gH-8Y-CdvRZs9lZscz3-lhAbM50GXUdtSKY=@proton.me>
In-Reply-To: <7b45f190.452f.1928e41b746.Coremail.andyshrk@163.com>
References: <20241014222022.571819-4-pZ010001011111@proton.me>
 <7b45f190.452f.1928e41b746.Coremail.andyshrk@163.com>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 50fff9609b798fd072c679443650091882e2bbe2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, October 15th, 2024 at 5:38 AM, Andy Yan <andyshrk@163.com> wrot=
e:

> Hi Piotr,
>=20
> At 2024-10-15 06:30:27, "Piotr Zalewski" pZ010001011111@proton.me wrote:
>=20
> > Add support for gamma LUT in VOP2 driver. The implementation was inspir=
ed
> > by one found in VOP1 driver. Blue and red channels in gamma LUT registe=
r
> > write were swapped with respect to how gamma LUT values are written in
> > VOP1. Gamma LUT port selection was added before the write of new gamma =
LUT
> > table. If the current SoC is RK3588, "seamless" gamma lut update is
> > performed similarly to how it was done in the case of RK3399 in VOP1[1]=
. In
> > seamless update gamma LUT disable before the write isn't necessary,
> > different register is being used to select gamma LUT port[2] and after
> > setting DSP_LUT_EN bit, GAMMA_UPDATE_EN bit is set[3]. Gamma size is se=
t
> > and drm color management is enabled for each video port's CRTC except o=
nes
> > which have no associated device.
> >=20
> > Solution was tested on RK3566 (Pinetab2). When using userspace tools
> > which set eg. constant color temperature no issues were noticed. When
> > using userspace tools which adjust eg. color temperature the slight scr=
een
> > flicker is visible probably because of gamma LUT disable.
> >=20
> > Compare behaviour of eg.:
> > `gammastep -O 3000`
> >=20
> > To eg.:
> > `gammastep -l 53:23 -t 6000:3000`
> >=20
> > In latter case color temperature is slowly adjusted at the beginning wh=
ich
> > causes screen to slighly flicker. Then it adjusts every few seconds whi=
ch
> > also causes slight screen flicker.
> >=20
> > [1] https://lists.infradead.org/pipermail/linux-rockchip/2021-October/0=
28132.html
> > [2] https://lore.kernel.org/linux-rockchip/48249708-8c05-40d2-a5d8-23de=
960c5a77@rock-chips.com/
> > [3] https://github.com/radxa/kernel/blob/linux-6.1-stan-rkr1/drivers/gp=
u/drm/rockchip/rockchip_drm_vop2.c#L3437
> >=20
> > Helped-by: Daniel Stone daniel@fooishbar.org
> > Helped-by: Dragan Simic dsimic@manjaro.org
> > Helped-by: Diederik de Haas didi.debian@cknow.org
> > Helped-by: Andy Yan andy.yan@rock-chips.com
> > Signed-off-by: Piotr Zalewski pZ010001011111@proton.me
> > ---
> >=20
> > Notes:
> > Changes in v5:
> > - Do not trigger full modeset in case seamless gamma lut update
> > isn't possible (eg. rk356x case). It was discovered that with
> > full modeset, userspace tools which adjust color temperature with
> > high frequency cause screen to go black and reduce overall
> > performance. Instead, revert to previous behaviour of lut update
> > happening in atomic_begin or (in case there is a modeset) in
> > atomic_enable. Also, add unrelated to modeset trigger
> > changes/improvements from v4 on top. Improve code readability
> > too.
> >=20
> > Changes in v4:
> > - rework the implementation to better utilize DRM atomic updates[2]
> > - handle the RK3588 case[2][3]
> >=20
> > Changes in v3:
> > - v3 is patch v2 "resend", by mistake the incremental patch was
> > sent in v2
> >=20
> > Changes in v2:
> > - Apply code styling corrections[1]
> > - Move gamma LUT write inside the vop2 lock
> >=20
> > Link to v4: https://lore.kernel.org/linux-rockchip/20240815124306.18928=
2-2-pZ010001011111@proton.me/
> > Link to v3: https://lore.kernel.org/linux-rockchip/TkgKVivuaLFLILPY-n3i=
Zo_8KF-daKdqdu-0_e0HP-5Ar_8DALDeNWog2suwWKjX7eomcbGET0KZe7DlzdhK2YM6CbLbeKe=
FZr-MJzJMtw0=3D@proton.me/
> > Link to v2: https://lore.kernel.org/linux-rockchip/Hk03HDb6wSSHWtEFZHUy=
e06HR0-9YzP5nCHx9A8_kHzWSZawDrU1o1pjEGkCOJFoRg0nTB4BWEv6V0XBOjF4-0Mj44lp2Tr=
jaQfnytzp-Pk=3D@proton.me/T/#u
> > Link to v1: https://lore.kernel.org/linux-rockchip/9736eadf6a9d8e97eef9=
19c6b3d88828@manjaro.org/T/#t
> >=20
> > [1] https://lore.kernel.org/linux-rockchip/d019761504b540600d9fc7a585d6=
f95f@manjaro.org
> > [2] https://lore.kernel.org/linux-rockchip/CAPj87rOM=3Dj0zmuWL9frGKV1xz=
PbJrk=3DQ9ip7F_HAPYnbCqPouw@mail.gmail.com
> > [3] https://lore.kernel.org/linux-rockchip/7d998e4c-e1d3-4e8b-af76-c5bc=
83b43647@rock-chips.com
> >=20
> > drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 161 +++++++++++++++++++
> > drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 5 +
> > 2 files changed, 166 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu=
/drm/rockchip/rockchip_drm_vop2.c
> > index 9873172e3fd3..a6a2d7df5ecc 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > @@ -278,6 +278,15 @@ static u32 vop2_readl(struct vop2 *vop2, u32 offse=
t)
> > return val;
> > }
> >=20
> > +static u32 vop2_vp_read(struct vop2_video_port *vp, u32 offset)
> > +{
> > + u32 val;
> > +
> > + regmap_read(vp->vop2->map, vp->data->offset + offset, &val);
> > +
> > + return val;
> > +}
> > +
> > static void vop2_win_write(const struct vop2_win *win, unsigned int reg=
, u32 v)
> > {
> > regmap_field_write(win->reg[reg], v);
> > @@ -998,6 +1007,55 @@ static void vop2_disable(struct vop2 *vop2)
> > clk_disable_unprepare(vop2->hclk);
> > }
> >=20
> > +static bool vop2_vp_dsp_lut_is_enabled(struct vop2_video_port *vp)
> > +{
> > + return (u32) (vop2_vp_read(vp, RK3568_VP_DSP_CTRL) & RK3568_VP_DSP_CT=
RL__DSP_LUT_EN) >
> > + 0;
> > +}
> > +
> > +static void vop2_vp_dsp_lut_disable(struct vop2_video_port *vp)
> > +{
> > + u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
> > +
> > + dsp_ctrl &=3D ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
> > + vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> > +}
> > +
> > +static bool vop2_vp_dsp_lut_poll_disable(struct vop2_video_port *vp)
> > +{
> > + u32 dsp_ctrl;
> > + int ret =3D readx_poll_timeout(vop2_vp_dsp_lut_is_enabled, vp, dsp_ct=
rl,
> > + !dsp_ctrl, 5, 30 * 1000);
> > + if (ret) {
> > + drm_err(vp->vop2->drm, "display LUT RAM enable timeout!\n");
> > + return false;
> > + }
> > +
> > + return true;
> > +}
> > +
> > +static void vop2_vp_dsp_lut_enable(struct vop2_video_port *vp)
> > +{
> > + u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
> > +
> > + dsp_ctrl |=3D RK3568_VP_DSP_CTRL__DSP_LUT_EN;
> > + vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> > +}
> > +
> > +static void vop2_vp_dsp_lut_update_enable(struct vop2_video_port *vp)
> > +{
> > + u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
> > +
> > + dsp_ctrl |=3D RK3588_VP_DSP_CTRL__GAMMA_UPDATE_EN;
> > + vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> > +}
> > +
> > +static inline bool vop2_supports_seamless_gamma_lut_update(struct vop2=
 *vop2)
> > +{
> > + return (vop2->data->soc_id =3D=3D 3588);
> > +}
> > +
> > +
> > static void vop2_crtc_atomic_disable(struct drm_crtc *crtc,
> > struct drm_atomic_state *state)
> > {
> > @@ -1482,6 +1540,66 @@ static bool vop2_crtc_mode_fixup(struct drm_crtc=
 *crtc,
> > return true;
> > }
> >=20
> > +static void vop2_crtc_write_gamma_lut(struct vop2 *vop2, struct drm_cr=
tc *crtc)
> > +{
> > + const struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
> > + const struct vop2_video_port_data *vp_data =3D &vop2->data->vp[vp->id=
];
> > +
> > + struct drm_color_lut *lut =3D crtc->state->gamma_lut->data;
> > + unsigned int i, bpc =3D ilog2(vp_data->gamma_lut_len);
> > + u32 word;
> > +
> > + for (i =3D 0; i < crtc->gamma_size; i++) {
> > + word =3D (drm_color_lut_extract(lut[i].blue, bpc) << (2 * bpc)) |
> > + (drm_color_lut_extract(lut[i].green, bpc) << bpc) |
> > + drm_color_lut_extract(lut[i].red, bpc);
> > +
> > + writel(word, vop2->lut_regs + i * 4);
> > + }
> > +}
> > +
> > +static void vop2_crtc_atomic_try_set_gamma(struct vop2 *vop2,
>=20
>=20
> Why we need a try in the function name ?

Since there is an if condition which checks for lut regs and color mgmt=20
changed flag directly in the function, 'try' in the function name=20
increases readability by suggesting that.

> > + struct vop2_video_port *vp,
> > + struct drm_crtc *crtc,
> > + struct drm_crtc_state *crtc_state)
> > +{
> > +
> > + if (vop2->lut_regs && crtc_state->color_mgmt_changed) {
> > + if (!crtc_state->gamma_lut) {
> > + vop2_vp_dsp_lut_disable(vp);
> > + return;
> > + }
> > +
> > + if (vop2_supports_seamless_gamma_lut_update(vop2)) {
>=20
> I think it's bettery to check for rk3568/rk3566 here, the newer soc will =
all follow
> rk3588 support seamless gamma lut update.

I will change in the next version.

> > + vop2_writel(vop2, RK3568_LUT_PORT_SEL, FIELD_PREP(
> > + RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL,
> > + vp->id));
> > + vop2_crtc_write_gamma_lut(vop2, crtc);
> > + vop2_vp_dsp_lut_enable(vp);
> > + vop2_vp_dsp_lut_update_enable(vp);
> > + } else {
>=20
>=20
> As for rk3566/68, we should do exclusive check here, because there is onl=
y
> one gamma , only one VP can use it at a time. See my comments in V3:

What do you mean exactly by exclusive check in this case.It's true that
gamma LUT is shared across video ports in rk356x but, if I correctly
understand, this doesn't forbid to reprogram LUT port sel and allow other
VP to use gamma LUT.

> https://patchwork.kernel.org/project/linux-rockchip/patch/TkgKVivuaLFLILP=
Y-n3iZo_8KF-daKdqdu-0_e0HP-5Ar_8DALDeNWog2suwWKjX7eomcbGET0KZe7DlzdhK2YM6Cb=
LbeKeFZr-MJzJMtw0=3D@proton.me/
>=20
> > + vop2_vp_dsp_lut_disable(vp);
> > + vop2_cfg_done(vp);
> > + if (!vop2_vp_dsp_lut_poll_disable(vp))
> > + return;
> > +
> > + vop2_writel(vop2, RK3568_LUT_PORT_SEL, vp->id);
> > + vop2_crtc_write_gamma_lut(vop2, crtc);
> > + vop2_vp_dsp_lut_enable(vp);
> > + }
> > + }
> > +}
> > +
> > +static inline void vop2_crtc_atomic_try_set_gamma_locked(struct vop2 *=
vop2,
> > + struct vop2_video_port *vp,
> > + struct drm_crtc *crtc,
> > + struct drm_crtc_state *crtc_state)
> > +{
> > + vop2_lock(vop2);
> > + vop2_crtc_atomic_try_set_gamma(vop2, vp, crtc, crtc_state);
> > + vop2_unlock(vop2);
> > +}
> > +
> > static void vop2_dither_setup(struct drm_crtc *crtc, u32 *dsp_ctrl)
> > {
> > struct rockchip_crtc_state *vcstate =3D to_rockchip_crtc_state(crtc->st=
ate);
> > @@ -2057,11 +2175,35 @@ static void vop2_crtc_atomic_enable(struct drm_=
crtc *crtc,
> >=20
> > vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> >=20
> > + vop2_crtc_atomic_try_set_gamma(vop2, vp, crtc, crtc_state);
> > +
> > drm_crtc_vblank_on(crtc);
> >=20
> > vop2_unlock(vop2);
> > }
> >=20
> > +static int vop2_crtc_atomic_check_gamma(struct vop2_video_port *vp,
> > + struct drm_crtc *crtc,
> > + struct drm_atomic_state *state,
> > + struct drm_crtc_state *crtc_state)
> > +{
> > + struct vop2 *vop2 =3D vp->vop2;
> > + unsigned int len;
> > +
> > + if (!vp->vop2->lut_regs || !crtc_state->color_mgmt_changed ||
> > + !crtc_state->gamma_lut)
> > + return 0;
> > +
> > + len =3D drm_color_lut_size(crtc_state->gamma_lut);
> > + if (len !=3D crtc->gamma_size) {
> > + drm_dbg(vop2->drm, "Invalid LUT size; got %d, expected %d\n",
> > + len, crtc->gamma_size);
> > + return -EINVAL;
> > + }
> > +
> > + return 0;
> > +}
> > +
> > static int vop2_crtc_atomic_check(struct drm_crtc *crtc,
> > struct drm_atomic_state *state)
> > {
> > @@ -2069,6 +2211,11 @@ static int vop2_crtc_atomic_check(struct drm_crt=
c *crtc,
> > struct drm_plane *plane;
> > int nplanes =3D 0;
> > struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te, crtc);
> > + int ret;
> > +
> > + ret =3D vop2_crtc_atomic_check_gamma(vp, crtc, state, crtc_state);
> > + if (ret)
> > + return ret;
> >=20
> > drm_atomic_crtc_state_for_each_plane(plane, crtc_state)
> > nplanes++;
> > @@ -2456,9 +2603,12 @@ static void vop2_setup_dly_for_windows(struct vo=
p2 *vop2)
> > vop2_writel(vop2, RK3568_SMART_DLY_NUM, sdly);
> > }
> >=20
> > +
> > static void vop2_crtc_atomic_begin(struct drm_crtc *crtc,
> > struct drm_atomic_state *state)
> > {
> > + struct drm_crtc_state *crtc_state =3D
> > + drm_atomic_get_new_crtc_state(state, crtc);
> > struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
> > struct vop2 *vop2 =3D vp->vop2;
> > struct drm_plane *plane;
> > @@ -2482,6 +2632,11 @@ static void vop2_crtc_atomic_begin(struct drm_cr=
tc *crtc,
> > vop2_setup_layer_mixer(vp);
> > vop2_setup_alpha(vp);
> > vop2_setup_dly_for_windows(vop2);
> > +
> > + // NOTE: in case of modeset gamma lut update
> > + // already happened in atomic enable
> > + if (!drm_atomic_crtc_needs_modeset(crtc_state))
> > + vop2_crtc_atomic_try_set_gamma_locked(vop2, vp, crtc, crtc_state);
>=20
>=20
> I would like update gamma at crtc_atomic_flush callback like mediateck, t=
idss, ast, and
> we also following these in our bsp code.

I will move it to atomic_flush in the next version.

> > }
> >=20
> > static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
> > @@ -2790,7 +2945,13 @@ static int vop2_create_crtcs(struct vop2 *vop2)
> > }
> >=20
> > drm_crtc_helper_add(&vp->crtc, &vop2_crtc_helper_funcs);
> > + if (vop2->lut_regs && vp->crtc.dev !=3D NULL) {
> > + const struct vop2_video_port_data *vp_data =3D &vop2_data->vp[vp->id]=
;
> >=20
> > + drm_mode_crtc_set_gamma_size(&vp->crtc, vp_data->gamma_lut_len);
> > + drm_crtc_enable_color_mgmt(&vp->crtc, 0, false,
> > + vp_data->gamma_lut_len);
>=20
>=20
> It seems that we can keep it in one line, the default limit of linux kern=
el coding style is 100 characters now.

Thanks. I didn't know, I will amend it.

> > + }
> > init_completion(&vp->dsp_hold_completion);
> > }
> >=20
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu=
/drm/rockchip/rockchip_drm_vop2.h
> > index 615a16196aff..510dda6f9092 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> > @@ -394,6 +394,7 @@ enum dst_factor_mode {
> > #define RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN BIT(15)
> >=20
> > #define RK3568_VP_DSP_CTRL__STANDBY BIT(31)
> > +#define RK3568_VP_DSP_CTRL__DSP_LUT_EN BIT(28)
> > #define RK3568_VP_DSP_CTRL__DITHER_DOWN_MODE BIT(20)
> > #define RK3568_VP_DSP_CTRL__DITHER_DOWN_SEL GENMASK(19, 18)
> > #define RK3568_VP_DSP_CTRL__DITHER_DOWN_EN BIT(17)
> > @@ -408,6 +409,8 @@ enum dst_factor_mode {
> > #define RK3568_VP_DSP_CTRL__CORE_DCLK_DIV BIT(4)
> > #define RK3568_VP_DSP_CTRL__OUT_MODE GENMASK(3, 0)
> >=20
> > +#define RK3588_VP_DSP_CTRL__GAMMA_UPDATE_EN BIT(22)
> > +
> > #define RK3588_VP_CLK_CTRL__DCLK_OUT_DIV GENMASK(3, 2)
> > #define RK3588_VP_CLK_CTRL__DCLK_CORE_DIV GENMASK(1, 0)
> >=20
> > @@ -460,6 +463,8 @@ enum dst_factor_mode {
> > #define RK3588_DSP_IF_POL__DP1_PIN_POL GENMASK(14, 12)
> > #define RK3588_DSP_IF_POL__DP0_PIN_POL GENMASK(10, 8)
> >=20
> > +#define RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL GENMASK(13, 12)
> > +
> > #define RK3568_VP0_MIPI_CTRL__DCLK_DIV2_PHASE_LOCK BIT(5)
> > #define RK3568_VP0_MIPI_CTRL__DCLK_DIV2 BIT(4)
> >=20
> > --
> > 2.47.0
> >=20
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip
