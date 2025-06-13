Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F703AD8001
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 03:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E003710E1E2;
	Fri, 13 Jun 2025 01:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K7xmcNgG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430FE10E0C8;
 Fri, 13 Jun 2025 01:11:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 48F5E629D7;
 Fri, 13 Jun 2025 01:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1FB5C4CEEB;
 Fri, 13 Jun 2025 01:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749777091;
 bh=22pOkiaoYKkKE9+FYGPOdRNTGjENCtQxx9n9TpcRYQw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=K7xmcNgGJceP5Ea/EI6S4Ae9f69XPMUzhS3hCUNJGwOh8mFkn3EiLevIQVzFOJm8P
 srXqvU+UuZSAcRmxl5f7544ZFCkX4hXdB/bv2JtaUQd+sCVN/zaCwJLnrB6VTHeM7t
 AuDznSMSaBbfZyWgq1SrBQQ4qE091QSW4C9aQBJmJIM2KEJdr5tMI7PF6D7Wtr7jc0
 Gq9F/0TUtwG9JBV0LPS85JlmhIUzGmQCgYvfpTFYFDdc2/T7+1bKoCzUGl142n7mkj
 v86mwNjhTLCeERrgcx0T6opX9XOlmpHZSKVY+9IBTIWlbAZggiLspRehb5Ma93ayM5
 TuKwfgD8OPS2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C8653C71136;
 Fri, 13 Jun 2025 01:11:31 +0000 (UTC)
From: Mingcong Bai via B4 Relay <devnull+jeffbai.aosc.io@kernel.org>
Date: Fri, 13 Jun 2025 09:11:32 +0800
Subject: [PATCH v2 4/5] drm/xe: use 4KiB alignment for cursor jumps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-upstream-xe-non-4k-v2-v2-4-934f82249f8a@aosc.io>
References: <20250613-upstream-xe-non-4k-v2-v2-0-934f82249f8a@aosc.io>
In-Reply-To: <20250613-upstream-xe-non-4k-v2-v2-0-934f82249f8a@aosc.io>
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Francois Dugast <francois.dugast@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, 
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Zhanjun Dong <zhanjun.dong@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Alan Previn <alan.previn.teres.alexis@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Mateusz Naklicki <mateusz.naklicki@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Kexy Biscuit <kexybiscuit@aosc.io>, Shang Yatsen <429839446@qq.com>, 
 Mingcong Bai <jeffbai@aosc.io>, Wenbin Fang <fangwenbin@vip.qq.com>, 
 Haien Liang <27873200@qq.com>, Jianfeng Liu <liujianfeng1994@gmail.com>, 
 Shirong Liu <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749777090; l=7981;
 i=jeffbai@aosc.io; s=20250604; h=from:subject:message-id;
 bh=kV2+HI26h6dKnEaSLYBIKXKOHnIj4zNMp7DXKD0IyuY=;
 b=48LfUtXhEPCUahqI3iDktGvLSziHXj/NCM1hwuPhImZqPlmB5YP6R8E3mVMIvkAfuP1Sbe2z8
 TkRywyRsSiYAyzrBxkKRGqHhreKqY3N3LJcwC3M1EmyVP4Nhbsd3YOw
X-Developer-Key: i=jeffbai@aosc.io; a=ed25519;
 pk=MJdgklflDF+Xz9x2Lp+ogEnEyk8HRosMGiqLgWbFctY=
X-Endpoint-Received: by B4 Relay for jeffbai@aosc.io/20250604 with auth_id=422
X-Original-From: Mingcong Bai <jeffbai@aosc.io>
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
Reply-To: jeffbai@aosc.io
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mingcong Bai <jeffbai@aosc.io>

It appears that the xe_res_cursor also assumes 4KiB alignment.

Current implementation uses `PAGE_SIZE' as an assumed alignment reference,
but 4KiB kernel page sizes is by no means a guarantee. On 16KiB-paged
kernels, this causes driver failures during boot up:

[   23.242757] ------------[ cut here ]------------
[   23.247363] WARNING: CPU: 0 PID: 2036 at drivers/gpu/drm/xe/xe_res_cursor.h:182 emit_pte+0x394/0x3b0 [xe]
[   23.256962] Modules linked in: nf_conntrack_netbios_ns(E) nf_conntrack_broadcast(E) nft_fib_inet(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) rfkill(E) nft_chain_nat(E) ip6table_nat(E) ip6table_mangle(E) ip6table_raw(E) ip6table_security(E) iptable_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) iptable_mangle(E) iptable_raw(E) iptable_security(E) ip_set(E) nf_tables(E) ip6table_filter(E) ip6_tables(E) iptable_filter(E) snd_hda_codec_conexant(E) snd_hda_codec_generic(E) snd_hda_codec_hdmi(E) snd_hda_intel(E) snd_intel_dspcfg(E) snd_hda_codec(E) nls_iso8859_1(E) qrtr(E) nls_cp437(E) snd_hda_core(E) loongson3_cpufreq(E) rtc_efi(E) snd_hwdep(E) snd_pcm(E) spi_loongson_pci(E) snd_timer(E) snd(E) spi_loongson_core(E) soundcore(E) gpio_loongson_64bit(E) rtc_loongson(E) i2c_ls2x(E) mousedev(E) input_leds(E) sch_fq_codel(E) fuse(E) nfnetlink(E) dmi_sysfs(E) ip_tables(E) x_tables(E) xe(E) d
 rm_gpuvm(E) drm_buddy(E) gpu_sched(E)
[   23.257034]  drm_exec(E) drm_suballoc_helper(E) drm_display_helper(E) cec(E) rc_core(E) hid_generic(E) tpm_tis_spi(E) r8169(E) loongson(E) i2c_algo_bit(E) realtek(E) drm_ttm_helper(E) led_class(E) ttm(E) drm_client_lib(E) drm_kms_helper(E) sunrpc(E) i2c_dev(E)
[   23.369697] CPU: 0 UID: 1000 PID: 2036 Comm: QSGRenderThread Tainted: G            E      6.14.0-rc4-aosc-main-g7cc07e6e50b0-dirty #8
[   23.381640] Tainted: [E]=UNSIGNED_MODULE
[   23.385534] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05756-prestab
[   23.399319] pc ffff80000251efc0 ra ffff80000251eddc tp 900000011fe3c000 sp 900000011fe3f7e0
[   23.407632] a0 0000000000000001 a1 0000000000000000 a2 0000000000000000 a3 0000000000000000
[   23.415938] a4 0000000000000000 a5 0000000000000000 a6 0000000000060000 a7 900000010c947b00
[   23.424240] t0 0000000000000000 t1 0000000000000000 t2 0000000000000000 t3 900000012e456230
[   23.432543] t4 0000000000000035 t5 0000000000004000 t6 00000001fbc40403 t7 0000000000004000
[   23.440845] t8 9000000100e688a8 u0 5cc06cee8ef0edee s9 9000000100024420 s0 0000000000000047
[   23.449147] s1 0000000000004000 s2 0000000000000001 s3 900000012adba000 s4 ffffffffffffc000
[   23.457450] s5 9000000108939428 s6 0000000000000000 s7 0000000000000000 s8 900000011fe3f8e0
[   23.465851]    ra: ffff80000251eddc emit_pte+0x1b0/0x3b0 [xe]
[   23.471761]   ERA: ffff80000251efc0 emit_pte+0x394/0x3b0 [xe]
[   23.477557]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
[   23.483732]  PRMD: 00000004 (PPLV0 +PIE -PWE)
[   23.488068]  EUEN: 00000003 (+FPE +SXE -ASXE -BTE)
[   23.492832]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
[   23.497594] ESTAT: 000c0000 [BRK] (IS= ECode=12 EsubCode=0)
[   23.503133]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
[   23.509164] CPU: 0 UID: 1000 PID: 2036 Comm: QSGRenderThread Tainted: G            E      6.14.0-rc4-aosc-main-g7cc07e6e50b0-dirty #8
[   23.509168] Tainted: [E]=UNSIGNED_MODULE
[   23.509168] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05756-prestab
[   23.509170] Stack : ffffffffffffffff ffffffffffffffff 900000000023eb34 900000011fe3c000
[   23.509176]         900000011fe3f440 0000000000000000 900000011fe3f448 9000000001c31c70
[   23.509181]         0000000000000000 0000000000000000 0000000000000000 0000000000000000
[   23.509185]         0000000000000000 5cc06cee8ef0edee 0000000000000000 0000000000000000
[   23.509190]         0000000000000000 0000000000000000 0000000000000000 0000000000000000
[   23.509193]         0000000000000000 0000000000000000 00000000066b4000 9000000100024420
[   23.509197]         9000000001eb8000 0000000000000000 9000000001c31c70 0000000000000004
[   23.509202]         0000000000000004 0000000000000000 0000000000000000 0000000000000000
[   23.509206]         900000011fe3f8e0 9000000001c31c70 9000000000244174 00007fffac097534
[   23.509211]         00000000000000b0 0000000000000004 0000000000000003 0000000000071c1d
[   23.509216]         ...
[   23.509218] Call Trace:
[   23.509220] [<9000000000244174>] show_stack+0x3c/0x16c
[   23.509226] [<900000000023eb30>] dump_stack_lvl+0x84/0xe0
[   23.509230] [<9000000000288208>] __warn+0x8c/0x174
[   23.509234] [<90000000017c1918>] report_bug+0x1c0/0x22c
[   23.509238] [<90000000017f66e8>] do_bp+0x280/0x344
[   23.509243] [<90000000002428a0>] handle_bp+0x120/0x1c0
[   23.509247] [<ffff80000251efc0>] emit_pte+0x394/0x3b0 [xe]
[   23.509295] [<ffff800002520d38>] xe_migrate_clear+0x2d8/0xa54 [xe]
[   23.509341] [<ffff8000024e6c38>] xe_bo_move+0x324/0x930 [xe]
[   23.509387] [<ffff800002209468>] ttm_bo_handle_move_mem+0xd0/0x194 [ttm]
[   23.509392] [<ffff800002209ebc>] ttm_bo_validate+0xd4/0x1cc [ttm]
[   23.509396] [<ffff80000220a138>] ttm_bo_init_reserved+0x184/0x1dc [ttm]
[   23.509399] [<ffff8000024e7840>] ___xe_bo_create_locked+0x1e8/0x3d4 [xe]
[   23.509445] [<ffff8000024e7cf8>] __xe_bo_create_locked+0x2cc/0x390 [xe]
[   23.509489] [<ffff8000024e7e98>] xe_bo_create_user+0x34/0xe4 [xe]
[   23.509533] [<ffff8000024e875c>] xe_gem_create_ioctl+0x154/0x4d8 [xe]
[   23.509578] [<9000000001062784>] drm_ioctl_kernel+0xe0/0x14c
[   23.509582] [<9000000001062c10>] drm_ioctl+0x420/0x5f4
[   23.509585] [<ffff8000024ea778>] xe_drm_ioctl+0x64/0xac [xe]
[   23.509630] [<9000000000653504>] sys_ioctl+0x2b8/0xf98
[   23.509634] [<90000000017f684c>] do_syscall+0xa0/0x140
[   23.509637] [<9000000000241e38>] handle_syscall+0xb8/0x158
[   23.509640]
[   23.509644] ---[ end trace 0000000000000000 ]---

Revise calls to `xe_res_dma()' and `xe_res_cursor()' to use
`XE_PTE_MASK' (12) and `SZ_4K' to fix this potentially confused use of
`PAGE_SIZE' in relevant code.

Cc: stable@vger.kernel.org
Fixes: e89b384cde62 ("drm/xe/migrate: Update emit_pte to cope with a size level than 4k")
Tested-by: Mingcong Bai <jeffbai@aosc.io>
Tested-by: Wenbin Fang <fangwenbin@vip.qq.com>
Tested-by: Haien Liang <27873200@qq.com>
Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com>
Tested-by: Shirong Liu <lsr1024@qq.com>
Tested-by: Haofeng Wu <s2600cw2@126.com>
Link: https://github.com/FanFansfan/loongson-linux/commit/22c55ab3931c32410a077b3ddb6dca3f28223360
Link: https://t.me/c/1109254909/768552
Co-developed-by: Shang Yatsen <429839446@qq.com>
Signed-off-by: Shang Yatsen <429839446@qq.com>
Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
---
 drivers/gpu/drm/xe/xe_migrate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8f8e9fdfb2a813dfc7619f626f919c3f70441527..74b887ec4edccccd65b8923b8c170477ca28ed43 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -592,7 +592,7 @@ static void emit_pte(struct xe_migrate *m,
 			u64 addr, flags = 0;
 			bool devmem = false;
 
-			addr = xe_res_dma(cur) & PAGE_MASK;
+			addr = xe_res_dma(cur) & ~XE_PTE_MASK;
 			if (is_vram) {
 				if (vm->flags & XE_VM_FLAG_64K) {
 					u64 va = cur_ofs * XE_PAGE_SIZE / 8;
@@ -613,7 +613,7 @@ static void emit_pte(struct xe_migrate *m,
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
 
-			xe_res_next(cur, min_t(u32, size, PAGE_SIZE));
+			xe_res_next(cur, min_t(u32, size, XE_PAGE_SIZE));
 			cur_ofs += 8;
 		}
 	}

-- 
2.49.0


