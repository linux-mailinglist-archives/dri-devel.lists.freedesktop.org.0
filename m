Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A3EAD7FFF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 03:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1ECA10E004;
	Fri, 13 Jun 2025 01:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HTix3quG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436F410E004;
 Fri, 13 Jun 2025 01:11:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 055BE49B29;
 Fri, 13 Jun 2025 01:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C113DC4CEF4;
 Fri, 13 Jun 2025 01:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749777091;
 bh=+NYye4MNUBzt+8gl9CH+0mAJaYkWbn1vnUcsS4wSDTY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=HTix3quG9jysMHH/ardx70hcNXVKzPW5rAo2n53Zo5gcttooUXwhpBWAgRzVEpqc8
 33j6imvtD49t7cl5UNIHG2wuSS8S1DTtRDnvyYNWq62HmkhuWER4LWGckRkZ8lZzlo
 nrLKftaHnOxPf6at6z+EUfMh7wcoR82sJccIGhNEA+16kjR6YrYq3ezMSRz9F5I9Dg
 jtIwb2FBlVT+6CWIK/RHgiAlQMq9px285CKIeo80SxTyqITl1//aMzOMlSUeMluIIX
 5qOCAYGgT30L95eGDcpV/5cZyXNAaS0qeM2aGUQKToypEQOS2z7qzD7U5+ZWEUmNUe
 ZVtU9rGu4W4Nw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B67AAC7114C;
 Fri, 13 Jun 2025 01:11:31 +0000 (UTC)
From: Mingcong Bai via B4 Relay <devnull+jeffbai.aosc.io@kernel.org>
Date: Fri, 13 Jun 2025 09:11:31 +0800
Subject: [PATCH v2 3/5] drm/xe/regs: fix RING_CTL_SIZE(size) calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-upstream-xe-non-4k-v2-v2-3-934f82249f8a@aosc.io>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749777090; l=6855;
 i=jeffbai@aosc.io; s=20250604; h=from:subject:message-id;
 bh=3xAgeSx/kQOKvU32cZAgSjMp+7iADD0ecjGV9IQ2UqA=;
 b=T2CI7xLa2+GyufMpZGOBEUr5PG/VRusl/QURmgjEkWfSVErjRUXfYoofFNSvv27T1+7ypecOL
 3UJUBsTTLk8Akiwo6cLwSIWOffAIqIF+PDE4McTNUJHUkmCPqfNhd9+
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

Similar to the preceding patch for GuC (and with the same references),
Intel GPUs expects command buffers to align to 4KiB boundaries.

Current code uses `PAGE_SIZE' as an assumed alignment reference but 4KiB
kernel page sizes is by no means a guarantee. On 16KiB-paged kernels, this
causes driver failures during boot up:

[   14.018975] ------------[ cut here ]------------
[   14.023562] xe 0000:09:00.0: [drm] GT0: Kernel-submitted job timed out
[   14.030084] WARNING: CPU: 3 PID: 564 at drivers/gpu/drm/xe/xe_guc_submit.c:1181 guc_exec_queue_timedout_job+0x1c0/0xacc [xe]
[   14.041300] Modules linked in: nf_conntrack_netbios_ns(E) nf_conntrack_broadcast(E) nft_fib_inet(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E) ip6table_nat(E) ip6table_mangle(E) ip6table_raw(E) ip6table_security(E) iptable_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) rfkill(E) iptable_mangle(E) iptable_raw(E) iptable_security(E) ip_set(E) nf_tables(E) ip6table_filter(E) ip6_tables(E) iptable_filter(E) snd_hda_codec_conexant(E) snd_hda_codec_generic(E) snd_hda_codec_hdmi(E) nls_iso8859_1(E) snd_hda_intel(E) snd_intel_dspcfg(E) qrtr(E) nls_cp437(E) snd_hda_codec(E) spi_loongson_pci(E) rtc_efi(E) snd_hda_core(E) loongson3_cpufreq(E) spi_loongson_core(E) snd_hwdep(E) snd_pcm(E) snd_timer(E) snd(E) soundcore(E) gpio_loongson_64bit(E) input_leds(E) rtc_loongson(E) i2c_ls2x(E) mousedev(E) sch_fq_codel(E) fuse(E) nfnetlink(E) dmi_sysfs(E) ip_tables(E) x_tables(E) xe(E) d
 rm_gpuvm(E) drm_buddy(E) gpu_sched(E)
[   14.041369]  drm_exec(E) drm_suballoc_helper(E) drm_display_helper(E) cec(E) rc_core(E) hid_generic(E) tpm_tis_spi(E) r8169(E) realtek(E) led_class(E) loongson(E) i2c_algo_bit(E) drm_ttm_helper(E) ttm(E) drm_client_lib(E) drm_kms_helper(E) sunrpc(E) i2c_dev(E)
[   14.153910] CPU: 3 UID: 0 PID: 564 Comm: kworker/u32:2 Tainted: G            E      6.14.0-rc4-aosc-main-gbad70b1cd8b0-dirty #7
[   14.165325] Tainted: [E]=UNSIGNED_MODULE
[   14.169220] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05756-prestab
[   14.182970] Workqueue: gt-ordered-wq drm_sched_job_timedout [gpu_sched]
[   14.189549] pc ffff8000024f3760 ra ffff8000024f3760 tp 900000012f150000 sp 900000012f153ca0
[   14.197853] a0 0000000000000000 a1 0000000000000000 a2 0000000000000000 a3 0000000000000000
[   14.206156] a4 0000000000000000 a5 0000000000000000 a6 0000000000000000 a7 0000000000000000
[   14.214458] t0 0000000000000000 t1 0000000000000000 t2 0000000000000000 t3 0000000000000000
[   14.222761] t4 0000000000000000 t5 0000000000000000 t6 0000000000000000 t7 0000000000000000
[   14.231064] t8 0000000000000000 u0 900000000195c0c8 s9 900000012e4dcf48 s0 90000001285f3640
[   14.239368] s1 90000001004f8000 s2 ffff8000026ec000 s3 0000000000000000 s4 900000012e4dc028
[   14.247672] s5 90000001009f5e00 s6 000000000000137e s7 0000000000000001 s8 900000012f153ce8
[   14.255975]    ra: ffff8000024f3760 guc_exec_queue_timedout_job+0x1c0/0xacc [xe]
[   14.263379]   ERA: ffff8000024f3760 guc_exec_queue_timedout_job+0x1c0/0xacc [xe]
[   14.270777]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
[   14.276927]  PRMD: 00000004 (PPLV0 +PIE -PWE)
[   14.281258]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
[   14.286024]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
[   14.290790] ESTAT: 000c0000 [BRK] (IS= ECode=12 EsubCode=0)
[   14.296329]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
[   14.302299] CPU: 3 UID: 0 PID: 564 Comm: kworker/u32:2 Tainted: G            E      6.14.0-rc4-aosc-main-gbad70b1cd8b0-dirty #7
[   14.302302] Tainted: [E]=UNSIGNED_MODULE
[   14.302302] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05756-prestab
[   14.302304] Workqueue: gt-ordered-wq drm_sched_job_timedout [gpu_sched]
[   14.302307] Stack : 900000012f153928 d84a6232d48f1ac7 900000000023eb34 900000012f150000
[   14.302310]         900000012f153900 0000000000000000 900000012f153908 9000000001c31c70
[   14.302313]         0000000000000000 0000000000000000 0000000000000000 0000000000000000
[   14.302315]         0000000000000000 d84a6232d48f1ac7 0000000000000000 0000000000000000
[   14.302318]         0000000000000000 0000000000000000 0000000000000000 0000000000000000
[   14.302320]         0000000000000000 0000000000000000 00000000072b4000 900000012e4dcf48
[   14.302323]         9000000001eb8000 0000000000000000 9000000001c31c70 0000000000000004
[   14.302325]         0000000000000004 0000000000000000 000000000000137e 0000000000000001
[   14.302328]         900000012f153ce8 9000000001c31c70 9000000000244174 0000555581840b98
[   14.302331]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[   14.302333]         ...
[   14.302335] Call Trace:
[   14.302336] [<9000000000244174>] show_stack+0x3c/0x16c
[   14.302341] [<900000000023eb30>] dump_stack_lvl+0x84/0xe0
[   14.302346] [<9000000000288208>] __warn+0x8c/0x174
[   14.302350] [<90000000017c1918>] report_bug+0x1c0/0x22c
[   14.302354] [<90000000017f66e8>] do_bp+0x280/0x344
[   14.302359]
[   14.302360] ---[ end trace 0000000000000000 ]---

Revise calculation of `RING_CTL_SIZE(size)' to use `SZ_4K' to fix the
aforementioned issue.

Cc: stable@vger.kernel.org
Fixes: b79e8fd954c4 ("drm/xe: Remove dependency on intel_engine_regs.h")
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
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 7ade41e2b7b3b4438a1955eb73e7d929d6bec24c..a7608c50c907e704404d029d909f4b39130d29c7 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -56,7 +56,7 @@
 #define RING_START(base)			XE_REG((base) + 0x38)
 
 #define RING_CTL(base)				XE_REG((base) + 0x3c)
-#define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
+#define   RING_CTL_SIZE(size)			((size) - SZ_4K) /* in bytes -> pages */
 
 #define RING_START_UDW(base)			XE_REG((base) + 0x48)
 

-- 
2.49.0


