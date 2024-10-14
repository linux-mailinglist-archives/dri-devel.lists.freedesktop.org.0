Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5423099D9CC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 00:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0512A10E0E4;
	Mon, 14 Oct 2024 22:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="FaN9WySO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E282810E0E4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 22:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1728945033; x=1729204233;
 bh=7xC9oVdcV9Xlb05b3B6P5qkDc7QSTcaEfnnGUqbbNTE=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=FaN9WySO6vLWnAL1K7cTuAOibDxljretOVAtYP59RGRs2GESYZrtRZb6D3H+OGIpt
 bBfbWHRnsTkwRir5yxbzscYSBSdJhpJxa6S1AQBw2PL/8YvWhYEB/bEf7LqCy/s6ag
 nd7kk2vbLU7s+2C6dkis8sxhlvfYHOs11wSskiWD2PSaWWlVsl0wZziMSH527EW7j3
 VFhNUOPJXusXnwaDZji9SuDVurpu2ThCsqS0DAMhwBeWNaMTEg751t0LuTnmSwHcvM
 YH5DptlvFbMoqg7bkVAFQ5YZIuOpEG2pieYf9yfriYxqgibPGqW0wMRkNlvGaLnBCE
 db6Bxt5GmVpSw==
Date: Mon, 14 Oct 2024 22:30:27 +0000
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: skhan@linuxfoundation.org, Piotr Zalewski <pZ010001011111@proton.me>,
 Daniel Stone <daniel@fooishbar.org>, Dragan Simic <dsimic@manjaro.org>,
 Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v5] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <20241014222022.571819-4-pZ010001011111@proton.me>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 7fb4f50f8934437703505aab2a582868ebe96dbd
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

Add support for gamma LUT in VOP2 driver. The implementation was inspired
by one found in VOP1 driver. Blue and red channels in gamma LUT register
write were swapped with respect to how gamma LUT values are written in
VOP1. Gamma LUT port selection was added before the write of new gamma LUT=
=20
table. If the current SoC is RK3588, "seamless" gamma lut update is=20
performed similarly to how it was done in the case of RK3399 in VOP1[1]. In
seamless update gamma LUT disable before the write isn't necessary,=20
different register is being used to select gamma LUT port[2] and after=20
setting DSP_LUT_EN bit, GAMMA_UPDATE_EN bit is set[3]. Gamma size is set=20
and drm color management is enabled for each video port's CRTC except ones=
=20
which have no associated device.=20

Solution was tested on RK3566 (Pinetab2). When using userspace tools
which set eg. constant color temperature no issues were noticed. When
using userspace tools which adjust eg. color temperature the slight screen
flicker is visible probably because of gamma LUT disable.

Compare behaviour of eg.:
```
gammastep -O 3000
```

To eg.:
```
gammastep -l 53:23 -t 6000:3000
```

In latter case color temperature is slowly adjusted at the beginning which
causes screen to slighly flicker. Then it adjusts every few seconds which=
=20
also causes slight screen flicker.

[1] https://lists.infradead.org/pipermail/linux-rockchip/2021-October/02813=
2.html
[2] https://lore.kernel.org/linux-rockchip/48249708-8c05-40d2-a5d8-23de960c=
5a77@rock-chips.com/
[3] https://github.com/radxa/kernel/blob/linux-6.1-stan-rkr1/drivers/gpu/dr=
m/rockchip/rockchip_drm_vop2.c#L3437

Helped-by: Daniel Stone <daniel@fooishbar.org>
Helped-by: Dragan Simic <dsimic@manjaro.org>
Helped-by: Diederik de Haas <didi.debian@cknow.org>
Helped-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Piotr Zalewski <pZ010001011111@proton.me>
---

Notes:
    Changes in v5:
        - Do not trigger full modeset in case seamless gamma lut update
=09=09  isn't possible (eg. rk356x case). It was discovered that with=20
=09=09  full modeset, userspace tools which adjust color temperature with
          high frequency cause screen to go black and reduce overall
          performance. Instead, revert to previous behaviour of lut update
=09=09  happening in atomic_begin or (in case there is a modeset) in
=09=09  atomic_enable. Also, add unrelated to modeset trigger
=09=09  changes/improvements from v4 on top. Improve code readability
=09=09  too.

    Changes in v4:
        - rework the implementation to better utilize DRM atomic updates[2]
        - handle the RK3588 case[2][3]
   =20
    Changes in v3:
        - v3 is patch v2 "resend", by mistake the incremental patch was
        sent in v2
   =20
    Changes in v2:
        - Apply code styling corrections[1]
        - Move gamma LUT write inside the vop2 lock
=09
=09Link to v4: https://lore.kernel.org/linux-rockchip/20240815124306.189282=
-2-pZ010001011111@proton.me/
    Link to v3: https://lore.kernel.org/linux-rockchip/TkgKVivuaLFLILPY-n3i=
Zo_8KF-daKdqdu-0_e0HP-5Ar_8DALDeNWog2suwWKjX7eomcbGET0KZe7DlzdhK2YM6CbLbeKe=
FZr-MJzJMtw0=3D@proton.me/
    Link to v2: https://lore.kernel.org/linux-rockchip/Hk03HDb6wSSHWtEFZHUy=
e06HR0-9YzP5nCHx9A8_kHzWSZawDrU1o1pjEGkCOJFoRg0nTB4BWEv6V0XBOjF4-0Mj44lp2Tr=
jaQfnytzp-Pk=3D@proton.me/T/#u
    Link to v1: https://lore.kernel.org/linux-rockchip/9736eadf6a9d8e97eef9=
19c6b3d88828@manjaro.org/T/#t
   =20
    [1] https://lore.kernel.org/linux-rockchip/d019761504b540600d9fc7a585d6=
f95f@manjaro.org
    [2] https://lore.kernel.org/linux-rockchip/CAPj87rOM=3Dj0zmuWL9frGKV1xz=
PbJrk=3DQ9ip7F_HAPYnbCqPouw@mail.gmail.com
    [3] https://lore.kernel.org/linux-rockchip/7d998e4c-e1d3-4e8b-af76-c5bc=
83b43647@rock-chips.com

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 161 +++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |   5 +
 2 files changed, 166 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm=
/rockchip/rockchip_drm_vop2.c
index 9873172e3fd3..a6a2d7df5ecc 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -278,6 +278,15 @@ static u32 vop2_readl(struct vop2 *vop2, u32 offset)
 =09return val;
 }
=20
+static u32 vop2_vp_read(struct vop2_video_port *vp, u32 offset)
+{
+=09u32 val;
+
+=09regmap_read(vp->vop2->map, vp->data->offset + offset, &val);
+
+=09return val;
+}
+
 static void vop2_win_write(const struct vop2_win *win, unsigned int reg, u=
32 v)
 {
 =09regmap_field_write(win->reg[reg], v);
@@ -998,6 +1007,55 @@ static void vop2_disable(struct vop2 *vop2)
 =09clk_disable_unprepare(vop2->hclk);
 }
=20
+static bool vop2_vp_dsp_lut_is_enabled(struct vop2_video_port *vp)
+{
+=09return (u32) (vop2_vp_read(vp, RK3568_VP_DSP_CTRL) & RK3568_VP_DSP_CTRL=
__DSP_LUT_EN) >
+=09    0;
+}
+
+static void vop2_vp_dsp_lut_disable(struct vop2_video_port *vp)
+{
+=09u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
+
+=09dsp_ctrl &=3D ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
+=09vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
+}
+
+static bool vop2_vp_dsp_lut_poll_disable(struct vop2_video_port *vp)
+{
+=09u32 dsp_ctrl;
+=09int ret =3D readx_poll_timeout(vop2_vp_dsp_lut_is_enabled, vp, dsp_ctrl=
,
+=09=09=09=09!dsp_ctrl, 5, 30 * 1000);
+=09if (ret) {
+=09=09drm_err(vp->vop2->drm, "display LUT RAM enable timeout!\n");
+=09=09return false;
+=09}
+
+=09return true;
+}
+
+static void vop2_vp_dsp_lut_enable(struct vop2_video_port *vp)
+{
+=09u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
+
+=09dsp_ctrl |=3D RK3568_VP_DSP_CTRL__DSP_LUT_EN;
+=09vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
+}
+
+static void vop2_vp_dsp_lut_update_enable(struct vop2_video_port *vp)
+{
+=09u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
+
+=09dsp_ctrl |=3D RK3588_VP_DSP_CTRL__GAMMA_UPDATE_EN;
+=09vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
+}
+
+static inline bool vop2_supports_seamless_gamma_lut_update(struct vop2 *vo=
p2)
+{
+=09return (vop2->data->soc_id =3D=3D 3588);
+}
+
+
 static void vop2_crtc_atomic_disable(struct drm_crtc *crtc,
 =09=09=09=09     struct drm_atomic_state *state)
 {
@@ -1482,6 +1540,66 @@ static bool vop2_crtc_mode_fixup(struct drm_crtc *cr=
tc,
 =09return true;
 }
=20
+static void vop2_crtc_write_gamma_lut(struct vop2 *vop2, struct drm_crtc *=
crtc)
+{
+=09const struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
+=09const struct vop2_video_port_data *vp_data =3D &vop2->data->vp[vp->id];
+
+=09struct drm_color_lut *lut =3D crtc->state->gamma_lut->data;
+=09unsigned int i, bpc =3D ilog2(vp_data->gamma_lut_len);
+=09u32 word;
+
+=09for (i =3D 0; i < crtc->gamma_size; i++) {
+=09=09word =3D (drm_color_lut_extract(lut[i].blue, bpc) << (2 * bpc)) |
+=09=09    (drm_color_lut_extract(lut[i].green, bpc) << bpc) |
+=09=09    drm_color_lut_extract(lut[i].red, bpc);
+
+=09=09writel(word, vop2->lut_regs + i * 4);
+=09}
+}
+
+static void vop2_crtc_atomic_try_set_gamma(struct vop2 *vop2,
+=09=09=09=09=09struct vop2_video_port *vp,
+=09=09=09=09=09struct drm_crtc *crtc,
+=09=09=09=09=09struct drm_crtc_state *crtc_state)
+{
+
+=09if (vop2->lut_regs && crtc_state->color_mgmt_changed) {
+=09=09if (!crtc_state->gamma_lut) {
+=09=09=09vop2_vp_dsp_lut_disable(vp);
+=09=09=09return;
+=09=09}
+
+=09=09if (vop2_supports_seamless_gamma_lut_update(vop2)) {
+=09=09=09vop2_writel(vop2, RK3568_LUT_PORT_SEL, FIELD_PREP(
+=09=09=09=09RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL,
+=09=09=09=09vp->id));
+=09=09=09vop2_crtc_write_gamma_lut(vop2, crtc);
+=09=09=09vop2_vp_dsp_lut_enable(vp);
+=09=09=09vop2_vp_dsp_lut_update_enable(vp);
+=09=09} else {
+=09=09=09vop2_vp_dsp_lut_disable(vp);
+=09=09=09vop2_cfg_done(vp);
+=09=09=09if (!vop2_vp_dsp_lut_poll_disable(vp))
+=09=09=09=09return;
+
+=09=09=09vop2_writel(vop2, RK3568_LUT_PORT_SEL, vp->id);
+=09=09=09vop2_crtc_write_gamma_lut(vop2, crtc);
+=09=09=09vop2_vp_dsp_lut_enable(vp);
+=09=09}
+=09}
+}
+
+static inline void vop2_crtc_atomic_try_set_gamma_locked(struct vop2 *vop2=
,
+=09=09=09=09=09struct vop2_video_port *vp,
+=09=09=09=09=09struct drm_crtc *crtc,
+=09=09=09=09=09struct drm_crtc_state *crtc_state)
+{
+=09vop2_lock(vop2);
+=09vop2_crtc_atomic_try_set_gamma(vop2, vp, crtc, crtc_state);
+=09vop2_unlock(vop2);
+}
+
 static void vop2_dither_setup(struct drm_crtc *crtc, u32 *dsp_ctrl)
 {
 =09struct rockchip_crtc_state *vcstate =3D to_rockchip_crtc_state(crtc->st=
ate);
@@ -2057,11 +2175,35 @@ static void vop2_crtc_atomic_enable(struct drm_crtc=
 *crtc,
=20
 =09vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
=20
+=09vop2_crtc_atomic_try_set_gamma(vop2, vp, crtc, crtc_state);
+
 =09drm_crtc_vblank_on(crtc);
=20
 =09vop2_unlock(vop2);
 }
=20
+static int vop2_crtc_atomic_check_gamma(struct vop2_video_port *vp,
+=09=09=09=09=09struct drm_crtc *crtc,
+=09=09=09=09=09struct drm_atomic_state *state,
+=09=09=09=09=09struct drm_crtc_state *crtc_state)
+{
+=09struct vop2 *vop2 =3D vp->vop2;
+=09unsigned int len;
+
+=09if (!vp->vop2->lut_regs || !crtc_state->color_mgmt_changed ||
+=09    !crtc_state->gamma_lut)
+=09=09return 0;
+
+=09len =3D drm_color_lut_size(crtc_state->gamma_lut);
+=09if (len !=3D crtc->gamma_size) {
+=09=09drm_dbg(vop2->drm, "Invalid LUT size; got %d, expected %d\n",
+=09=09=09=09      len, crtc->gamma_size);
+=09=09return -EINVAL;
+=09}
+
+=09return 0;
+}
+
 static int vop2_crtc_atomic_check(struct drm_crtc *crtc,
 =09=09=09=09  struct drm_atomic_state *state)
 {
@@ -2069,6 +2211,11 @@ static int vop2_crtc_atomic_check(struct drm_crtc *c=
rtc,
 =09struct drm_plane *plane;
 =09int nplanes =3D 0;
 =09struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te, crtc);
+=09int ret;
+
+=09ret =3D vop2_crtc_atomic_check_gamma(vp, crtc, state, crtc_state);
+=09if (ret)
+=09=09return ret;
=20
 =09drm_atomic_crtc_state_for_each_plane(plane, crtc_state)
 =09=09nplanes++;
@@ -2456,9 +2603,12 @@ static void vop2_setup_dly_for_windows(struct vop2 *=
vop2)
 =09vop2_writel(vop2, RK3568_SMART_DLY_NUM, sdly);
 }
=20
+
 static void vop2_crtc_atomic_begin(struct drm_crtc *crtc,
 =09=09=09=09   struct drm_atomic_state *state)
 {
+=09struct drm_crtc_state *crtc_state =3D
+=09=09drm_atomic_get_new_crtc_state(state, crtc);
 =09struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
 =09struct vop2 *vop2 =3D vp->vop2;
 =09struct drm_plane *plane;
@@ -2482,6 +2632,11 @@ static void vop2_crtc_atomic_begin(struct drm_crtc *=
crtc,
 =09vop2_setup_layer_mixer(vp);
 =09vop2_setup_alpha(vp);
 =09vop2_setup_dly_for_windows(vop2);
+
+=09// NOTE: in case of modeset gamma lut update
+=09// already happened in atomic enable
+=09if (!drm_atomic_crtc_needs_modeset(crtc_state))
+=09=09vop2_crtc_atomic_try_set_gamma_locked(vop2, vp, crtc, crtc_state);
 }
=20
 static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
@@ -2790,7 +2945,13 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 =09=09}
=20
 =09=09drm_crtc_helper_add(&vp->crtc, &vop2_crtc_helper_funcs);
+=09=09if (vop2->lut_regs && vp->crtc.dev !=3D NULL) {
+=09=09=09const struct vop2_video_port_data *vp_data =3D &vop2_data->vp[vp-=
>id];
=20
+=09=09=09drm_mode_crtc_set_gamma_size(&vp->crtc, vp_data->gamma_lut_len);
+=09=09=09drm_crtc_enable_color_mgmt(&vp->crtc, 0, false,
+=09=09=09=09=09=09   vp_data->gamma_lut_len);
+=09=09}
 =09=09init_completion(&vp->dsp_hold_completion);
 =09}
=20
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm=
/rockchip/rockchip_drm_vop2.h
index 615a16196aff..510dda6f9092 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -394,6 +394,7 @@ enum dst_factor_mode {
 #define RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN=09=09BIT(15)
=20
 #define RK3568_VP_DSP_CTRL__STANDBY=09=09=09BIT(31)
+#define RK3568_VP_DSP_CTRL__DSP_LUT_EN=09=09=09BIT(28)
 #define RK3568_VP_DSP_CTRL__DITHER_DOWN_MODE=09=09BIT(20)
 #define RK3568_VP_DSP_CTRL__DITHER_DOWN_SEL=09=09GENMASK(19, 18)
 #define RK3568_VP_DSP_CTRL__DITHER_DOWN_EN=09=09BIT(17)
@@ -408,6 +409,8 @@ enum dst_factor_mode {
 #define RK3568_VP_DSP_CTRL__CORE_DCLK_DIV=09=09BIT(4)
 #define RK3568_VP_DSP_CTRL__OUT_MODE=09=09=09GENMASK(3, 0)
=20
+#define RK3588_VP_DSP_CTRL__GAMMA_UPDATE_EN=09=09BIT(22)
+
 #define RK3588_VP_CLK_CTRL__DCLK_OUT_DIV=09=09GENMASK(3, 2)
 #define RK3588_VP_CLK_CTRL__DCLK_CORE_DIV=09=09GENMASK(1, 0)
=20
@@ -460,6 +463,8 @@ enum dst_factor_mode {
 #define RK3588_DSP_IF_POL__DP1_PIN_POL=09=09=09GENMASK(14, 12)
 #define RK3588_DSP_IF_POL__DP0_PIN_POL=09=09=09GENMASK(10, 8)
=20
+#define RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL=09GENMASK(13, 12)
+
 #define RK3568_VP0_MIPI_CTRL__DCLK_DIV2_PHASE_LOCK=09BIT(5)
 #define RK3568_VP0_MIPI_CTRL__DCLK_DIV2=09=09=09BIT(4)
=20
--=20
2.47.0


