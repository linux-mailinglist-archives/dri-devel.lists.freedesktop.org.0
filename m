Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B15CBEE19
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 17:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFEE310E5AE;
	Mon, 15 Dec 2025 16:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Q3W/MlB/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AC210E5AE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 16:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765815964;
 bh=JQmcOhi9j3XdpznVjKJDHAurln1q2yw3C5GFh+KpH88=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q3W/MlB/5NuNZLQ3vDUMob7cCZ0neYqxmb18Mwx8grInY/1ktJlwCOyn0L4SrZv8b
 7L1/nS6VOgVRVT3Q90cqtx2QiR3nYSHA4k9o4bL3nsyixocJvOgios0YGSwlDtO/MC
 bJIOgrKDujvjvrsMztp7hlCXYcXnMwVaZs8zomNvf/syun+wxmIN8oi+r6MCi2A2Dd
 JDx/k3MGqusFgx1/AQJ+W66K0j7uAu+4t8akIBnyCBhBzjFJRfSwnvCBTLkSLpgj81
 P1lf67NJ4cHz4QVu0OTzVbHk2gtK2lTZyQjRSG313urUg5cWeT2JcKcZeLmBMdctL1
 IREzRGjShOkSQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 133C717E0451;
 Mon, 15 Dec 2025 17:26:04 +0100 (CET)
Date: Mon, 15 Dec 2025 17:25:59 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Aishwarya <aishwarya.tcv@arm.com>
Cc: karunika.choo@arm.com, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 nd@arm.com, simona@ffwll.ch, steven.price@arm.com, tzimmermann@suse.de,
 broonie@kernel.org
Subject: Re: [PATCH v5 6/8] drm/panthor: Support GLB_REQ.STATE field for
 Mali-G1 GPUs
Message-ID: <20251215172559.0de2a329@fedora>
In-Reply-To: <20251215160520.55812-1-aishwarya.tcv@arm.com>
References: <20251125125548.3282320-7-karunika.choo@arm.com>
 <20251215160520.55812-1-aishwarya.tcv@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Mon, 15 Dec 2025 16:05:20 +0000
Aishwarya <aishwarya.tcv@arm.com> wrote:

> Hi Karunika,
>=20
> Booting v6.19-rc1 on rk3588-rock-5b succeeds, but the kernel log shows a
> panthor firmware load failure followed by a NULL pointer dereference in
> panthor_fw_halt_mcu() during probe. The driver fails to load
> arm/mali/arch10.8/mali_csffw.bin with -ENOENT.
>=20
> A git bisect identified the first bad commit as:
>=20
> 51407254986501b19681d55531963f1ea58e89cd
> drm/panthor: Support GLB_REQ.STATE field for Mali-G1 GPUs
>=20
>=20
> Failure log (v6.19-rc1):
>=20
> <4>[   16.915783] panthor fb000000.gpu: Direct firmware load for arm/mali=
/arch10.8/mali_csffw.bin failed with error -2
> <3>[   16.916754] panthor fb000000.gpu: [drm] *ERROR* Failed to load firm=
ware image 'mali_csffw.bin'
> <1>[   16.917542] Unable to handle kernel NULL pointer dereference at vir=
tual address 0000000000000000
> <1>[   16.918329] Mem abort info:
> <1>[   16.918598]   ESR =3D 0x0000000096000004
> <1>[   16.918949]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> <1>[   16.919436]   SET =3D 0, FnV =3D 0
> <1>[   16.919742]   EA =3D 0, S1PTW =3D 0
> <1>[   16.920041]   FSC =3D 0x04: level 0 translation fault
> <1>[   16.920489] Data abort info:
> <1>[   16.920766]   ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
> <1>[   16.921269]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> <1>[   16.921272]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> <1>[   16.921275] user pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000117ca=
8000
> <1>[   16.922802] [0000000000000000] pgd=3D0000000000000000, p4d=3D000000=
0000000000
> <0>[   16.923423] Internal error: Oops: 0000000096000004 [#1]  SMP
> [[0;32m  OK  [0m] Started [0;1;39mgetty@tty1.service[0m - Ge<4>[   16.923=
941]=20
> Modules linked in: pci_endpoint_test snd_soc_audio_graph_card
> snd_soc_simple_card_utils rockchipdrm snd_soc_core snd_compress panthor(+)
> snd_pcm_dmaengine drm_gpuvm drm_exec dw_hdmi_qp analogix_dp dw_dp
> dw_mipi_dsi drm_dp_aux_bus dw_hdmi drm_shmem_helper drm_display_helper sn=
d_pcm
> cec gpu_sched drm_client_lib drm_dma_helper snd_timer drm_kms_helper snd
> soundcore drm backlight dm_mod ipv6
> <4>[   16.927513] CPU: 2 UID: 0 PID: 187 Comm: (udev-worker) Not tainted =
6.19.0-rc1 #1 PREEMPT=20
> <4>[   16.928357] Hardware name: Radxa ROCK 5B (DT)
> <4>[   16.928761] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS B=
TYPE=3D--)
> <4>[   16.929392] pc : panthor_fw_halt_mcu+0x24/0x98 [panthor]
> <4>[   16.929901] lr : panthor_fw_unplug+0x54/0x134 [panthor]
> <4>[   16.930394] sp : ffff800084cf3750
> <4>[   16.930707] x29: ffff800084cf3750 x28: ffff000101d1b000 x27: 000000=
0000000000
> <4>[   16.931358] x26: ffff80007b36b618 x25: 0000000000000000 x24: ffff00=
0101d1b800
> <4>[   16.932008] x23: ffff80007b373de0 x22: ffff00010126b010 x21: ffff00=
0101d1b000
> <4>[   16.932657] x20: ffff000101d1b000 x19: ffff00011b4200a0 x18: 000000=
0000000006
> <4>[   16.933310] x17: 67616d6920657261 x16: 776d726966206461 x15: 6f6c20=
6f74206465
> <4>[   16.933963] x14: 6c696146202a524f x13: ffff800082aa6c40 x12: 000000=
0000000630
> <4>[   16.933970] x11: 0000000000000210 x10: ffff800082afec40 x9 : 1fffe0=
002039be41
> <4>[   16.935258] x8 : 0000000000000001 x7 : ffff000101cdf200 x6 : ffff00=
01165f1830
> <4>[   16.935908] x5 : 000000000000007c x4 : 000000000000007c x3 : 000000=
0000000000
> <4>[   16.936557] x2 : 0000000000000000 x1 : 000000000400ffff x0 : 000000=
0000000000
> [[0;32m  OK  [0m] Started [0;1;39mserial-getty@ttyS2=E2=80=A6rvice<4>[   =
16.937207] Call trace:
> [0m - Serial Getty on ttyS2.
> <4>[   16.937924]  panthor_fw_halt_mcu+0x24/0x98 [panthor] (P)
> <4>[   16.938640]  panthor_fw_unplug+0x54/0x134 [panthor]
> <4>[   16.939104]  panthor_fw_init+0x1a8/0x81c [panthor]
> <4>[   16.939561]  panthor_device_init+0x350/0x4fc [panthor]
> <4>[   16.940046]  panthor_probe+0x3c/0x60 [panthor]
> <4>[   16.940473]  platform_probe+0x5c/0x98
> <4>[   16.940823]  really_probe+0xbc/0x298
> <4>[   16.941164]  __driver_probe_device+0x78/0x12c
> <4>[   16.941572]  driver_probe_device+0x3c/0x15c
> <4>[   16.941965]  __driver_attach+0x94/0x19c
> <4>[   16.942328]  bus_for_each_dev+0x78/0xd4
> <4>[   16.942691]  driver_attach+0x24/0x30
> <4>[   16.943031]  bus_add_driver+0xe4/0x208
> <4>[   16.943385]  driver_register+0x60/0x128
> <4>[   16.943747]  __platform_driver_register+0x24/0x30
> <4>[   16.944184]  panthor_init+0x64/0x1000 [panthor]
> <4>[   16.944618]  do_one_initcall+0x80/0x1c4
> <4>[   16.944981]  do_init_module+0x58/0x234
> <4>[   16.945336]  load_module+0x1c54/0x1c98
> <4>[   16.945691]  init_module_from_file+0xd4/0xec
> <4>[   16.946091]  __arm64_sys_finit_module+0x144/0x324
> <4>[   16.946528]  invoke_syscall+0x48/0x110
> <4>[   16.946883]  el0_svc_common.constprop.0+0xc0/0xe0
> <4>[   16.947321]  do_el0_svc+0x1c/0x28
> <4>[   16.947638]  el0_svc+0x34/0x10c
> <4>[   16.947940]  el0t_64_sync_handler+0xa0/0xe4
> <4>[   16.948335]  el0t_64_sync+0x198/0x19c
> <0>[   16.948344] Code: aa0003f4 f9438413 91008273 f9400660 (b9400000)=20
> <4>[   16.949233] ---[ end trace 0000000000000000 ]---
> [[0;32m  OK  [0m] Reached target [0;1;39mgetty.target[0m - Login Prompts.
> [[0;32m  OK  [0m] Reached target [0;1;39mmulti-user.target[0m - Multi-Use=
r System.
> <6>[   16.956742] mc: Linux media interface: v0.10
> <6>[   16.958944] videodev: Linux video capture interface: v2.00
> [[0;32m  OK  [0m] Reached target [0;1;39mgraphical.target[0m - Graphical =
Interface.
>          Starting [0;1;39msystemd-update-ut=E2=80=A6 Record Runlevel Chan=
ge in UTMP...
> [[0;32m  OK  [0m] Finished [0;1;39msystemd-update-ut=E2=80=A6 - Record Ru=
nlevel Change in UTMP.
> <6>[   17.034547] rockchip-rga fdb80000.rga: HW Version: 0x03.02
> <6>[   17.035459] snps_hdmirx fdee0000.hdmi_receiver: assigned reserved m=
emory node hdmi-receiver-cma
> <6>[   17.038646] rockchip-rga fdb80000.rga: Registered rockchip-rga as /=
dev/video0
> <6>[   17.040732] hantro-vpu fdb50000.video-codec: registered rockchip,rk=
3568-vpu-dec as /dev/video2
> Debian GNU/Linux 12 debian-bookworm-arm64 ttyS2
>=20
>=20
> Bisect log summary:
>=20
> git bisect start
> # good: [7d0a66e4bb9081d75c82ec4957c50034cb0ea449] Linux 6.18
> git bisect good 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> # bad: [d9771d0dbe18dd643760431870a6abf9b0866bb0] Add linux-next specific=
 files for 20251212
> git bisect bad d9771d0dbe18dd643760431870a6abf9b0866bb0
> # bad: [2aa680df68062e4e0c356ec2aa7100c13654907b] Merge tag 'sound-6.19-r=
c1' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
> git bisect bad 2aa680df68062e4e0c356ec2aa7100c13654907b
> # good: [8f7aa3d3c7323f4ca2768a9e74ebbe359c4f8f88] Merge tag 'net-next-6.=
19' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
> git bisect good 8f7aa3d3c7323f4ca2768a9e74ebbe359c4f8f88
> # bad: [b3239df349c2c2c94686674489c9629c89ca49a1] Merge tag 'drm-misc-nex=
t-2025-12-01-1' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-=
next
> git bisect bad b3239df349c2c2c94686674489c9629c89ca49a1
> # good: [2e640e8e7b9e9fc0f42c1e15ea0e02d00916ad57] drm/amd/pm: Update def=
ault power1_cap
> git bisect good 2e640e8e7b9e9fc0f42c1e15ea0e02d00916ad57
> # good: [89b34ebed02ee39ae02069dcf2e5728aceec9deb] drm/panel: ilitek-ili9=
881d: Add support for Wanchanglong W552946AAA panel
> git bisect good 89b34ebed02ee39ae02069dcf2e5728aceec9deb
> # good: [31d3354f42c0da34415164a1f621a195caa1f1bc] drm/nouveau: verify th=
at hardware supports the flush page address
> git bisect good 31d3354f42c0da34415164a1f621a195caa1f1bc
> # good: [ee31621316cc20108eb2075de5d57f2cbd295677] Merge tag 'drm-msm-nex=
t-2025-11-18' of https://gitlab.freedesktop.org/drm/msm into drm-next
> git bisect good ee31621316cc20108eb2075de5d57f2cbd295677
> # bad: [e5719e7f19009d4fbedf685fc22eec9cd8de154f] drm/colorop: Add 3x4 CT=
M type
> git bisect bad e5719e7f19009d4fbedf685fc22eec9cd8de154f
> # good: [b1075ae1a3b56fd0b1275caf51bcc633f665bb19] drm/panthor: Add arch-=
specific panthor_hw binding
> git bisect good b1075ae1a3b56fd0b1275caf51bcc633f665bb19
> # bad: [303e9bf147b3a1b48a6d7079f2924b7d43662805] drm/vkms: Add kunit tes=
ts for VKMS LUT handling
> git bisect bad 303e9bf147b3a1b48a6d7079f2924b7d43662805
> # bad: [ab3490493c73374862e47ccc00d3dbb89228f86e] drm/panthor: Add suppor=
t for Mali-G1 GPUs
> git bisect bad ab3490493c73374862e47ccc00d3dbb89228f86e
> # good: [ee4f9af07933648f2f9337d7b24da5562a594399] drm/panthor: Implement=
 L2 power on/off via PWR_CONTROL
> git bisect good ee4f9af07933648f2f9337d7b24da5562a594399
> # bad: [51407254986501b19681d55531963f1ea58e89cd] drm/panthor: Support GL=
B_REQ.STATE field for Mali-G1 GPUs
> git bisect bad 51407254986501b19681d55531963f1ea58e89cd
> # good: [9ee52f5cdc45e397fddad2a9ed879c72a8fcfa65] drm/panthor: Implement=
 soft reset via PWR_CONTROL
> git bisect good 9ee52f5cdc45e397fddad2a9ed879c72a8fcfa65
> # first bad commit: [51407254986501b19681d55531963f1ea58e89cd] drm/pantho=
r: Support GLB_REQ.STATE field for Mali-G1 GPUs
>=20
> Please let me know if further testing on rk3588-rock-5b would be helpful.

Could you try with the following diff applied.

Karunika, do you remember why we have to gracefully halt the MCU
in case of an unplug? Feels to me that we can just pull the plug
by writing DISABLE to MCU_CONTROL, since we don't care about
warm boots after an unplug happened.

--->8---
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor=
/panthor_fw.c
index 3641829aeb52..2c4e7aa5ba1e 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1266,10 +1266,6 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
                if (ptdev->fw->irq.irq)
                        panthor_job_irq_suspend(&ptdev->fw->irq);
=20
-               panthor_fw_halt_mcu(ptdev);
-               if (!panthor_fw_wait_mcu_halted(ptdev))
-                       drm_warn(&ptdev->base, "Failed to halt MCU on unplu=
g");
-
                panthor_fw_stop(ptdev);
        }
=20
