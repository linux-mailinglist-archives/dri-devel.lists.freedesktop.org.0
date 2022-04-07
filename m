Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB554F799F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 10:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D1310E108;
	Thu,  7 Apr 2022 08:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1842B10E108
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 08:27:49 +0000 (UTC)
Date: Thu, 07 Apr 2022 08:27:39 +0000
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="g6vd5Gh+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1649320062;
 bh=T8YC9X8FDT+lxc4JWQyofVNEUQUvHM5/pMxAWZOTax4=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=g6vd5Gh+NvtHgmceLmu3UAcOuMfgnyDLTvz9+OhkJec6PSe3csk5FiWRFrQg8yP6v
 wgJaoTHT764w71b/BVPmZriBxzyKHXgteh3f02owAtlTgAGRB7QSYny+pBMPEeXfmh
 InkNABRtkSHkEvaboyZPwgXgHK1+dLGJZLw0nqw5ZwkiYHbPcOlMQ30Xj2ieXkw+lN
 4o7DM7rEebFDMXAhzLCCuqhQNmy7pcdVrVGnQQhH5PklkLmcr+hrzYD4F5QKj9bZvW
 Azot++hvphlbJFmuKwPBe2KIpz4czKpkZg8om6ViixRSDpCyU0J8r6JqTDkGh2Mvol
 WgB9CwjEdOQyA==
To: Maxime Ripard <maxime@cerno.tech>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH v7 04/12] clk: Always clamp the rounded rate
Message-ID: <wv5t_wS8upUbTp267ngk1_SkGV7a-6vOpeQ13QMZ3HGGcD8RqrTriBjZs7aFbP4rS1D_YC4eKmga-r4o3Ke8sp0xsp9NMV9WX87ZTEV6oOU=@protonmail.com>
In-Reply-To: <20220407080833.fkieuqx3hgdnwqy2@houat>
References: <20220406183714.830218-1-y.oudjana@protonmail.com>
 <20220407080833.fkieuqx3hgdnwqy2@houat>
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
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Mike Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, April 7th, 2022 at 12:08 PM, Maxime Ripard <maxime@cerno.tech>=
 wrote:
> Hi Yassine,
>
> On Thu, Apr 07, 2022 at 07:56:42AM +0000, Yassine Oudjana wrote:
>
> > On Fri, 25 Feb 2022 15:35:26 +0100, Maxime Ripard maxime@cerno.tech wro=
te:
> >
> > > The current core while setting the min and max rate properly in the
> > > clk_request structure will not make sure that the requested rate is
> > > within these boundaries, leaving it to each and every driver to make
> > > sure it is.
> > >
> > > It's not clear if this was on purpose or not, but this introduces som=
e
> > > inconsistencies within the API.
> > >
> > > For example, a user setting a range and then calling clk_round_rate()
> > > with a value outside of that range will get the same value back
> > > (ignoring any driver adjustements), effectively ignoring the range th=
at
> > > was just set.
> > >
> > > Another one, arguably worse, is that it also makes clk_round_rate() a=
nd
> > > clk_set_rate() behave differently if there's a range and the rate bei=
ng
> > > used for both is outside that range. As we have seen, the rate will b=
e
> > > returned unchanged by clk_round_rate(), but clk_set_rate() will error
> > > out returning -EINVAL.
> > >
> > > Let's make sure the framework will always clamp the rate to the curre=
nt
> > > range found on the clock, which will fix both these inconsistencies.
> > >
> > > Signed-off-by: Maxime Ripard maxime@cerno.tech
> > > ---
> > > drivers/clk/clk.c | 2 ++
> > > drivers/clk/clk_test.c | 50 +++++++++++++++++++++++++++--------------=
-
> > > 2 files changed, 34 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 112911138a7b..6c4e10209568 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -1348,6 +1348,8 @@ static int clk_core_determine_round_nolock(stru=
ct clk_core *core,
> > > if (!core)
> > > return 0;
> > >
> > > + req->rate =3D clamp(req->rate, req->min_rate, req->max_rate);
> > > +
> >
> > This breaks mmpll8_early on mmcc-msm8996, making GPU power up fail:
> >
> > ------------[ cut here ]------------
> > mmpll8_early failed to enable!
> > WARNING: CPU: 3 PID: 354 at drivers/clk/qcom/clk-alpha-pll.c:238 wait_f=
or_pll+0xe8/0xfc
> > Modules linked in: q6asm_dai(+) ath10k_pci(+) q6afe_dai q6routing venus=
_enc panel_lgphilips_sw43101(+) venus_dec ath10k_core q6asm q6adm videobuf2=
_dma_contig qcom_camss snd_q6dsp_common snd_soc_wcd9335 q6afe snd_soc_apq80=
96 msm q6core ath regmap_slimbus v4l2_fwnode snd_soc_qcom_common apr snd_so=
c_core v4l2_async mac80211 venus_core videobuf2_dma_sg snd_compress v4l2_me=
m2mem videobuf2_memops videobuf2_v4l2 snd_pcm nxp_nci_i2c videobuf2_common =
libarc4 nxp_nci snd_timer gpu_sched videodev hci_uart drm_dp_helper snd i2c=
_qcom_cci nci btqca drm_kms_helper mc soundcore nfc syscopyarea sysfillrect=
 bluetooth slim_qcom_ngd_ctrl sysimgblt pdr_interface fb_sys_fops slimbus l=
zo_rle qcom_spmi_haptics qcom_q6v5_mss qcom_spmi_temp_alarm qcom_q6v5_pas i=
ndustrialio qcom_pil_info qcom_common qcom_q6v5 qcom_sysmon qmi_helpers mdt=
_loader socinfo pwm_ir_tx rmtfs_mem cfg80211 rfkill zram atmel_mxt_ts drm d=
rm_panel_orientation_quirks ip_tables
> > CPU: 3 PID: 354 Comm: systemd-udevd Not tainted 5.18.0-rc1+ #361
> > Hardware name: Xiaomi Mi Note 2 (DT)
> > pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> > pc : wait_for_pll+0xe8/0xfc
> > lr : wait_for_pll+0xe8/0xfc
> > sp : ffff80000b01b250
> > x29: ffff80000b01b250 x28: ffff0000ae071960 x27: ffff000096a9ec00
> > x26: ffff0000801d7cf4 x25: 00000001cd074651 x24: 0000000000000000
> > x23: ffff800009129090 x22: ffff8000090d7c30 x21: 0000000000000000
> > x20: 0000000080000000 x19: ffff8000097b4598 x18: 0000000000000ca8
> > x17: 00000000000032a0 x16: 0000000000000007 x15: 00000000ffffffff
> > x14: 0000000000000001 x13: 0000000000000020 x12: fffffffffffcaebf
> > x11: ffff80000968afb0 x10: 000000000000000a x9 : ffff80000815bcc8
> > x8 : 000000000000000a x7 : 0000000000000006 x6 : 000000000000000c
> > x5 : ffff0000fdd16990 x4 : 0000000000000000 x3 : 0000000000000027
> > x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000857e3b00
> > Call trace:
> > wait_for_pll+0xe8/0xfc
> > clk_alpha_pll_enable+0x118/0x150
> > clk_core_enable+0x78/0x290
> > clk_core_enable+0x58/0x290
> > clk_core_enable+0x58/0x290
> > clk_core_enable+0x58/0x290
> > clk_enable+0x38/0x60
> > clk_bulk_enable+0x48/0xb0
> > msm_gpu_pm_resume+0xb4/0x20c [msm]
> > a5xx_pm_resume+0x28/0x200 [msm]
> > adreno_resume+0x2c/0x40 [msm]
> > pm_generic_runtime_resume+0x38/0x50
> > __genpd_runtime_resume+0x38/0x90
> > genpd_runtime_resume+0xa4/0x2cc
> > __rpm_callback+0x50/0x180
> > rpm_callback+0x74/0x80
> > rpm_resume+0x434/0x6b0
> > __pm_runtime_resume+0x64/0xb0
> > adreno_load_gpu+0x68/0x1b0 [msm]
> > msm_open+0xf0/0x100 [msm]
> > drm_file_alloc+0x150/0x234 [drm]
> > drm_client_init+0xdc/0x180 [drm]
> > drm_fb_helper_init+0x60/0x70 [drm_kms_helper]
> > msm_fbdev_init+0x6c/0x100 [msm]
> > msm_drm_bind+0x56c/0x640 [msm]
> > try_to_bring_up_aggregate_device+0x230/0x320
> > __component_add+0xac/0x194
> > component_add+0x20/0x30
> > dsi_dev_attach+0x2c/0x3c [msm]
> > dsi_host_attach+0xa0/0x154 [msm]
> > mipi_dsi_attach+0x34/0x50
> > sw43101_probe+0x144/0x200 [panel_lgphilips_sw43101]
> > mipi_dsi_drv_probe+0x2c/0x40
> > really_probe+0x184/0x3d0
> > __driver_probe_device+0x11c/0x190
> > driver_probe_device+0x44/0xf4
> > __driver_attach+0xd8/0x1f0
> > bus_for_each_dev+0x7c/0xe0
> > driver_attach+0x30/0x40
> > bus_add_driver+0x150/0x230
> > driver_register+0x84/0x140
> > mipi_dsi_driver_register_full+0x64/0x70
> > sw43101_driver_init+0x2c/0x1000 [panel_lgphilips_sw43101]
> > do_one_initcall+0x50/0x2b0
> > do_init_module+0x50/0x260
> > load_module+0x229c/0x2ae0
> > __do_sys_finit_module+0xac/0x12c
> > __arm64_sys_finit_module+0x2c/0x3c
> > invoke_syscall+0x50/0x120
> > el0_svc_common.constprop.0+0xdc/0x100
> > do_el0_svc+0x34/0xa0
> > el0_svc+0x34/0xb0
> > el0t_64_sync_handler+0xa4/0x130
> > el0t_64_sync+0x18c/0x190
> > ---[ end trace 0000000000000000 ]---
> > Failed to enable clk 'core': -110
> > msm 900000.mdss: [drm:adreno_load_gpu [msm]] ERROR Couldn't power up th=
e GPU: -110
>
>
> Thanks for the report.
>
> Are you sure it's that exact patch though? It looks like we're in a
> separate path entirely, as clk_enable doesn't call
> clk_round_rate/determine_rate.

I noticed that too, but a bisect pointed me towards this patch and
reverting it does seem to fix the issue, so I'm not sure how it's
causing it.

> I've been piling up few fixes already for other platforms, could you
> also test ?
>
> https://github.com/mripard/linux/tree/rpi/clk-improvements-more-fixes

Alright, will test.

Thanks for the quick reply!
Yassine

