Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E420693B82D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 22:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFBB10E109;
	Wed, 24 Jul 2024 20:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="SXHfdTki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BE310E79B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 19:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1721847972; x=1722107172;
 bh=xXyqPAWiPGTlRuUl6Au8Vf9PuxCMIzRAhei2a3kfeEc=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=SXHfdTkirkEZ7voqfB1b9hCVgNVFDCeiog1HpomvahB/1qkgF/apiVYgqfMBlNNLX
 ibac/UXQF/TynZ5If8hwimNQaDS+i/pGgl9bpmstV+AAr1eNbzDFjz1EGOA8KwCnMm
 I3p0Tj/4sjm6mJ8KslR1bgdYMTCjfVFaE43oK+aLmzM4XEMjf/8e3BDTgfP125e29N
 oz9vncaAOwRbr9WxYFNtORrtN4BDBJqR/U3jmrQ+hqbEVejnSuFmncEgcQMnTVZDAu
 lnP8LvcOxQz0tKnHGZ1NqLBJ6dvK8no3vkkte3/hiUiq2udoFv3FvnPMqj2+vfwxx1
 73KoCFUrOPhtg==
Date: Wed, 24 Jul 2024 19:06:01 +0000
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
Subject: [PATCH v2] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <Hk03HDb6wSSHWtEFZHUye06HR0-9YzP5nCHx9A8_kHzWSZawDrU1o1pjEGkCOJFoRg0nTB4BWEv6V0XBOjF4-0Mj44lp2TrjaQfnytzp-Pk=@proton.me>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 2763f33b849810a95c08efa9a15f31ec8564793e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 24 Jul 2024 20:43:44 +0000
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
    Changes in v2:
        - Apply code styling corrections [1]
        - Move gamma LUT write inside the vop2 lock
   =20
    Link to v1: https://lore.kernel.org/linux-rockchip/9736eadf6a9d8e97eef9=
19c6b3d88828@manjaro.org/T/#t
   =20
    [1] https://lore.kernel.org/linux-rockchip/d019761504b540600d9fc7a585d6=
f95f@manjaro.org/

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm=
/rockchip/rockchip_drm_vop2.c
index 16abdc4a59a8..37fcf544a5fd 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1515,9 +1515,8 @@ static void vop2_vp_dsp_lut_disable(struct vop2_video=
_port *vp)
=20
 static void vop2_crtc_write_gamma_lut(struct vop2 *vop2, struct drm_crtc *=
crtc)
 {
-=09const struct vop2_data *vop2_data =3D vop2->data;
 =09const struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
-=09const struct vop2_video_port_data *vp_data =3D &vop2_data->vp[vp->id];
+=09const struct vop2_video_port_data *vp_data =3D &vop2->data->vp[vp->id];
=20
 =09struct drm_color_lut *lut =3D crtc->state->gamma_lut->data;
 =09unsigned int i, bpc =3D ilog2(vp_data->gamma_lut_len);
@@ -1558,9 +1557,8 @@ static void vop2_crtc_gamma_set(struct vop2 *vop2, st=
ruct drm_crtc *crtc,
 =09=09 * In order to write the LUT to the internal memory,
 =09=09 * we need to first make sure the dsp_lut_en bit is cleared.
 =09=09 */
-=09=09ret =3D
-=09=09    readx_poll_timeout(vop2_vp_dsp_lut_is_enabled, vp, dsp_ctrl, !ds=
p_ctrl, 5,
-=09=09=09=09       30 * 1000);
+=09=09ret =3D readx_poll_timeout(vop2_vp_dsp_lut_is_enabled, vp, dsp_ctrl,
+=09=09=09=09!dsp_ctrl, 5, 30 * 1000);
=20
 =09=09if (ret) {
 =09=09=09DRM_DEV_ERROR(vop2->dev, "display LUT RAM enable timeout!\n");
@@ -1571,9 +1569,9 @@ static void vop2_crtc_gamma_set(struct vop2 *vop2, st=
ruct drm_crtc *crtc,
 =09=09=09return;
 =09}
=20
-=09vop2_crtc_write_gamma_lut(vop2, crtc);
=20
 =09vop2_lock(vop2);
+=09vop2_crtc_write_gamma_lut(vop2, crtc);
 =09vop2_writel(vp->vop2, RK3568_LUT_PORT_SEL, vp->id);
=20
 =09vop2_vp_dsp_lut_enable(vp);

