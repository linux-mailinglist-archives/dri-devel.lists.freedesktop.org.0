Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D25A56E2674
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 17:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C8210E140;
	Fri, 14 Apr 2023 15:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B39110E110;
 Fri, 14 Apr 2023 15:08:23 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-74adf7948f9so1707085a.1; 
 Fri, 14 Apr 2023 08:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681484901; x=1684076901;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1DHJBDspMajlrujavRDU6vtCwaBPIsI/3VTJnd4RLo8=;
 b=oa1AFfbhhVWSNWiQySvCLP8zRBHSTSyk+myCJet9bqPazHyUIjGOHaE7n00zENqqjb
 CiEL9KXgY7vL//KLR2jBwXiSYg7ComjN+YGqezzxKdvx7MVmAYDtpWfMKpJuYHOukSfP
 DXFNfDcqut++VhESUeFRBU8Jbb1xdHkvu4aYJIL1aMZQlwm/4HxXzgJc/urHSr7KiR/v
 PRGzvCFhlgm5hLcVvRvifo6TSP4F/fKndj+MWygavivXn+wzJtJz/Jv1JPt2fAL7dXeU
 4GYILfK9BS73BhFqM4qH0u+Br3hlpVdUpsAhfTULrEGNvAbeR13X1c5ixIgQZ+GtQXmk
 nM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681484901; x=1684076901;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1DHJBDspMajlrujavRDU6vtCwaBPIsI/3VTJnd4RLo8=;
 b=ad8qwTVkK386Y5G4c1hHY5T72r1bpw0uWz2Xuqrzy60Lu9sHtFUbmJtmyjADlpnQ+L
 r0rQBbaRRJ0E9fcENO8Awe5uNnI5hCJUwZEBn1HVQm7LNyoeKoKCvMdNYtoCVAOmryyh
 BYYRbc6x7rZNntwdJFfS4fqgBKie7F65sxg6NUAHkPtQJwutEGQuySFlPoW2VJY3HXXp
 aF7UialT8Rm4A7Ep94C5omyZEncuQKdVdHjc0LhgDiFrupjX3Y8FecvPNNoo46tjRye2
 C/07nOC6OZmGlOYOtQVu0aNCnS5/vMZJdL60WJYfBlunc3d6ZTd273193ioh3ybTjVs5
 Ig3A==
X-Gm-Message-State: AAQBX9frMpgaDWGnUxcvvkDDxqp1CBBCxKda+bZQZgGPm5cvTrx+jDo9
 mvo2+L9cnvYolD8oX0sLAvedgxhxG+eQrSvntSFTmxqNwDp2pBqgLCQ=
X-Google-Smtp-Source: AKy350YNUoOPJ+OCKvYTBSudBhqiHYcwZkBw/V9eFp3pBFko/J+KSso4lMgzKvolYSOm/E8qDnwkH0rUL4O4n/wl1OM=
X-Received: by 2002:ad4:4ea6:0:b0:5ea:a212:3fe1 with SMTP id
 ed6-20020ad44ea6000000b005eaa2123fe1mr4053939qvb.4.1681484900581; Fri, 14 Apr
 2023 08:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsPZxgpFzAVN=eFXu0WV+Jk0vB4rv4p+Jt31C841LcqV=A@mail.gmail.com>
In-Reply-To: <CABXGCsPZxgpFzAVN=eFXu0WV+Jk0vB4rv4p+Jt31C841LcqV=A@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 14 Apr 2023 20:08:09 +0500
Message-ID: <CABXGCsO0sST8+MvQs=T1JP49ogRsaHPT9gMQZGJ3dY7v3m0H8g@mail.gmail.com>
Subject: Re: BUG: KASAN: null-ptr-deref in drm_sched_job_cleanup+0x96/0x290
 [gpu_sched]
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="00000000000031fc2705f94d3664"
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

--00000000000031fc2705f94d3664
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 11, 2023 at 10:40=E2=80=AFPM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> Hi,
> KASAN continues to find problems in the drm_sched_job_cleanup code at 6.3=
rc6.
> I not got any feedback in the thread
> https://lore.kernel.org/lkml/CABXGCsMVUB2RA4D+k5CnA0_2521TOX++D4NmOukKi4X=
2-Q_RfQ@mail.gmail.com/
> Therefore, I decided to start a separate thread. Since the problems
> are different, the symptoms are also different.
>
> Reproduction scenario.
> After launching one of the listed games:
> - Cyberpunk 2077
> - Forza Horizon 4
> - Forza Horizon 5
> - Sackboy: A Big Adventure
>
> Firstly after some time (may be after several attempts) appears bug
> message from KASAN:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: null-ptr-deref in drm_sched_job_cleanup+0x96/0x290 [gpu_sched=
]
> Read of size 4 at addr 0000000000000078 by task ForzaHorizon4.e/31587
>
> CPU: 15 PID: 31587 Comm: ForzaHorizon4.e Tainted: G        W    L
> -------  ---  6.3.0-0.rc6.49.fc39.x86_64+debug #1
> Hardware name: System manufacturer System Product Name/ROG STRIX
> X570-I GAMING, BIOS 4601 02/02/2023
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x72/0xc0
>  kasan_report+0xa4/0xe0
>  ? drm_sched_job_cleanup+0x96/0x290 [gpu_sched]
>  kasan_check_range+0x104/0x1b0
>  drm_sched_job_cleanup+0x96/0x290 [gpu_sched]
>  ? __pfx_drm_sched_job_cleanup+0x10/0x10 [gpu_sched]
>  ? slab_free_freelist_hook+0x11e/0x1d0
>  ? amdgpu_cs_parser_fini+0x363/0x5a0 [amdgpu]
>  amdgpu_job_free+0x40/0x1b0 [amdgpu]
>  amdgpu_cs_parser_fini+0x3c9/0x5a0 [amdgpu]
>  ? __pfx_amdgpu_cs_parser_fini+0x10/0x10 [amdgpu]
>  amdgpu_cs_ioctl+0x3d9/0x5630 [amdgpu]
>  ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
>  ? __kmem_cache_free+0xbc/0x2e0
>  ? mark_lock+0x101/0x16e0
>  ? __lock_acquire+0xe54/0x59f0
>  ? kasan_save_stack+0x3f/0x50
>  ? __pfx_lock_release+0x10/0x10
>  ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
>  drm_ioctl_kernel+0x1f8/0x3d0
>  ? __pfx_drm_ioctl_kernel+0x10/0x10
>  drm_ioctl+0x4c1/0xaa0
>  ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
>  ? __pfx_drm_ioctl+0x10/0x10
>  ? _raw_spin_unlock_irqrestore+0x62/0x80
>  ? lockdep_hardirqs_on+0x7d/0x100
>  ? _raw_spin_unlock_irqrestore+0x4b/0x80
>  amdgpu_drm_ioctl+0xce/0x1b0 [amdgpu]
>  __x64_sys_ioctl+0x12d/0x1a0
>  do_syscall_64+0x5c/0x90
>  ? do_syscall_64+0x68/0x90
>  ? lockdep_hardirqs_on+0x7d/0x100
>  ? do_syscall_64+0x68/0x90
>  ? do_syscall_64+0x68/0x90
>  ? lockdep_hardirqs_on+0x7d/0x100
>  ? do_syscall_64+0x68/0x90
>  ? asm_exc_page_fault+0x22/0x30
>  ? lockdep_hardirqs_on+0x7d/0x100
>  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> RIP: 0033:0x7fb8a270881d
> Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00
> 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2
> 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
> RSP: 002b:00000000467ad060 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00000000467ad358 RCX: 00007fb8a270881d
> RDX: 00000000467ad140 RSI: 00000000c0186444 RDI: 000000000000005a
> RBP: 00000000467ad0b0 R08: 00007fb7f00d3eb0 R09: 00000000467ad100
> R10: 00007fb88c68fb20 R11: 0000000000000246 R12: 00000000467ad140
> R13: 00000000c0186444 R14: 000000000000005a R15: 00007fb7f00d3e50
>  </TASK>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Finally it ends up with the games listed above stopping working they
> stuck after a kernel warning:
> general protection fault, probably for non-canonical address
> 0xdffffc000000000f: 0000 [#1] PREEMPT SMP KASAN NOPTI
> KASAN: null-ptr-deref in range [0x0000000000000078-0x000000000000007f]
> CPU: 15 PID: 31587 Comm: ForzaHorizon4.e Tainted: G    B   W    L
> -------  ---  6.3.0-0.rc6.49.fc39.x86_64+debug #1
> Hardware name: System manufacturer System Product Name/ROG STRIX
> X570-I GAMING, BIOS 4601 02/02/2023
> RIP: 0010:drm_sched_job_cleanup+0xa7/0x290 [gpu_sched]
> Code: d6 01 00 00 4c 8b 75 20 be 04 00 00 00 4d 8d 66 78 4c 89 e7 e8
> ba 4d 4e c9 4c 89 e2 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6
> 14 02 4c 89 e0 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 8a
> RSP: 0018:ffffc9003676f5a8 EFLAGS: 00010216
> RAX: dffffc0000000000 RBX: ffff88816f81f020 RCX: 0000000000000001
> RDX: 000000000000000f RSI: 0000000000000008 RDI: ffffffff9053e5e0
> RBP: ffff88816f81f000 R08: 0000000000000001 R09: ffffffff9053e5e7
> R10: fffffbfff20a7cbc R11: 6e696c6261736944 R12: 0000000000000078
> R13: 1ffff92006cedeb5 R14: 0000000000000000 R15: ffffc9003676f870
> FS:  000000004680f6c0(0000) GS:ffff888fa5c00000(0000) knlGS:0000000029910=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fb854d6f010 CR3: 000000017b2d6000 CR4: 0000000000350ee0
> Call Trace:
>  <TASK>
>  ? __pfx_drm_sched_job_cleanup+0x10/0x10 [gpu_sched]
>  ? slab_free_freelist_hook+0x11e/0x1d0
>  ? amdgpu_cs_parser_fini+0x363/0x5a0 [amdgpu]
>  amdgpu_job_free+0x40/0x1b0 [amdgpu]
>  amdgpu_cs_parser_fini+0x3c9/0x5a0 [amdgpu]
>  ? __pfx_amdgpu_cs_parser_fini+0x10/0x10 [amdgpu]
>  amdgpu_cs_ioctl+0x3d9/0x5630 [amdgpu]
>  ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
>  ? __kmem_cache_free+0xbc/0x2e0
>  ? mark_lock+0x101/0x16e0
>  ? __lock_acquire+0xe54/0x59f0
>  ? kasan_save_stack+0x3f/0x50
>  ? __pfx_lock_release+0x10/0x10
>  ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
>  drm_ioctl_kernel+0x1f8/0x3d0
>  ? __pfx_drm_ioctl_kernel+0x10/0x10
>  drm_ioctl+0x4c1/0xaa0
>  ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
>  ? __pfx_drm_ioctl+0x10/0x10
>  ? _raw_spin_unlock_irqrestore+0x62/0x80
>  ? lockdep_hardirqs_on+0x7d/0x100
>  ? _raw_spin_unlock_irqrestore+0x4b/0x80
>  amdgpu_drm_ioctl+0xce/0x1b0 [amdgpu]
>  __x64_sys_ioctl+0x12d/0x1a0
>  do_syscall_64+0x5c/0x90
>  ? do_syscall_64+0x68/0x90
>  ? lockdep_hardirqs_on+0x7d/0x100
>  ? do_syscall_64+0x68/0x90
>  ? do_syscall_64+0x68/0x90
>  ? lockdep_hardirqs_on+0x7d/0x100
>  ? do_syscall_64+0x68/0x90
>  ? asm_exc_page_fault+0x22/0x30
>  ? lockdep_hardirqs_on+0x7d/0x100
>  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> RIP: 0033:0x7fb8a270881d
> Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00
> 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2
> 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
> RSP: 002b:00000000467ad060 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00000000467ad358 RCX: 00007fb8a270881d
> RDX: 00000000467ad140 RSI: 00000000c0186444 RDI: 000000000000005a
> RBP: 00000000467ad0b0 R08: 00007fb7f00d3eb0 R09: 00000000467ad100
> R10: 00007fb88c68fb20 R11: 0000000000000246 R12: 00000000467ad140
> R13: 00000000c0186444 R14: 000000000000005a R15: 00007fb7f00d3e50
>  </TASK>
> Modules linked in: uinput rfcomm snd_seq_dummy snd_hrtimer
> nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet
> nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4
> nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack
> nf_defrag_ipv6 ip_set nf_tables nfnetlink qrtr bnep sunrpc binfmt_misc
> mt76x2u mt76x2_common mt76x02_usb iwlmvm snd_hda_codec_realtek
> mt76_usb intel_rapl_msr snd_hda_codec_generic snd_hda_codec_hdmi
> intel_rapl_common mt76x02_lib mt76 snd_hda_intel edac_mce_amd
> snd_intel_dspcfg cpi snd_usb_audio snd_hda_codec mac80211 kvm_amd
> snd_usbmidi_lib btusb snd_hda_core snd_rawmidi snd_hwdep mc btrtl kvm
> btbcm btintel snd_seq libarc4 iwlwifi btmtk snd_seq_device vfat
> eeepc_wmi fat bluetooth asus_ec_sensors snd_pcm asus_wmi irqbypass
> ledtrig_audio _keymap snd_timer xpad platform_profile wmi_bmof
> ff_memless rapl joydev pcspkr snd k10temp i2c_piix4 soundcore rfkill
> acpi_cpufreq loop zram amdgpu drm_ttm_helper ttm video iommu_v2
>  drm_buddy gpu_sched drm_display_helper crct10dif_pclmul ucsi_ccg
> crc32_pclmul crc32c_intel typec_ucsi polyval_clmulni polyval_generic
> typec ghash_clmulni_intel cec ccp sha512_ssse3 sp5100_tco igb nvme
> nvme_core dca i2c_algo_bit nvme_common wmi ip6_tables ip_tables
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:drm_sched_job_cleanup+0xa7/0x290 [gpu_sched]
> Code: d6 01 00 00 4c 8b 75 20 be 04 00 00 00 4d 8d 66 78 4c 89 e7 e8
> ba 4d 4e c9 4c 89 e2 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6
> 14 02 4c 89 e0 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 8a
> RSP: 0018:ffffc9003676f5a8 EFLAGS: 00010216
> RAX: dffffc0000000000 RBX: ffff88816f81f020 RCX: 0000000000000001
> RDX: 000000000000000f RSI: 0000000000000008 RDI: ffffffff9053e5e0
> RBP: ffff88816f81f000 R08: 0000000000000001 R09: ffffffff9053e5e7
> R10: fffffbfff20a7cbc R11: 6e696c6261736944 R12: 0000000000000078
> R13: 1ffff92006cedeb5 R14: 0000000000000000 R15: ffffc9003676f870
> FS:  000000004680f6c0(0000) GS:ffff888fa5c00000(0000) knlGS:0000000029910=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fb854d6f010 CR3: 000000017b2d6000 CR4: 0000000000350ee0
>
> Demonstration:
> https://youtu.be/ysRc4TXuBQI
>
> I would be happy to join in testing patches that would fix this.
>
> I attached a full kernel log here.
>

I think that the result of the problem that KASAN found out looks like
this if the kernel is built without KASAN:

BUG: kernel NULL pointer dereference, address: 0000000000000078
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD f975b1067 P4D f975b1067 PUD e3bdba067 PMD f94134067 PTE 0
Oops: 0000 [#1] PREEMPT SMP NOPTI
CPU: 31 PID: 40791 Comm: ForzaHorizon4.e Tainted: G             L
-------  ---  6.3.0-0.rc6.20230413gitde4664485abb.52.fc39.x86_64 #1
Hardware name: System manufacturer System Product Name/ROG STRIX
X570-I GAMING, BIOS 4601 02/02/2023
RIP: 0010:drm_sched_job_cleanup+0x2a/0x130 [gpu_sched]
Code: 0f 1f 44 00 00 55 53 48 89 fb 48 83 ec 10 48 8b 7f 20 65 48 8b
04 25 28 00 00 00 48 89 44 24 08 31 c0 48 c7 04 24 00 00 00 00 <8b> 47
78 85 c0 0f 84 c2 00 00 00 48 83 ff c0 74 1f 48 8d 57 78 b8
RSP: 0018:ffffa69d5d33fa10 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff8a617d87c000 RCX: 00000000b93d601f
RDX: 00000000b93d401f RSI: ad0811cd15498925 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffff8a55c4986018 R09: 0000000080080000
R10: 0000000000000001 R11: 0000000000000000 R12: 00000000ffffffff
R13: 0000000000000018 R14: 0000000000000000 R15: ffffa69d5d33faf8
FS:  0000000048b6f6c0(0000) GS:ffff8a64aa9c0000(0000) knlGS:000000003bc4000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000078 CR3: 000000015a164000 CR4: 0000000000350ee0
Call Trace:
 <TASK>
 amdgpu_job_free+0x15/0xc0 [amdgpu]
 amdgpu_cs_parser_fini+0x137/0x1a0 [amdgpu]
 amdgpu_cs_ioctl+0x176/0x2140 [amdgpu]
 ? kmem_cache_alloc+0xf1/0x310
 ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
 drm_ioctl_kernel+0xc9/0x170
 drm_ioctl+0x269/0x4a0
 ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
 amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]
 __x64_sys_ioctl+0x90/0xd0
 do_syscall_64+0x5c/0x90
 ? __x64_sys_ioctl+0xa8/0xd0
 ? syscall_exit_to_user_mode+0x17/0x40
 ? do_syscall_64+0x68/0x90
 ? exc_page_fault+0x78/0x180
 entry_SYSCALL_64_after_hwframe+0x72/0xdc
RIP: 0033:0x7fe76290881d
Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00
00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2
3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
RSP: 002b:0000000048b6c220 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000048b6c418 RCX: 00007fe76290881d
RDX: 0000000048b6c300 RSI: 00000000c0186444 RDI: 0000000000000059
RBP: 0000000048b6c270 R08: 00007fe6a80bedc0 R09: 0000000048b6c2c0
R10: 00007fe74c678770 R11: 0000000000000246 R12: 0000000048b6c300
R13: 00000000c0186444 R14: 0000000000000059 R15: 0000000000000001
 </TASK>
Modules linked in: overlay tun uinput rfcomm snd_seq_dummy snd_hrtimer
nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet
nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4
nft_reject nf_reject_ipv6 nft_ct nft_chain_nat nf_nat nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink qrtr bnep
sunrpc binfmt_misc snd_hda_codec_realtek snd_hda_codec_generic
intel_rapl_msr snd_hda_codec_hdmi intel_rapl_common mt76x2u rapl
mt76x2_common snd_hda_intel mt76x02_usb iwlmvm snd_hda_codec
mt76x02_lib snd_usb_audio mt76_usb snd_hda_core kvm_amd mt76
snd_intel_dspcfg snd_intel_sdw_acpi vfat fat snd_hwdep mac80211
eeepc_wmi snd_usbmidi_lib asus_wmi kvm snd_rawmidi btusb snd_seq btrtl
snd_seq_device snd_pcm btbcm btintel ledtrig_audio iwlwifi irqbypass
snd_timer libarc4 btmtk sparse_keymap asus_ec_sensors bluetooth snd
edac_mce_amd platform_profile cfg80211 wmi_bmof pcspkr soundcore mc
i2c_piix4 k10temp rfkill joydev acpi_cpufreq loop zram amdgpu
drm_ttm_helper ttm iommu_v2 drm_buddy
 gpu_sched crc32_pclmul drm_display_helper nvme ghash_clmulni_intel
ucsi_ccg polyval_clmulni igb typec_ucsi polyval_generic cec ccp
nvme_core sha512_ssse3 typec crct10dif_pclmul video crc32c_intel
sp5100_tco i2c_algo_bit dca nvme_common wmi ip6_tables ip_tables fuse
CR2: 0000000000000078
---[ end trace 0000000000000000 ]---
RIP: 0010:drm_sched_job_cleanup+0x2a/0x130 [gpu_sched]
Code: 0f 1f 44 00 00 55 53 48 89 fb 48 83 ec 10 48 8b 7f 20 65 48 8b
04 25 28 00 00 00 48 89 44 24 08 31 c0 48 c7 04 24 00 00 00 00 <8b> 47
78 85 c0 0f 84 c2 00 00 00 48 83 ff c0 74 1f 48 8d 57 78 b8
RSP: 0018:ffffa69d5d33fa10 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff8a617d87c000 RCX: 00000000b93d601f
RDX: 00000000b93d401f RSI: ad0811cd15498925 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffff8a55c4986018 R09: 0000000080080000
R10: 0000000000000001 R11: 0000000000000000 R12: 00000000ffffffff
R13: 0000000000000018 R14: 0000000000000000 R15: ffffa69d5d33faf8
FS:  0000000048b6f6c0(0000) GS:ffff8a64aa9c0000(0000) knlGS:000000003bc4000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000078 CR3: 000000015a164000 CR4: 0000000000350ee0
note: ForzaHorizon4.e[40791] exited with irqs disabled

To reproduce it, you need to spend more time running Cyberpunk 2077,
Forza Horizon 4, Forza Horizon 5 in turn.

--=20
Best Regards,
Mike Gavrilov.

--00000000000031fc2705f94d3664
Content-Type: application/x-xz; 
	name="BUG-kernel-NULL-pointer-dereference-address-0000000000000078.tar.xz"
Content-Disposition: attachment; 
	filename="BUG-kernel-NULL-pointer-dereference-address-0000000000000078.tar.xz"
Content-Transfer-Encoding: base64
Content-ID: <f_lggogscp0>
X-Attachment-Id: f_lggogscp0

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
--00000000000031fc2705f94d3664--
