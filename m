Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55064953A47
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 20:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838CB10E4EB;
	Thu, 15 Aug 2024 18:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="ZkQVtu88";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3448410E4EA
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 18:40:21 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e115ea1b919so1167527276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 11:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723747220; x=1724352020;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q6twqm9Yc6e/2w4/oA8h/PlAlhh+vo52vlGS7BIi8mc=;
 b=ZkQVtu88djHOUQRRVhZShI7dRkEoj3Zj9Bd/uiBMVYFN6jekRsMalcTJmD3zaRRJhz
 ZiMJJFZ0QcuXJg33Cw/dq3cYTTq3oKMzhBDEYy7pROCiwW5j2klbnmcgbJvf8rN2V0Z0
 OYH40ZK0r2ZjQhF9UjgeKgnxTN38eJUBfIwEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723747220; x=1724352020;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q6twqm9Yc6e/2w4/oA8h/PlAlhh+vo52vlGS7BIi8mc=;
 b=CGQmayQkFGaFWfMZJx8GB9KQG7x3mUNopfCHQB45lz5aKBeKOX6CmEyzdyPw0ZpTz5
 PizRemAzGNkJGPxRJpsfxysdvYeOPdn0P/d5XAXRyCxWnHYrMG/VUyMXYpsHmQ5L4Ven
 SW/FbaFi5aPJC4zDVIGWpUfIpr2Ww28oRLoYWlWZoENjpBvmcLkq1qAU/wbUNTgvYi+H
 UBg+ESTB03mHgU9MD+wsqhMsnowUDwAjvrnSDxbcpkoJuBLVx7/ge6MwPztojteNg9Wg
 n2wT0CTidzZ/f40rVQdMqlxRHgjEMPAkfVZpOhiwg9UEMMmGyIMt7Q6uE1eynvzu3uxV
 tyOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUREqnbpxOIDfbvkr3CxrcbKWY5GeAoCP9uJ3auJ2zCnvAu9eOmy8RYHV4CERaJLdEWj6AlBas3TFixF8jD9sN1Ie+MdV/LlQMoUq9mllnn
X-Gm-Message-State: AOJu0YxS/1YEJktjQ+8nw6ifgaWqpj23Xxs629FkwfFO9sybiuqa3lbW
 OKCsxomPE3COwQfd2CmoecRF91Nymk/6QWRnmjTsxKATK/SPpgU2PyD/XL+5FKO5KkGcpc8n2Ud
 lOcdRTzjRLaBVCJ+RUlRueyKAZiPM5BGQ0Sym
X-Google-Smtp-Source: AGHT+IEcy7xzmO5hq16LPn4v17KdZBaVx0Voi4qh8NqcvNrYQaoAHytKR/xOq4LHfcwLe5YLHgQojVrduburu1Ax+lU=
X-Received: by 2002:a05:6902:11cb:b0:e11:44b9:6bb7 with SMTP id
 3f1490d57ef6-e1180f6e192mr966482276.24.1723747220109; Thu, 15 Aug 2024
 11:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <0d0330f3-2ac0-4cd5-8075-7f1cbaf72a8e@heusel.eu>
In-Reply-To: <0d0330f3-2ac0-4cd5-8075-7f1cbaf72a8e@heusel.eu>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 15 Aug 2024 14:40:09 -0400
Message-ID: <CABQX2QM09V=+G=9T6Ax8Ad3F85hU0Cg4WqD82hTN=yhktXNDaQ@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] vmwgfx crashes with command buffer error
 after update
To: Christian Heusel <christian@heusel.eu>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, 
 Martin Krastev <martin.krastev@broadcom.com>, 
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 dri-devel@lists.freedesktop.org, 
 Brad Spengler <spender@grsecurity.net>, rdkehn@gmail.com,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 15, 2024 at 1:48=E2=80=AFPM Christian Heusel <christian@heusel.=
eu> wrote:
>
> Hello Zack,
>
> the user rdkehn (in CC) on the Arch Linux Forums reports that after
> updating to the 6.10.4 stable kernel inside of their VM Workstation the
> driver crashes with the error attached below. This error is also present
> on the latest mainline release 6.11-rc3.
>
> We have bisected the issue together down to the following commit:
>
>     d6667f0ddf46 ("drm/vmwgfx: Fix handling of dumb buffers")
>
> Reverting this commit on top of 6.11-rc3 fixes the issue.
>
> While we were still debugging the issue Brad (also CC'ed) messaged me
> that they were seeing similar failures in their ESXi based test
> pipelines except for one box that was running on legacy BIOS (so maybe
> that is relevant). They noticed this because they had set panic_on_warn.
>
> Cheers,
> Chris
>
> ---
>
> #regzbot introduced: d6667f0ddf46
> #regzbot title: drm/vmwgfx: driver crashes due to command buffer error
> #regzbot link: https://bbs.archlinux.org/viewtopic.php?id=3D298491
>
> ---
>
> dmesg snippet:
> [   13.297084] ------------[ cut here ]------------
> [   13.297086] Command buffer error.
> [   13.297139] WARNING: CPU: 0 PID: 186 at drivers/gpu/drm/vmwgfx/vmwgfx_=
cmdbuf.c:399 vmw_cmdbuf_ctx_process+0x268/0x270 [vmwgfx]
> [   13.297160] Modules linked in: uas usb_storage hid_generic usbhid mpts=
pi sr_mod cdrom scsi_transport_spi vmwgfx serio_raw mptscsih ata_generic at=
kbd drm_ttm_helper libps2 pata_acpi vivaldi_fmap ttm mptbase crc32c_intel x=
hci_pci intel_agp xhci_pci_renesas ata_piix intel_gtt i8042 serio
> [   13.297172] CPU: 0 PID: 186 Comm: irq/16-vmwgfx Not tainted 6.10.4-arc=
h2-1 #1 517ed45cc9c4492ee5d5bfc2d2fe6ef1f2e7a8eb
> [   13.297174] Hardware name: VMware, Inc. VMware Virtual Platform/440BX =
Desktop Reference Platform, BIOS 6.00 11/12/2020
> [   13.297175] RIP: 0010:vmw_cmdbuf_ctx_process+0x268/0x270 [vmwgfx]
> [   13.297186] Code: 01 00 01 e8 ba 8c 4f f9 0f 0b 4c 89 ff e8 40 fb ff f=
f e9 9d fe ff ff 48 c7 c7 99 d9 3f c0 c6 05 52 2f 01 00 01 e8 98 8c 4f f9 <=
0f> 0b e9 1f fe ff ff 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
> [   13.297187] RSP: 0018:ffffb9c1805e3d78 EFLAGS: 00010282
> [   13.297188] RAX: 0000000000000000 RBX: 0000000000000003 RCX: 000000000=
0000003
> [   13.297189] RDX: 0000000000000000 RSI: 0000000000000003 RDI: 000000000=
0000001
> [   13.297190] RBP: ffff907fc8274c98 R08: 0000000000000000 R09: ffffb9c18=
05e3bf8
> [   13.297191] R10: ffff9086dbdfffa8 R11: 0000000000000003 R12: ffff907fc=
4db5b00
> [   13.297192] R13: ffff907fc83fd318 R14: ffff907fc8274c88 R15: ffff907fc=
83fd300
> [   13.297193] FS:  0000000000000000(0000) GS:ffff9086dbe00000(0000) knlG=
S:0000000000000000
> [   13.297194] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   13.297194] CR2: 0000774dc57671ca CR3: 00000006b9e20005 CR4: 000000000=
03706f0
> [   13.297196] Call Trace:
> [   13.297198]  <TASK>
> [   13.297199]  ? vmw_cmdbuf_ctx_process+0x268/0x270 [vmwgfx a4fe13044bca=
4eda782d964fb8c4ca15afb325e9]
> [   13.297209]  ? __warn.cold+0x8e/0xe8
> [   13.297211]  ? vmw_cmdbuf_ctx_process+0x268/0x270 [vmwgfx a4fe13044bca=
4eda782d964fb8c4ca15afb325e9]
> [   13.297221]  ? report_bug+0xff/0x140
> [   13.297222]  ? console_unlock+0x84/0x130
> [   13.297225]  ? handle_bug+0x3c/0x80
> [   13.297226]  ? exc_invalid_op+0x17/0x70
> [   13.297227]  ? asm_exc_invalid_op+0x1a/0x20
> [   13.297230]  ? vmw_cmdbuf_ctx_process+0x268/0x270 [vmwgfx a4fe13044bca=
4eda782d964fb8c4ca15afb325e9]
> [   13.297238]  ? vmw_cmdbuf_ctx_process+0x268/0x270 [vmwgfx a4fe13044bca=
4eda782d964fb8c4ca15afb325e9]
> [   13.297245]  vmw_cmdbuf_man_process+0x5d/0x100 [vmwgfx a4fe13044bca4ed=
a782d964fb8c4ca15afb325e9]
> [   13.297253]  vmw_cmdbuf_irqthread+0x25/0x30 [vmwgfx a4fe13044bca4eda78=
2d964fb8c4ca15afb325e9]
> [   13.297261]  vmw_thread_fn+0x3a/0x70 [vmwgfx a4fe13044bca4eda782d964fb=
8c4ca15afb325e9]
> [   13.297271]  irq_thread_fn+0x20/0x60
> [   13.297273]  irq_thread+0x18a/0x270
> [   13.297274]  ? __pfx_irq_thread_fn+0x10/0x10
> [   13.297276]  ? __pfx_irq_thread_dtor+0x10/0x10
> [   13.297277]  ? __pfx_irq_thread+0x10/0x10
> [   13.297278]  kthread+0xcf/0x100
> [   13.297281]  ? __pfx_kthread+0x10/0x10
> [   13.297282]  ret_from_fork+0x31/0x50
> [   13.297285]  ? __pfx_kthread+0x10/0x10
> [   13.297286]  ret_from_fork_asm+0x1a/0x30
> [   13.297288]  </TASK>
> [   13.297289] ---[ end trace 0000000000000000 ]---

Hi, Christian.

Thanks for the report! So just to be clear vmwgfx doesn't crash, but
it shows a warning and the kernel has been compiled with panic on
warning which is actually what panics, right?

I haven't seen this on any of our systems so I'm guessing the affected
systems aren't running gnome/kde? Is there any chance I could see the
full "journalctl -b" log and the vmware.log file associated with those
warnings? They could give me some clues on how to reproduce this.

z
