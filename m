Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3DC4187DF
	for <lists+dri-devel@lfdr.de>; Sun, 26 Sep 2021 11:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC516E50C;
	Sun, 26 Sep 2021 09:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5B66E50C
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 09:15:02 +0000 (UTC)
Date: Sun, 26 Sep 2021 09:14:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1632647699;
 bh=EaQZugeIZYFPOkLvYmzmKldXWgaDiRwWgn2j4xItey8=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=bSPcZlneXLjZQEI1V1R7+URkdM2jA65GQPp+CRaP1QalBNY9Zt74xsrEP65uF37hs
 GWpdOFh/Th7cFf2Ty1/cmrZ+Y+GrFKh023AkPrCxg1QSmrAT8SytHah+u7tBhDXWwD
 hkbIitOAVpBWa/wOEgVtn02QCxu2dulxDxwSjreg=
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <abhinavk@codeaurora.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/mdp5: fix cursor-related warnings
Message-ID: <12096203c2651e07403d236956ae56bebe061654.camel@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2021-09-25 at 22:28 +0300, Dmitry Baryshkov wrote:
> Since f35a2a99100f ("drm/encoder: make encoder control functions
> optional") drm_mode_config_validate would print warnings if both cursor
> plane and cursor functions are provided. Restore separate set of
> drm_crtc_funcs to be used if separate cursor plane is provided.
>=20
> [    6.556046] ------------[ cut here ]------------
> [    6.556071] [CRTC:93:crtc-0] must not have both a cursor plane and a c=
ursor_set func
> [    6.556091] WARNING: CPU: 1 PID: 76 at drivers/gpu/drm/drm_mode_config=
.c:648 drm_mode_config_validate+0x238/0x4d0
> [    6.567453] Modules linked in:
> [    6.577604] CPU: 1 PID: 76 Comm: kworker/u8:2 Not tainted 5.15.0-rc1-d=
irty #43
> [    6.580557] Hardware name: Qualcomm Technologies, Inc. DB820c (DT)
> [    6.587763] Workqueue: events_unbound deferred_probe_work_func
> [    6.593926] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    6.599740] pc : drm_mode_config_validate+0x238/0x4d0
> [    6.606596] lr : drm_mode_config_validate+0x238/0x4d0
> [    6.611804] sp : ffff8000121b3980
> [    6.616838] x29: ffff8000121b3990 x28: 0000000000000000 x27: 000000000=
0000001
> [    6.620140] x26: ffff8000114cde50 x25: ffff8000114cdd40 x24: ffff00009=
87282d8
> [    6.627258] x23: 0000000000000000 x22: 0000000000000000 x21: 000000000=
0000001
> [    6.634376] x20: ffff000098728000 x19: ffff000080a39000 x18: fffffffff=
fffffff
> [    6.641494] x17: 3136564e3631564e x16: 0000000000000324 x15: ffff80001=
1c78709
> [    6.648613] x14: 0000000000000000 x13: ffff800011a22850 x12: 000000000=
00009ab
> [    6.655730] x11: 0000000000000339 x10: ffff800011a22850 x9 : ffff80001=
1a22850
> [    6.662848] x8 : 00000000ffffefff x7 : ffff800011a7a850 x6 : ffff80001=
1a7a850
> [    6.669966] x5 : 000000000000bff4 x4 : 40000000fffff339 x3 : 000000000=
0000000
> [    6.677084] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00008=
093b800
> [    6.684205] Call trace:
> [    6.691319]  drm_mode_config_validate+0x238/0x4d0
> [    6.693577]  drm_dev_register+0x17c/0x210
> [    6.698435]  msm_drm_bind+0x4b4/0x694
> [    6.702429]  try_to_bring_up_master+0x164/0x1d0
> [    6.706075]  __component_add+0xa0/0x170
> [    6.710415]  component_add+0x14/0x20
> [    6.714234]  msm_hdmi_dev_probe+0x1c/0x2c
> [    6.718053]  platform_probe+0x68/0xe0
> [    6.721959]  really_probe.part.0+0x9c/0x30c
> [    6.725606]  __driver_probe_device+0x98/0x144
> [    6.729600]  driver_probe_device+0xc8/0x15c
> [    6.734114]  __device_attach_driver+0xb4/0x120
> [    6.738106]  bus_for_each_drv+0x78/0xd0
> [    6.742619]  __device_attach+0xdc/0x184
> [    6.746351]  device_initial_probe+0x14/0x20
> [    6.750172]  bus_probe_device+0x9c/0xa4
> [    6.754337]  deferred_probe_work_func+0x88/0xc0
> [    6.758158]  process_one_work+0x1d0/0x370
> [    6.762671]  worker_thread+0x2c8/0x470
> [    6.766839]  kthread+0x15c/0x170
> [    6.770483]  ret_from_fork+0x10/0x20
> [    6.773870] ---[ end trace 5884eb76cd26d274 ]---
> [    6.777500] ------------[ cut here ]------------
> [    6.782043] [CRTC:93:crtc-0] must not have both a cursor plane and a c=
ursor_move func
> [    6.782063] WARNING: CPU: 1 PID: 76 at drivers/gpu/drm/drm_mode_config=
.c:654 drm_mode_config_validate+0x290/0x4d0
> [    6.794362] Modules linked in:
> [    6.804600] CPU: 1 PID: 76 Comm: kworker/u8:2 Tainted: G        W     =
    5.15.0-rc1-dirty #43
> [    6.807555] Hardware name: Qualcomm Technologies, Inc. DB820c (DT)
> [    6.816148] Workqueue: events_unbound deferred_probe_work_func
> [    6.822311] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    6.828126] pc : drm_mode_config_validate+0x290/0x4d0
> [    6.834981] lr : drm_mode_config_validate+0x290/0x4d0
> [    6.840189] sp : ffff8000121b3980
> [    6.845223] x29: ffff8000121b3990 x28: 0000000000000000 x27: 000000000=
0000001
> [    6.848525] x26: ffff8000114cde50 x25: ffff8000114cdd40 x24: ffff00009=
87282d8
> [    6.855643] x23: 0000000000000000 x22: 0000000000000000 x21: 000000000=
0000001
> [    6.862763] x20: ffff000098728000 x19: ffff000080a39000 x18: fffffffff=
fffffff
> [    6.869879] x17: 3136564e3631564e x16: 0000000000000324 x15: ffff80001=
1c790c2
> [    6.876998] x14: 0000000000000000 x13: ffff800011a22850 x12: 000000000=
0000a2f
> [    6.884116] x11: 0000000000000365 x10: ffff800011a22850 x9 : ffff80001=
1a22850
> [    6.891234] x8 : 00000000ffffefff x7 : ffff800011a7a850 x6 : ffff80001=
1a7a850
> [    6.898351] x5 : 000000000000bff4 x4 : 40000000fffff365 x3 : 000000000=
0000000
> [    6.905470] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00008=
093b800
> [    6.912590] Call trace:
> [    6.919702]  drm_mode_config_validate+0x290/0x4d0
> [    6.921960]  drm_dev_register+0x17c/0x210
> [    6.926821]  msm_drm_bind+0x4b4/0x694
> [    6.930813]  try_to_bring_up_master+0x164/0x1d0
> [    6.934459]  __component_add+0xa0/0x170
> [    6.938799]  component_add+0x14/0x20
> [    6.942619]  msm_hdmi_dev_probe+0x1c/0x2c
> [    6.946438]  platform_probe+0x68/0xe0
> [    6.950345]  really_probe.part.0+0x9c/0x30c
> [    6.953991]  __driver_probe_device+0x98/0x144
> [    6.957984]  driver_probe_device+0xc8/0x15c
> [    6.962498]  __device_attach_driver+0xb4/0x120
> [    6.966492]  bus_for_each_drv+0x78/0xd0
> [    6.971004]  __device_attach+0xdc/0x184
> [    6.974737]  device_initial_probe+0x14/0x20
> [    6.978556]  bus_probe_device+0x9c/0xa4
> [    6.982722]  deferred_probe_work_func+0x88/0xc0
> [    6.986543]  process_one_work+0x1d0/0x370
> [    6.991057]  worker_thread+0x2c8/0x470
> [    6.995223]  kthread+0x15c/0x170
> [    6.998869]  ret_from_fork+0x10/0x20
> [    7.002255] ---[ end trace 5884eb76cd26d275 ]---
>=20
> Fixes: aa649e875daf ("drm/msm/mdp5: mdp5_crtc: Restore cursor state only =
if LM cursors are enabled")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/=
msm/disp/mdp5/mdp5_crtc.c
> index f482e0911d03..bb7d066618e6 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> @@ -1125,6 +1125,20 @@ static void mdp5_crtc_reset(struct drm_crtc *crtc)
>  =09__drm_atomic_helper_crtc_reset(crtc, &mdp5_cstate->base);
>  }
> =20
> +static const struct drm_crtc_funcs mdp5_crtc_no_lm_cursor_funcs =3D {
> +=09.set_config =3D drm_atomic_helper_set_config,
> +=09.destroy =3D mdp5_crtc_destroy,
> +=09.page_flip =3D drm_atomic_helper_page_flip,
> +=09.reset =3D mdp5_crtc_reset,
> +=09.atomic_duplicate_state =3D mdp5_crtc_duplicate_state,
> +=09.atomic_destroy_state =3D mdp5_crtc_destroy_state,
> +=09.atomic_print_state =3D mdp5_crtc_atomic_print_state,
> +=09.get_vblank_counter =3D mdp5_crtc_get_vblank_counter,
> +=09.enable_vblank  =3D msm_crtc_enable_vblank,
> +=09.disable_vblank =3D msm_crtc_disable_vblank,
> +=09.get_vblank_timestamp =3D drm_crtc_vblank_helper_get_vblank_timestamp=
,
> +};
> +
>  static const struct drm_crtc_funcs mdp5_crtc_funcs =3D {
>  =09.set_config =3D drm_atomic_helper_set_config,
>  =09.destroy =3D mdp5_crtc_destroy,
> @@ -1313,6 +1327,8 @@ struct drm_crtc *mdp5_crtc_init(struct drm_device *=
dev,
>  =09mdp5_crtc->lm_cursor_enabled =3D cursor_plane ? false : true;
> =20
>  =09drm_crtc_init_with_planes(dev, crtc, plane, cursor_plane,
> +=09=09=09=09  cursor_plane ?
> +=09=09=09=09  &mdp5_crtc_no_lm_cursor_funcs :
>  =09=09=09=09  &mdp5_crtc_funcs, NULL);
> =20
>  =09drm_flip_work_init(&mdp5_crtc->unref_cursor_work,

On msm8996-xiaomi-scorpio:

Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>


