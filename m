Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3347D40E3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 22:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DCD10E013;
	Mon, 23 Oct 2023 20:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123A910E013;
 Mon, 23 Oct 2023 20:27:46 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6ce2eaf7c2bso2549432a34.0; 
 Mon, 23 Oct 2023 13:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698092865; x=1698697665; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FzLS/WAJVc8r/bI0YL02DSWgXAnqpt9XXdg9/gyyxpE=;
 b=YT7WflQmi3OmrqUxLl765Q/e0bEmGfOyp6QNnUdGAY3sEo9KEQYTY2FogqN6y08mcK
 m7OxiRqAxUS4Qink3VAqVyJQOSnRmaAliOdBffc7gsMP0EwlsfhPRkZD74FlOvTe5Z08
 UnY8gqYt/XcYPOEwEpZM9fx4aOVKZiaEeDjZH2P4q0vyWG3FK5zTZ5RNuJt2HP3yvmyl
 xfXYRGeQ2fBeBeiPC9bw5WbNIiHrcczwg3G6dWSTMXvxlkzxkiKQUw3UDcTQpDo3tk0o
 0fG4X9PMEdhsIrUvwIuM2ILcNGVVwl3Ko0DCfaV7qWW7tBm+YxWhbG55NRuW1lGATm9i
 FVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698092865; x=1698697665;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FzLS/WAJVc8r/bI0YL02DSWgXAnqpt9XXdg9/gyyxpE=;
 b=P2kscoRi/D1nKPOnsry416jkRJCsFPVvptMrqp+Hm35TdtRTbjWpzSaFga/7aTW0Jr
 2EREHe5SyE8MgEEPVbw9ADO2Fevl5kGvCwcfXLK9HaNuqvYgzQU+AVyWaBB9ptKMN5ws
 wRCG1RH1f0+xDyvPkxViGFITIrbqoTMBo4PzUzhvcTHnJReM/mnKV1ncd05Q0FeqUD1m
 TZeDuwNfg2BlwG4ROEI93yypXEa4uF10HJGuhjsmNEXq1yYiiMh2qY8q8WbWR4DlxxaF
 0dYa990klvZydpfKIh3bmqtaadFFUg/hewqYFjKmo/RqLSNgQhhW7mY61bd41nw+BHmo
 0CVQ==
X-Gm-Message-State: AOJu0Yy9FbOmS5Wl383b1wrUdwze4/Cd5CaJCgMtaWTxdhNfm8Vdnskf
 zJB0AdGHHk16CfrX1IQ9IFtCePBCyzUUHca11sw=
X-Google-Smtp-Source: AGHT+IHiaH512GTb6BpPWBQh3ebnUVcsivT+MJIbGiUzbB0k13wDweg69MJc8eOVh+sM7y5tJsWCcpB2ViIaj0UUY9s=
X-Received: by 2002:a05:6870:13c5:b0:1dc:d8c6:39f with SMTP id
 5-20020a05687013c500b001dcd8c6039fmr10996105oat.14.1698092865253; Mon, 23 Oct
 2023 13:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <4a687c592b0f1b04f4bbf684129f5ce02b2b6f7b@linux.dev>
In-Reply-To: <4a687c592b0f1b04f4bbf684129f5ce02b2b6f7b@linux.dev>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 Oct 2023 16:27:34 -0400
Message-ID: <CADnq5_P-fxbkGbzDAys+pob-mdDJOX0QZYVsVvS=7FyGZukjOQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix a null pointer access when the smc_rreg
 pointer is NULL
To: qu.huang@linux.dev
Content-Type: text/plain; charset="UTF-8"
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
Cc: tom.stdenis@amd.com, Praful.Swarnakar@amd.com, srinivasan.shanmugam@amd.com,
 suhui@nfschina.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 Harish.Kasiviswanathan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, victorchengchi.lu@amd.com,
 linaro-mm-sig@lists.linaro.org, le.ma@amd.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, Hawking.Zhang@amd.com, sumit.semwal@linaro.org,
 dan.carpenter@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Oct 23, 2023 at 9:06=E2=80=AFAM <qu.huang@linux.dev> wrote:
>
> In certain types of chips, such as VEGA20, reading the amdgpu_regs_smc fi=
le could result in an abnormal null pointer access when the smc_rreg pointe=
r is NULL. Below are the steps to reproduce this issue and the correspondin=
g exception log:
>
> 1. Navigate to the directory: /sys/kernel/debug/dri/0
> 2. Execute command: cat amdgpu_regs_smc
> 3. Exception Log::
> [4005007.702554] BUG: kernel NULL pointer dereference, address: 000000000=
0000000
> [4005007.702562] #PF: supervisor instruction fetch in kernel mode
> [4005007.702567] #PF: error_code(0x0010) - not-present page
> [4005007.702570] PGD 0 P4D 0
> [4005007.702576] Oops: 0010 [#1] SMP NOPTI
> [4005007.702581] CPU: 4 PID: 62563 Comm: cat Tainted: G           OE     =
5.15.0-43-generic #46-Ubunt       u
> [4005007.702590] RIP: 0010:0x0
> [4005007.702598] Code: Unable to access opcode bytes at RIP 0xfffffffffff=
fffd6.
> [4005007.702600] RSP: 0018:ffffa82b46d27da0 EFLAGS: 00010206
> [4005007.702605] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffa82=
b46d27e68
> [4005007.702609] RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff994=
0656e0000
> [4005007.702612] RBP: ffffa82b46d27dd8 R08: 0000000000000000 R09: ffff994=
060c07980
> [4005007.702615] R10: 0000000000020000 R11: 0000000000000000 R12: 00007f5=
e06753000
> [4005007.702618] R13: ffff9940656e0000 R14: ffffa82b46d27e68 R15: 00007f5=
e06753000
> [4005007.702622] FS:  00007f5e0755b740(0000) GS:ffff99479d300000(0000) kn=
lGS:0000000000000000
> [4005007.702626] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [4005007.702629] CR2: ffffffffffffffd6 CR3: 00000003253fc000 CR4: 0000000=
0003506e0
> [4005007.702633] Call Trace:
> [4005007.702636]  <TASK>
> [4005007.702640]  amdgpu_debugfs_regs_smc_read+0xb0/0x120 [amdgpu]
> [4005007.703002]  full_proxy_read+0x5c/0x80
> [4005007.703011]  vfs_read+0x9f/0x1a0
> [4005007.703019]  ksys_read+0x67/0xe0
> [4005007.703023]  __x64_sys_read+0x19/0x20
> [4005007.703028]  do_syscall_64+0x5c/0xc0
> [4005007.703034]  ? do_user_addr_fault+0x1e3/0x670
> [4005007.703040]  ? exit_to_user_mode_prepare+0x37/0xb0
> [4005007.703047]  ? irqentry_exit_to_user_mode+0x9/0x20
> [4005007.703052]  ? irqentry_exit+0x19/0x30
> [4005007.703057]  ? exc_page_fault+0x89/0x160
> [4005007.703062]  ? asm_exc_page_fault+0x8/0x30
> [4005007.703068]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [4005007.703075] RIP: 0033:0x7f5e07672992
> [4005007.703079] Code: c0 e9 b2 fe ff ff 50 48 8d 3d fa b2 0c 00 e8 c5 1d=
 02 00 0f 1f 44 00 00 f3 0f        1e fa 64 8b 04 25 18 00 00 00 85 c0 75 1=
0 0f 05 <48> 3d 00 f0 ff ff 77 56 c3 0f 1f 44 00 00 48 83 e       c 28 48 8=
9 54 24
> [4005007.703083] RSP: 002b:00007ffe03097898 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000000
> [4005007.703088] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f5=
e07672992
> [4005007.703091] RDX: 0000000000020000 RSI: 00007f5e06753000 RDI: 0000000=
000000003
> [4005007.703094] RBP: 00007f5e06753000 R08: 00007f5e06752010 R09: 00007f5=
e06752010
> [4005007.703096] R10: 0000000000000022 R11: 0000000000000246 R12: 0000000=
000022000
> [4005007.703099] R13: 0000000000000003 R14: 0000000000020000 R15: 0000000=
000020000
> [4005007.703105]  </TASK>
> [4005007.703107] Modules linked in: nf_tables libcrc32c nfnetlink algif_h=
ash af_alg binfmt_misc nls_       iso8859_1 ipmi_ssif ast intel_rapl_msr in=
tel_rapl_common drm_vram_helper drm_ttm_helper amd64_edac t       tm edac_m=
ce_amd kvm_amd ccp mac_hid k10temp kvm acpi_ipmi ipmi_si rapl sch_fq_codel =
ipmi_devintf ipm       i_msghandler msr parport_pc ppdev lp parport mtd pst=
ore_blk efi_pstore ramoops pstore_zone reed_solo       mon ip_tables x_tabl=
es autofs4 ib_uverbs ib_core amdgpu(OE) amddrm_ttm_helper(OE) amdttm(OE) io=
mmu_v       2 amd_sched(OE) amdkcl(OE) drm_kms_helper syscopyarea sysfillre=
ct sysimgblt fb_sys_fops cec rc_core        drm igb ahci xhci_pci libahci i=
2c_piix4 i2c_algo_bit xhci_pci_renesas dca
> [4005007.703184] CR2: 0000000000000000
> [4005007.703188] ---[ end trace ac65a538d240da39 ]---
> [4005007.800865] RIP: 0010:0x0
> [4005007.800871] Code: Unable to access opcode bytes at RIP 0xfffffffffff=
fffd6.
> [4005007.800874] RSP: 0018:ffffa82b46d27da0 EFLAGS: 00010206
> [4005007.800878] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffa82=
b46d27e68
> [4005007.800881] RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff994=
0656e0000
> [4005007.800883] RBP: ffffa82b46d27dd8 R08: 0000000000000000 R09: ffff994=
060c07980
> [4005007.800886] R10: 0000000000020000 R11: 0000000000000000 R12: 00007f5=
e06753000
> [4005007.800888] R13: ffff9940656e0000 R14: ffffa82b46d27e68 R15: 00007f5=
e06753000
> [4005007.800891] FS:  00007f5e0755b740(0000) GS:ffff99479d300000(0000) kn=
lGS:0000000000000000
> [4005007.800895] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [4005007.800898] CR2: ffffffffffffffd6 CR3: 00000003253fc000 CR4: 0000000=
0003506e0
>
> Signed-off-by: Qu Huang <qu.huang@linux.dev>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_debugfs.c
> index a4faea4..05405da 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -748,6 +748,9 @@ static ssize_t amdgpu_debugfs_regs_smc_read(struct fi=
le *f, char __user *buf,
>         ssize_t result =3D 0;
>         int r;
>
> +       if (!adev->smc_rreg)
> +               return -EPERM;
> +
>         if (size & 0x3 || *pos & 0x3)
>                 return -EINVAL;
>
> @@ -804,6 +807,9 @@ static ssize_t amdgpu_debugfs_regs_smc_write(struct f=
ile *f, const char __user *
>         ssize_t result =3D 0;
>         int r;
>
> +       if (!adev->smc_wreg)
> +               return -EPERM;
> +
>         if (size & 0x3 || *pos & 0x3)
>                 return -EINVAL;
>
> --
> 1.8.3.1
