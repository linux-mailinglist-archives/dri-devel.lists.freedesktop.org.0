Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EC293CEE9
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 09:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9AF10E1AB;
	Fri, 26 Jul 2024 07:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="ku5ajV0Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 75237 seconds by postgrey-1.36 at gabe;
 Thu, 25 Jul 2024 19:06:31 UTC
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch
 [185.70.43.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C63E10E28E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 19:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1721934389; x=1722193589;
 bh=x81TfLwbeRD7LO1ywJlnBHjBlqnbvQnAgiDB8r7qObQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ku5ajV0Y0RHq30r7SirfHs6StZZSZ7OkbzbAwEYhmNyH0GvHypT0q6andmEXTILg+
 jS2eVKbTle2HUONQfPGqzEDFLsTUaBbirmGCPhUjZiReINPATEuoXFyGcNydOvog8K
 GQqrPYQ3vCMmGPAlE7H7Rn1As0CA0+UYB6mvKDwrCbpRBoapteifXJViyhvT9wMaQS
 1qc8bIZ+M7xcH3XsaN5kIbUpHJsB+mvnlwIQLxFv61vaHHI0DUHRmk/7qKngg4q4cl
 jSnlp1Zd6yUZQ6IMCJfpLqel6H5eOgsEK1Mhdmz9g7krz7LoBGrF65EcN/7g9oKQnX
 KQ3PErfuhs+lg==
Date: Thu, 25 Jul 2024 19:06:23 +0000
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
Message-ID: <PGDz1uKmBh2U_yB-ut5xcahPHdmxgrIRAwALnJzsEHFuYssmMhQUz8jbHpEyUDBMjVbmQCjlP3K4gbzw3zZ53HhXUsXufBb5YzptnC58aeQ=@proton.me>
In-Reply-To: <CAPj87rPwJ-vRTsjM1rWRj1gyjbJM_ryrkTiPRBF3ZF1D7TVDYw@mail.gmail.com>
References: <TkgKVivuaLFLILPY-n3iZo_8KF-daKdqdu-0_e0HP-5Ar_8DALDeNWog2suwWKjX7eomcbGET0KZe7DlzdhK2YM6CbLbeKeFZr-MJzJMtw0=@proton.me>
 <CAPj87rPwJ-vRTsjM1rWRj1gyjbJM_ryrkTiPRBF3ZF1D7TVDYw@mail.gmail.com>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: e0ffaa85b1c367437802927356ee731dc03456bd
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 26 Jul 2024 07:37:29 +0000
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



On Thursday, July 25th, 2024 at 12:28 PM, Daniel Stone <daniel@fooishbar.or=
g> wrote:

> Hi Piotr,

Hi, Daniel!

Thank you for the review.

>=20
> In the atomic_enable callback, we are already holding the VOP lock,
> and waiting to set cfg_done etc - we then do it all over again here.
> This should all be atomic, so that we configure the LUT whilst doing
> the setup, and then only call cfg_done once, to avoid showing the user
> intermediate states which only later converge on the desired final
> state.
>=20

I based my patch on how gamma LUT is handled in VOP. There, in atomic=20
enable, gamma LUT write takes places at the end too, after the mutex was=20
already first-time unlocked. I understand the concept of DRM atomic state=
=20
updates and what you wrote makes sense.

Below is what I came up with to make it fulfill atomicity requirement.=20
Frankly, the code ended up simpler. I tested it on RK3566 (Pinetab2).
Let me know what do you think.

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm=
/rockchip/rockchip_drm_vop2.c
index 37fcf544a5fd..cba92239dcbc 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1497,22 +1497,6 @@ static bool vop2_vp_dsp_lut_is_enabled(struct vop2_v=
ideo_port *vp)
 =09    0;
 }
=20
-static void vop2_vp_dsp_lut_enable(struct vop2_video_port *vp)
-{
-=09u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
-
-=09dsp_ctrl |=3D RK3568_VP_DSP_CTRL__DSP_LUT_EN;
-=09vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
-}
-
-static void vop2_vp_dsp_lut_disable(struct vop2_video_port *vp)
-{
-=09u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
-
-=09dsp_ctrl &=3D ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
-=09vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
-}
-
 static void vop2_crtc_write_gamma_lut(struct vop2 *vop2, struct drm_crtc *=
crtc)
 {
 =09const struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
@@ -1532,11 +1516,12 @@ static void vop2_crtc_write_gamma_lut(struct vop2 *=
vop2, struct drm_crtc *crtc)
 }
=20
 static void vop2_crtc_gamma_set(struct vop2 *vop2, struct drm_crtc *crtc,
-=09=09=09=09struct drm_crtc_state *old_state)
+=09=09=09=09struct drm_crtc_state *old_state,
+=09=09=09=09u32* dsp_ctrl)
 {
 =09struct drm_crtc_state *state =3D crtc->state;
 =09struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
-=09u32 dsp_ctrl;
+=09u32 _dsp_ctrl;
 =09int ret;
=20
 =09if (!vop2->lut_regs)
@@ -1547,37 +1532,27 @@ static void vop2_crtc_gamma_set(struct vop2 *vop2, =
struct drm_crtc *crtc,
 =09=09 * To disable gamma (gamma_lut is null) or to write
 =09=09 * an update to the LUT, clear dsp_lut_en.
 =09=09 */
-=09=09vop2_lock(vop2);
-
-=09=09vop2_vp_dsp_lut_disable(vp);
-
-=09=09vop2_cfg_done(vp);
-=09=09vop2_unlock(vop2);
-=09=09/*
-=09=09 * In order to write the LUT to the internal memory,
-=09=09 * we need to first make sure the dsp_lut_en bit is cleared.
-=09=09 */
-=09=09ret =3D readx_poll_timeout(vop2_vp_dsp_lut_is_enabled, vp, dsp_ctrl,
-=09=09=09=09!dsp_ctrl, 5, 30 * 1000);
-
-=09=09if (ret) {
-=09=09=09DRM_DEV_ERROR(vop2->dev, "display LUT RAM enable timeout!\n");
-=09=09=09return;
-=09=09}
+=09=09*dsp_ctrl &=3D ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
=20
 =09=09if (!state->gamma_lut)
 =09=09=09return;
 =09}
=20
+=09/*
+=09 * In order to write the LUT to the internal memory,
+=09 * we need to first make sure the dsp_lut_en bit is cleared.
+=09 */
+=09ret =3D readx_poll_timeout(vop2_vp_dsp_lut_is_enabled, vp, _dsp_ctrl,
+=09=09=09!_dsp_ctrl, 5, 30 * 1000);
+=09if (ret) {
+=09=09DRM_DEV_ERROR(vop2->dev, "display LUT RAM enable timeout!\n");
+=09=09return;
+=09}
=20
-=09vop2_lock(vop2);
 =09vop2_crtc_write_gamma_lut(vop2, crtc);
 =09vop2_writel(vp->vop2, RK3568_LUT_PORT_SEL, vp->id);
=20
-=09vop2_vp_dsp_lut_enable(vp);
-
-=09vop2_cfg_done(vp);
-=09vop2_unlock(vop2);
+=09*dsp_ctrl |=3D RK3568_VP_DSP_CTRL__DSP_LUT_EN;
 }
=20
 static void vop2_dither_setup(struct drm_crtc *crtc, u32 *dsp_ctrl)
@@ -2152,6 +2127,9 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *=
crtc,
=20
 =09vop2_post_config(crtc);
=20
+=09if (crtc->state->gamma_lut)
+=09=09vop2_crtc_gamma_set(vop2, crtc, old_state, &dsp_ctrl);
+
 =09vop2_cfg_done(vp);
=20
 =09vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
@@ -2160,8 +2138,6 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *=
crtc,
=20
 =09vop2_unlock(vop2);
=20
-=09if (crtc->state->gamma_lut)
-=09=09vop2_crtc_gamma_set(vop2, crtc, old_state);
 }
=20
 static int vop2_crtc_atomic_check(struct drm_crtc *crtc,
@@ -2599,8 +2575,17 @@ static void vop2_crtc_atomic_begin(struct drm_crtc *=
crtc,
 =09vop2_setup_alpha(vp);
 =09vop2_setup_dly_for_windows(vop2);
=20
-=09if (crtc_state->color_mgmt_changed && !crtc_state->active_changed)
-=09=09vop2_crtc_gamma_set(vop2, crtc, old_crtc_state);
+=09if (crtc_state->color_mgmt_changed && !crtc_state->active_changed) {
+=09=09u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);;
+
+=09=09vop2_lock(vop2);
+
+=09=09vop2_crtc_gamma_set(vop2, crtc, old_crtc_state, &dsp_ctrl);
+
+=09=09vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
+=09=09vop2_cfg_done(vp);
+=09=09vop2_unlock(vop2);
+=09}
 }
=20
 static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,


Best regards, Piotr Zalewski
