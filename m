Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E19093BD41
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 09:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9284410E10C;
	Thu, 25 Jul 2024 07:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="Hjrg05yB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 11179 seconds by postgrey-1.36 at gabe;
 Wed, 24 Jul 2024 22:12:37 UTC
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7A410E1CD
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 22:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1721859152; x=1722118352;
 bh=Y3q6wyv95UM7ODxI2RYM+RBlxx/vpcUDxEO4RuJgGvM=;
 h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Hjrg05yBBbKhW+y7N3o+o2l2RJ8xux4D9Aj+922+MTbN++3dcDMSZwB14EblOPvBn
 +c1nleACvHtU3J4NGSeZst2APETa12J6yA3MCyyqkPwoYoQWyyxFNL/vg9AWs3T1aK
 Z27lisE3cT8NXwa8D8pT5n3FQVNXBMLYxqzpVMZHCniwnQeiWcm8//c04afG6vQI9z
 dDwN9jJYHFbpWX6QXgZDqQGz5JVHVLO7wVp3Z7YadPTBkoWDOZ+AMBIFe9pCHisjUJ
 /bLWKe2LW++u6fn/Xgit8CjAMvy5lmJMoRMSyTxhkOBhO6Q+H+vGnA+K0UlGpUYulC
 BVEgagzwBMraw==
Date: Wed, 24 Jul 2024 22:12:28 +0000
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
Subject: Re: [PATCH v2] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <hhaq0wCH5_DWz6vjiyTLV3TcEVzi5owdIWxl0El_y36yTo9hPPzAtKvzBuXvcXNTy3E_cT63jbG2QJn6kPE32ltoojplR-fd0JBukRCfA8U=@proton.me>
In-Reply-To: <Hk03HDb6wSSHWtEFZHUye06HR0-9YzP5nCHx9A8_kHzWSZawDrU1o1pjEGkCOJFoRg0nTB4BWEv6V0XBOjF4-0Mj44lp2TrjaQfnytzp-Pk=@proton.me>
References: <Hk03HDb6wSSHWtEFZHUye06HR0-9YzP5nCHx9A8_kHzWSZawDrU1o1pjEGkCOJFoRg0nTB4BWEv6V0XBOjF4-0Mj44lp2TrjaQfnytzp-Pk=@proton.me>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: aef39d10e8f770a96c9098bc69e9b2ade7178120
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

By mistake the incremental patch were sent here. The correct v2 patch was
sent in the form of a v3 patch [1]

[1] https://lore.kernel.org/linux-rockchip/TkgKVivuaLFLILPY-n3iZo_8KF-daKdq=
du-0_e0HP-5Ar_8DALDeNWog2suwWKjX7eomcbGET0KZe7DlzdhK2YM6CbLbeKeFZr-MJzJMtw0=
=3D@proton.me/T/#u

On Wednesday, July 24th, 2024 at 9:06 PM, Piotr Zalewski <pZ010001011111@pr=
oton.me> wrote:

> Add support for gamma LUT in VOP2 driver. The implementation is based on
> the one found in VOP driver and modified to be compatible with VOP2. Blue
> and red channels in gamma LUT register write were swapped with respect to
> how gamma LUT values are written in VOP. Write of the current video port =
id
> to VOP2_SYS_LUT_PORT_SEL register was added before the write of DSP_LUT_E=
N
> bit. Gamma size is set and drm color management is enabled for each video
> port's CRTC except ones which have no associated device. Tested on RK3566
> (Pinetab2).
>=20
> Helped-by: Dragan Simic dsimic@manjaro.org
>=20
> Signed-off-by: Piotr Zalewski pZ010001011111@proton.me
>=20
> ---
>=20
> Notes:
> Changes in v2:
> - Apply code styling corrections [1]
> - Move gamma LUT write inside the vop2 lock
>=20
> Link to v1: https://lore.kernel.org/linux-rockchip/9736eadf6a9d8e97eef919=
c6b3d88828@manjaro.org/T/#t
>=20
> [1] https://lore.kernel.org/linux-rockchip/d019761504b540600d9fc7a585d6f9=
5f@manjaro.org/
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 16abdc4a59a8..37fcf544a5fd 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1515,9 +1515,8 @@ static void vop2_vp_dsp_lut_disable(struct vop2_vid=
eo_port *vp)
>=20
> static void vop2_crtc_write_gamma_lut(struct vop2 *vop2, struct drm_crtc =
*crtc)
> {
> - const struct vop2_data *vop2_data =3D vop2->data;
>=20
> const struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
> - const struct vop2_video_port_data *vp_data =3D &vop2_data->vp[vp->id];
>=20
> + const struct vop2_video_port_data *vp_data =3D &vop2->data->vp[vp->id];
>=20
>=20
> struct drm_color_lut *lut =3D crtc->state->gamma_lut->data;
>=20
> unsigned int i, bpc =3D ilog2(vp_data->gamma_lut_len);
>=20
> @@ -1558,9 +1557,8 @@ static void vop2_crtc_gamma_set(struct vop2 *vop2, =
struct drm_crtc *crtc,
> * In order to write the LUT to the internal memory,
> * we need to first make sure the dsp_lut_en bit is cleared.
> */
> - ret =3D
> - readx_poll_timeout(vop2_vp_dsp_lut_is_enabled, vp, dsp_ctrl, !dsp_ctrl,=
 5,
> - 30 * 1000);
> + ret =3D readx_poll_timeout(vop2_vp_dsp_lut_is_enabled, vp, dsp_ctrl,
> + !dsp_ctrl, 5, 30 * 1000);
>=20
> if (ret) {
> DRM_DEV_ERROR(vop2->dev, "display LUT RAM enable timeout!\n");
>=20
> @@ -1571,9 +1569,9 @@ static void vop2_crtc_gamma_set(struct vop2 *vop2, =
struct drm_crtc *crtc,
> return;
> }
>=20
> - vop2_crtc_write_gamma_lut(vop2, crtc);
>=20
> vop2_lock(vop2);
> + vop2_crtc_write_gamma_lut(vop2, crtc);
> vop2_writel(vp->vop2, RK3568_LUT_PORT_SEL, vp->id);
>=20
>=20
> vop2_vp_dsp_lut_enable(vp);
