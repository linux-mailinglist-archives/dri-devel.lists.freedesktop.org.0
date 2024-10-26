Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAAB9B1AF2
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 22:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C7610E429;
	Sat, 26 Oct 2024 20:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="SGZUpiyo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2021410E033
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 20:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1729975669; x=1730234869;
 bh=bEydPZ+56CYTS2lVFmGF7S6D5shHcuWv01ItgyurBFc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=SGZUpiyovAcp1gP86aC2XvkXcUqZ3FU9yPdcQ1IC8d9La97Do7JQTIYvkX1Lt5Pgs
 qj0KmxsMEm8geiOoSadS1ziOuiYPoqjYkUY1a0KcskEkS0FHxfcelft+ZnJeQvCRir
 St6mb87RMqLj6Yv1t1EfV9nG9LURGYArm87K8y3AzwIYidFQ50vlSLC1R+zNo6DjIy
 cmoBtDCAnVeZDeHvUN/3hZ4hgQ0xWq+8ir3aLhGGzAq0YvHQhCsexT5sFgKDcN8hz6
 c17QusaSUKpLoh3b0IvN5eH+mdTNkaSF39Al6wqmiedNOYldPLAmbn9bSE6T3tXEk2
 ktEbQoyIqlWBQ==
Date: Sat, 26 Oct 2024 20:47:42 +0000
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: skhan@linuxfoundation.org, Piotr Zalewski <pZ010001011111@proton.me>,
 Daniel Stone <daniel@fooishbar.org>, Dragan Simic <dsimic@manjaro.org>,
 Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH v6] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <DurUfF_0TBHKv4DHKIP3ggQh_85nRY0usYWn_fu_oJ45txO7dGKv-OK5rl6EDEPmX5l8WzrwPCzAvYz0xFPfeKGyx7enu1g-prsWIpilv88=@proton.me>
In-Reply-To: <20241016223558.673145-2-pZ010001011111@proton.me>
References: <20241016223558.673145-2-pZ010001011111@proton.me>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 3f8cafed897b1a397e4d981876fc9532604b7692
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

Hi all,

any comments on this?

On Thursday, October 17th, 2024 at 12:36 AM, Piotr Zalewski <pZ010001011111=
@proton.me> wrote:

> Add support for gamma LUT in VOP2 driver. The implementation was inspired
> by one found in VOP1 driver. Blue and red channels in gamma LUT register
> write were swapped with respect to how gamma LUT values are written in
> VOP1. Gamma LUT port selection was added before the write of new gamma LU=
T
> table.
>=20
> If the current SoC is rk356x, check if no other CRTC has gamma LUT enable=
d
> in atomic_check (only one video port can use gamma LUT at a time) and
> disable gamma LUT before the LUT table write.
>=20
> If the current SoC isn't rk356x, "seamless" gamma lut update is performed
> similarly to how it was done in the case of RK3399 in VOP1[1]. In seamles=
s
> update gamma LUT disable before the write isn't necessary, check if no
> other CRTC has gamma LUT enabled is also not necessary, different registe=
r
> is being used to select gamma LUT port[2] and after setting DSP_LUT_EN bi=
t,
> GAMMA_UPDATE_EN bit is set[3].
>=20
> Gamma size is set and drm color management is enabled for each video port=
's
> CRTC except ones which have no associated device.
>=20
> Solution was tested on RK3566 (Pinetab2). When using userspace tools
> which set eg. constant color temperature no issues were noticed. When
> using userspace tools which adjust eg. color temperature the slight scree=
n
> flicker is visible probably because of gamma LUT disable.
>=20
> Compare behaviour of eg.:
> `gammastep -O 3000`
>=20
> To eg.:
> `gammastep -l 53:23 -t 6000:3000`
>=20
> In latter case color temperature is slowly adjusted at the beginning whic=
h
> causes screen to slighly flicker. Then it adjusts every few seconds which
> also causes slight screen flicker.
>=20
> [1] https://lists.infradead.org/pipermail/linux-rockchip/2021-October/028=
132.html
> [2] https://lore.kernel.org/linux-rockchip/48249708-8c05-40d2-a5d8-23de96=
0c5a77@rock-chips.com/
> [3] https://github.com/radxa/kernel/blob/linux-6.1-stan-rkr1/drivers/gpu/=
drm/rockchip/rockchip_drm_vop2.c#L3437
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
> Changes in v6:
> - Move gamma lut write to atomic_flush[4].
> - In atomic_check if any other than the currently updated CRTC has
> gamma lut enabled, return -EINVAL [5] (perform a check only if
> device is rk356x).
> - Instead of checking for rk3588 to determine seamless gamma
> update availability check for rk3566/rk3568.
> - remove null check in vop2_create_crtcs
> - Move some code to separate functions to increase readability.
>=20
> Changes in v5:
> - Do not trigger full modeset in case seamless gamma lut update
> isn't possible (eg. rk356x case). It was discovered that with
> full modeset, userspace tools which adjust color temperature with
> high frequency cause screen to go black and reduce overall
> performance. Instead, revert to previous behaviour of lut update
> happening in atomic_begin or (in case there is a modeset) in
> atomic_enable. Also, add unrelated to modeset trigger
> changes/improvements from v4 on top. Improve code readability
> too.
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
> Link to v5: https://lore.kernel.org/linux-rockchip/20241014222022.571819-=
4-pZ010001011111@proton.me/
> Link to v4: https://lore.kernel.org/linux-rockchip/20240815124306.189282-=
2-pZ010001011111@proton.me/
> Link to v3: https://lore.kernel.org/linux-rockchip/TkgKVivuaLFLILPY-n3iZo=
_8KF-daKdqdu-0_e0HP-5Ar_8DALDeNWog2suwWKjX7eomcbGET0KZe7DlzdhK2YM6CbLbeKeFZ=
r-MJzJMtw0=3D@proton.me/
> Link to v2: https://lore.kernel.org/linux-rockchip/Hk03HDb6wSSHWtEFZHUye0=
6HR0-9YzP5nCHx9A8_kHzWSZawDrU1o1pjEGkCOJFoRg0nTB4BWEv6V0XBOjF4-0Mj44lp2Trja=
Qfnytzp-Pk=3D@proton.me/
> Link to v1: https://lore.kernel.org/linux-rockchip/ZVMxgcrtgHui9fJpnhbN6T=
SPhofHbbXElh241lImrzzTUl-8WejGpaR8CPzYhBgoqe_xj7N6En8Ny7Z-gsCr0kaFs7apwjYV1=
MBJJLmLHxs=3D@proton.me/
>=20
> [1] https://lore.kernel.org/linux-rockchip/d019761504b540600d9fc7a585d6f9=
5f@manjaro.org
> [2] https://lore.kernel.org/linux-rockchip/CAPj87rOM=3Dj0zmuWL9frGKV1xzPb=
Jrk=3DQ9ip7F_HAPYnbCqPouw@mail.gmail.com
> [3] https://lore.kernel.org/linux-rockchip/7d998e4c-e1d3-4e8b-af76-c5bc83=
b43647@rock-chips.com
> [4] https://lore.kernel.org/linux-rockchip/7b45f190.452f.1928e41b746.Core=
mail.andyshrk@163.com/
> [5] https://lore.kernel.org/linux-rockchip/CAPj87rOdQPsuH9qB_ZLfC9S=3DcO2=
noNi1mOGW0ZmQ6SHCugb9=3Dw@mail.gmail.com/
>=20
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 189 +++++++++++++++++++
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 5 +
> 2 files changed, 194 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 9873172e3fd3..6018c353e66b 100644
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
> @@ -998,6 +1007,65 @@ static void vop2_disable(struct vop2 *vop2)
> clk_disable_unprepare(vop2->hclk);
>=20
> }
>=20
> +static bool vop2_vp_dsp_lut_is_enabled(struct vop2_video_port *vp)
> +{
> + return (u32) (vop2_vp_read(vp, RK3568_VP_DSP_CTRL) & RK3568_VP_DSP_CTRL=
__DSP_LUT_EN) >
>=20
> + 0;
> +}
> +
> +static void vop2_vp_dsp_lut_disable(struct vop2_video_port *vp)
> +{
> + u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
> +
> + dsp_ctrl &=3D ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
> + vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> +}
> +
> +static bool vop2_vp_dsp_lut_poll_disable(struct vop2_video_port *vp)
> +{
> + u32 dsp_ctrl;
> + int ret =3D readx_poll_timeout(vop2_vp_dsp_lut_is_enabled, vp, dsp_ctrl=
,
> + !dsp_ctrl, 5, 30 * 1000);
> + if (ret) {
> + drm_err(vp->vop2->drm, "display LUT RAM enable timeout!\n");
>=20
> + return false;
> + }
> +
> + return true;
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
> +static inline bool vop2_supports_seamless_gamma_lut_update(struct vop2 *=
vop2)
> +{
> + return (vop2->data->soc_id !=3D 3566 && vop2->data->soc_id !=3D 3568);
>=20
> +}
> +
> +static bool vop2_gamma_lut_in_use(struct vop2 *vop2, struct vop2_video_p=
ort *vp)
> +{
> + const int nr_vps =3D vop2->data->nr_vps;
>=20
> + int gamma_en_vp_id;
> + for (gamma_en_vp_id =3D 0; gamma_en_vp_id < nr_vps; gamma_en_vp_id++)
> + if (vop2_vp_dsp_lut_is_enabled(&vop2->vps[gamma_en_vp_id]))
>=20
> + break;
> +
> + return gamma_en_vp_id !=3D nr_vps && gamma_en_vp_id !=3D vp->id;
>=20
> +}
> +
> static void vop2_crtc_atomic_disable(struct drm_crtc *crtc,
> struct drm_atomic_state *state)
> {
> @@ -1482,6 +1550,80 @@ static bool vop2_crtc_mode_fixup(struct drm_crtc *=
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
> +static void vop2_crtc_atomic_set_gamma_seamless(struct vop2 *vop2,
> + struct vop2_video_port *vp,
> + struct drm_crtc *crtc)
> +{
> + vop2_writel(vop2, RK3568_LUT_PORT_SEL, FIELD_PREP(
> + RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL,
> + vp->id));
>=20
> + vop2_vp_dsp_lut_enable(vp);
> + vop2_crtc_write_gamma_lut(vop2, crtc);
> + vop2_vp_dsp_lut_update_enable(vp);
> +}
> +
> +static void vop2_crtc_atomic_set_gamma_rk356x(struct vop2 *vop2,
> + struct vop2_video_port *vp,
> + struct drm_crtc *crtc)
> +{
> + vop2_vp_dsp_lut_disable(vp);
> + vop2_cfg_done(vp);
> + if (!vop2_vp_dsp_lut_poll_disable(vp))
> + return;
> +
> + vop2_writel(vop2, RK3568_LUT_PORT_SEL, vp->id);
>=20
> + vop2_crtc_write_gamma_lut(vop2, crtc);
> + vop2_vp_dsp_lut_enable(vp);
> +}
> +
> +static void vop2_crtc_atomic_try_set_gamma(struct vop2 *vop2,
> + struct vop2_video_port *vp,
> + struct drm_crtc *crtc,
> + struct drm_crtc_state *crtc_state)
> +{
> +
> + if (!vop2->lut_regs || !crtc_state->color_mgmt_changed)
>=20
> + return;
> +
> + if (!crtc_state->gamma_lut) {
>=20
> + vop2_vp_dsp_lut_disable(vp);
> + return;
> + }
> +
> + if (vop2_supports_seamless_gamma_lut_update(vop2))
> + vop2_crtc_atomic_set_gamma_seamless(vop2, vp, crtc);
> + else
> + vop2_crtc_atomic_set_gamma_rk356x(vop2, vp, crtc);
> +}
> +
> +static inline void vop2_crtc_atomic_try_set_gamma_locked(struct vop2 *vo=
p2,
> + struct vop2_video_port *vp,
> + struct drm_crtc *crtc,
> + struct drm_crtc_state *crtc_state)
> +{
> + vop2_lock(vop2);
> + vop2_crtc_atomic_try_set_gamma(vop2, vp, crtc, crtc_state);
> + vop2_unlock(vop2);
> +}
> +
> static void vop2_dither_setup(struct drm_crtc *crtc, u32 *dsp_ctrl)
> {
> struct rockchip_crtc_state *vcstate =3D to_rockchip_crtc_state(crtc->stat=
e);
>=20
> @@ -2057,11 +2199,40 @@ static void vop2_crtc_atomic_enable(struct drm_cr=
tc *crtc,
>=20
> vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
>=20
> + vop2_crtc_atomic_try_set_gamma(vop2, vp, crtc, crtc_state);
> +
> drm_crtc_vblank_on(crtc);
>=20
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
> + drm_dbg(vop2->drm, "Invalid LUT size; got %d, expected %d\n",
>=20
> + len, crtc->gamma_size);
>=20
> + return -EINVAL;
> + }
> +
> + if (!vop2_supports_seamless_gamma_lut_update(vop2) && vop2_gamma_lut_in=
_use(vop2, vp)) {
> + drm_info(vop2->drm, "Gamma LUT can be enabled for only one CRTC at a ti=
me\n");
>=20
> + return -EINVAL;
> + }
> +
> + return 0;
> +}
> +
> static int vop2_crtc_atomic_check(struct drm_crtc *crtc,
> struct drm_atomic_state *state)
> {
> @@ -2069,6 +2240,11 @@ static int vop2_crtc_atomic_check(struct drm_crtc =
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
> @@ -2456,6 +2632,7 @@ static void vop2_setup_dly_for_windows(struct vop2 =
*vop2)
> vop2_writel(vop2, RK3568_SMART_DLY_NUM, sdly);
> }
>=20
> +
> static void vop2_crtc_atomic_begin(struct drm_crtc *crtc,
> struct drm_atomic_state *state)
> {
> @@ -2487,7 +2664,14 @@ static void vop2_crtc_atomic_begin(struct drm_crtc=
 *crtc,
> static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
> struct drm_atomic_state *state)
> {
> + struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te, crtc);
> struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
> + struct vop2 *vop2 =3D vp->vop2;
>=20
> +
> + // NOTE: in case of modeset gamma lut update
> + // already happened in atomic enable
> + if (!drm_atomic_crtc_needs_modeset(crtc_state))
> + vop2_crtc_atomic_try_set_gamma_locked(vop2, vp, crtc, crtc_state);
>=20
> vop2_post_config(crtc);
>=20
> @@ -2790,7 +2974,12 @@ static int vop2_create_crtcs(struct vop2 *vop2)
> }
>=20
> drm_crtc_helper_add(&vp->crtc, &vop2_crtc_helper_funcs);
>=20
> + if (vop2->lut_regs) {
>=20
> + const struct vop2_video_port_data *vp_data =3D &vop2_data->vp[vp->id];
>=20
>=20
> + drm_mode_crtc_set_gamma_size(&vp->crtc, vp_data->gamma_lut_len);
>=20
> + drm_crtc_enable_color_mgmt(&vp->crtc, 0, false, vp_data->gamma_lut_len)=
;
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
> 2.47.0
