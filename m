Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56C5A83E7D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB2D10E81C;
	Thu, 10 Apr 2025 09:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AUCfxjqi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CE010E81A;
 Thu, 10 Apr 2025 09:24:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2223D49DAA;
 Thu, 10 Apr 2025 09:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C042C4CEDD;
 Thu, 10 Apr 2025 09:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744277089;
 bh=z9DLedmXiRmc1dsWGkvkvESFQLVBKuAuxFDjAN5DRx4=;
 h=From:To:Cc:Subject:Date:From;
 b=AUCfxjqiOA5ZUcWKs0YBP5dhkKcYha0CBhmz+nXUyksDNObsq+Ve6Ag2Zyr/YE+U4
 QdKKm6fk8tu5h30MNOZ24JrPhfw19rP4ZkZVBquIB1ryQbDshnU9pLOxrpmIReg12j
 XrhaaRvU9iB5DJFqK4OyFLLafHpYaCTzR8L1h63upZMOSY3Gm+edRn7bXU5PaZTt8+
 blVeZgq3/exCfBa+f+kjz1nzjnvLQ+bHC7rK/PbuOIu680zZr/hIrEAAhEI5qeR+GG
 ONjrGvzF3OfTuVrcX/xQYEv8BeFRaIpM78Qd71cFF43AzeAnSis0l5r3VV2xDVTQm1
 Pu10RVQ73JK/A==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sabrina Dubroca <sd@queasysnail.net>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 0/3] drm/nouveau: Fix & improve nouveau_fence_done()
Date: Thu, 10 Apr 2025 11:24:16 +0200
Message-ID: <20250410092418.135258-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Contains two patches improving nouveau_fence_done(), and one addressing
an actual bug (race):

[   39.848463] WARNING: CPU: 21 PID: 1734 at drivers/gpu/drm/nouveau/nouveau_fence.c:509 nouveau_fence_no_signaling+0xac/0xd0 [nouveau]
[   39.848551] Modules linked in: snd_seq_dummy snd_hrtimer nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_ine
t nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set nf_tables qrtr sunrpc snd_sof_pci_intel_
tgl snd_sof_pci_intel_cnl snd_sof_intel_hda_generic snd_sof_pci snd_sof_xtensa_dsp snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_intel_hda snd_sof snd_sof_utils snd
_soc_acpi_intel_match snd_soc_acpi snd_soc_acpi_intel_sdca_quirks snd_sof_intel_hda_mlink snd_soc_sdca snd_soc_avs snd_ctl_led snd_soc_hda_codec intel_rapl_msr snd_hda_
codec_realtek snd_hda_ext_core intel_rapl_common snd_hda_codec_generic snd_soc_core snd_hda_scodec_component intel_uncore_frequency intel_uncore_frequency_common snd_hd
a_codec_hdmi intel_ifs snd_compress i10nm_edac skx_edac_common nfit snd_hda_intel snd_intel_dspcfg libnvdimm snd_hda_codec binfmt_misc snd_hwdep snd_hda_core snd_seq sn
d_seq_device dell_wmi
[   39.848575]  dell_pc x86_pkg_temp_thermal spi_nor platform_profile sparse_keymap intel_powerclamp dax_hmem snd_pcm cxl_acpi coretemp cxl_port iTCO_wdt mtd rapl intel
_pmc_bxt pmt_telemetry cxl_core dell_wmi_sysman pmt_class iTCO_vendor_support snd_timer isst_if_mmio vfat intel_cstate dell_smbios dcdbas fat dell_wmi_ddv dell_smm_hwmo
n dell_wmi_descriptor firmware_attributes_class wmi_bmof intel_uncore einj pcspkr isst_if_mbox_pci atlantic snd isst_if_common intel_vsec e1000e macsec mei_me i2c_i801 
spi_intel_pci soundcore i2c_smbus spi_intel mei joydev loop nfnetlink zram nouveau drm_ttm_helper ttm polyval_clmulni iaa_crypto gpu_sched polyval_generic rtsx_pci_sdmm
c ghash_clmulni_intel i2c_algo_bit mmc_core drm_gpuvm sha512_ssse3 nvme drm_exec drm_display_helper sha256_ssse3 idxd sha1_ssse3 cec nvme_core idxd_bus rtsx_pci nvme_au
th pinctrl_alderlake ip6_tables ip_tables fuse
[   39.848603] CPU: 21 UID: 42 PID: 1734 Comm: gnome-shell Tainted: G        W          6.14.0-rc4+ #11
[   39.848605] Tainted: [W]=WARN
[   39.848606] Hardware name: Dell Inc. Precision 7960 Tower/01G0M6, BIOS 2.7.0 12/17/2024
[   39.848607] RIP: 0010:nouveau_fence_no_signaling+0xac/0xd0 [nouveau]
[   39.848688] Code: db 74 17 48 8d 7b 38 b8 ff ff ff ff f0 0f c1 43 38 83 f8 01 74 29 85 c0 7e 17 31 c0 5b 5d c3 cc cc cc cc e8 76 b2 c5 f0 eb 96 <0f> 0b e9 67 ff ff f
f be 03 00 00 00 e8 83 76 33 f1 31 c0 eb dd e8
[   39.848690] RSP: 0018:ff1cc1ffc5c039f0 EFLAGS: 00010046
[   39.848691] RAX: 0000000000000001 RBX: ff175a3b504da980 RCX: ff175a3b4801e008
[   39.848692] RDX: ff175a3b43e7bad0 RSI: ffffffffc09d3fda RDI: ff175a3b504da980
[   39.848693] RBP: ff175a3b504da9c0 R08: ffffffffc09e39df R09: 0000000000000001
[   39.848694] R10: 0000000000000001 R11: 0000000000000000 R12: ff175a3b6d97de00
[   39.848695] R13: 0000000000000246 R14: ff1cc1ffc5c03c60 R15: 0000000000000001
[   39.848696] FS:  00007fc5477846c0(0000) GS:ff175a5a50280000(0000) knlGS:0000000000000000
[   39.848698] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   39.848699] CR2: 000055cb7613d1a8 CR3: 000000012e5ce004 CR4: 0000000000f71ef0
[   39.848700] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   39.848701] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
[   39.848702] PKRU: 55555554
[   39.848703] Call Trace:
[   39.848704]  <TASK>
[   39.848705]  ? nouveau_fence_no_signaling+0xac/0xd0 [nouveau]
[   39.848782]  ? __warn.cold+0x93/0xfa
[   39.848785]  ? nouveau_fence_no_signaling+0xac/0xd0 [nouveau]
[   39.848861]  ? report_bug+0xff/0x140
[   39.848863]  ? handle_bug+0x58/0x90
[   39.848865]  ? exc_invalid_op+0x17/0x70
[   39.848866]  ? asm_exc_invalid_op+0x1a/0x20
[   39.848870]  ? nouveau_fence_no_signaling+0xac/0xd0 [nouveau]
[   39.848943]  nouveau_fence_enable_signaling+0x32/0x80 [nouveau]
[   39.849016]  ? __pfx_nouveau_fence_cleanup_cb+0x10/0x10 [nouveau]
[   39.849088]  __dma_fence_enable_signaling+0x33/0xc0
[   39.849090]  dma_fence_add_callback+0x4b/0xd0
[   39.849093]  nouveau_fence_emit+0xa3/0x260 [nouveau]
[   39.849166]  nouveau_fence_new+0x7d/0xf0 [nouveau]
[   39.849242]  nouveau_gem_ioctl_pushbuf+0xe8f/0x1300 [nouveau]
[   39.849338]  ? __pfx_nouveau_gem_ioctl_pushbuf+0x10/0x10 [nouveau]
[   39.849431]  drm_ioctl_kernel+0xad/0x100
[   39.849433]  drm_ioctl+0x288/0x550
[   39.849435]  ? __pfx_nouveau_gem_ioctl_pushbuf+0x10/0x10 [nouveau]
[   39.849526]  nouveau_drm_ioctl+0x57/0xb0 [nouveau]
[   39.849620]  __x64_sys_ioctl+0x94/0xc0
[   39.849621]  do_syscall_64+0x82/0x160
[   39.849623]  ? drm_ioctl+0x2b7/0x550
[   39.849625]  ? __pfx_nouveau_gem_ioctl_pushbuf+0x10/0x10 [nouveau]
[   39.849719]  ? ktime_get_mono_fast_ns+0x38/0xd0
[   39.849721]  ? __pm_runtime_suspend+0x69/0xc0
[   39.849724]  ? syscall_exit_to_user_mode_prepare+0x15e/0x1a0
[   39.849726]  ? syscall_exit_to_user_mode+0x10/0x200
[   39.849729]  ? do_syscall_64+0x8e/0x160
[   39.849730]  ? exc_page_fault+0x7e/0x1a0
[   39.849733]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   39.849735] RIP: 0033:0x7fc5576fe0ad
[   39.849736] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
[   39.849737] RSP: 002b:00007ffc002688a0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   39.849739] RAX: ffffffffffffffda RBX: 000055cb74e316c0 RCX: 00007fc5576fe0ad
[   39.849740] RDX: 00007ffc00268960 RSI: 00000000c0406481 RDI: 000000000000000e
[   39.849741] RBP: 00007ffc002688f0 R08: 0000000000000000 R09: 000055cb74e35560
[   39.849742] R10: 0000000000000014 R11: 0000000000000246 R12: 00007ffc00268960
[   39.849744] R13: 00000000c0406481 R14: 000000000000000e R15: 000055cb74e3cd10
[   39.849746]  </TASK>
[   39.849746] ---[ end trace 0000000000000000 ]---
[   39.849776] ------------[ cut here ]------------


This is the first WARN_ON() in dma_fence_set_error(), called by
nouveau_fence_context_kill().

It's rare, but it is a bug, or rather: the archetype of a race, since
(as Christian pointed out) nouveau_fence_update() later at some point
will remove the signaled fence (by signaling it again).


P.


Philipp Stanner (3):
  drm/nouveau: Prevent signaled fences in pending list
  drm/nouveau: Remove surplus if-branch
  drm/nouveau: Add helper to check base fence

 drivers/gpu/drm/nouveau/nouveau_fence.c | 32 ++++++++++++++-----------
 1 file changed, 18 insertions(+), 14 deletions(-)

-- 
2.48.1

