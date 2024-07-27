Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531F093EE46
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 09:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D3C10E310;
	Mon, 29 Jul 2024 07:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="mMd8LMcy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch
 [185.70.43.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0600A10E03E
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 17:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=wqr2p5rnn5hlrfu7vbs3syfx2q.protonmail; t=1722102285; x=1722361485;
 bh=QhVLypATs6LoKzU1QSk1WY58Mm3TF8AwxlQoMqadsB8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=mMd8LMcyPdwjZAtYcbghoMoubpEkd7vxpG4QArBO40+EOT2QksUvQmUuFHMj2n5Ty
 wSm208Mf+B2b4an/E/7AFNFeLQkenYUeCIaScGZ1Ad54FRy441WhFs5AawjyM1EnSC
 H5X5I53QIiNWMXivkm52lpPDrLL33Dlh6vFpaXXXBWhB81sl345hWARtumYQ1+wLBs
 yJSbTex/ugdzpcFLhJLT2S9Oc5A0PxIE3XzF7+qXK/1DyCocAiuEa5NqZ4gN/OPNzT
 EuJWxyOLzUPHfGEjPZWPz/cuK6SKKQJlPT07pcJKuItMMbrnImbsplkDwhvzLRgoSR
 YfED785bCSUnw==
Date: Sat, 27 Jul 2024 17:44:39 +0000
To: Daniel Stone <daniel@fooishbar.org>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: "airlied@gmail.com" <airlied@gmail.com>,
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
Subject: Re: [PATCH v3] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <iK93HIUOzw25uDw1H2qJ2uwmrUfdjSNKoK3JTPnPmye49SOdN7H_XAZIT-mFZpx1wc9nVJ_bIASP5PbXBIbovsRdEMW80QJX-lnkyvViWFI=@proton.me>
In-Reply-To: <CAPj87rOM=j0zmuWL9frGKV1xzPbJrk=Q9ip7F_HAPYnbCqPouw@mail.gmail.com>
References: <TkgKVivuaLFLILPY-n3iZo_8KF-daKdqdu-0_e0HP-5Ar_8DALDeNWog2suwWKjX7eomcbGET0KZe7DlzdhK2YM6CbLbeKeFZr-MJzJMtw0=@proton.me>
 <CAPj87rPwJ-vRTsjM1rWRj1gyjbJM_ryrkTiPRBF3ZF1D7TVDYw@mail.gmail.com>
 <PGDz1uKmBh2U_yB-ut5xcahPHdmxgrIRAwALnJzsEHFuYssmMhQUz8jbHpEyUDBMjVbmQCjlP3K4gbzw3zZ53HhXUsXufBb5YzptnC58aeQ=@proton.me>
 <CAPj87rOM=j0zmuWL9frGKV1xzPbJrk=Q9ip7F_HAPYnbCqPouw@mail.gmail.com>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: ff9273a8a210d1cf69f9f0e3f33f30657d70a104
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 29 Jul 2024 07:16:05 +0000
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

On Friday, July 26th, 2024 at 1:31 PM, Daniel Stone <daniel@fooishbar.org> =
wrote:

> Hi Piotr,

Hi Daniel, sorry for delayed response.

>
> > static void vop2_dither_setup(struct drm_crtc *crtc, u32 *dsp_ctrl)
> > @@ -2152,6 +2127,9 @@ static void vop2_crtc_atomic_enable(struct drm_cr=
tc *crtc,
> >
> > vop2_post_config(crtc);
> >
> > + if (crtc->state->gamma_lut)
> > + vop2_crtc_gamma_set(vop2, crtc, old_state, &dsp_ctrl);
>
>
> I think this call should be unconditional, so that we correctly
> program LUT_DIS if there is no LUT set up during enable.
>

Noted

> > @@ -2599,8 +2575,17 @@ static void vop2_crtc_atomic_begin(struct drm_cr=
tc *crtc,
> > vop2_setup_alpha(vp);
> > vop2_setup_dly_for_windows(vop2);
> >
> > - if (crtc_state->color_mgmt_changed && !crtc_state->active_changed)
> > - vop2_crtc_gamma_set(vop2, crtc, old_crtc_state);
> > + if (crtc_state->color_mgmt_changed && !crtc_state->active_changed) {
> > + u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);;
> > +
> > + vop2_lock(vop2);
> > +
> > + vop2_crtc_gamma_set(vop2, crtc, old_crtc_state, &dsp_ctrl);
> > +
> > + vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> > + vop2_cfg_done(vp);
> > + vop2_unlock(vop2);
> > + }
>
>
> Calling lock/set/write/done/unlock here seems like an anti-pattern;
> the cfg_done is already written in atomic_flush, so at least that part
> is not necessary.

Right sorry for sending such code. I wanted to demonstrate the idea.

> On platforms like RK3588, it looks like the new LUT can just be
> written directly from atomic_begin without needing to program
> DSP_CTRL, take locks, or synchronise against anything, so that should
> be an easy straight-line path.
>
> On platforms like RK3568, it would probably be better to set
> mode_changed when the colour management configuration changes. That
> will give you a good point to synchronise the cross-VOP dependencies
> (i.e. claim or release the shared LUT when it is being
> enabled/disabled), and also a hint to userspace that it is not going
> to be a seamless transition as the LUT is disabled, programmed, then
> re-enabled.
>
> I think this would end up in a net reduction of LoC as well as a net
> reduction of code weirdness.

Okay so if I understood you correctly you suggest setting mode_changed in=
=20
order to trigger full modeset (check->begin->flush->enable) to cleanly=20
handle the RK356x case and for RK3588 just write the LUT in begin and=20
don't do anything more.

I tried to do this but couldn't get the thing to work. It seems like=20
setting the mode_changed manually in atomic_check, messes something up=20
with the CRTC states. Namely, the retrieved new state in subsequent=20
atomic_begin call isn't the same state (as a result, flags=20
color_mgmt_changed and mode_changed are both false when they are checked=20
in atomic_begin which stops further gamma LUT reconfiguration). Below is=20
how I reworked this (included only parts which changed).

As already mentioned, in atomic check the mode_changed flag is set, then in=
=20
atomic begin gamma LUT is disabled and DSP_LUT_EN bit unset (or gamma LUT=
=20
is written directly based on if it's RK356x or not). Then in atomic_flush=
=20
video port is selected and gamma LUT is written. Gamma LUT is enabled in=20
atomic_enable.

Perhaps I'm missing something important, if so please hint what exactly.=20

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm=
/rockchip/rockchip_drm_vop2.c
index 9873172e3fd3..9c5ee2d85a58 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2051,6 +2092,13 @@ static void vop2_crtc_atomic_enable(struct drm_crtc =
*crtc,
=20
 =09clk_set_rate(vp->dclk, clock);
=20
+=09/**
+=09 * Enable gamma LUT in atomic enable
+=09 */
+=09if (crtc_state->gamma_lut && (vop2->data->soc_id =3D=3D 3566 ||
+=09=09=09=09      vop2->data->soc_id =3D=3D 3568))
+=09=09dsp_ctrl |=3D RK3568_VP_DSP_CTRL__DSP_LUT_EN;
+
 =09vop2_post_config(crtc);
=20
 =09vop2_cfg_done(vp);
@@ -2062,6 +2110,39 @@ static void vop2_crtc_atomic_enable(struct drm_crtc =
*crtc,
 =09vop2_unlock(vop2);
 }
=20
+static int vop2_crtc_atomic_check_gamma(struct vop2_video_port *vp,
+=09=09=09=09=09struct drm_crtc *crtc,
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
+=09=09DRM_DEBUG_KMS("Invalid LUT size; got %d, expected %d\n",
+=09=09=09=09      len, crtc->gamma_size);
+=09=09return -EINVAL;
+=09}
+
+=09if (!crtc_state->mode_changed && (vop2->data->soc_id =3D=3D 3566 ||
+=09=09=09=09=09  vop2->data->soc_id =3D=3D 3568)) {
+=09=09int ret;
+
+=09=09crtc_state->mode_changed =3D true;
+
+=09=09ret =3D drm_atomic_helper_check_modeset(crtc->dev,
+=09=09=09=09crtc_state->state);
+=09=09if (ret)
+=09=09=09return ret;
+=09}
+
+=09return 0;
+}
+
 static int vop2_crtc_atomic_check(struct drm_crtc *crtc,
 =09=09=09=09  struct drm_atomic_state *state)
 {
@@ -2069,6 +2150,11 @@ static int vop2_crtc_atomic_check(struct drm_crtc *c=
rtc,
 =09struct drm_plane *plane;
 =09int nplanes =3D 0;
 =09struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te, crtc);
+=09int ret;
+
+=09ret =3D vop2_crtc_atomic_check_gamma(vp, crtc, crtc_state);
+=09if (ret)
+=09=09return ret;
=20
 =09drm_atomic_crtc_state_for_each_plane(plane, crtc_state)
 =09=09nplanes++;
@@ -2456,9 +2542,36 @@ static void vop2_setup_dly_for_windows(struct vop2 *=
vop2)
 =09vop2_writel(vop2, RK3568_SMART_DLY_NUM, sdly);
 }
=20
+static void vop2_crtc_atomic_begin_gamma(struct vop2 *vop2,
+=09=09=09=09=09struct drm_crtc *crtc) {
+=09struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
+=09int ret;
+=09u32 dsp_ctrl;
+
+=09vop2_lock(vop2);
+=09/**
+=09 * Gamma lut always has to be disabled in both cases. When gamma
+=09 * lut is enabled it needs to be disabled before writing (Applies
+=09 * only to RK356x SoCs).
+=09 */
+=09vop2_vp_dsp_lut_disable(vp);
+
+=09vop2_cfg_done(vp);
+=09vop2_unlock(vop2);
+
+=09ret =3D readx_poll_timeout(vop2_vp_dsp_lut_is_enabled, vp, dsp_ctrl,
+=09=09=09!dsp_ctrl, 5, 30 * 1000);
+=09if (ret) {
+=09=09DRM_DEV_ERROR(vop2->dev,
+=09=09=09"display LUT RAM enable timeout!\n");
+=09}
+}
+
 static void vop2_crtc_atomic_begin(struct drm_crtc *crtc,
 =09=09=09=09   struct drm_atomic_state *state)
 {
+=09struct drm_crtc_state *crtc_state =3D
+=09=09drm_atomic_get_new_crtc_state(state, crtc);
 =09struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
 =09struct vop2 *vop2 =3D vp->vop2;
 =09struct drm_plane *plane;
@@ -2482,13 +2595,50 @@ static void vop2_crtc_atomic_begin(struct drm_crtc =
*crtc,
 =09vop2_setup_layer_mixer(vp);
 =09vop2_setup_alpha(vp);
 =09vop2_setup_dly_for_windows(vop2);
+
+=09if (crtc_state->color_mgmt_changed && !crtc_state->active_changed) {
+=09=09/**
+=09=09 * When the SoC is RK356x gamma lut change always triggers
+=09=09 * mode_changed - proceed with gamma lut disable
+=09=09 */
+=09=09if (crtc_state->mode_changed &&
+=09=09    (vop2->data->soc_id =3D=3D 3566 ||
+=09=09     vop2->data->soc_id =3D=3D 3568))
+=09=09=09vop2_crtc_atomic_begin_gamma(vop2, crtc);
+=09=09/**
+=09=09 * When the Soc isn't RK356x (eg. RK3588) gamma lut can be
+=09=09 * written directly
+=09=09 */
+=09=09else if (crtc_state->gamma_lut)
+=09=09=09vop2_crtc_write_gamma_lut(vop2, crtc);
+=09}
+}
+
+static void vop2_crtc_atomic_flush_gamma(struct vop2 *vop2, struct vop2_vi=
deo_port *vp, struct drm_crtc *crtc)
+{
+=09if (vop2->data->soc_id =3D=3D 3566 || vop2->data->soc_id =3D=3D 3568) {
+=09=09vop2_lock(vop2);
+
+=09=09vop2_crtc_write_gamma_lut(vop2, crtc);
+=09=09vop2_writel(vp->vop2, RK3568_LUT_PORT_SEL, vp->id);
+
+=09=09vop2_unlock(vop2);
+=09}
 }
=20
 static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
 =09=09=09=09   struct drm_atomic_state *state)
 {
+=09struct drm_crtc_state *crtc_state =3D
+=09=09drm_atomic_get_new_crtc_state(state, crtc);
 =09struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
=20
+=09/**
+=09 * Write gamma LUT in atomic flush
+=09 */
+=09if (crtc_state->mode_changed && crtc_state->gamma_lut)
+=09=09vop2_crtc_atomic_flush_gamma(vp->vop2, vp, crtc);
+
 =09vop2_post_config(crtc);
=20
 =09vop2_cfg_done(vp);

