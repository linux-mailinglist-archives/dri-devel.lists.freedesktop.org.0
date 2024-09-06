Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3869096FE90
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 01:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE2710EABE;
	Fri,  6 Sep 2024 23:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="dNb2WYic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078DB10EAB5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 17:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1725645041; x=1725904241;
 bh=c6uEbkcohf3ucYhL6tKjBC7+SOWgapOzdFEqRfu2C7Y=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=dNb2WYicA5wChC1je5j68QZci7UlEHK4+v2tWDbbx+Xgz645IVE2j4BhMVNe0Dmlr
 eV2tKPL6tlK/IExBvfTKGVlolkMgFnhsRYg9U4Wfu/km6OXYUDb+F2wEVAhXQN+Ird
 tSUCLuvlSviQS9I1SIHzOTeq8uXQ5a6ZhOCe/MWH7PLju34Dx0+O2S7uyU7xIypj5E
 amsfjOMom7xmoPRd24TTQUtjR35pwRRHeRt2QmrYmSnhQkZHX7VwAZMqbGF1sW7QbR
 abbCxuUdIYTtLSqstMeph52k1x1LEYwFzq78Lx7cxMtG++7qWHPOlGQsdMJqzqgFTb
 RdvI1qFkxg/KQ==
Date: Fri, 06 Sep 2024 17:50:36 +0000
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: Piotr Zalewski <pZ010001011111@proton.me>,
 Daniel Stone <daniel@fooishbar.org>, Dragan Simic <dsimic@manjaro.org>,
 Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH v4] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <Pn-SxLyO78OXrKgkMG8Skwa69PG6oAG_UACHHy_VQqbNRbs1VHW9VV1feGos-zrtrTTi7RDOjERu_fmx9QYPXxI8SXqL_nOKuv0P6z-z6NI=@proton.me>
In-Reply-To: <20240815124306.189282-2-pZ010001011111@proton.me>
References: <20240815124306.189282-2-pZ010001011111@proton.me>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: aad2cd532d71b8c356243e076b6e061492935d66
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 06 Sep 2024 23:45:00 +0000
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

Hi Daniel,

Can you comment on or review this? This version of the patch was based on
your suggestions and it has been stuck for some time now.

I appreciate your time and help :)

Best Regards, Piotr Zalewski

On Thursday, August 15th, 2024 at 2:46 PM, Piotr Zalewski <pZ010001011111@p=
roton.me> wrote:

> Add support for gamma LUT in VOP2 driver. The implementation was inspired
> by one found in VOP1 driver. Blue and red channels in gamma LUT register
> write were swapped with respect to how gamma LUT values are written in
> VOP1. If the current SoC is RK3566 or RK3568 and gamma LUT is to be
> written, full modeset is triggered to synchronize disable, write, enable
> process and hint userspace that it is not seamless transition[1]. If the
> current SoC is RK3588 full modeset isn't triggered because gamma LUT need
> not to be disabled before the LUT write[1]. In case of RK356x as well as
> RK3588 respective LUT port sel register write was added before the LUT
> write[2]. In case of RK3588, gamma update enable bit is set after setting
> gamma LUT enable bit[2]. Gamma size is set and drm color management is
> enabled for each video port's CRTC except ones which have no associated
> device. Tested on RK3566 (Pinetab2).
>=20
> [1] https://lore.kernel.org/linux-rockchip/CAPj87rOM=3Dj0zmuWL9frGKV1xzPb=
Jrk=3DQ9ip7F_HAPYnbCqPouw@mail.gmail.com/
> [2] https://lore.kernel.org/linux-rockchip/7d998e4c-e1d3-4e8b-af76-c5bc83=
b43647@rock-chips.com/
>=20
> Helped-by: Daniel Stone daniel@fooishbar.org
>=20
> Helped-by: Dragan Simic dsimic@manjaro.org
>=20
> Helped-by: Diederik de Haas didi.debian@cknow.org
>=20
> Helped-by: Andy Yan andy.yan@rock-chips.com
>=20
> Signed-off-by: Piotr Zalewski pZ010001011111@proton.me
>=20
> ---
>=20
> Notes:
> WASN'T tested on RK3588.
>=20
> Changes in v4:
> - rework the implementation to better utilize DRM atomic updates[2]
> - handle the RK3588 case[2][3]
>=20
> Changes in v3:
> - v3 is patch v2 "resend", by mistake the incremental patch was
> sent in v2
>=20
> Changes in v2:
> - Apply code styling corrections[1]
> - Move gamma LUT write inside the vop2 lock
>=20
> Link to v3: https://lore.kernel.org/linux-rockchip/TkgKVivuaLFLILPY-n3iZo=
_8KF-daKdqdu-0_e0HP-5Ar_8DALDeNWog2suwWKjX7eomcbGET0KZe7DlzdhK2YM6CbLbeKeFZ=
r-MJzJMtw0=3D@proton.me/
> Link to v2: https://lore.kernel.org/linux-rockchip/Hk03HDb6wSSHWtEFZHUye0=
6HR0-9YzP5nCHx9A8_kHzWSZawDrU1o1pjEGkCOJFoRg0nTB4BWEv6V0XBOjF4-0Mj44lp2Trja=
Qfnytzp-Pk=3D@proton.me/T/#u
> Link to v1: https://lore.kernel.org/linux-rockchip/9736eadf6a9d8e97eef919=
c6b3d88828@manjaro.org/T/#t
>=20
> [1] https://lore.kernel.org/linux-rockchip/d019761504b540600d9fc7a585d6f9=
5f@manjaro.org
> [2] https://lore.kernel.org/linux-rockchip/CAPj87rOM=3Dj0zmuWL9frGKV1xzPb=
Jrk=3DQ9ip7F_HAPYnbCqPouw@mail.gmail.com
> [3] https://lore.kernel.org/linux-rockchip/7d998e4c-e1d3-4e8b-af76-c5bc83=
b43647@rock-chips.com
>=20
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 148 +++++++++++++++++++
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 5 +
> 2 files changed, 153 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 9873172e3fd3..fe7657984909 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -278,6 +278,15 @@ static u32 vop2_readl(struct vop2 *vop2, u32 offset)
> return val;
> }
>=20
> +static u32 vop2_vp_read(struct vop2_video_port *vp, u32 offset)
> +{
> + u32 val;
> +
> + regmap_read(vp->vop2->map, vp->data->offset + offset, &val);
>=20
> +
> + return val;
> +}
> +
> static void vop2_win_write(const struct vop2_win *win, unsigned int reg, =
u32 v)
> {
> regmap_field_write(win->reg[reg], v);
>=20
> @@ -998,6 +1007,30 @@ static void vop2_disable(struct vop2 *vop2)
> clk_disable_unprepare(vop2->hclk);
>=20
> }
>=20
> +static void vop2_vp_dsp_lut_disable(struct vop2_video_port *vp)
> +{
> + u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
> +
> + dsp_ctrl &=3D ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
> + vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> +}
> +
> +static void vop2_vp_dsp_lut_enable(struct vop2_video_port *vp)
> +{
> + u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
> +
> + dsp_ctrl |=3D RK3568_VP_DSP_CTRL__DSP_LUT_EN;
> + vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> +}
> +
> +static void vop2_vp_dsp_lut_update_enable(struct vop2_video_port *vp)
> +{
> + u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
> +
> + dsp_ctrl |=3D RK3588_VP_DSP_CTRL__GAMMA_UPDATE_EN;
> + vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> +}
> +
> static void vop2_crtc_atomic_disable(struct drm_crtc *crtc,
> struct drm_atomic_state *state)
> {
> @@ -1482,6 +1515,24 @@ static bool vop2_crtc_mode_fixup(struct drm_crtc *=
crtc,
> return true;
> }
>=20
> +static void vop2_crtc_write_gamma_lut(struct vop2 *vop2, struct drm_crtc=
 *crtc)
> +{
> + const struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
> + const struct vop2_video_port_data *vp_data =3D &vop2->data->vp[vp->id];
>=20
> +
> + struct drm_color_lut *lut =3D crtc->state->gamma_lut->data;
>=20
> + unsigned int i, bpc =3D ilog2(vp_data->gamma_lut_len);
>=20
> + u32 word;
> +
> + for (i =3D 0; i < crtc->gamma_size; i++) {
>=20
> + word =3D (drm_color_lut_extract(lut[i].blue, bpc) << (2 * bpc)) |
> + (drm_color_lut_extract(lut[i].green, bpc) << bpc) |
> + drm_color_lut_extract(lut[i].red, bpc);
> +
> + writel(word, vop2->lut_regs + i * 4);
>=20
> + }
> +}
> +
> static void vop2_dither_setup(struct drm_crtc *crtc, u32 *dsp_ctrl)
> {
> struct rockchip_crtc_state *vcstate =3D to_rockchip_crtc_state(crtc->stat=
e);
>=20
> @@ -2062,6 +2113,42 @@ static void vop2_crtc_atomic_enable(struct drm_crt=
c *crtc,
> vop2_unlock(vop2);
> }
>=20
> +static int vop2_crtc_atomic_check_gamma(struct vop2_video_port *vp,
> + struct drm_crtc *crtc,
> + struct drm_atomic_state *state,
> + struct drm_crtc_state *crtc_state)
> +{
> + struct vop2 *vop2 =3D vp->vop2;
>=20
> + unsigned int len;
> +
> + if (!vp->vop2->lut_regs || !crtc_state->color_mgmt_changed ||
>=20
> + !crtc_state->gamma_lut)
>=20
> + return 0;
> +
> + len =3D drm_color_lut_size(crtc_state->gamma_lut);
>=20
> + if (len !=3D crtc->gamma_size) {
>=20
> + DRM_DEBUG_KMS("Invalid LUT size; got %d, expected %d\n",
> + len, crtc->gamma_size);
>=20
> + return -EINVAL;
> + }
> +
> + // trigger full modeset only when SoC is 356x
> + if (!crtc_state->mode_changed && (vop2->data->soc_id =3D=3D 3566 ||
>=20
> + vop2->data->soc_id =3D=3D 3568)) {
>=20
> + int ret;
> +
> + crtc_state->mode_changed =3D true;
>=20
> + state->allow_modeset =3D true;
>=20
> +
> + ret =3D drm_atomic_helper_check_modeset(crtc->dev,
>=20
> + crtc_state->state);
>=20
> + if (ret)
> + return ret;
> + }
> +
> + return 0;
> +}
> +
> static int vop2_crtc_atomic_check(struct drm_crtc *crtc,
> struct drm_atomic_state *state)
> {
> @@ -2069,6 +2156,11 @@ static int vop2_crtc_atomic_check(struct drm_crtc =
*crtc,
> struct drm_plane *plane;
> int nplanes =3D 0;
> struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(state=
, crtc);
> + int ret;
> +
> + ret =3D vop2_crtc_atomic_check_gamma(vp, crtc, state, crtc_state);
> + if (ret)
> + return ret;
>=20
> drm_atomic_crtc_state_for_each_plane(plane, crtc_state)
> nplanes++;
> @@ -2456,9 +2548,32 @@ static void vop2_setup_dly_for_windows(struct vop2=
 *vop2)
> vop2_writel(vop2, RK3568_SMART_DLY_NUM, sdly);
> }
>=20
> +static void vop2_crtc_atomic_begin_gamma(struct vop2 *vop2,
> + struct vop2_video_port *vp,
> + struct drm_crtc *crtc,
> + struct drm_crtc_state *crtc_state)
> +{
> + if (vop2->lut_regs && crtc_state->color_mgmt_changed &&
>=20
> + crtc_state->gamma_lut) {
>=20
> + vop2_lock(vop2);
> + if (vop2->data->soc_id =3D=3D 3566 || vop2->data->soc_id =3D=3D 3568) {
>=20
> + vop2_writel(vop2, RK3568_LUT_PORT_SEL, vp->id);
>=20
> + } else {
> + vop2_writel(vop2, RK3568_LUT_PORT_SEL, FIELD_PREP(
> + RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL,
> + vp->id));
>=20
> + }
> + vop2_crtc_write_gamma_lut(vop2, crtc);
> +
> + vop2_unlock(vop2);
> + }
> +}
> +
> static void vop2_crtc_atomic_begin(struct drm_crtc *crtc,
> struct drm_atomic_state *state)
> {
> + struct drm_crtc_state *crtc_state =3D
> + drm_atomic_get_new_crtc_state(state, crtc);
> struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
> struct vop2 *vop2 =3D vp->vop2;
>=20
> struct drm_plane *plane;
> @@ -2482,13 +2597,39 @@ static void vop2_crtc_atomic_begin(struct drm_crt=
c *crtc,
> vop2_setup_layer_mixer(vp);
> vop2_setup_alpha(vp);
> vop2_setup_dly_for_windows(vop2);
> +
> + vop2_crtc_atomic_begin_gamma(vop2, vp, crtc, crtc_state);
> +}
> +
> +static void vop2_crtc_atomic_flush_gamma(struct vop2 *vop2,
> + struct vop2_video_port *vp,
> + struct drm_crtc_state *crtc_state)
> +{
> + if (vop2->lut_regs && crtc_state->color_mgmt_changed) {
>=20
> + vop2_lock(vop2);
> +
> + if (crtc_state->gamma_lut) {
>=20
> + vop2_vp_dsp_lut_enable(vp);
> + if (vop2->data->soc_id !=3D 3566 &&
>=20
> + vop2->data->soc_id !=3D 3568)
>=20
> + vop2_vp_dsp_lut_update_enable(vp);
> +
> + } else
> + vop2_vp_dsp_lut_disable(vp);
> +
> + vop2_unlock(vop2);
> + }
> }
>=20
> static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
> struct drm_atomic_state *state)
> {
> + struct drm_crtc_state *crtc_state =3D
> + drm_atomic_get_new_crtc_state(state, crtc);
> struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
>=20
> + vop2_crtc_atomic_flush_gamma(vp->vop2, vp, crtc_state);
>=20
> +
> vop2_post_config(crtc);
>=20
> vop2_cfg_done(vp);
> @@ -2791,6 +2932,13 @@ static int vop2_create_crtcs(struct vop2 *vop2)
>=20
> drm_crtc_helper_add(&vp->crtc, &vop2_crtc_helper_funcs);
>=20
>=20
> + if (vop2->lut_regs && vp->crtc.dev !=3D NULL) {
>=20
> + const struct vop2_video_port_data *vp_data =3D &vop2_data->vp[vp->id];
>=20
> +
> + drm_mode_crtc_set_gamma_size(&vp->crtc, vp_data->gamma_lut_len);
>=20
> + drm_crtc_enable_color_mgmt(&vp->crtc, 0, false,
>=20
> + vp_data->gamma_lut_len);
>=20
> + }
> init_completion(&vp->dsp_hold_completion);
>=20
> }
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.h
> index 615a16196aff..510dda6f9092 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> @@ -394,6 +394,7 @@ enum dst_factor_mode {
> #define RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN BIT(15)
>=20
> #define RK3568_VP_DSP_CTRL__STANDBY BIT(31)
> +#define RK3568_VP_DSP_CTRL__DSP_LUT_EN BIT(28)
> #define RK3568_VP_DSP_CTRL__DITHER_DOWN_MODE BIT(20)
> #define RK3568_VP_DSP_CTRL__DITHER_DOWN_SEL GENMASK(19, 18)
> #define RK3568_VP_DSP_CTRL__DITHER_DOWN_EN BIT(17)
> @@ -408,6 +409,8 @@ enum dst_factor_mode {
> #define RK3568_VP_DSP_CTRL__CORE_DCLK_DIV BIT(4)
> #define RK3568_VP_DSP_CTRL__OUT_MODE GENMASK(3, 0)
>=20
> +#define RK3588_VP_DSP_CTRL__GAMMA_UPDATE_EN BIT(22)
> +
> #define RK3588_VP_CLK_CTRL__DCLK_OUT_DIV GENMASK(3, 2)
> #define RK3588_VP_CLK_CTRL__DCLK_CORE_DIV GENMASK(1, 0)
>=20
> @@ -460,6 +463,8 @@ enum dst_factor_mode {
> #define RK3588_DSP_IF_POL__DP1_PIN_POL GENMASK(14, 12)
> #define RK3588_DSP_IF_POL__DP0_PIN_POL GENMASK(10, 8)
>=20
> +#define RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL GENMASK(13, 12)
> +
> #define RK3568_VP0_MIPI_CTRL__DCLK_DIV2_PHASE_LOCK BIT(5)
> #define RK3568_VP0_MIPI_CTRL__DCLK_DIV2 BIT(4)
>=20
> --
> 2.46.0
