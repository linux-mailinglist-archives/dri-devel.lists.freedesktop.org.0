Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB701A84818
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 17:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB1210E9EF;
	Thu, 10 Apr 2025 15:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="AIpO4x3n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4546710E9EF;
 Thu, 10 Apr 2025 15:36:50 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZYP7H3fKSz9shl;
 Thu, 10 Apr 2025 17:36:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1744299403; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P9+QqdYG4mDRVeosGe6Cms2HjBGgK+zNhnnFSTSo6Yk=;
 b=AIpO4x3n6xHT70+tOoPw8y7k4ukvlib+2KwkPScvhWcoQE87X5acZ4Eb9qiQm0Dm+6Ahn+
 cYjTqHC1CtpM9f+AoLmXZe4+zxFpV19Lcz8suyfRQpVNXf8fdrcCkaeYvXSeS+NuWQ9+56
 5vnMjy2cqKS+TPO2McsXHbeJrvqJO9RQxKbLR+SdA51lbIfWNqFZiKEkmWd1JBgqfMdPKI
 +TM/YLHdVFwDQGwqeL0a7+dpiZ/d2KpQRLgbIHI1d2WCWdxlJXwA2+Gj6IEIOhDTUQD0nA
 Ynbcra043KVq+LPJIOu3GQvszCxOAKSoxRbLfhC+7CL7LM4RZGD2xwhm6krziA==
Message-ID: <1a73e5fe4350d6ee4b7d807612264eb637c4f2a9.camel@mailbox.org>
Subject: Re: [PATCH 1/3] drm/nouveau: Prevent signaled fences in pending list
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Sabrina Dubroca <sd@queasysnail.net>, Sumit Semwal
 <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 stable@vger.kernel.org
Date: Thu, 10 Apr 2025 17:36:39 +0200
In-Reply-To: <50c9530d-e274-4f89-8620-16afe0981239@amd.com>
References: <20250410092418.135258-2-phasta@kernel.org>
 <20250410092418.135258-3-phasta@kernel.org>
 <8583665a-6886-4245-be49-fd8839cfe212@amd.com>
 <c737c89c7ce9174e349c61ab4e5712eee8946f13.camel@mailbox.org>
 <50c9530d-e274-4f89-8620-16afe0981239@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 84ec33af105abd139b5
X-MBO-RS-META: kiyghzsqxxi4yjsni7xcg347t76osqot
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2025-04-10 at 15:16 +0200, Christian K=C3=B6nig wrote:
> Am 10.04.25 um 15:09 schrieb Philipp Stanner:
> > On Thu, 2025-04-10 at 14:58 +0200, Christian K=C3=B6nig wrote:
> > > Am 10.04.25 um 11:24 schrieb Philipp Stanner:
> > > > Nouveau currently relies on the assumption that dma_fences will
> > > > only
> > > > ever get signaled through nouveau_fence_signal(), which takes
> > > > care
> > > > of
> > > > removing a signaled fence from the list
> > > > nouveau_fence_chan.pending.
> > > >=20
> > > > This self-imposed rule is violated in nouveau_fence_done(),
> > > > where
> > > > dma_fence_is_signaled() (somewhat surprisingly, considering its
> > > > name)
> > > > can signal the fence without removing it from the list. This
> > > > enables
> > > > accesses to already signaled fences through the list, which is
> > > > a
> > > > bug.
> > > >=20
> > > > In particular, it can race with nouveau_fence_context_kill(),
> > > > which
> > > > would then attempt to set an error code on an already signaled
> > > > fence,
> > > > which is illegal.
> > > >=20
> > > > In nouveau_fence_done(), the call to nouveau_fence_update()
> > > > already
> > > > ensures to signal all ready fences. Thus, the signaling
> > > > potentially
> > > > performed by dma_fence_is_signaled() is actually not necessary.
> > > Ah, I now got what you are trying to do here! But that won't
> > > help.
> > >=20
> > > The problem is it is perfectly valid for somebody external (e.g.
> > > other driver, TTM etc...) to call dma_fence_is_signaled() on a
> > > nouveau fence.
> > >=20
> > > This will then in turn still signal the fence and leave it on the
> > > pending list and creating the problem you have.
> > Good to hear =E2=80=93 precisely that then is the use case for a dma_fe=
nce
> > callback! ^_^ It guarantees that, no matter who signals a fence, no
> > matter at what place, a certain action will always be performed.
> >=20
> > I can't think of any other mechanism which could guarantee that a
> > signaled fence immediately gets removed from nouveau's pending
> > list,
> > other than the callbacks.
> >=20
> > But seriously, I don't think that anyone does this currently, nor
> > do I
> > think that anyone could get away with doing it without the entire
> > computer burning down.
>=20
> Yeah, I don't think that this is possible at the moment.
>=20
> When you do stuff like that from the provider side you will always
> run into lifetime issues because in the signaling from interrupt case
> you then drop the last reference before the signaling is completed.
>=20
> How about the attached (not even compile tested) patch? I think it
> should fix the issue.

This patch looked correct enough for me to try it out on top of my
memleak fix series [1] (which seems to reveal all those problems
through races appearing due to the removal of the waitqueue in
nouveau_sched_fini()).

The code looked correct to me, but it still makes boom-boom, again
because two parties get their fingers onto list_del():

[paste in case my editor explodes again:
https://paste.debian.net/1368705/ ]

[   41.681698] list_del corruption, ff31ae696cdc86a0->next is
LIST_POISON1 (dead000000000100)
[   41.681720] ------------[ cut here ]------------
[   41.681722] kernel BUG at lib/list_debug.c:56!
[   41.681729] Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
[   41.681732] CPU: 22 UID: 42 PID: 1733 Comm: gnome-shell Not tainted
6.14.0-rc4+ #11
[   41.681735] Hardware name: Dell Inc. Precision 7960 Tower/01G0M6,
BIOS 2.7.0 12/17/2024
[   41.681737] RIP: 0010:__list_del_entry_valid_or_report+0x76/0xf0
[   41.681743] Code: 75 66 5b b8 01 00 00 00 5d 41 5c c3 cc cc cc cc 48
89 ef e8 4c e7 b0 ff 48 89 ea 48 89 de 48 c7 c7 38 fb b5 a0 e8 3a 6d 6b
ff <0f> 0b 4c 89 e7 e8 30 e7 b0 ff 4c 89 e2 48 89 de 48 c7 c7 70 fb b5
[   41.681745] RSP: 0018:ff4fe30cc0f83b30 EFLAGS: 00010246
[   41.681748] RAX: 000000000000004e RBX: ff31ae696cdc86a0 RCX:
0000000000000027
[   41.681749] RDX: 0000000000000000 RSI: 0000000000000001 RDI:
ff31ae8850321900
[   41.681751] RBP: dead000000000100 R08: 0000000000000000 R09:
0000000000000000
[   41.681752] R10: 7572726f63206c65 R11: 6c65645f7473696c R12:
dead000000000122
[   41.681753] R13: ff31ae696cdc8662 R14: ff4fe30cc0f83cb8 R15:
00007f68b7f9a000
[   41.681754] FS:  00007f68bd0396c0(0000) GS:ff31ae8850300000(0000)
knlGS:0000000000000000
[   41.681756] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   41.681757] CR2: 00005577caaad68c CR3: 000000010407c003 CR4:
0000000000f71ef0
[   41.681758] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[   41.681759] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7:
0000000000000400
[   41.681760] PKRU: 55555554
[   41.681761] Call Trace:
[   41.681763]  <TASK>
[   41.681764]  ? __die_body.cold+0x19/0x27
[   41.681768]  ? die+0x2e/0x50
[   41.681772]  ? do_trap+0xca/0x110
[   41.681775]  ? do_error_trap+0x6a/0x90
[   41.681776]  ? __list_del_entry_valid_or_report+0x76/0xf0
[   41.681778]  ? exc_invalid_op+0x50/0x70
[   41.681781]  ? __list_del_entry_valid_or_report+0x76/0xf0
[   41.681782]  ? asm_exc_invalid_op+0x1a/0x20
[   41.681788]  ? __list_del_entry_valid_or_report+0x76/0xf0
[   41.681789]  nouveau_fence_is_signaled+0x47/0xc0 [nouveau]
[   41.681961]  dma_resv_iter_walk_unlocked.part.0+0xbd/0x170
[   41.681966]  dma_resv_test_signaled+0x53/0x100
[   41.681969]  ttm_bo_release+0x12d/0x2f0 [ttm]
[   41.681979]  nouveau_gem_object_del+0x54/0x80 [nouveau]
[   41.682090]  ttm_bo_vm_close+0x41/0x60 [ttm]
[   41.682097]  remove_vma+0x2c/0x70
[   41.682100]  vms_complete_munmap_vmas+0xd8/0x180
[   41.682102]  do_vmi_align_munmap+0x1d7/0x250
[   41.682106]  do_vmi_munmap+0xd0/0x170
[   41.682109]  __vm_munmap+0xb1/0x180
[   41.682112]  __x64_sys_munmap+0x1b/0x30
[   41.682115]  do_syscall_64+0x82/0x160
[   41.682117]  ? do_user_addr_fault+0x55a/0x7b0
[   41.682121]  ? exc_page_fault+0x7e/0x1a0
[   41.682124]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   41.682127] RIP: 0033:0x7f68cceff02b
[   41.682130] Code: 73 01 c3 48 8b 0d e5 6d 0f 00 f7 d8 64 89 01 48 83
c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 0b 00 00 00 0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b5 6d 0f 00 f7 d8 64 89 01 48
[   41.682131] RSP: 002b:00007ffed8d00c08 EFLAGS: 00000206 ORIG_RAX:
000000000000000b
[   41.682134] RAX: ffffffffffffffda RBX: 00005577ca99ef50 RCX:
00007f68cceff02b
[   41.682135] RDX: 0000000000000000 RSI: 0000000000001000 RDI:
00007f68b7f9a000
[   41.682136] RBP: 00007ffed8d00c50 R08: 00005577cacc4160 R09:
00005577caccf930
[   41.682137] R10: 000199999996d999 R11: 0000000000000206 R12:
0000000000000000
[   41.682138] R13: 00007ffed8d00c60 R14: 00005577caf6c550 R15:
0000000000000035
[   41.682141]  </TASK>
[   41.682141] Modules linked in: nf_conntrack_netbios_ns
nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill
ip_set nf_tables qrtr sunrpc snd_sof_pci_intel_tgl
snd_sof_pci_intel_cnl snd_sof_intel_hda_generic snd_sof_pci
snd_sof_xtensa_dsp snd_sof_intel_hda_common snd_soc_hdac_hda
snd_sof_intel_hda snd_sof snd_sof_utils snd_soc_acpi_intel_match
snd_soc_acpi snd_soc_acpi_intel_sdca_quirks snd_sof_intel_hda_mlink
snd_soc_sdca snd_soc_avs snd_ctl_led intel_rapl_msr snd_soc_hda_codec
snd_hda_ext_core intel_rapl_common snd_hda_codec_realtek snd_soc_core
intel_uncore_frequency snd_hda_codec_generic
intel_uncore_frequency_common intel_ifs snd_hda_scodec_component
snd_hda_codec_hdmi i10nm_edac snd_compress skx_edac_common binfmt_misc
nfit snd_hda_intel snd_intel_dspcfg snd_hda_codec libnvdimm snd_hwdep
snd_hda_core snd_seq snd_seq_device x86_pkg_temp_thermal dell_pc
dell_wmi
[   41.682195]  dax_hmem platform_profile intel_powerclamp
sparse_keymap cxl_acpi snd_pcm cxl_port coretemp iTCO_wdt cxl_core
spi_nor intel_pmc_bxt dell_wmi_sysman rapl pmt_telemetry dell_smbios
iTCO_vendor_support pmt_class intel_cstate snd_timer vfat dcdbas
isst_if_mmio mtd dell_smm_hwmon dell_wmi_ddv dell_wmi_descriptor
intel_uncore firmware_attributes_class wmi_bmof atlantic fat einj
pcspkr isst_if_mbox_pci snd isst_if_common intel_vsec i2c_i801 mei_me
e1000e spi_intel_pci macsec soundcore i2c_smbus spi_intel mei joydev
loop nfnetlink zram nouveau drm_ttm_helper ttm iaa_crypto
polyval_clmulni rtsx_pci_sdmmc polyval_generic mmc_core gpu_sched
ghash_clmulni_intel i2c_algo_bit nvme sha512_ssse3 drm_gpuvm drm_exec
sha256_ssse3 idxd nvme_core sha1_ssse3 drm_display_helper rtsx_pci cec
nvme_auth idxd_bus pinctrl_alderlake ip6_tables ip_tables fuse
[   41.682269] ---[ end trace 0000000000000000 ]---
[   41.969442] RIP: 0010:__list_del_entry_valid_or_report+0x76/0xf0
[   41.969458] Code: 75 66 5b b8 01 00 00 00 5d 41 5c c3 cc cc cc cc 48
89 ef e8 4c e7 b0 ff 48 89 ea 48 89 de 48 c7 c7 38 fb b5 a0 e8 3a 6d 6b
ff <0f> 0b 4c 89 e7 e8 30 e7 b0 ff 4c 89 e2 48 89 de 48 c7 c7 70 fb b5
[   41.969461] RSP: 0018:ff4fe30cc0f83b30 EFLAGS: 00010246
[   41.969464] RAX: 000000000000004e RBX: ff31ae696cdc86a0 RCX:
0000000000000027
[   41.969466] RDX: 0000000000000000 RSI: 0000000000000001 RDI:
ff31ae8850321900
[   41.969468] RBP: dead000000000100 R08: 0000000000000000 R09:
0000000000000000
[   41.969469] R10: 7572726f63206c65 R11: 6c65645f7473696c R12:
dead000000000122
[   41.969470] R13: ff31ae696cdc8662 R14: ff4fe30cc0f83cb8 R15:
00007f68b7f9a000
[   41.969471] FS:  00007f68bd0396c0(0000) GS:ff31ae8850300000(0000)
knlGS:0000000000000000
[   41.969473] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   41.969474] CR2: 00005577caaad68c CR3: 000000010407c003 CR4:
0000000000f71ef0
[   41.969476] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[   41.969477] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7:
0000000000000400
[   41.969478] PKRU: 55555554


I fail to see why exactly right now, but am also quite tired. Might
take another look the next days.

Although I'm not convinced that my solution is bad either. It's
Nouveau, after all. On this ranch a cowboy has to defend himself with
the pitchfork instead of the colt at times.


[1] https://lore.kernel.org/all/20250407152239.34429-2-phasta@kernel.org/



P.

>=20
> Regards,
> Christian.
>=20
> >=20
> > P.
> >=20
> >=20
> >=20
> > > Regards,
> > > Christian.
> > >=20
> > > > Replace the call to dma_fence_is_signaled() with
> > > > nouveau_fence_base_is_signaled().
> > > >=20
> > > > Cc: <stable@vger.kernel.org> # 4.10+, precise commit not to be
> > > > determined
> > > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > > ---
> > > > =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
> > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > index 7cc84472cece..33535987d8ed 100644
> > > > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > @@ -274,7 +274,7 @@ nouveau_fence_done(struct nouveau_fence
> > > > *fence)
> > > > =C2=A0			nvif_event_block(&fctx->event);
> > > > =C2=A0		spin_unlock_irqrestore(&fctx->lock, flags);
> > > > =C2=A0	}
> > > > -	return dma_fence_is_signaled(&fence->base);
> > > > +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence-
> > > > > base.flags);
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static long

