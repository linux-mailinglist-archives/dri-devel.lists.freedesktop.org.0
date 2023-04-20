Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F96A6E8D75
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 11:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624FC10E013;
	Thu, 20 Apr 2023 09:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C3C10E013
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 09:04:25 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-552ae3e2cbeso30691007b3.13
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 02:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681981464; x=1684573464;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wKtBzMUV9hqGJdb9Z5c6Q0amkNjCy+P79xURFwU+I0A=;
 b=dw4eyP3VNNMbt4cpBGe9caefQivY9IcuKG0pOnzLCRlD8fZdJY/KIdI80s5BnbM3RG
 UzfjXaKGWVKB7yvPNGx7gtsNquxMUTQPTmJqEPQVXtoDMDIyWojIK4XIPbOvq76fVbVm
 eeVX5SjV83rkCukx+r5a4bsWSc8M1yxqEWMkDtiZ3k70y9j0Pwbq9ao+QAL/smVZkWL0
 0QWt01ZkV5XJK8JQdqvjuWfIKfRG5LsP3x/p+/Hx/NRejL0xCLgvgWXZ1RHdD7bKqyeE
 swBMqzqE1AgmPCRUtK0KfKbx0O781l4n3PSQkIWu8YxXdIDAcKURfPJJdKEGBnPV4XYN
 Ewgg==
X-Gm-Message-State: AAQBX9cvs0WqGSPEa6Apy2lORBUPaWhDoBWU8Ikin0sP5E08AcJGFdTo
 HX/mvcKuAF0ktNJrbMsXtGjzuD6fHODzQw==
X-Google-Smtp-Source: AKy350ZEm+qFHHsZEgE5TUkhbjUXIwkRib0QrbXLytfTRN2yi2z7VP/nHD7BhmpuIvYLS9SLBQthuQ==
X-Received: by 2002:a81:92d4:0:b0:546:2787:4b93 with SMTP id
 j203-20020a8192d4000000b0054627874b93mr254780ywg.35.1681981463956; 
 Thu, 20 Apr 2023 02:04:23 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 i143-20020a0ddf95000000b0054c02f97d8dsm224569ywe.91.2023.04.20.02.04.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 02:04:22 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-54fbb713301so31017307b3.11
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 02:04:22 -0700 (PDT)
X-Received: by 2002:a81:a1d5:0:b0:54f:c1c1:199a with SMTP id
 y204-20020a81a1d5000000b0054fc1c1199amr290622ywg.18.1681981461935; Thu, 20
 Apr 2023 02:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230420030500.1578756-1-suijingfeng@loongson.cn>
In-Reply-To: <20230420030500.1578756-1-suijingfeng@loongson.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Apr 2023 11:04:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZoBZEM73fo8-PitSae8wgv-m6sez3nA8J3RFMAtOyOQ@mail.gmail.com>
Message-ID: <CAMuHMdUZoBZEM73fo8-PitSae8wgv-m6sez3nA8J3RFMAtOyOQ@mail.gmail.com>
Subject: Re: [PATCH v5] drm/fbdev-generic: prohibit potential out-of-bounds
 access
To: Sui Jingfeng <suijingfeng@loongson.cn>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

On Thu, Apr 20, 2023 at 5:09=E2=80=AFAM Sui Jingfeng <suijingfeng@loongson.=
cn> wrote:
> The fbdev test of IGT may write after EOF, which lead to out-of-bound
> access for drm drivers hire fbdev-generic. For example, run fbdev test
> on a x86+ast2400 platform, with 1680x1050 resolution, will cause the
> linux kernel hang with the following call trace:
>
>   Oops: 0000 [#1] PREEMPT SMP PTI
>   [IGT] fbdev: starting subtest eof
>   Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
>   [IGT] fbdev: starting subtest nullptr
>
>   RIP: 0010:memcpy_erms+0xa/0x20
>   RSP: 0018:ffffa17d40167d98 EFLAGS: 00010246
>   RAX: ffffa17d4eb7fa80 RBX: ffffa17d40e0aa80 RCX: 00000000000014c0
>   RDX: 0000000000001a40 RSI: ffffa17d40e0b000 RDI: ffffa17d4eb80000
>   RBP: ffffa17d40167e20 R08: 0000000000000000 R09: ffff89522ecff8c0
>   R10: ffffa17d4e4c5000 R11: 0000000000000000 R12: ffffa17d4eb7fa80
>   R13: 0000000000001a40 R14: 000000000000041a R15: ffffa17d40167e30
>   FS:  0000000000000000(0000) GS:ffff895257380000(0000) knlGS:00000000000=
00000
>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   CR2: ffffa17d40e0b000 CR3: 00000001eaeca006 CR4: 00000000001706e0
>   Call Trace:
>    <TASK>
>    ? drm_fbdev_generic_helper_fb_dirty+0x207/0x330 [drm_kms_helper]
>    drm_fb_helper_damage_work+0x8f/0x170 [drm_kms_helper]
>    process_one_work+0x21f/0x430
>    worker_thread+0x4e/0x3c0
>    ? __pfx_worker_thread+0x10/0x10
>    kthread+0xf4/0x120
>    ? __pfx_kthread+0x10/0x10
>    ret_from_fork+0x2c/0x50
>    </TASK>
>   CR2: ffffa17d40e0b000
>   ---[ end trace 0000000000000000 ]---
>
> The is because damage rectangles computed by
> drm_fb_helper_memory_range_to_clip() function does not guaranteed to be
> bound in the screen's active display area. Possible reasons are:
>
> 1) Buffers are allocated in the granularity of page size, for mmap system
>    call support. The shadow screen buffer consumed by fbdev emulation may
>    also choosed be page size aligned.
>
> 2) The DIV_ROUND_UP() used in drm_fb_helper_memory_range_to_clip()
>    will introduce off-by-one error.
>
> For example, on a 16KB page size system, in order to store a 1920x1080
> XRGB framebuffer, we need allocate 507 pages. Unfortunately, the size
> 1920*1080*4 can not be divided exactly by 16KB.
>
>  1920 * 1080 * 4 =3D 8294400 bytes
>  506 * 16 * 1024 =3D 8290304 bytes
>  507 * 16 * 1024 =3D 8306688 bytes
>
>  line_length =3D 1920*4 =3D 7680 bytes
>
>  507 * 16 * 1024 / 7680 =3D 1081.6
>
>  off / line_length =3D 507 * 16 * 1024 / 7680 =3D 1081
>  DIV_ROUND_UP(507 * 16 * 1024, 7680) will yeild 1082
>
> memcpy_toio() typically issue the copy line by line, when copy the last
> line, out-of-bound access will be happen. Because:
>
>  1082 * line_length =3D 1082 * 7680 =3D 8309760, and 8309760 > 8306688
>
> Note that userspace may stil write to the invisiable area if a larger
> buffer than width x stride is exposed. But it is not a big issue as
> long as there still have memory resolve the access if not drafting so
> far.
>
>  - Also limit the y1 (Daniel)
>  - keep fix patch it to minimal (Daniel)
>  - screen_size is page size aligned because of it need mmap (Thomas)
>  - Adding fixes tag (Thomas)
>
> Fixes: aa15c677cc34 ("drm/fb-helper: Fix vertical damage clipping")
>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for the update!  This v5 is completely different from the v3
I tested before, so keeping my Tested-by is not really appropriate...

I have retested fbtest with shmob-drm on Armadillo-800-EVA
(800x480@RG16, i.e. 187.5 pages), and fortunately this version still
works fine, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
