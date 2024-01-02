Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C538219B2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 11:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F34E10E08F;
	Tue,  2 Jan 2024 10:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DE810E0D3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 10:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704191372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2A/k3NwCeVAup3mVWkxBmzDW6zyEIqnjTkrSFsMu7FM=;
 b=TS5eOXNQCQqKk/r9Ds+ortmy6Z/q1nPdWE6QimHwaPr5XqchsAGUdsgh8eH/z0JBfYiU27
 CgMqT4snScdNYvYRwmaED2A0eKfgQhgEogwkAXqum/KCxFk6E4i5TPmo/dfXOiQeBg7R2h
 +9TI5e7mRs3MAqT074HZOAwSdWuyh7E=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-S8d-cZvoNcqzNR9eK-AY4g-1; Tue, 02 Jan 2024 05:29:31 -0500
X-MC-Unique: S8d-cZvoNcqzNR9eK-AY4g-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-28be2bd2ba4so4052335a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jan 2024 02:29:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704191370; x=1704796170;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2A/k3NwCeVAup3mVWkxBmzDW6zyEIqnjTkrSFsMu7FM=;
 b=gkhFABys89e0uKorlSdbx64yBmsqCX2uJxlh6bpXgiFKtLqtPGqbgeWnpOdPaDYQok
 7PLbb+rN7iDtA8MxdGk4bDAdB/CiRmshMCt5MJAloZrb3i6VRnx9fQdWSUImbM1BED5J
 uQ5iMSi8Ra39USH85+ezLJ9QE5+/XMDFVJwhT1J7cunW/crfYOtlhT4qvZQoWDQM3hK6
 3dztejfXz6pbV3zfgtXeiPd0lmB1sgzHdETkW40joU3/z/6U2a0zTVHBS2rYoxtA8ULj
 kNob41x1/7MrFLRWonc+0L3gMwsEIoJ3XVmKvtjVq7hJtJVaRq/7eNMy0bMLkvqpkVbi
 9hPw==
X-Gm-Message-State: AOJu0YxB7iAzgngBKT9+t2FxAzUqT3IB6lNTXKwHHaGDJ6aiTlEza7/x
 uv+NfO8e65rZbUcm4W9EAymgvbfNhzYVqDm1vqT/2xIRQzz8GQ+qXi3GWc+fg3Fm/Q6FgKDBMbS
 QsDx5DG9R2L6OWczhDJynsZ+hUiEGzmJAnEMd
X-Received: by 2002:a17:90a:f40e:b0:28c:e568:5ebd with SMTP id
 ch14-20020a17090af40e00b0028ce5685ebdmr17128pjb.37.1704191370059; 
 Tue, 02 Jan 2024 02:29:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExqlIDJkWXxAfGwgPdJEztWa7yaf98XBDHih7D2UIVxxIYpgEuw4kSSnbOhNNofbKAUPAVew==
X-Received: by 2002:a17:90a:f40e:b0:28c:e568:5ebd with SMTP id
 ch14-20020a17090af40e00b0028ce5685ebdmr17121pjb.37.1704191369711; 
 Tue, 02 Jan 2024 02:29:29 -0800 (PST)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 pv1-20020a17090b3c8100b0028cd86f321fsm2556660pjb.43.2024.01.02.02.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 02:29:29 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/vmwgfx: Unmap the surface before resetting it on a
 plane state
In-Reply-To: <20231224052540.605040-1-zack.rusin@broadcom.com>
References: <20231224052540.605040-1-zack.rusin@broadcom.com>
Date: Tue, 02 Jan 2024 11:29:23 +0100
Message-ID: <87r0j03u64.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: stable@vger.kernel.org, Ian Forbes <ian.forbes@broadcom.com>,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 Martin Krastev <martin.krastev@broadcom.com>,
 Stefan Hoffmeister <stefan.hoffmeister@econos.de>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zack Rusin <zack.rusin@broadcom.com> writes:

Hello Zack,

> Switch to a new plane state requires unreferencing of all held surfaces.
> In the work required for mob cursors the mapped surfaces started being
> cached but the variable indicating whether the surface is currently
> mapped was not being reset. This leads to crashes as the duplicated
> state, incorrectly, indicates the that surface is mapped even when
> no surface is present. That's because after unreferencing the surface
> it's perfectly possible for the plane to be backed by a bo instead of a
> surface.
>
> Reset the surface mapped flag when unreferencing the plane state surface
> to fix null derefs in cleanup. Fixes crashes in KDE KWin 6.0 on Wayland:
>
> Oops: 0000 [#1] PREEMPT SMP PTI
> CPU: 4 PID: 2533 Comm: kwin_wayland Not tainted 6.7.0-rc3-vmwgfx #2
> Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 11/12/2020
> RIP: 0010:vmw_du_cursor_plane_cleanup_fb+0x124/0x140 [vmwgfx]
> Code: 00 00 00 75 3a 48 83 c4 10 5b 5d c3 cc cc cc cc 48 8b b3 a8 00 00 00 48 c7 c7 99 90 43 c0 e8 93 c5 db ca 48 8b 83 a8 00 00 00 <48> 8b 78 28 e8 e3 f>
> RSP: 0018:ffffb6b98216fa80 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffff969d84cdcb00 RCX: 0000000000000027
> RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff969e75f21600
> RBP: ffff969d4143dc50 R08: 0000000000000000 R09: ffffb6b98216f920
> R10: 0000000000000003 R11: ffff969e7feb3b10 R12: 0000000000000000
> R13: 0000000000000000 R14: 000000000000027b R15: ffff969d49c9fc00
> FS:  00007f1e8f1b4180(0000) GS:ffff969e75f00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000028 CR3: 0000000104006004 CR4: 00000000003706f0
> Call Trace:
>  <TASK>
>  ? __die+0x23/0x70
>  ? page_fault_oops+0x171/0x4e0
>  ? exc_page_fault+0x7f/0x180
>  ? asm_exc_page_fault+0x26/0x30
>  ? vmw_du_cursor_plane_cleanup_fb+0x124/0x140 [vmwgfx]
>  drm_atomic_helper_cleanup_planes+0x9b/0xc0
>  commit_tail+0xd1/0x130
>  drm_atomic_helper_commit+0x11a/0x140
>  drm_atomic_commit+0x97/0xd0
>  ? __pfx___drm_printfn_info+0x10/0x10
>  drm_atomic_helper_update_plane+0xf5/0x160
>  drm_mode_cursor_universal+0x10e/0x270
>  drm_mode_cursor_common+0x102/0x230
>  ? __pfx_drm_mode_cursor2_ioctl+0x10/0x10
>  drm_ioctl_kernel+0xb2/0x110
>  drm_ioctl+0x26d/0x4b0
>  ? __pfx_drm_mode_cursor2_ioctl+0x10/0x10
>  ? __pfx_drm_ioctl+0x10/0x10
>  vmw_generic_ioctl+0xa4/0x110 [vmwgfx]
>  __x64_sys_ioctl+0x94/0xd0
>  do_syscall_64+0x61/0xe0
>  ? __x64_sys_ioctl+0xaf/0xd0
>  ? syscall_exit_to_user_mode+0x2b/0x40
>  ? do_syscall_64+0x70/0xe0
>  ? __x64_sys_ioctl+0xaf/0xd0
>  ? syscall_exit_to_user_mode+0x2b/0x40
>  ? do_syscall_64+0x70/0xe0
>  ? exc_page_fault+0x7f/0x180
>  entry_SYSCALL_64_after_hwframe+0x6e/0x76
> RIP: 0033:0x7f1e93f279ed
> Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff f>
> RSP: 002b:00007ffca0faf600 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 000055db876ed2c0 RCX: 00007f1e93f279ed
> RDX: 00007ffca0faf6c0 RSI: 00000000c02464bb RDI: 0000000000000015
> RBP: 00007ffca0faf650 R08: 000055db87184010 R09: 0000000000000007
> R10: 000055db886471a0 R11: 0000000000000246 R12: 00007ffca0faf6c0
> R13: 00000000c02464bb R14: 0000000000000015 R15: 00007ffca0faf790
>  </TASK>
> Modules linked in: snd_seq_dummy snd_hrtimer nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_ine>
> CR2: 0000000000000028
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:vmw_du_cursor_plane_cleanup_fb+0x124/0x140 [vmwgfx]
> Code: 00 00 00 75 3a 48 83 c4 10 5b 5d c3 cc cc cc cc 48 8b b3 a8 00 00 00 48 c7 c7 99 90 43 c0 e8 93 c5 db ca 48 8b 83 a8 00 00 00 <48> 8b 78 28 e8 e3 f>
> RSP: 0018:ffffb6b98216fa80 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffff969d84cdcb00 RCX: 0000000000000027
> RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff969e75f21600
> RBP: ffff969d4143dc50 R08: 0000000000000000 R09: ffffb6b98216f920
> R10: 0000000000000003 R11: ffff969e7feb3b10 R12: 0000000000000000
> R13: 0000000000000000 R14: 000000000000027b R15: ffff969d49c9fc00
> FS:  00007f1e8f1b4180(0000) GS:ffff969e75f00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000028 CR3: 0000000104006004 CR4: 00000000003706f0
>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Fixes: 485d98d472d5 ("drm/vmwgfx: Add support for CursorMob and CursorBypass 4")
> Reported-by: Stefan Hoffmeister <stefan.hoffmeister@econos.de>
> Closes: https://gitlab.freedesktop.org/drm/misc/-/issues/34
> Cc: Martin Krastev <martin.krastev@broadcom.com>
> Cc: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
> Cc: Ian Forbes <ian.forbes@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.19+
> ---

I'm not familiar with this driver but your explanation in the commit
message is very clear and from inspecting the code, the change looks
correct to me.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

