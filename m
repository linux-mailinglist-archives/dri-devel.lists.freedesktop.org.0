Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D426E4A00
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 15:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2164410E4E7;
	Mon, 17 Apr 2023 13:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE0110E4E7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 13:34:28 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-54fb615ac3dso204255257b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 06:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681738466; x=1684330466;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vuYclpeiJRPrLHWKW+XqsKHh8mT/S+D96VMBdCK00iE=;
 b=XzyhhFVQI93xvJJy6Kh13LD1gaTczIdrSMoihobhK0uJ5SpvbI3H0Yb84fGKRhliwQ
 OScTDN/K+lKDU5KYZNVIqtoEdxSFS2JUu076CP4d4CLBteP12AI6Eza+97XTOhhaUeix
 wxH7LsNhqxu277V95hJVMGDXwNWeO35okml7AdJlNHiti08oZoqFkGH8qx/CI1SbPUiY
 hbdZGv7yK9qBjQ2QSn7SY+mny1YqselgFE+HcqPDXCgy5S481kgH55jl2usup65LA2Ja
 vRObo1Cbd6SVIli2RA4ZS95yqwWDFZfOLYvDo/75T1hGAby/xn+mNLAk9lphDtCg76xK
 etlg==
X-Gm-Message-State: AAQBX9c1dV1alinh4dBJi0MqHkuZ+d/VzpEKd3rPAkrymFFSLlLlg8x3
 B4Te9WUQWLNBzlmpR1k2EeUgNt4GpzYKuw==
X-Google-Smtp-Source: AKy350aXXSa7kd2JRoBKLarm3M3DVr0Lzs5jGM56bWmogQ1RAQbDIM4/09+EMZR/crQNyTYXbPF+Og==
X-Received: by 2002:a81:2589:0:b0:54f:6aa3:f167 with SMTP id
 l131-20020a812589000000b0054f6aa3f167mr19202502ywl.12.1681738466334; 
 Mon, 17 Apr 2023 06:34:26 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 68-20020a810a47000000b00545a081847fsm3134244ywk.15.2023.04.17.06.34.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 06:34:25 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-54fb615ac3dso204253847b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 06:34:24 -0700 (PDT)
X-Received: by 2002:a81:b71c:0:b0:54f:b931:adf7 with SMTP id
 v28-20020a81b71c000000b0054fb931adf7mr9946168ywh.4.1681738464551; Mon, 17 Apr
 2023 06:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230417113219.1354078-1-suijingfeng@loongson.cn>
In-Reply-To: <20230417113219.1354078-1-suijingfeng@loongson.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Apr 2023 15:34:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0pcPhpYJ8GtjeCSNkRgjGOTbtjWORKZEveB1WjhoVnA@mail.gmail.com>
Message-ID: <CAMuHMdV0pcPhpYJ8GtjeCSNkRgjGOTbtjWORKZEveB1WjhoVnA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/fbdev-generic: prohibit potential out-of-bounds
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 1:45=E2=80=AFPM Sui Jingfeng <suijingfeng@loongson.=
cn> wrote:
> The fbdev test of IGT may write after EOF, which lead to out-of-bound
> access for the drm drivers using fbdev-generic. For example, on a x86
> + aspeed bmc card platform, with a 1680x1050 resolution display, running
> fbdev test if IGT will cause the linux kernel hang with the following
> call trace:
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
> The direct reason is that damage rectange computed by
> drm_fb_helper_memory_range_to_clip() does not guaranteed to be in-bound.
> It is already results in workaround code populate to elsewhere. Another
> reason is that exposing a larger buffer size than the actual needed help
> to trigger this bug intrinsic in drm_fb_helper_memory_range_to_clip().
>
> Others fbdev emulation solutions write to the GEM buffer directly, they
> won't reproduce this bug because the .fb_dirty function callback do not
> being hooked, so no chance is given to drm_fb_helper_memory_range_to_clip=
()
> to generate a out-of-bound when drm_fb_helper_sys_write() is called.
>
> This patch break the trigger condition of this bug by shrinking the shado=
w
> buffer size to sizes->surface_height * buffer->fb->pitches[0].
>
> Fixes: '8fbc9af55de0 ("drm/fbdev-generic: Set screen size to size of GEM
> buffer")'
>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>

Thanks, this fixes the crashes when running fbtest on shmob-drm.
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
