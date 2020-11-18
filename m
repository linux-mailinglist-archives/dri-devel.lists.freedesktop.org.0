Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5782B83A2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 19:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BF26E42F;
	Wed, 18 Nov 2020 18:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F1C6E42F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 18:11:00 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id d17so4282179lfq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 10:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=A/g3yYtN8H9WQxXIPZbNKmKtXHXUxDwRyCAO0Mol3gw=;
 b=RD1DU3CAhxoyGkJcnAvi1nG+AMxWMTP9QyO3Mdicy1LN6Qf4pSgGhCNbURofZE+erM
 HqnXlPqVoBAVv//4v3BXSfA5clhx+yKpCwmxzAmJTAtcCk5wv1FoC7TlO9PQY016G9MD
 HNRcZyCCYj/OAbwQEquwlOHXHzDSLr0GN8dGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A/g3yYtN8H9WQxXIPZbNKmKtXHXUxDwRyCAO0Mol3gw=;
 b=MSJjd9bMnBeAeRZKka0eZaOp8Tc59mQNeebGBBN0ue7WVfattffCFHkafyXg0DBgEY
 H5r9WYnP59dU0MkoMsMK4/qId6m4hh9D5IpkUH/hhzGd3Hw+VZ++4E/HEXY4h3AeboGt
 7Snq7m+dLALuJdbk+vQllqSOWHxmt+rVYHJP7DczjIHIFmT1hTVVtcuAlMrM9afo4+Hz
 Ck/Mu4GRsI3T5iXaSgWMLOSYZKMyrjp2oYWHieUlqXZgf0eth/pCuf/lsKBKKCfhjKbr
 9mKk1j0WwaDfl/+h1Ywr64J5N1ZCatdTgcUaLsgN3kUfEc6v0XGNxkb3k4Dleh1/A1Nn
 45CA==
X-Gm-Message-State: AOAM531uyhgW8nsFQ6sGvchomNpZPsY9nVxxgqvi3LbBHnvhL/fJyk9X
 AFWFdxVdpNb+mOqTDhyDWMtpcl64EvI6Eg==
X-Google-Smtp-Source: ABdhPJxPg7d7FYPR0IqQA9Yu6ZraEJWVpfa1WgOvQFZ9AEML5Y+7O7gj8H3yDfxNkTMweVZk/hQykA==
X-Received: by 2002:a19:2407:: with SMTP id k7mr4377288lfk.533.1605723058566; 
 Wed, 18 Nov 2020 10:10:58 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id c17sm3670665lfr.135.2020.11.18.10.10.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 10:10:56 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id y16so3406757ljk.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 10:10:54 -0800 (PST)
X-Received: by 2002:a05:651c:2cb:: with SMTP id
 f11mr4299671ljo.371.1605723053125; 
 Wed, 18 Nov 2020 10:10:53 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wjFfAktnadOPb_iV5nKh=V5Am1sG-gciYveswRtuEkrLQ@mail.gmail.com>
 <692820a49ded436591b5fe3a18c68a5e@AcuMS.aculab.com>
In-Reply-To: <692820a49ded436591b5fe3a18c68a5e@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 Nov 2020 10:10:37 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgQY7k_3NVCbaSmiJyLiAV_1TgwLk-d4QRMHMWqM5Oo_w@mail.gmail.com>
Message-ID: <CAHk-=wgQY7k_3NVCbaSmiJyLiAV_1TgwLk-d4QRMHMWqM5Oo_w@mail.gmail.com>
Subject: Re: Linux 5.10-rc4
To: David Laight <David.Laight@aculab.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 18, 2020 at 4:12 AM David Laight <David.Laight@aculab.com> wrote:
>
> I've got the 'splat' below during boot.
> This is an 8-core C2758 Atom cpu using the on-board/cpu graphics.
> User space is Ubuntu 20.04.
>
> Additionally the X display has all the colours and alignment slightly
> messed up.
> 5.9.0 was ok.
> I'm just guessing the two issues are related.

Sounds likely.  But it would be lovely if you could bisect when
exactly the problem(s) started to both verify that, and just to
pinpoint the exact change..

I'm adding Thomas Zimmermann to the cc, because he did that "drm/ast:
Program display mode in CRTC's atomic_enable" which looks relevant in
that it's right in that call-chain.

Did some initialization perhaps get overlooked?

And Dave and Daniel and the drm list cc'd as well..

Full splat left quoted below for new people and list.

            Linus

> [   20.809891] WARNING: CPU: 0 PID: 973 at drivers/gpu/drm/drm_gem_vram_helper.c:284 drm_gem_vram_offset+0x35/0x40 [drm_vram_helper]
> [   20.821543] Modules linked in: nls_iso8859_1 dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua ipmi_ssif intel_powerclamp coretemp kvm_intel kvm joydev input_leds ipmi_si intel_cstate ipmi_devintf ipmi_msghandler mac_hid sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx libcrc32c xor raid6_pq raid1 raid0 multipath linear ast drm_vram_helper drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops cec drm_ttm_helper ttm crct10dif_pclmul crc32_pclmul ghash_clmulni_intel gpio_ich drm aesni_intel hid_generic glue_helper crypto_simd igb usbhid cryptd ahci i2c_i801 hid libahci i2c_smbus lpc_ich dca i2c_ismt i2c_algo_bit
> [   20.887477] CPU: 0 PID: 973 Comm: gnome-shell Not tainted 5.10.0-rc4+ #78
> [   20.894274] Hardware name: Supermicro A1SAi/A1SRi, BIOS 1.1a 08/27/2015
> [   20.900896] RIP: 0010:drm_gem_vram_offset+0x35/0x40 [drm_vram_helper]
> [   20.907342] Code: 00 48 89 e5 85 c0 74 17 48 83 bf 78 01 00 00 00 74 18 48 8b 87 80 01 00 00 5d 48 c1 e0 0c c3 0f 0b 48 c7 c0 ed ff ff ff 5d c3 <0f> 0b 31 c0 5d c3 0f 1f 44 00 00 0f 1f 44 00 00 55 48 8b 87 18 06
> [   20.926100] RSP: 0018:ffff9f59811d3a68 EFLAGS: 00010246
> [   20.931339] RAX: 0000000000000002 RBX: ffff8b46861e20c0 RCX: ffffffffc032d600
> [   20.938479] RDX: ffff8b468f47a000 RSI: ffff8b46861e2000 RDI: ffff8b468f9acc00
> [   20.945622] RBP: ffff9f59811d3a68 R08: 0000000000000040 R09: ffff8b46864ce288
> [   20.952769] R10: 0000000000000000 R11: 0000000000000001 R12: ffff8b468f47a000
> [   20.959915] R13: 0000000000000000 R14: 0000000000000000 R15: ffff8b468ad2bf00
> [   20.967057] FS:  00007f5b37ac5cc0(0000) GS:ffff8b49efc00000(0000) knlGS:0000000000000000
> [   20.975149] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   20.980904] CR2: 00007f5b3d093f00 CR3: 0000000103438000 CR4: 00000000001006f0
> [   20.988047] Call Trace:
> [   20.990506]  ast_cursor_page_flip+0x22/0x100 [ast]
> [   20.995313]  ast_cursor_plane_helper_atomic_update+0x46/0x70 [ast]
> [   21.001524]  drm_atomic_helper_commit_planes+0xbd/0x220 [drm_kms_helper]
> [   21.008243]  drm_atomic_helper_commit_tail_rpm+0x3a/0x70 [drm_kms_helper]
> [   21.015062]  commit_tail+0x99/0x130 [drm_kms_helper]
> [   21.020050]  drm_atomic_helper_commit+0x123/0x150 [drm_kms_helper]
> [   21.026269]  drm_atomic_commit+0x4a/0x50 [drm]
> [   21.030737]  drm_atomic_helper_update_plane+0xe7/0x140 [drm_kms_helper]
> [   21.037384]  __setplane_atomic+0xcc/0x110 [drm]
> [   21.041953]  drm_mode_cursor_universal+0x13e/0x260 [drm]
> [   21.047299]  drm_mode_cursor_common+0xef/0x220 [drm]
> [   21.052287]  ? alloc_set_pte+0x10d/0x6d0
> [   21.056244]  ? drm_mode_cursor_ioctl+0x60/0x60 [drm]
> [   21.061242]  drm_mode_cursor2_ioctl+0xe/0x10 [drm]
> [   21.066067]  drm_ioctl_kernel+0xae/0xf0 [drm]
> [   21.070455]  drm_ioctl+0x241/0x3f0 [drm]
> [   21.074415]  ? drm_mode_cursor_ioctl+0x60/0x60 [drm]
> [   21.079401]  __x64_sys_ioctl+0x91/0xc0
> [   21.083167]  do_syscall_64+0x38/0x90
> [   21.086755]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   21.091813] RIP: 0033:0x7f5b3cf1350b
> [   21.095403] Code: 0f 1e fa 48 8b 05 85 39 0d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 55 39 0d 00 f7 d8 64 89 01 48
> [   21.114154] RSP: 002b:00007ffef1966588 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [   21.121730] RAX: ffffffffffffffda RBX: 00007ffef19665c0 RCX: 00007f5b3cf1350b
> [   21.128870] RDX: 00007ffef19665c0 RSI: 00000000c02464bb RDI: 0000000000000009
> [   21.136013] RBP: 00000000c02464bb R08: 0000000000000040 R09: 0000000000000004
> [   21.143157] R10: 0000000000000002 R11: 0000000000000246 R12: 0000561ec9d10060
> [   21.150295] R13: 0000000000000009 R14: 0000561eca2cc9a0 R15: 0000000000000040
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
