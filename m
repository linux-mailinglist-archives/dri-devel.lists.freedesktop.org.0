Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BA86EA217
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 05:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CC110E2DC;
	Fri, 21 Apr 2023 03:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD4410E2DC
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 03:01:29 +0000 (UTC)
X-UUID: 4b91f07f618d4ae5b48f46229cc7dbc6-20230421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:e52280f5-6c42-4634-a19b-c8d67dc61862, IP:5,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:28,RULE:Release_Ham,ACTIO
 N:release,TS:24
X-CID-INFO: VERSION:1.1.22, REQID:e52280f5-6c42-4634-a19b-c8d67dc61862, IP:5,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:28,RULE:Release_Ham,ACTION:
 release,TS:24
X-CID-META: VersionHash:120426c, CLOUDID:ca08c584-cd9c-45f5-8134-710979e3df0e,
 B
 ulkID:23042104015933YJ2GA9,BulkQuantity:6,Recheck:0,SF:19|42|38|24|17|102,
 TC:nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:40|20,QS:nil,BEC:nil,COL
 :0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 4b91f07f618d4ae5b48f46229cc7dbc6-20230421
X-User: zhouzongmin@kylinos.cn
Received: from [172.20.12.156] [(116.128.244.169)] by mailgw
 (envelope-from <zhouzongmin@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 142489521; Fri, 21 Apr 2023 11:01:25 +0800
Message-ID: <4f9722f0235ebb9702f98b1ec17d36801add04ca.camel@kylinos.cn>
Subject: Re: [PATCH] drm/probe_helper: fix the warning reported when calling
 drm_kms_helper_poll_disable during suspend
From: zongmin zhou <zhouzongmin@kylinos.cn>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Janne Grunau <j@jannau.net>
Date: Fri, 21 Apr 2023 11:00:27 +0800
In-Reply-To: <CAA8EJpoK3yv3E==bJuDoQhsW2Q1LdqKakJgdZx6S=ec-CvyGyw@mail.gmail.com>
References: <20230328023129.3596968-1-zhouzongmin@kylinos.cn>
 <20230420200148.GD3280@jannau.net>
 <CAA8EJpoK3yv3E==bJuDoQhsW2Q1LdqKakJgdZx6S=ec-CvyGyw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
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
Cc: neil.armstrong@linaro.org, tony.luck@intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, gpiccoli@igalia.com,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 laurentiu.palcu@oss.nxp.com, keescook@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2023-04-20 at 23:07 +0300, Dmitry Baryshkov wrote:
> On Thu, 20 Apr 2023 at 23:01, Janne Grunau <j@jannau.net> wrote:
> >=20
> > On 2023-03-28 10:31:29 +0800, Zongmin Zhou wrote:
> > > When drivers call drm_kms_helper_poll_disable from
> > > their device suspend implementation without enabled output
> > > polling before,
> > > following warning will be reported,due to work->func not be
> > > initialized:
> >=20
> > we see the same warning with the wpork in progress kms driver for
> > apple
> > silicon SoCs. The connectors do not need to polled so the driver
> > never
> > calls drm_kms_helper_poll_init().
> >=20
> > > [=C2=A0=C2=A0 55.141361] WARNING: CPU: 3 PID: 372 at
> > > kernel/workqueue.c:3066 __flush_work+0x22f/0x240
> > > [=C2=A0=C2=A0 55.141382] Modules linked in: nls_iso8859_1
> > > snd_hda_codec_generic ledtrig_audio snd_hda_intel
> > > snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hda_core
> > > snd_hwdep snd_pcm snd_seq_midi snd_seq_midi_event snd_rawmidi
> > > snd_seq intel_rapl_msr intel_rapl_common bochs drm_vram_helper
> > > drm_ttm_helper snd_seq_device nfit ttm crct10dif_pclmul snd_timer
> > > ghash_clmulni_intel binfmt_misc sha512_ssse3 aesni_intel
> > > drm_kms_helper joydev input_leds syscopyarea crypto_simd snd
> > > cryptd sysfillrect sysimgblt mac_hid serio_raw soundcore
> > > qemu_fw_cfg sch_fq_codel msr parport_pc ppdev lp parport drm
> > > ramoops reed_solomon pstore_blk pstore_zone efi_pstore virtio_rng
> > > ip_tables x_tables autofs4 hid_generic usbhid hid ahci virtio_net
> > > i2c_i801 crc32_pclmul psmouse virtio_scsi libahci i2c_smbus
> > > lpc_ich xhci_pci net_failover virtio_blk xhci_pci_renesas
> > > failover
> > > [=C2=A0=C2=A0 55.141430] CPU: 3 PID: 372 Comm: kworker/u16:9 Not tain=
ted
> > > 6.2.0-rc6+ #16
> > > [=C2=A0=C2=A0 55.141433] Hardware name: QEMU Standard PC (Q35 + ICH9,
> > > 2009), BIOS rel-1.12.1-0-ga5cab58e9a3f-prebuilt.qemu.org
> > > 04/01/2014
> > > [=C2=A0=C2=A0 55.141435] Workqueue: events_unbound async_run_entry_fn
> > > [=C2=A0=C2=A0 55.141441] RIP: 0010:__flush_work+0x22f/0x240
> > > [=C2=A0=C2=A0 55.141444] Code: 8b 43 28 48 8b 53 30 89 c1 e9 f9 fe ff=
 ff 4c
> > > 89 f7 e8 b5 95 d9 00 e8 00 53 08 00 45 31 ff e9 11 ff ff ff 0f 0b
> > > e9 0a ff ff ff <0f> 0b 45 31 ff e9 00 ff ff ff e8 e2 54 d8 00 66
> > > 90 90 90 90 90 90
> > > [=C2=A0=C2=A0 55.141446] RSP: 0018:ff59221940833c18 EFLAGS: 00010246
> > > [=C2=A0=C2=A0 55.141449] RAX: 0000000000000000 RBX: 0000000000000000 =
RCX:
> > > ffffffff9b72bcbe
> > > [=C2=A0=C2=A0 55.141450] RDX: 0000000000000001 RSI: 0000000000000001 =
RDI:
> > > ff3ea01e4265e330
> > > [=C2=A0=C2=A0 55.141451] RBP: ff59221940833c90 R08: 0000000000000000 =
R09:
> > > 8080808080808080
> > > [=C2=A0=C2=A0 55.141453] R10: ff3ea01e42b3caf4 R11: 000000000000000f =
R12:
> > > ff3ea01e4265e330
> > > [=C2=A0=C2=A0 55.141454] R13: 0000000000000001 R14: ff3ea01e505e5e80 =
R15:
> > > 0000000000000001
> > > [=C2=A0=C2=A0 55.141455] FS:=C2=A0 0000000000000000(0000)
> > > GS:ff3ea01fb7cc0000(0000) knlGS:0000000000000000
> > > [=C2=A0=C2=A0 55.141456] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 000000=
0080050033
> > > [=C2=A0=C2=A0 55.141458] CR2: 0000563543ad1546 CR3: 000000010ee82005 =
CR4:
> > > 0000000000771ee0
> > > [=C2=A0=C2=A0 55.141464] DR0: 0000000000000000 DR1: 0000000000000000 =
DR2:
> > > 0000000000000000
> > > [=C2=A0=C2=A0 55.141465] DR3: 0000000000000000 DR6: 00000000fffe0ff0 =
DR7:
> > > 0000000000000400
> > > [=C2=A0=C2=A0 55.141466] PKRU: 55555554
> > > [=C2=A0=C2=A0 55.141467] Call Trace:
> > > [=C2=A0=C2=A0 55.141469]=C2=A0 <TASK>
> > > [=C2=A0=C2=A0 55.141472]=C2=A0 ? pcie_wait_cmd+0xdf/0x220
> > > [=C2=A0=C2=A0 55.141478]=C2=A0 ? mptcp_seq_show+0xe0/0x180
> > > [=C2=A0=C2=A0 55.141484]=C2=A0 __cancel_work_timer+0x124/0x1b0
> > > [=C2=A0=C2=A0 55.141487]=C2=A0 cancel_delayed_work_sync+0x17/0x20
> > > [=C2=A0=C2=A0 55.141490]=C2=A0 drm_kms_helper_poll_disable+0x26/0x40
> > > [drm_kms_helper]
> > > [=C2=A0=C2=A0 55.141516]=C2=A0 drm_mode_config_helper_suspend+0x25/0x=
90
> > > [drm_kms_helper]
> > > [=C2=A0=C2=A0 55.141531]=C2=A0 ? __pm_runtime_resume+0x64/0x90
> > > [=C2=A0=C2=A0 55.141536]=C2=A0 bochs_pm_suspend+0x16/0x20 [bochs]
> > > [=C2=A0=C2=A0 55.141540]=C2=A0 pci_pm_suspend+0x8b/0x1b0
> > > [=C2=A0=C2=A0 55.141545]=C2=A0 ? __pfx_pci_pm_suspend+0x10/0x10
> > > [=C2=A0=C2=A0 55.141547]=C2=A0 dpm_run_callback+0x4c/0x160
> > > [=C2=A0=C2=A0 55.141550]=C2=A0 __device_suspend+0x14c/0x4c0
> > > [=C2=A0=C2=A0 55.141553]=C2=A0 async_suspend+0x24/0xa0
> > > [=C2=A0=C2=A0 55.141555]=C2=A0 async_run_entry_fn+0x34/0x120
> > > [=C2=A0=C2=A0 55.141557]=C2=A0 process_one_work+0x21a/0x3f0
> > > [=C2=A0=C2=A0 55.141560]=C2=A0 worker_thread+0x4e/0x3c0
> > > [=C2=A0=C2=A0 55.141563]=C2=A0 ? __pfx_worker_thread+0x10/0x10
> > > [=C2=A0=C2=A0 55.141565]=C2=A0 kthread+0xf2/0x120
> > > [=C2=A0=C2=A0 55.141568]=C2=A0 ? __pfx_kthread+0x10/0x10
> > > [=C2=A0=C2=A0 55.141570]=C2=A0 ret_from_fork+0x29/0x50
> > > [=C2=A0=C2=A0 55.141575]=C2=A0 </TASK>
> > > [=C2=A0=C2=A0 55.141575] ---[ end trace 0000000000000000 ]---
> > >=20
> > > Fixes: a4e771729a51 ("drm/probe_helper: sort out poll_running vs
> > > poll_enabled")
> > > Signed-off-by: Zongmin Zhou<zhouzongmin@kylinos.cn>
> > > ---
> > > =C2=A0drivers/gpu/drm/drm_probe_helper.c | 3 ++-
> > > =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_probe_helper.c
> > > b/drivers/gpu/drm/drm_probe_helper.c
> > > index 8127be134c39..ac72b18e2257 100644
> > > --- a/drivers/gpu/drm/drm_probe_helper.c
> > > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > > @@ -855,7 +855,8 @@ void drm_kms_helper_poll_disable(struct
> > > drm_device *dev)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dev->mode_config.poll_running)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 drm_kms_helper_disable_hpd(dev);
> > >=20
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 cancel_delayed_work_sync(&dev-
> > > >mode_config.output_poll_work);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 if (dev->mode_config.poll_enabled)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 cancel_delayed_work_sync(&dev-
> > > >mode_config.output_poll_work);
> >=20
> > Checking for dev->mode_config.poll_enabled at the start of the
> > function
> > and return early if it is not true looks more in style with the
> > rest of
> > drm_probe_helper.c.
>=20
> I think it is an error to call drm_kms_helper_poll_disable() if
> polling was not initialized. So, in my opinion the fix should go to
> the drm_mode_config_helper_suspend() / _resume() instead. Please add
> a
> guard there using dev->mode_config.poll_enabled.
>=20
In my test case,It's ok to check for dev->mode_config.poll_enabled in
drm_mode_config_helper_suspend() / _resume() before calling
drm_kms_helper_poll_disable().But I find that some device driver call
drm_kms_helper_poll_disable()/_enable directly without call
_suspend()/_resume() function.

So I think the safest way is to add a guard in
drm_kms_helper_poll_disable() using dev->mode_config.poll_enabled.

I'm looking forward to your comments and Suggestions.

Thanks.
>=20
> > No difference functionally of course. Tested with the apple kms
> > driver.
> >=20
> > Reviewed-by: Janne Grunau <j@jannau.net>
> >=20
> > ciao
> > Janne
>=20
>=20
>=20

