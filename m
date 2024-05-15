Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8443B8C6D12
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 22:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AC010E5F1;
	Wed, 15 May 2024 20:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Tc2JwmPd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C7910E5F1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 20:06:36 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52232d0e5ceso6668339e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 13:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1715803594; x=1716408394;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xgWTsnppDGQ+VtFfLUk2HloVqk5skXTycI5AJpTh8zw=;
 b=Tc2JwmPdbdS+KufQO9KmnErNAhP0AQznzVySTK1ICZAhVGPi4e28BgKBbYRfR260f5
 1o7UU6hn84dYqRjenp3T+2DpnfFXu/CIy2Trl6DfOUfzo5Opy2WShwmuX/89ZP0ozFhm
 t9zeMaoV5NTjs3CiFi1RwJaFz+oRG+0SID9VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715803594; x=1716408394;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xgWTsnppDGQ+VtFfLUk2HloVqk5skXTycI5AJpTh8zw=;
 b=YaJQvyrjph7+Gux4dm+SNwmiMzsYQtLric7MvU+rO+VP+0YtRgIqlm+2LPRXZXwhQN
 vFg5VuGp9Lg5R0zzupvZUy+Q9JTZep/jHIyfo7nFF4tBLjjWYci7yL7xYzpr/vCU/CcW
 t+nyOI0GbhJExOoR8/Ey8KcyFGa/4G50++UV86Ffan4QiocwWwVg0ViF7I5qvQR/jgnw
 Vrdmf6mqvcah5ixX6Ep5nshuRzbr38FWbGbX7Op0uVtRcqZHiXi4zwiOMtF1a54DCzyn
 q9j+9rznaEm7tYiDPHMRxSuIusZnz+ksxymX/U8WX7bmqWjZgXCL/nhZBBjOSeQnzZrH
 JTyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFIXFnmRJgbZs/BWcZrfXuDqGdxM7GZsyk4v1r20YQFARoYga5BpQywfnxY8v6CgPXMj8KpcY8ct1JvKW2FTDkiDv1GOCaB5aHWykI1EGZ
X-Gm-Message-State: AOJu0YxRdrUdAyM6joaUKCj1dyB58bA1gRhTZUgNfuFlZ/3tU0lZR57K
 2opRPMu08b4WzdGs77GjY1s7ZOSCRN2u0oba8ogjBP6gSg74/XtO8jXMxxlzx9e16/GPMVf15qf
 844/bSA==
X-Google-Smtp-Source: AGHT+IFD7fNbALDXLs6ET21iL9bDtCv9M51RvXtb9djfe1IfkJIPD/udRd2Ri/aOQ7KJchfLxzSQag==
X-Received: by 2002:ac2:488d:0:b0:515:c9a5:6abe with SMTP id
 2adb3069b0e04-5220fd79fe1mr9054272e87.40.1715803593688; 
 Wed, 15 May 2024 13:06:33 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c322c3csm9615694a12.83.2024.05.15.13.06.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 13:06:33 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-572e8028e0cso2390869a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 13:06:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVArq3gJsbXgxTiWSTlos4GSZpvVit8L9vkVcrLAMkt6fpXnsddBbdSUXqdS3pqtnGETKPqZcf/VJBcniqYqNOLIQO3ZsCiP1HIfnC6SJgK
X-Received: by 2002:a17:906:b2d3:b0:a59:cf0a:4e46 with SMTP id
 a640c23a62f3a-a5a2d5d53a0mr1067386566b.42.1715803592607; Wed, 15 May 2024
 13:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
In-Reply-To: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 May 2024 13:06:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wge0et+3PP47OBnNx66Q=i_XgqfGfrSmDGHSyp=Jn-CgQ@mail.gmail.com>
Message-ID: <CAHk-=wge0et+3PP47OBnNx66Q=i_XgqfGfrSmDGHSyp=Jn-CgQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.10-rc1
To: Dave Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 14 May 2024 at 23:21, Dave Airlie <airlied@gmail.com> wrote:
>
> In drivers the main thing is a new driver for ARM Mali firmware based
> GPUs, otherwise there are a lot of changes to amdgpu/xe/i915/msm and
> scattered changes to everything else.

Hmm. There's something seriously wrong with amdgpu.

I'm getting a ton of__force_merge warnings:

  WARNING: CPU: 0 PID: 1069 at drivers/gpu/drm/drm_buddy.c:199
__force_merge+0x14f/0x180 [drm_buddy]
  Modules linked in: hid_logitech_hidpp hid_logitech_dj uas
usb_storage amdgpu drm_ttm_helper ttm video drm_exec
drm_suballoc_helper amdxcp drm_buddy gpu_sched drm_display_helper
drm_kms_helper crct10dif_pclmul crc32_pclmul crc32c_intel drm
ghash_clmulni_intel igb atlantic nvme dca macsec ccp i2c_algo_bit
nvme_core sp5100_tco wmi ip6_tables ip_tables fuse
  CPU: 0 PID: 1069 Comm: plymouthd Not tainted 6.9.0-07381-g3860ca371740 #60
  Hardware name: Gigabyte Technology Co., Ltd. TRX40 AORUS
MASTER/TRX40 AORUS MASTER, BIOS F7 09/07/2022
  RIP: 0010:__force_merge+0x14f/0x180 [drm_buddy]
  Code: 74 0d 49 8b 44 24 18 48 d3 e0 49 29 44 24 30 4c 89 e7 ba 01 00
00 00 e8 9f 00 00 00 44 39 e8 73 1f 49 8b 04 24 e9 25 ff ff ff <0f> 0b
4c 39 c3 75 a3 eb 99 b8 f4 ff ff ff c3 b8 f4 ff ff ff eb 02
  RSP: 0018:ffffb87a81cb7908 EFLAGS: 00010246
  RAX: ffff9b1915de8000 RBX: ffff9b1919478288 RCX: 000000000ffff800
  RDX: ffff9b19194782f8 RSI: ffff9b19194782d0 RDI: ffff9b19194782b0
  RBP: 0000000000000000 R08: ffff9b1919478288 R09: 0000000000001000
  R10: 0000000000000800 R11: 0000000000000000 R12: ffff9b192590fa18
  R13: 000000000000000d R14: 0000000010000000 R15: 0000000000000000
  FS:  00007fa06bfa9740(0000) GS:ffff9b281e000000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 0000555adb857000 CR3: 000000011b516000 CR4: 0000000000350ef0
  Call Trace:
   ? __force_merge+0x14f/0x180 [drm_buddy]
   drm_buddy_alloc_blocks+0x249/0x400 [drm_buddy]
   ? __cond_resched+0x16/0x40
   amdgpu_vram_mgr_new+0x204/0x3f0 [amdgpu]
   ttm_resource_alloc+0x31/0x120 [ttm]
   ttm_bo_alloc_resource+0xbc/0x260 [ttm]
   ttm_bo_validate+0x9f/0x210 [ttm]
   ttm_bo_init_reserved+0x103/0x130 [ttm]
   amdgpu_bo_create+0x246/0x400 [amdgpu]
   ? amdgpu_bo_destroy+0x70/0x70 [amdgpu]
   amdgpu_bo_create_user+0x29/0x40 [amdgpu]
   amdgpu_mode_dumb_create+0x108/0x190 [amdgpu]
   ? amdgpu_bo_destroy+0x70/0x70 [amdgpu]
   ? drm_mode_create_dumb+0xa0/0xa0 [drm]
   drm_ioctl_kernel+0xad/0xd0 [drm]
   drm_ioctl+0x330/0x4b0 [drm]
   ? drm_mode_create_dumb+0xa0/0xa0 [drm]
   amdgpu_drm_ioctl+0x41/0x80 [amdgpu]
   __x64_sys_ioctl+0xd2a/0xe00
   ? update_process_times+0x89/0xa0
   ? tick_nohz_handler+0xe2/0x120
   ? timerqueue_add+0x94/0xa0
   ? __hrtimer_run_queues+0x12b/0x250
   ? ktime_get+0x34/0xb0
   ? lapic_next_event+0x12/0x20
   ? clockevents_program_event+0x78/0xd0
   ? hrtimer_interrupt+0x118/0x390
   ? sched_clock+0x5/0x10
   do_syscall_64+0x68/0x130
   ? __irq_exit_rcu+0x53/0xb0
   entry_SYSCALL_64_after_hwframe+0x4b/0x53

and eventually the whole thing just crashes entirely, with a bad page
state in the VM:

  BUG: Bad page state in process kworker/u261:13  pfn:31fb9a
  page: refcount:0 mapcount:0 mapping:00000000ff0b239e index:0x37ce8
pfn:0x31fb9a
  aops:btree_aops ino:1
  flags: 0x2fffc600000020c(referenced|uptodate|workingset|node=0|zone=2|lastcpupid=0x3fff)
  page_type: 0xffffffff()

which comes from a btrfs worker (btrfs-delayed-meta
btrfs_work_helper), but I would not be surprised if that was caused by
whatever odd thing is going on with the DRM code. IOW, it *looks* like
this code ends up just corrupting memory in horrible ways.

            Linus

                Linus
