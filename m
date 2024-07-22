Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE03793B1DA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 15:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E76A10E331;
	Wed, 24 Jul 2024 13:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="kIR6wbCJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44C810E26F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 18:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=6qebepoplzf2flm7zxkjwxsj4m.protonmail; t=1721672803; x=1721932003;
 bh=mOgnAl41sFrWGJo+3xOGusaA3kVBZ9rqK5x4UigzAEk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=kIR6wbCJLVHf7jt4iNCSxtjO+8vene0MBVtxnIo4dW5+ouybskDKzEnhuX0SLeTY9
 mI3cx47uH6yewkhAd89WswvL8mQV6H0z7HpN9lPe4rFG/ixIhBo7LmlGKiXSuJUVMG
 r8A3J0KkKuBS+ZWQfD4eRAFxaYZN8DdkfqKY0Rzt8X9OVDvZoXD1r4J6Me9KpdVGzo
 aas5+02ROVxsC/OC2jQkQ2lYXWrvNyIgVH5YdNPBQgfiBAqHVP4ckc5HrEiHyzmKP4
 PKlGnn11DPD1uMPU/ClFJUQItIjUSvpQGNWQV5b3RYyxhCD++A1QzkoEqxF7Uva5Yk
 FdzU+ZIDSQ9MA==
Date: Mon, 22 Jul 2024 18:26:36 +0000
To: Dragan Simic <dsimic@manjaro.org>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, andy.yan@rock-chips.com, heiko@sntech.de,
 hjc@rock-chips.com
Subject: Re: [PATCH RESEND] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <1j9TaYWvKClDhffohlNyAKGnqXD7fg9eA7FmPunHO__2SxvClWRZp7a1wNMf5Fl4KWGXzZ745LjQOl2Lmu3w0D3sc-1en-cA8vBmvol6OqM=@proton.me>
In-Reply-To: <d019761504b540600d9fc7a585d6f95f@manjaro.org>
References: <ZVMxgcrtgHui9fJpnhbN6TSPhofHbbXElh241lImrzzTUl-8WejGpaR8CPzYhBgoqe_xj7N6En8Ny7Z-gsCr0kaFs7apwjYV1MBJJLmLHxs=@proton.me>
 <d019761504b540600d9fc7a585d6f95f@manjaro.org>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 63ca6cb77cf33c2ffd872d068b37e7c3695f5c2d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 24 Jul 2024 13:42:46 +0000
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

Hello Dragan,=20

Thank you for the comment/review. Your code styling suggestions are
naturally justified. Also, thanks to your comment, I noticed one extra=20
thing. Namely, in my patch, gamma LUT write happens outside of the vop2
lock - which should happen inside of the lock.=20

I'm not sure in what form should I supply corrections to my patch now.
Should it be whole new patch with said fixes, or a patch on top of my
patch?

On Monday, July 22nd, 2024 at 8:37 AM, Dragan Simic <dsimic@manjaro.org> wr=
ote:

> Hello Piotr,
>=20
> Thanks for the patch. Please see a few general comments below.
>=20
> On 2024-07-21 12:06, Piotr Zalewski wrote:
>=20
> > Add support for gamma LUT in VOP2 driver. The implementation is based
> > on
> > the one found in VOP driver and modified to be compatible with VOP2.
> > Blue
> > and red channels in gamma LUT register write were swapped with respect
> > to
> > how gamma LUT values are written in VOP. Write of the current video
> > port id
> > to VOP2_SYS_LUT_PORT_SEL register was added before the write of
> > DSP_LUT_EN
> > bit. Gamma size is set and drm color management is enabled for each
> > video
> > port's CRTC except ones which have no associated device. Tested on
> > RK3566
> > (Pinetab2).
> >=20
> > Signed-off-by: Piotr Zalewski pZ010001011111@proton.me
> > ---
> >=20
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > index 9873172e3fd3..16abdc4a59a8 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > @@ -278,6 +278,15 @@ static u32 vop2_readl(struct vop2 *vop2, u32
> > offset)
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
> > static void vop2_win_write(const struct vop2_win *win, unsigned int
> > reg, u32 v)
> > {
> > regmap_field_write(win->reg[reg], v);
> > @@ -1482,6 +1491,97 @@ static bool vop2_crtc_mode_fixup(struct drm_crtc
> > *crtc,
> > return true;
> > }
> >=20
> > +static bool vop2_vp_dsp_lut_is_enabled(struct vop2_video_port *vp)
> > +{
> > + return (u32) (vop2_vp_read(vp, RK3568_VP_DSP_CTRL) &
> > RK3568_VP_DSP_CTRL__DSP_LUT_EN) >
> > + 0;
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
> > +static void vop2_vp_dsp_lut_disable(struct vop2_video_port *vp)
> > +{
> > + u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
> > +
> > + dsp_ctrl &=3D ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
> > + vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> > +}
> > +
> > +static void vop2_crtc_write_gamma_lut(struct vop2 *vop2, struct
> > drm_crtc *crtc)
> > +{
> > + const struct vop2_data *vop2_data =3D vop2->data;
> > + const struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
> > + const struct vop2_video_port_data *vp_data =3D &vop2_data->vp[vp->id]=
;
>=20
>=20
> Perhaps vop2_data could be dropped as a separate variable.
>=20
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
> > +static void vop2_crtc_gamma_set(struct vop2 *vop2, struct drm_crtc
> > *crtc,
> > + struct drm_crtc_state *old_state)
> > +{
> > + struct drm_crtc_state *state =3D crtc->state;
> > + struct vop2_video_port vp =3D to_vop2_video_port(crtc);
> > + u32 dsp_ctrl;
> > + int ret;
> > +
> > + if (!vop2->lut_regs)
> > + return;
> > +
> > + if (!state->gamma_lut) {
> > + /
> > + * To disable gamma (gamma_lut is null) or to write
> > + * an update to the LUT, clear dsp_lut_en.
> > + /
> > + vop2_lock(vop2);
> > +
> > + vop2_vp_dsp_lut_disable(vp);
> > +
> > + vop2_cfg_done(vp);
> > + vop2_unlock(vop2);
> > + /
> > + * In order to write the LUT to the internal memory,
> > + * we need to first make sure the dsp_lut_en bit is cleared.
> > + */
> > + ret =3D
> > + readx_poll_timeout(vop2_vp_dsp_lut_is_enabled, vp, dsp_ctrl,
> > !dsp_ctrl, 5,
> > + 30 * 1000);
>=20
>=20
> It would look nicer to keep "ret =3D" and "readx_poll_timeout(..." in the
> same line,
> and to introduce line breaks later in the same line.
>=20
> > +
> > + if (ret) {
> > + DRM_DEV_ERROR(vop2->dev, "display LUT RAM enable timeout!\n");
> > + return;
> > + }
> > +
> > + if (!state->gamma_lut)
> > + return;
> > + }
> > +
> > + vop2_crtc_write_gamma_lut(vop2, crtc);
> > +

Here the gamma LUT write happens outside of the vop2 lock.

> > + vop2_lock(vop2);
> > + vop2_writel(vp->vop2, RK3568_LUT_PORT_SEL, vp->id);
> > +
> > + vop2_vp_dsp_lut_enable(vp);
> > +
> > + vop2_cfg_done(vp);
> > + vop2_unlock(vop2);
> > +}
> > +
> > static void vop2_dither_setup(struct drm_crtc *crtc, u32 *dsp_ctrl)
> > {
> > struct rockchip_crtc_state *vcstate =3D
> > to_rockchip_crtc_state(crtc->state);
> > @@ -1925,6 +2025,7 @@ static void vop2_crtc_atomic_enable(struct
> > drm_crtc *crtc,
> > const struct vop2_data *vop2_data =3D vop2->data;
> > const struct vop2_video_port_data *vp_data =3D &vop2_data->vp[vp->id];
> > struct drm_crtc_state *crtc_state =3D
> > drm_atomic_get_new_crtc_state(state, crtc);
> > + struct drm_crtc_state *old_state =3D
> > drm_atomic_get_old_crtc_state(state, crtc);
> > struct rockchip_crtc_state *vcstate =3D
> > to_rockchip_crtc_state(crtc->state);
> > struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;
> > unsigned long clock =3D mode->crtc_clock * 1000;
> > @@ -2060,6 +2161,9 @@ static void vop2_crtc_atomic_enable(struct
> > drm_crtc *crtc,
> > drm_crtc_vblank_on(crtc);
> >=20
> > vop2_unlock(vop2);
> > +
> > + if (crtc->state->gamma_lut)
> > + vop2_crtc_gamma_set(vop2, crtc, old_state);
> > }
> >=20
> > static int vop2_crtc_atomic_check(struct drm_crtc *crtc,
> > @@ -2070,6 +2174,16 @@ static int vop2_crtc_atomic_check(struct
> > drm_crtc *crtc,
> > int nplanes =3D 0;
> > struct drm_crtc_state *crtc_state =3D
> > drm_atomic_get_new_crtc_state(state, crtc);
> >=20
> > + if (vp->vop2->lut_regs && crtc_state->color_mgmt_changed &&
> > crtc_state->gamma_lut) {
> > + unsigned int len =3D drm_color_lut_size(crtc_state->gamma_lut);
> > +
> > + if (len !=3D crtc->gamma_size) {
> > + DRM_DEBUG_KMS("Invalid LUT size; got %d, expected %d\n",
> > + len, crtc->gamma_size);
> > + return -EINVAL;
> > + }
> > + }
> > +
> > drm_atomic_crtc_state_for_each_plane(plane, crtc_state)
> > nplanes++;
> >=20
> > @@ -2459,6 +2573,10 @@ static void vop2_setup_dly_for_windows(struct
> > vop2 *vop2)
> > static void vop2_crtc_atomic_begin(struct drm_crtc *crtc,
> > struct drm_atomic_state *state)
> > {
> > + struct drm_crtc_state *crtc_state =3D
> > drm_atomic_get_new_crtc_state(state,
> > + crtc);
> > + struct drm_crtc_state *old_crtc_state =3D
> > drm_atomic_get_old_crtc_state(state,
> > + crtc);
> > struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
> > struct vop2 *vop2 =3D vp->vop2;
> > struct drm_plane *plane;
> > @@ -2482,6 +2600,9 @@ static void vop2_crtc_atomic_begin(struct
> > drm_crtc *crtc,
> > vop2_setup_layer_mixer(vp);
> > vop2_setup_alpha(vp);
> > vop2_setup_dly_for_windows(vop2);
> > +
> > + if (crtc_state->color_mgmt_changed && !crtc_state->active_changed)
> > + vop2_crtc_gamma_set(vop2, crtc, old_crtc_state);
> > }
> >=20
> > static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
> > @@ -2791,6 +2912,14 @@ static int vop2_create_crtcs(struct vop2 *vop2)
> >=20
> > drm_crtc_helper_add(&vp->crtc, &vop2_crtc_helper_funcs);
> >=20
> > + if (vop2->lut_regs && vp->crtc.dev !=3D NULL) {
> > + const struct vop2_video_port_data *vp_data =3D
> > &vop2_data->vp[vp->id];
> > +
> > + drm_mode_crtc_set_gamma_size(&vp->crtc, vp_data->gamma_lut_len);
> > + drm_crtc_enable_color_mgmt(&vp->crtc, 0, false,
> > + vp_data->gamma_lut_len);
> > + }
> > +
> > init_completion(&vp->dsp_hold_completion);
> > }
> >=20
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> > b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> > index 615a16196aff..3a58b73fa876 100644
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
