Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B617D376A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 15:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D3810E0BD;
	Mon, 23 Oct 2023 13:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 583 seconds by postgrey-1.36 at gabe;
 Mon, 23 Oct 2023 13:06:31 UTC
Received: from out-203.mta1.migadu.com (out-203.mta1.migadu.com
 [95.215.58.203])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D053F10E0C3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 13:06:31 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1698065801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DibBT+Cxaspvrrd75l4t/nEOTmiyvO/k87QOeRksta4=;
 b=AWLfGLB5z/RmfcU++nipn2//MwZtuA2DZ+LXveRszl6H821gYpKH5MhhNkZnmAw10f8hoU
 3MYFhD4F8XkMNkGISplDeOtwCWkSggvPeRdXrttSRhNbwwhzyiTZoxCImv9nTTo02uGATB
 bK3lODWOHRh2gkcX66EjTciY4fpzO7I=
Date: Mon, 23 Oct 2023 12:56:37 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: qu.huang@linux.dev
Message-ID: <4a687c592b0f1b04f4bbf684129f5ce02b2b6f7b@linux.dev>
TLS-Required: No
Subject: [PATCH] drm/amdgpu: Fix a null pointer access when the smc_rreg 
 pointer is NULL
To: alexander.deucher@amd.com
X-Migadu-Flow: FLOW_OUT
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
Cc: tom.stdenis@amd.com, Praful.Swarnakar@amd.com, srinivasan.shanmugam@amd.com,
 suhui@nfschina.com, qu.huang@linux.dev, Xinhui.Pan@amd.com,
 Harish.Kasiviswanathan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, le.ma@amd.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, victorchengchi.lu@amd.com,
 christian.koenig@amd.com, dan.carpenter@linaro.org, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In certain types of chips, such as VEGA20, reading the amdgpu_regs_smc fi=
le could result in an abnormal null pointer access when the smc_rreg poin=
ter is NULL. Below are the steps to reproduce this issue and the correspo=
nding exception log:

1. Navigate to the directory: /sys/kernel/debug/dri/0
2. Execute command: cat amdgpu_regs_smc
3. Exception Log::
[4005007.702554] BUG: kernel NULL pointer dereference, address: 000000000=
0000000
[4005007.702562] #PF: supervisor instruction fetch in kernel mode
[4005007.702567] #PF: error_code(0x0010) - not-present page
[4005007.702570] PGD 0 P4D 0
[4005007.702576] Oops: 0010 [#1] SMP NOPTI
[4005007.702581] CPU: 4 PID: 62563 Comm: cat Tainted: G           OE     =
5.15.0-43-generic #46-Ubunt       u
[4005007.702590] RIP: 0010:0x0
[4005007.702598] Code: Unable to access opcode bytes at RIP 0xfffffffffff=
fffd6.
[4005007.702600] RSP: 0018:ffffa82b46d27da0 EFLAGS: 00010206
[4005007.702605] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffa82=
b46d27e68
[4005007.702609] RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff994=
0656e0000
[4005007.702612] RBP: ffffa82b46d27dd8 R08: 0000000000000000 R09: ffff994=
060c07980
[4005007.702615] R10: 0000000000020000 R11: 0000000000000000 R12: 00007f5=
e06753000
[4005007.702618] R13: ffff9940656e0000 R14: ffffa82b46d27e68 R15: 00007f5=
e06753000
[4005007.702622] FS:  00007f5e0755b740(0000) GS:ffff99479d300000(0000) kn=
lGS:0000000000000000
[4005007.702626] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[4005007.702629] CR2: ffffffffffffffd6 CR3: 00000003253fc000 CR4: 0000000=
0003506e0
[4005007.702633] Call Trace:
[4005007.702636]  <TASK>
[4005007.702640]  amdgpu_debugfs_regs_smc_read+0xb0/0x120 [amdgpu]
[4005007.703002]  full_proxy_read+0x5c/0x80
[4005007.703011]  vfs_read+0x9f/0x1a0
[4005007.703019]  ksys_read+0x67/0xe0
[4005007.703023]  __x64_sys_read+0x19/0x20
[4005007.703028]  do_syscall_64+0x5c/0xc0
[4005007.703034]  ? do_user_addr_fault+0x1e3/0x670
[4005007.703040]  ? exit_to_user_mode_prepare+0x37/0xb0
[4005007.703047]  ? irqentry_exit_to_user_mode+0x9/0x20
[4005007.703052]  ? irqentry_exit+0x19/0x30
[4005007.703057]  ? exc_page_fault+0x89/0x160
[4005007.703062]  ? asm_exc_page_fault+0x8/0x30
[4005007.703068]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[4005007.703075] RIP: 0033:0x7f5e07672992
[4005007.703079] Code: c0 e9 b2 fe ff ff 50 48 8d 3d fa b2 0c 00 e8 c5 1d=
 02 00 0f 1f 44 00 00 f3 0f        1e fa 64 8b 04 25 18 00 00 00 85 c0 75=
 10 0f 05 <48> 3d 00 f0 ff ff 77 56 c3 0f 1f 44 00 00 48 83 e       c 28 =
48 89 54 24
[4005007.703083] RSP: 002b:00007ffe03097898 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000000
[4005007.703088] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f5=
e07672992
[4005007.703091] RDX: 0000000000020000 RSI: 00007f5e06753000 RDI: 0000000=
000000003
[4005007.703094] RBP: 00007f5e06753000 R08: 00007f5e06752010 R09: 00007f5=
e06752010
[4005007.703096] R10: 0000000000000022 R11: 0000000000000246 R12: 0000000=
000022000
[4005007.703099] R13: 0000000000000003 R14: 0000000000020000 R15: 0000000=
000020000
[4005007.703105]  </TASK>
[4005007.703107] Modules linked in: nf_tables libcrc32c nfnetlink algif_h=
ash af_alg binfmt_misc nls_       iso8859_1 ipmi_ssif ast intel_rapl_msr =
intel_rapl_common drm_vram_helper drm_ttm_helper amd64_edac t       tm ed=
ac_mce_amd kvm_amd ccp mac_hid k10temp kvm acpi_ipmi ipmi_si rapl sch_fq_=
codel ipmi_devintf ipm       i_msghandler msr parport_pc ppdev lp parport=
 mtd pstore_blk efi_pstore ramoops pstore_zone reed_solo       mon ip_tab=
les x_tables autofs4 ib_uverbs ib_core amdgpu(OE) amddrm_ttm_helper(OE) a=
mdttm(OE) iommu_v       2 amd_sched(OE) amdkcl(OE) drm_kms_helper syscopy=
area sysfillrect sysimgblt fb_sys_fops cec rc_core        drm igb ahci xh=
ci_pci libahci i2c_piix4 i2c_algo_bit xhci_pci_renesas dca
[4005007.703184] CR2: 0000000000000000
[4005007.703188] ---[ end trace ac65a538d240da39 ]---
[4005007.800865] RIP: 0010:0x0
[4005007.800871] Code: Unable to access opcode bytes at RIP 0xfffffffffff=
fffd6.
[4005007.800874] RSP: 0018:ffffa82b46d27da0 EFLAGS: 00010206
[4005007.800878] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffa82=
b46d27e68
[4005007.800881] RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff994=
0656e0000
[4005007.800883] RBP: ffffa82b46d27dd8 R08: 0000000000000000 R09: ffff994=
060c07980
[4005007.800886] R10: 0000000000020000 R11: 0000000000000000 R12: 00007f5=
e06753000
[4005007.800888] R13: ffff9940656e0000 R14: ffffa82b46d27e68 R15: 00007f5=
e06753000
[4005007.800891] FS:  00007f5e0755b740(0000) GS:ffff99479d300000(0000) kn=
lGS:0000000000000000
[4005007.800895] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[4005007.800898] CR2: ffffffffffffffd6 CR3: 00000003253fc000 CR4: 0000000=
0003506e0

Signed-off-by: Qu Huang <qu.huang@linux.dev>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_debugfs.c
index a4faea4..05405da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -748,6 +748,9 @@ static ssize_t amdgpu_debugfs_regs_smc_read(struct fi=
le *f, char __user *buf,
 	ssize_t result =3D 0;
 	int r;

+	if (!adev->smc_rreg)
+		return -EPERM;
+
 	if (size & 0x3 || *pos & 0x3)
 		return -EINVAL;

@@ -804,6 +807,9 @@ static ssize_t amdgpu_debugfs_regs_smc_write(struct f=
ile *f, const char __user *
 	ssize_t result =3D 0;
 	int r;

+	if (!adev->smc_wreg)
+		return -EPERM;
+
 	if (size & 0x3 || *pos & 0x3)
 		return -EINVAL;

--
1.8.3.1
