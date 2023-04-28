Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B8E6F0FF0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 03:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40FD10E28B;
	Fri, 28 Apr 2023 01:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEC310E28B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 01:17:22 +0000 (UTC)
X-UUID: cd50ef11d3c34755ab4be2551cc1b666-20230428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:408dea53-6e23-4300-b724-4ae2918a6d1e, IP:5,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-4
X-CID-INFO: VERSION:1.1.22, REQID:408dea53-6e23-4300-b724-4ae2918a6d1e, IP:5,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:-4
X-CID-META: VersionHash:120426c, CLOUDID:8eda256a-2f20-4998-991c-3b78627e4938,
 B
 ulkID:230428091715JX7J7YU3,BulkQuantity:0,Recheck:0,SF:19|41|24|17|102,TC:
 nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
 I:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: cd50ef11d3c34755ab4be2551cc1b666-20230428
X-User: zhouzongmin@kylinos.cn
Received: from [172.20.12.156] [(116.128.244.169)] by mailgw
 (envelope-from <zhouzongmin@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 710927598; Fri, 28 Apr 2023 09:17:14 +0800
Message-ID: <6599319fea8ed1e3d6968e5b986661f0cf175902.camel@kylinos.cn>
Subject: Re: [PATCH] drm/probe_helper: fix the warning reported when calling
 drm_kms_helper_poll_disable during suspend
From: zongmin zhou <zhouzongmin@kylinos.cn>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Apr 2023 09:17:12 +0800
In-Reply-To: <CAA8EJppmUtuhAF+VHPh3Q8tNYp1m4T6P7dZ0wYZ8Vzwo0DF6cg@mail.gmail.com>
References: <20230328023129.3596968-1-zhouzongmin@kylinos.cn>
 <20230420200148.GD3280@jannau.net>
 <CAA8EJpoK3yv3E==bJuDoQhsW2Q1LdqKakJgdZx6S=ec-CvyGyw@mail.gmail.com>
 <1682386644754589.204.seg@mailgw>
 <1186d62a5fe7f2aa6e06f06a3dc7605c0072f1eb.camel@kylinos.cn>
 <CAA8EJppmUtuhAF+VHPh3Q8tNYp1m4T6P7dZ0wYZ8Vzwo0DF6cg@mail.gmail.com>
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
 Janne Grunau <j@jannau.net>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, gpiccoli@igalia.com,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 laurentiu.palcu@oss.nxp.com, keescook@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-04-26 at 16:10 +0300, Dmitry Baryshkov wrote:
> On Wed, 26 Apr 2023 at 12:09, zongmin zhou <zhouzongmin@kylinos.cn>
> wrote:
> >=20
> > On Sun, 2023-04-23 at 22:51 +0200, Janne Grunau wrote:
> > > On 2023-04-20 23:07:01 +0300, Dmitry Baryshkov wrote:
> > > > On Thu, 20 Apr 2023 at 23:01, Janne Grunau <j@jannau.net>
> > > > wrote:
> > > > >=20
> > > > > On 2023-03-28 10:31:29 +0800, Zongmin Zhou wrote:
> > > > > > When drivers call drm_kms_helper_poll_disable from
> > > > > > their device suspend implementation without enabled output
> > > > > > polling before,
> > > > > > following warning will be reported,due to work->func not be
> > > > > > initialized:
> > > > >=20
> > > > > we see the same warning with the wpork in progress kms driver
> > > > > for
> > > > > apple
> > > > > silicon SoCs. The connectors do not need to polled so the
> > > > > driver
> > > > > never
> > > > > calls drm_kms_helper_poll_init().
> > > > >=20
> > > > > > [=C2=A0=C2=A0 55.141361] WARNING: CPU: 3 PID: 372 at
> > > > > > kernel/workqueue.c:3066 __flush_work+0x22f/0x240
> > > > > > [=C2=A0=C2=A0 55.141382] Modules linked in: nls_iso8859_1
> > > > > > snd_hda_codec_generic ledtrig_audio snd_hda_intel
> > > > > > snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec
> > > > > > snd_hda_core
> > > > > > snd_hwdep snd_pcm snd_seq_midi snd_seq_midi_event
> > > > > > snd_rawmidi
> > > > > > snd_seq intel_rapl_msr intel_rapl_common bochs
> > > > > > drm_vram_helper
> > > > > > drm_ttm_helper snd_seq_device nfit ttm crct10dif_pclmul
> > > > > > snd_timer ghash_clmulni_intel binfmt_misc sha512_ssse3
> > > > > > aesni_intel drm_kms_helper joydev input_leds syscopyarea
> > > > > > crypto_simd snd cryptd sysfillrect sysimgblt mac_hid
> > > > > > serio_raw
> > > > > > soundcore qemu_fw_cfg sch_fq_codel msr parport_pc ppdev lp
> > > > > > parport drm ramoops reed_solomon pstore_blk pstore_zone
> > > > > > efi_pstore virtio_rng ip_tables x_tables autofs4
> > > > > > hid_generic
> > > > > > usbhid hid ahci virtio_net i2c_i801 crc32_pclmul psmouse
> > > > > > virtio_scsi libahci i2c_smbus lpc_ich xhci_pci net_failover
> > > > > > virtio_blk xhci_pci_renesas failover
> > > > > > [=C2=A0=C2=A0 55.141430] CPU: 3 PID: 372 Comm: kworker/u16:9 No=
t
> > > > > > tainted
> > > > > > 6.2.0-rc6+ #16
> > > > > > [=C2=A0=C2=A0 55.141433] Hardware name: QEMU Standard PC (Q35 +=
 ICH9,
> > > > > > 2009), BIOS rel-1.12.1-0-ga5cab58e9a3f-prebuilt.qemu.org
> > > > > > 04/01/2014
> > > > > > [=C2=A0=C2=A0 55.141435] Workqueue: events_unbound async_run_en=
try_fn
> > > > > > [=C2=A0=C2=A0 55.141441] RIP: 0010:__flush_work+0x22f/0x240
> > > > > > [=C2=A0=C2=A0 55.141444] Code: 8b 43 28 48 8b 53 30 89 c1 e9 f9=
 fe ff
> > > > > > ff
> > > > > > 4c 89 f7 e8 b5 95 d9 00 e8 00 53 08 00 45 31 ff e9 11 ff ff
> > > > > > ff
> > > > > > 0f 0b e9 0a ff ff ff <0f> 0b 45 31 ff e9 00 ff ff ff e8 e2
> > > > > > 54
> > > > > > d8 00 66 90 90 90 90 90 90
> > > > > > [=C2=A0=C2=A0 55.141446] RSP: 0018:ff59221940833c18 EFLAGS: 000=
10246
> > > > > > [=C2=A0=C2=A0 55.141449] RAX: 0000000000000000 RBX: 00000000000=
00000
> > > > > > RCX:
> > > > > > ffffffff9b72bcbe
> > > > > > [=C2=A0=C2=A0 55.141450] RDX: 0000000000000001 RSI: 00000000000=
00001
> > > > > > RDI:
> > > > > > ff3ea01e4265e330
> > > > > > [=C2=A0=C2=A0 55.141451] RBP: ff59221940833c90 R08: 00000000000=
00000
> > > > > > R09:
> > > > > > 8080808080808080
> > > > > > [=C2=A0=C2=A0 55.141453] R10: ff3ea01e42b3caf4 R11: 00000000000=
0000f
> > > > > > R12:
> > > > > > ff3ea01e4265e330
> > > > > > [=C2=A0=C2=A0 55.141454] R13: 0000000000000001 R14: ff3ea01e505=
e5e80
> > > > > > R15:
> > > > > > 0000000000000001
> > > > > > [=C2=A0=C2=A0 55.141455] FS:=C2=A0 0000000000000000(0000)
> > > > > > GS:ff3ea01fb7cc0000(0000) knlGS:0000000000000000
> > > > > > [=C2=A0=C2=A0 55.141456] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0:
> > > > > > 0000000080050033
> > > > > > [=C2=A0=C2=A0 55.141458] CR2: 0000563543ad1546 CR3: 000000010ee=
82005
> > > > > > CR4:
> > > > > > 0000000000771ee0
> > > > > > [=C2=A0=C2=A0 55.141464] DR0: 0000000000000000 DR1: 00000000000=
00000
> > > > > > DR2:
> > > > > > 0000000000000000
> > > > > > [=C2=A0=C2=A0 55.141465] DR3: 0000000000000000 DR6: 00000000fff=
e0ff0
> > > > > > DR7:
> > > > > > 0000000000000400
> > > > > > [=C2=A0=C2=A0 55.141466] PKRU: 55555554
> > > > > > [=C2=A0=C2=A0 55.141467] Call Trace:
> > > > > > [=C2=A0=C2=A0 55.141469]=C2=A0 <TASK>
> > > > > > [=C2=A0=C2=A0 55.141472]=C2=A0 ? pcie_wait_cmd+0xdf/0x220
> > > > > > [=C2=A0=C2=A0 55.141478]=C2=A0 ? mptcp_seq_show+0xe0/0x180
> > > > > > [=C2=A0=C2=A0 55.141484]=C2=A0 __cancel_work_timer+0x124/0x1b0
> > > > > > [=C2=A0=C2=A0 55.141487]=C2=A0 cancel_delayed_work_sync+0x17/0x=
20
> > > > > > [=C2=A0=C2=A0 55.141490]=C2=A0 drm_kms_helper_poll_disable+0x26=
/0x40
> > > > > > [drm_kms_helper]
> > > > > > [=C2=A0=C2=A0 55.141516]=C2=A0 drm_mode_config_helper_suspend+0=
x25/0x90
> > > > > > [drm_kms_helper]
> > > > > > [=C2=A0=C2=A0 55.141531]=C2=A0 ? __pm_runtime_resume+0x64/0x90
> > > > > > [=C2=A0=C2=A0 55.141536]=C2=A0 bochs_pm_suspend+0x16/0x20 [boch=
s]
> > > > > > [=C2=A0=C2=A0 55.141540]=C2=A0 pci_pm_suspend+0x8b/0x1b0
> > > > > > [=C2=A0=C2=A0 55.141545]=C2=A0 ? __pfx_pci_pm_suspend+0x10/0x10
> > > > > > [=C2=A0=C2=A0 55.141547]=C2=A0 dpm_run_callback+0x4c/0x160
> > > > > > [=C2=A0=C2=A0 55.141550]=C2=A0 __device_suspend+0x14c/0x4c0
> > > > > > [=C2=A0=C2=A0 55.141553]=C2=A0 async_suspend+0x24/0xa0
> > > > > > [=C2=A0=C2=A0 55.141555]=C2=A0 async_run_entry_fn+0x34/0x120
> > > > > > [=C2=A0=C2=A0 55.141557]=C2=A0 process_one_work+0x21a/0x3f0
> > > > > > [=C2=A0=C2=A0 55.141560]=C2=A0 worker_thread+0x4e/0x3c0
> > > > > > [=C2=A0=C2=A0 55.141563]=C2=A0 ? __pfx_worker_thread+0x10/0x10
> > > > > > [=C2=A0=C2=A0 55.141565]=C2=A0 kthread+0xf2/0x120
> > > > > > [=C2=A0=C2=A0 55.141568]=C2=A0 ? __pfx_kthread+0x10/0x10
> > > > > > [=C2=A0=C2=A0 55.141570]=C2=A0 ret_from_fork+0x29/0x50
> > > > > > [=C2=A0=C2=A0 55.141575]=C2=A0 </TASK>
> > > > > > [=C2=A0=C2=A0 55.141575] ---[ end trace 0000000000000000 ]---
> > > > > >=20
> > > > > > Fixes: a4e771729a51 ("drm/probe_helper: sort out
> > > > > > poll_running
> > > > > > vs poll_enabled")
> > > > > > Signed-off-by: Zongmin Zhou<zhouzongmin@kylinos.cn>
> > > > > > ---
> > > > > > =C2=A0drivers/gpu/drm/drm_probe_helper.c | 3 ++-
> > > > > > =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/drm_probe_helper.c
> > > > > > b/drivers/gpu/drm/drm_probe_helper.c
> > > > > > index 8127be134c39..ac72b18e2257 100644
> > > > > > --- a/drivers/gpu/drm/drm_probe_helper.c
> > > > > > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > > > > > @@ -855,7 +855,8 @@ void drm_kms_helper_poll_disable(struct
> > > > > > drm_device *dev)
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dev->mode_config.poll_runnin=
g)
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 drm_kms_helper_disable_hpd(dev);
> > > > > >=20
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0 cancel_delayed_work_sync(&dev-
> > > > > > > mode_config.output_poll_work);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 if (dev->mode_config.poll_enabled)
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 cancel_delayed_work_sync(&dev-
> > > > > > > mode_config.output_poll_work);
> > > > >=20
> > > > > Checking for dev->mode_config.poll_enabled at the start of
> > > > > the
> > > > > function
> > > > > and return early if it is not true looks more in style with
> > > > > the
> > > > > rest of
> > > > > drm_probe_helper.c.
> > > >=20
> > > > I think it is an error to call drm_kms_helper_poll_disable() if
> > > > polling was not initialized. So, in my opinion the fix should
> > > > go to
> > > > the drm_mode_config_helper_suspend() / _resume() instead.
> > > > Please
> > > > add a
> > > > guard there using dev->mode_config.poll_enabled.
> > >=20
> > > While I tend to agree to the sentiment I do not think this is the
> > > correct fix in this situation. drm_kms_helper_poll_disable had
> > > the
> > > check since at least 2014. a4e771729a51 is a regression. If we
> > > want
> > > to
> > > change the behavior it should be done explicitly and after
> > > verifying
> > > all
> > > drm_kms_helper_poll_disable() calls.
> > >=20
> > > #regzbot ^introduced a4e771729a51
> > >=20
> > > ciao
> > > Janne
> >=20
> > Dear Janne:
> >=20
> > I agree with you like I mentioned on last letter.
> > Thanks for your time.
> >=20
> >=20
> > Dear Dmitry:
> >=20
> > Is there anything else I can do?
> > Looking forward to your reply.
>=20
> If it is a common consensus, I'm fine with your approach.
>=20
Dear Dmitry:

Ok.Thanks for your reply.

Best regards!
