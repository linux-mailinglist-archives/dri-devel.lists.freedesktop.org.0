Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AFD93BD40
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 09:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF7210E0DD;
	Thu, 25 Jul 2024 07:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="ObyB5NXq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 10779 seconds by postgrey-1.36 at gabe;
 Wed, 24 Jul 2024 22:05:53 UTC
Received: from mail-4027.protonmail.ch (mail-4027.protonmail.ch [185.70.40.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0B410E1CD
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 22:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1721858752; x=1722117952;
 bh=Ku5Kinv0bXpfAM8rUKfhniDPyYb2+o88Wn2r102s25A=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=ObyB5NXqc46rnOvEGYig8HGw2rHLfsPjEAVJCq7OCPyMc59iGA9a9olTCmQTnIE8V
 MVEFq8zFfLlfojcYx9uh81FBphki0kZW6fC/snh2Y70SssM/dFemQfgNj8PHVyZgVf
 F3x4iuQMg2hJTkpkmZ/FbiOONQhDpBF4j7QGiZPRFvuul9JX3m1boVNYpRKVuU2y8f
 fOp3gO3nM/47YbPwPy+VlrYXf0eiIbhm965uDzzJb38huBPWQvgrjX3cRoHNqwvYkv
 sN0fCFeZO8V7MQ8qReSDVnzqTkrjUMFMKtGMiMUVnL+SHZaODg/Wp56POKXY/rofOh
 GN4mUjbMA/O1w==
Date: Wed, 24 Jul 2024 22:05:45 +0000
To: "airlied@gmail.com" <airlied@gmail.com>,
 "andy.yan@rock-chips.com" <andy.yan@rock-chips.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "heiko@sntech.de" <heiko@sntech.de>, "hjc@rock-chips.com" <hjc@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
From: Piotr Zalewski <pZ010001011111@proton.me>
Subject: [PATCH v3] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <TkgKVivuaLFLILPY-n3iZo_8KF-daKdqdu-0_e0HP-5Ar_8DALDeNWog2suwWKjX7eomcbGET0KZe7DlzdhK2YM6CbLbeKeFZr-MJzJMtw0=@proton.me>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 569d9fa073fa2aff17121429bca20eed88154b0f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 25 Jul 2024 07:43:29 +0000
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

Add support for gamma LUT in VOP2 driver. The implementation is based on
the one found in VOP driver and modified to be compatible with VOP2. Blue
and red channels in gamma LUT register write were swapped with respect to
how gamma LUT values are written in VOP. Write of the current video port id
to VOP2_SYS_LUT_PORT_SEL register was added before the write of DSP_LUT_EN
bit. Gamma size is set and drm color management is enabled for each video
port's CRTC except ones which have no associated device. Tested on RK3566
(Pinetab2).

Helped-by: Dragan Simic <dsimic@manjaro.org>
Signed-off-by: Piotr Zalewski <pZ010001011111@proton.me>
---

Notes:
    Changes in v3:
        - v3 is patch v2 "resend", by mistake the incremental patch were
        sent in v2

    Changes in v2:
        - Apply code styling corrections [1]
        - Move gamma LUT write inside the vop2 lock

    Link to v2: https://lore.kernel.org/linux-rockchip/Hk03HDb6wSSHWtEFZHUy=
e06HR0-9YzP5nCHx9A8_kHzWSZawDrU1o1pjEGkCOJFoRg0nTB4BWEv6V0XBOjF4-0Mj44lp2Tr=
jaQfnytzp-Pk=3D@proton.me/T/#u
    Link to v1: https://lore.kernel.org/linux-rockchip/9736eadf6a9d8e97eef9=
19c6b3d88828@manjaro.org/T/#t

    [1] https://lore.kernel.org/linux-rockchip/d019761504b540600d9fc7a585d6=
f95f@manjaro.org/

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm=
/rockchip/rockchip_drm_vop2.c
index 9873172e3fd3..37fcf544a5fd 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -278,6 +278,15 @@ static u32 vop2_readl(struct vop2 *vop2, u32 offset)
 =09return val;
 }

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
@@ -1482,6 +1491,95 @@ static bool vop2_crtc_mode_fixup(struct drm_crtc *cr=
tc,
 =09return true;
 }

+static bool vop2_vp_dsp_lut_is_enabled(struct vop2_video_port *vp)
+{
+=09return (u32) (vop2_vp_read(vp, RK3568_VP_DSP_CTRL) & RK3568_VP_DSP_CTRL=
__DSP_LUT_EN) >
+=09    0;
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
+static void vop2_vp_dsp_lut_disable(struct vop2_video_port *vp)
+{
+=09u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
+
+=09dsp_ctrl &=3D ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
+=09vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
+}
+
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
+static void vop2_crtc_gamma_set(struct vop2 *vop2, struct drm_crtc *crtc,
+=09=09=09=09struct drm_crtc_state *old_state)
+{
+=09struct drm_crtc_state *state =3D crtc->state;
+=09struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
+=09u32 dsp_ctrl;
+=09int ret;
+
+=09if (!vop2->lut_regs)
+=09=09return;
+
+=09if (!state->gamma_lut) {
+=09=09/*
+=09=09 * To disable gamma (gamma_lut is null) or to write
+=09=09 * an update to the LUT, clear dsp_lut_en.
+=09=09 */
+=09=09vop2_lock(vop2);
+
+=09=09vop2_vp_dsp_lut_disable(vp);
+
+=09=09vop2_cfg_done(vp);
+=09=09vop2_unlock(vop2);
+=09=09/*
+=09=09 * In order to write the LUT to the internal memory,
+=09=09 * we need to first make sure the dsp_lut_en bit is cleared.
+=09=09 */
+=09=09ret =3D readx_poll_timeout(vop2_vp_dsp_lut_is_enabled, vp, dsp_ctrl,
+=09=09=09=09!dsp_ctrl, 5, 30 * 1000);
+
+=09=09if (ret) {
+=09=09=09DRM_DEV_ERROR(vop2->dev, "display LUT RAM enable timeout!\n");
+=09=09=09return;
+=09=09}
+
+=09=09if (!state->gamma_lut)
+=09=09=09return;
+=09}
+
+
+=09vop2_lock(vop2);
+=09vop2_crtc_write_gamma_lut(vop2, crtc);
+=09vop2_writel(vp->vop2, RK3568_LUT_PORT_SEL, vp->id);
+
+=09vop2_vp_dsp_lut_enable(vp);
+
+=09vop2_cfg_done(vp);
+=09vop2_unlock(vop2);
+}
+
 static void vop2_dither_setup(struct drm_crtc *crtc, u32 *dsp_ctrl)
 {
 =09struct rockchip_crtc_state *vcstate =3D to_rockchip_crtc_state(crtc->st=
ate);
@@ -1925,6 +2023,7 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *=
crtc,
 =09const struct vop2_data *vop2_data =3D vop2->data;
 =09const struct vop2_video_port_data *vp_data =3D &vop2_data->vp[vp->id];
 =09struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te, crtc);
+=09struct drm_crtc_state *old_state =3D drm_atomic_get_old_crtc_state(stat=
e, crtc);
 =09struct rockchip_crtc_state *vcstate =3D to_rockchip_crtc_state(crtc->st=
ate);
 =09struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;
 =09unsigned long clock =3D mode->crtc_clock * 1000;
@@ -2060,6 +2159,9 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *=
crtc,
 =09drm_crtc_vblank_on(crtc);

 =09vop2_unlock(vop2);
+
+=09if (crtc->state->gamma_lut)
+=09=09vop2_crtc_gamma_set(vop2, crtc, old_state);
 }

 static int vop2_crtc_atomic_check(struct drm_crtc *crtc,
@@ -2070,6 +2172,16 @@ static int vop2_crtc_atomic_check(struct drm_crtc *c=
rtc,
 =09int nplanes =3D 0;
 =09struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te, crtc);

+=09if (vp->vop2->lut_regs && crtc_state->color_mgmt_changed && crtc_state-=
>gamma_lut) {
+=09=09unsigned int len =3D drm_color_lut_size(crtc_state->gamma_lut);
+
+=09=09if (len !=3D crtc->gamma_size) {
+=09=09=09DRM_DEBUG_KMS("Invalid LUT size; got %d, expected %d\n",
+=09=09=09=09      len, crtc->gamma_size);
+=09=09=09return -EINVAL;
+=09=09}
+=09}
+
 =09drm_atomic_crtc_state_for_each_plane(plane, crtc_state)
 =09=09nplanes++;

@@ -2459,6 +2571,10 @@ static void vop2_setup_dly_for_windows(struct vop2 *=
vop2)
 static void vop2_crtc_atomic_begin(struct drm_crtc *crtc,
 =09=09=09=09   struct drm_atomic_state *state)
 {
+=09struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te,
+=09=09=09=09=09=09=09=09=09  crtc);
+=09struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_state=
(state,
+=09=09=09=09=09=09=09=09=09      crtc);
 =09struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
 =09struct vop2 *vop2 =3D vp->vop2;
 =09struct drm_plane *plane;
@@ -2482,6 +2598,9 @@ static void vop2_crtc_atomic_begin(struct drm_crtc *c=
rtc,
 =09vop2_setup_layer_mixer(vp);
 =09vop2_setup_alpha(vp);
 =09vop2_setup_dly_for_windows(vop2);
+
+=09if (crtc_state->color_mgmt_changed && !crtc_state->active_changed)
+=09=09vop2_crtc_gamma_set(vop2, crtc, old_crtc_state);
 }

 static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
@@ -2791,6 +2910,14 @@ static int vop2_create_crtcs(struct vop2 *vop2)

 =09=09drm_crtc_helper_add(&vp->crtc, &vop2_crtc_helper_funcs);

+=09=09if (vop2->lut_regs && vp->crtc.dev !=3D NULL) {
+=09=09=09const struct vop2_video_port_data *vp_data =3D &vop2_data->vp[vp-=
>id];
+
+=09=09=09drm_mode_crtc_set_gamma_size(&vp->crtc, vp_data->gamma_lut_len);
+=09=09=09drm_crtc_enable_color_mgmt(&vp->crtc, 0, false,
+=09=09=09=09=09=09   vp_data->gamma_lut_len);
+=09=09}
+
 =09=09init_completion(&vp->dsp_hold_completion);
 =09}

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm=
/rockchip/rockchip_drm_vop2.h
index 615a16196aff..3a58b73fa876 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -394,6 +394,7 @@ enum dst_factor_mode {
 #define RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN=09=09BIT(15)

 #define RK3568_VP_DSP_CTRL__STANDBY=09=09=09BIT(31)
+#define RK3568_VP_DSP_CTRL__DSP_LUT_EN=09=09=09BIT(28)
 #define RK3568_VP_DSP_CTRL__DITHER_DOWN_MODE=09=09BIT(20)
 #define RK3568_VP_DSP_CTRL__DITHER_DOWN_SEL=09=09GENMASK(19, 18)
 #define RK3568_VP_DSP_CTRL__DITHER_DOWN_EN=09=09BIT(17)
