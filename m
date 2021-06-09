Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2683A0CDB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 08:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952ED6E0F1;
	Wed,  9 Jun 2021 06:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id 04AC26E193;
 Wed,  9 Jun 2021 06:57:46 +0000 (UTC)
Received: from [192.168.1.3] (ns.gsystem.sk [62.176.172.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id F0F607A044E;
 Wed,  9 Jun 2021 08:57:44 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: nouveau broken on Riva TNT2 in 5.13.0-rc4: NULL pointer
 dereference in nouveau_bo_sync_for_device
Date: Wed, 9 Jun 2021 08:57:41 +0200
User-Agent: KMail/1.9.10
References: <202106052143.52488.linux@zary.sk>
 <202106082359.12109.linux@zary.sk>
 <ab40bbc8-2c0f-0652-c9b8-bc7fda7ca2a9@amd.com>
In-Reply-To: <ab40bbc8-2c0f-0652-c9b8-bc7fda7ca2a9@amd.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <202106090857.42133.linux@zary.sk>
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday 09 June 2021, Christian K=C3=B6nig wrote:
> Am 08.06.21 um 23:59 schrieb Ondrej Zary:
> > On Tuesday 08 June 2021 22:01:56 Ondrej Zary wrote:
> >> On Tuesday 08 June 2021 20:47:42 Ondrej Zary wrote:
> >>> On Monday 07 June 2021 22:58:43 Ondrej Zary wrote:
> >>>> On Sunday 06 June 2021 23:16:03 Ondrej Zary wrote:
> >>>>> On Saturday 05 June 2021 23:34:23 Ondrej Zary wrote:
> >>>>>> On Saturday 05 June 2021 21:43:52 Ondrej Zary wrote:
> >>>>>>> Hello,
> >>>>>>> I'm testing 5.13.0-rc4 and nouveau crashes with NULL pointer dere=
ference in nouveau_bo_sync_for_device.
> >>>>>>> Found various reports like this but that was back in februaryso t=
hat should be fixed now.
> >>>>>> So it is the same bug. Broken since 5.11. This revert fixes it in =
5.11:
> >>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2021-February%2F298531.htm=
l&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7C605d2e3757ba466bb02a08d=
92ac8a895%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637587864017853132%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C3000&amp;sdata=3DM5KXSwD%2Fnro3cnCo8Nx4llFu%2Fj2T%2FGQAaMB=
LeGl0XMc%3D&amp;reserved=3D0
> >>>>>>
> >>>>>> Added some debug printks to nouveau_bo_sync_for_device:
> >>>>>> [   22.225048] ttm_dma=3Dfc33b500
> >>>>>> [   22.225066] ttm_dma->num_pages=3D18
> >>>>>> [   22.225071] i=3D0 num_pages=3D16
> >>>>>> [   22.225077] ttm_dma->dma_address=3D00000000
> >>>>>> [   22.225094] BUG: kernel NULL pointer dereference, address: 0000=
0000
> >>>>>>
> >>>>>> So ttm->dma_address is NULL.
> >>>>>>
> >>>>> Tested reverting f295c8cfec833c2707ff1512da10d65386dde7af again and=
 it does not work...
> >>>>> Not sure what I did before.
> >>>>>
> >>>>> Bisecting between 5.10 and 5.11 is impossible - I keep hitting neve=
rending stream of bugs.
> >>>>> As always with nouveau...
> >>>> e34b8feeaa4b65725b25f49c9b08a0f8707e8e86 seems to be the first bad c=
ommit
> >>>> Going back one commit makes it crash in a different way:
> >>>>
> >>>> [   55.444208] BUG: kernel NULL pointer dereference, address: 000001=
b0
> >>>> [   55.444219] #PF: supervisor read access in kernel mode
> >>>> [   55.444222] #PF: error_code(0x0000) - not-present page
> >>>> [   55.444225] *pde =3D 00000000
> >>>> [   55.444231] Oops: 0000 [#1] SMP
> >>>> [   55.444237] CPU: 0 PID: 1740 Comm: Xorg Not tainted 5.9.0-rc5+ #3=
61
> >>>> [   55.444240] Hardware name:  /848P-ICH5, BIOS 6.00 PG 02/03/2005
> >>>> [   55.444321] EIP: nouveau_bo_wr16+0x8/0x27 [nouveau]
> >>>> [   55.444326] Code: 85 ff 74 0d 80 7d f3 00 74 07 80 a6 f4 01 00 00=
 fe 89 f0 e8 0c ef ff ff 8d 65 f4 89 f8 5b 5e 5f 5d c3 55 01 d2 89 e5 53 89=
 c3 <03> 93 b0 01 00 00 0f b7 c1 f6 83 b8 01 00 00 80 74 07 e8 40 49 69
> >>>> [   55.444330] EAX: 00000000 EBX: 00000000 ECX: 00000000 EDX: 000000=
00
> >>>> [   55.444334] ESI: 00000020 EDI: e7a14400 EBP: e786fd98 ESP: e786fd=
94
> >>>> [   55.444338] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: =
00210246
> >>>> [   55.444341] CR0: 80050033 CR2: 000001b0 CR3: 27896000 CR4: 000006=
90
> >>>> [   55.444344] Call Trace:
> >>>> [   55.444395]  nv04_crtc_cursor_set+0x148/0x1d8 [nouveau]
> >>>> [   55.444442]  ? ttm_bo_reserve.constprop.15+0x1c/0x1c [nouveau]
> >>>> [   55.444451]  drm_mode_cursor_common+0x13b/0x1ad
> >>>> [   55.444497]  ? ttm_bo_reserve.constprop.15+0x1c/0x1c [nouveau]
> >>>> [   55.444504]  drm_mode_cursor_ioctl+0x2e/0x36
> >>>> [   55.444509]  ? drm_mode_setplane+0x203/0x203
> >>>> [   55.444514]  drm_ioctl_kernel+0x66/0x99
> >>>> [   55.444518]  drm_ioctl+0x211/0x2d8
> >>>> [   55.444522]  ? drm_mode_setplane+0x203/0x203
> >>>> [   55.444529]  ? _cond_resched+0x1e/0x22
> >>>> [   55.444533]  ? mutex_lock+0xb/0x24
> >>>> [   55.444582]  ? nouveau_bo_add_io_reserve_lru+0x53/0x58 [nouveau]
> >>>> [   55.444589]  ? rpm_resume.part.13+0x72/0x365
> >>>> [   55.444594]  ? ktime_get_mono_fast_ns+0x5e/0xf2
> >>>> [   55.444598]  ? __pm_runtime_resume+0x5b/0x63
> >>>> [   55.444647]  nouveau_drm_ioctl+0x65/0x81 [nouveau]
> >>>> [   55.444696]  ? nouveau_cli_work+0xc3/0xc3 [nouveau]
> >>>> [   55.444702]  vfs_ioctl+0x1a/0x24
> >>>> [   55.444706]  __ia32_sys_ioctl+0x583/0x59d
> >>>> [   55.444711]  ? doublefault_shim+0x120/0x120
> >>>> [   55.444717]  ? exit_to_user_mode_prepare+0x71/0xba
> >>>> [   55.444721]  do_int80_syscall_32+0x2c/0x39
> >>>> [   55.444725]  entry_INT80_32+0xf0/0xf0
> >>>> [   55.444729] EIP: 0xb7fb2092
> >>>> [   55.444733] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30=
 00 00 00 e9 80 ff ff ff ff a3 e8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd=
 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
> >>>> [   55.444737] EAX: ffffffda EBX: 0000000e ECX: c01c64a3 EDX: bfe897=
50
> >>>> [   55.444741] ESI: 02580b40 EDI: c01c64a3 EBP: 0000000e ESP: bfe897=
04
> >>>> [   55.444744] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: =
00200292
> >>>> [   55.444748] Modules linked in: i2c_dev nouveau serial_cs snd_inte=
l8x0 snd_ac97_codec wmi hwmon ttm ac97_bus 8139cp snd_pcm pcmcia snd_timer =
snd sg soundcore psmouse yenta_socket serio_raw pcmcia_rsrc pcmcia_core int=
el_agp parport_pc parport
> >>>> [   55.444769] CR2: 00000000000001b0
> >>>> [   55.444774] ---[ end trace e2b0d4c3c2e4e488 ]---
> >>>> [   55.444827] EIP: nouveau_bo_wr16+0x8/0x27 [nouveau]
> >>>> [   55.444831] Code: 85 ff 74 0d 80 7d f3 00 74 07 80 a6 f4 01 00 00=
 fe 89 f0 e8 0c ef ff ff 8d 65 f4 89 f8 5b 5e 5f 5d c3 55 01 d2 89 e5 53 89=
 c3 <03> 93 b0 01 00 00 0f b7 c1 f6 83 b8 01 00 00 80 74 07 e8 40 49 69
> >>>> [   55.444835] EAX: 00000000 EBX: 00000000 ECX: 00000000 EDX: 000000=
00
> >>>> [   55.444838] ESI: 00000020 EDI: e7a14400 EBP: e786fd98 ESP: e786fd=
94
> >>>> [   55.444842] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: =
00210246
> >>>> [   55.444845] CR0: 80050033 CR2: 000001b0 CR3: 27896000 CR4: 000006=
90
> >>> Bisected this crash:
> >>> # first bad commit: [141b15e59175aa174ca1f7596188bd15a7ca17ba] drm/no=
uveau: move io_reserve_lru handling into the driver v5
> >>>
> >>> Adding Christian K=C3=B6nig to CC.
> >> Tracked it down to an uninitialized variable bug.
> >> I see now that this was fixed by aea656b0d05ec5b8ed5beb2f94c4dd42ea834=
e9d.
> > So the first bad commit for the original bug is e34b8feeaa4b65725b25f49=
c9b08a0f8707e8e86
> > (as bisected before).
> > Going one commit back and fixing the uninitialized variable and endian =
bugs manually makes nouveau work.
>=20
> Thanks for the heads up. So the problem with my patch is already fixed,=20
> isn't it?

The NULL pointer dereference in nouveau_bo_wr16 introduced in
141b15e59175aa174ca1f7596188bd15a7ca17ba was fixed by
aea656b0d05ec5b8ed5beb2f94c4dd42ea834e9d.

That's the bug I hit when bisecting the original problem:
NULL pointer dereference in nouveau_bo_sync_for_device
It's caused by:
# first bad commit: [e34b8feeaa4b65725b25f49c9b08a0f8707e8e86] drm/ttm: mer=
ge ttm_dma_tt back into ttm_tt

=2D-=20
Ondrej Zary
