Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC8A8C7B14
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 19:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B2210E44D;
	Thu, 16 May 2024 17:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Q9DxeUWO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2661A10E44D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 17:25:33 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-574f7c0bab4so3944191a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 10:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1715880331; x=1716485131;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZoJcT9IN7CXxnbK0d4qtbKbdlGqkhITWkFsznFTzj4Q=;
 b=Q9DxeUWOUAd0Z4b5bwagnkhEUG/L7pfVr0q0VnJKa3PqZKedYzcXsMvUlDijiSWv/s
 5CNYOUmcPnTuTXBnGHH/173GBAkkLXe7/mRKOEKQ8CxbtjuZlEuLe5QTP6YW6nUf1rhY
 fLI2+ZMINvd6zK1jtLrD6XxNiwr93W+YZN4fE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715880331; x=1716485131;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZoJcT9IN7CXxnbK0d4qtbKbdlGqkhITWkFsznFTzj4Q=;
 b=Zmh1QiDXNnF2XPQ56C0LmQb+MfE7+NxELHsrOcggSp2qKmv/gCEN8Adq6FhYmhZHzU
 fbsdh5sW77Oyp0LJtzB9oOFpsBD8BCixDSkKsvQL7MKqN86+ZcQH2nvqFKHkgUut1t/G
 tVXxaRxwv9bJ6wIEpeRdUGU6Ua2bG70ctPcV3rJmPbzLwYChb+hk7azV7D9Nw6ca5Sxv
 BV/yfiZwwis680Nnw5RMrEcY3tKqvftEV64PmLxk0ruK26ojC2GoS0iYllGa/DgumE64
 htRV3j6hyoazpVluTK47Yyhaz1sC5t3FkOAmwLb42sqoaiLGyGksbbXEe5w3qCizzihi
 sJdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ4KjI0uINXvFKu9Yrb41jwQVFcd3P2pYPD4ULZyzZ/fES2YproeUfxr8151+fyUmdgeQPxa2fB8W5160EZMg0S2L6qBJCmpJVPRNfPD7n
X-Gm-Message-State: AOJu0Yx4NYMARnt0FKGuc/50l9K1t4Ht3OH8sREq66UVDiIWyEEFTc4n
 ZwkTAtQlT5SL8a3PrXrKeA5YruNCUj6pvby4XSKsua2TStsXRRh5Sn7ycPf464eT0pVh3o/jyge
 VN78W2w==
X-Google-Smtp-Source: AGHT+IGtBUdqMCaghO1YKL7IbF1QcK/c4L8aReQnp7mZJNk6JbDGiWPdkzOkGwzi/fB2T/wHWOmEwQ==
X-Received: by 2002:a17:906:6a10:b0:a59:9636:f3e with SMTP id
 a640c23a62f3a-a5a118c520bmr2237985266b.33.1715880330919; 
 Thu, 16 May 2024 10:25:30 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com.
 [209.85.218.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a50365669sm763938066b.193.2024.05.16.10.25.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 10:25:30 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a5cdd6cfae7so256115166b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 10:25:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWkaxvcYaHiJHR5roLcL456x+5xzP18NqR5Qkz3SpYsIgkoLs8RCaTDtAhyD7MkPVZxOruaUFe8+pYXa4THrcPypY5KFkoROHMQYMK8dkzc
X-Received: by 2002:a17:906:6547:b0:a5a:8896:73de with SMTP id
 a640c23a62f3a-a5a88967610mr708543966b.26.1715880330099; Thu, 16 May 2024
 10:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tx_KS1qc8E1kUB5PPBvO9EKHNkk7hYWu-WwWJ6os=otJA@mail.gmail.com>
In-Reply-To: <CAPM=9tx_KS1qc8E1kUB5PPBvO9EKHNkk7hYWu-WwWJ6os=otJA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 16 May 2024 10:25:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjdyimk4t2C7xfqLYFX1HUH92yTRTFQXAitJJT+REvF3Q@mail.gmail.com>
Message-ID: <CAHk-=wjdyimk4t2C7xfqLYFX1HUH92yTRTFQXAitJJT+REvF3Q@mail.gmail.com>
Subject: Re: [git pull] drm urgent for 6.10-rc1
To: Dave Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, 
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

On Wed, 15 May 2024 at 19:54, Dave Airlie <airlied@gmail.com> wrote:
>
> Here is the buddy allocator fix I picked up from the list, please apply.

So I removed my reverts, and am running a kernel that includes the
merge 972a2543e3dd ("Merge tag 'drm-next-2024-05-16' of
https://gitlab.freedesktop.org/drm/kernel") but I still see a lot of
warnings as per below.

I was going to say that the difference is that now they trigger
through the page fault path (amdgpu_gem_fault) while previously they
triggered through the system call path and amdgpu_drm_ioctl. But it
turns out it's both in both cases, and it just happened to be one or
the other in the particular warnings that I cut-and-pasted.

As before, there are tens of thousands of them after being up for less
than an hour, so this is not some kind of rare thing.

The machine hasn't _crashed_ yet, though. But I'm going to be out and
about and working on my laptop the rest of the day, so I won't be able
to test.

(And that kernel version of "6.9.0-08295-gfd39ab3b5289" that is quoted
in the WARN isn't some official kernel, I have about ten private
patches that I keep testing in my tree, so if you wondered what the
heck that git version is, it's not going to match anything you see,
but the ~ten patches also aren't relevant to this).

Nothing unusual in the config, although this is clang-built. Shouldn't
matter, never has before.

            Linus

---
CPU: 28 PID: 3326 Comm: mutter-x11-fram Tainted: G        W
6.9.0-08295-gfd39ab3b5289 #64
Hardware name: Gigabyte Technology Co., Ltd. TRX40 AORUS MASTER/TRX40
AORUS MASTER, BIOS F7 09/07/2022
RIP: 0010:__force_merge+0x14f/0x180 [drm_buddy]
Code: 74 0d 49 8b 44 24 18 48 d3 e0 49 29 44 24 30 4c 89 e7 ba 01 00
00 00 e8 9f 00 00 00 44 39 e8 73 1f 49 8b 04 24 e9 25 ff ff ff <0f> 0b
4c 39 c3 75 a3 eb 99 b8 f4 ff ff ff c3 b8 f4 ff ff ff eb 02
RSP: 0000:ffff9e350314baa0 EFLAGS: 00010246
RAX: ffff974a227a4a00 RBX: ffff974a2d024b88 RCX: 000000000b8eb800
RDX: ffff974a2d024bf8 RSI: ffff974a2d024bd0 RDI: ffff974a2d024bb0
RBP: 0000000000000000 R08: ffff974a2d024b88 R09: 0000000000001000
R10: 0000000000000800 R11: 0000000000000000 R12: ffff974a2198fa18
R13: 0000000000000009 R14: 0000000010000000 R15: 0000000000000000
FS:  00007f56a78b6540(0000) GS:ffff97591e700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5688040000 CR3: 0000000198cc9000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 ? __warn+0xc1/0x190
 ? __force_merge+0x14f/0x180 [drm_buddy]
 ? report_bug+0x129/0x1a0
 ? handle_bug+0x3d/0x70
 ? exc_invalid_op+0x16/0x40
 ? asm_exc_invalid_op+0x16/0x20
 ? __force_merge+0x14f/0x180 [drm_buddy]
 drm_buddy_alloc_blocks+0x249/0x400 [drm_buddy]
 ? __cond_resched+0x16/0x40
 amdgpu_vram_mgr_new+0x204/0x3f0 [amdgpu]
 ttm_resource_alloc+0x31/0x120 [ttm]
 ttm_bo_alloc_resource+0xbc/0x260 [ttm]
 ? memcg_account_kmem+0x4a/0xe0
 ? ttm_resource_compatible+0xbb/0xe0 [ttm]
 ttm_bo_validate+0x9f/0x210 [ttm]
 ? __alloc_pages+0x129/0x210
 amdgpu_bo_fault_reserve_notify+0x98/0x110 [amdgpu]
 amdgpu_gem_fault+0x53/0xd0 [amdgpu]
 __do_fault+0x41/0x140
 do_pte_missing+0x453/0xfd0
 handle_mm_fault+0x73c/0x1090
 do_user_addr_fault+0x2e2/0x6f0
 exc_page_fault+0x56/0x110
 asm_exc_page_fault+0x22/0x30
