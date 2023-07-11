Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1024174F12A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 16:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1827C10E3AC;
	Tue, 11 Jul 2023 14:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3D110E3AC
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 14:06:37 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-6b91ad1f9c1so3292659a34.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689084396; x=1691676396;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JtrkZvukDlSziDN0KAKNR+HUJU/841tM48VnLXRDDo8=;
 b=i93WdTTiAGJ+tFeS0se4pf4s2TbAw/jPe7OaKDmAsRV7B+b5LZ4IR6CGrz7jLeLyir
 4nYOYgUDkBwzG9KXPPfiB61dsbHrIGyh3j7ofIzxzSmQAQ3KHgpBKjxPsn5foHV8fSnJ
 HJCpHqsmsgqZOJ9giji+c8IzGgmIQtAsWa3xcd1InIZCQ6zDEm+i1e/MqAAVaYztbCDW
 qK/uQKwXvrPHtPdztYi3ShTP49LgenyUL/bJ19A2MP+iqituynHw4XJGxsQl1dE9lQyI
 7JZGqymxjlQOd6KcCaCB1mH3lJmBDFDQhBRRUYqb+FKXxmrzVCigKHBK6yuegZ3tO7MK
 3TYg==
X-Gm-Message-State: ABy/qLYZ0MAJEJ1RFgZrGhxW77hawINYm80dla+kCPF5xDHaW1S+4CGr
 Vf6NY6uR6bPTvhmNMOjfBg/p3qxvgKin7g==
X-Google-Smtp-Source: APBJJlHTrn63fFqilV9RTkrZPOfKuJMdbgDxQsGRsu+cOhnY4b8kCCYU5Evi66+OsWwQ2NtNEDlNgg==
X-Received: by 2002:a9d:76d6:0:b0:6b9:1917:b2f5 with SMTP id
 p22-20020a9d76d6000000b006b91917b2f5mr9169760otl.28.1689084396289; 
 Tue, 11 Jul 2023 07:06:36 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com.
 [209.85.210.54]) by smtp.gmail.com with ESMTPSA id
 q5-20020a9d6645000000b006b73c264e30sm953595otm.17.2023.07.11.07.06.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 07:06:35 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-6b74b37fbe0so4682497a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:06:35 -0700 (PDT)
X-Received: by 2002:a9d:560a:0:b0:6b8:83ca:560a with SMTP id
 e10-20020a9d560a000000b006b883ca560amr13140949oti.18.1689084395442; Tue, 11
 Jul 2023 07:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230511181931.869812-1-tj@kernel.org>
 <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
 <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
In-Reply-To: <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Jul 2023 16:06:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
Message-ID: <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE
 mechanism)
To: Tejun Heo <tj@kernel.org>
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
Cc: linux-rtc@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, netdev <netdev@vger.kernel.org>,
 kernel-team@meta.com, Lai Jiangshan <jiangshanlai@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 11, 2023 at 3:55=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Tejun,
>
> On Fri, May 12, 2023 at 9:54=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
> > Workqueue now automatically marks per-cpu work items that hog CPU for t=
oo
> > long as CPU_INTENSIVE, which excludes them from concurrency management =
and
> > prevents stalling other concurrency-managed work items. If a work funct=
ion
> > keeps running over the thershold, it likely needs to be switched to use=
 an
> > unbound workqueue.
> >
> > This patch adds a debug mechanism which tracks the work functions which
> > trigger the automatic CPU_INTENSIVE mechanism and report them using
> > pr_warn() with exponential backoff.
> >
> > v2: Drop bouncing through kthread_worker for printing messages. It was =
to
> >     avoid introducing circular locking dependency but wasn't effective =
as it
> >     still had pool lock -> wci_lock -> printk -> pool lock loop. Let's =
just
> >     print directly using printk_deferred().
> >
> > Signed-off-by: Tejun Heo <tj@kernel.org>
> > Suggested-by: Peter Zijlstra <peterz@infradead.org>
>
> Thanks for your patch, which is now commit 6363845005202148
> ("workqueue: Report work funcs that trigger automatic CPU_INTENSIVE
> mechanism") in v6.5-rc1.
>
> I guess you are interested to know where this triggers.
> I enabled CONFIG_WQ_CPU_INTENSIVE_REPORT=3Dy, and tested
> the result on various machines...

> OrangeCrab/Linux-on-LiteX-VexRiscV with ht16k33 14-seg display and ssd130=
xdrmfb:
>
>   workqueue: check_lifetime hogged CPU for >10000us 4 times, consider
> switching to WQ_UNBOUND
>   workqueue: drm_fb_helper_damage_work hogged CPU for >10000us 1024
> times, consider switching to WQ_UNBOUND
>   workqueue: fb_flashcursor hogged CPU for >10000us 128 times,
> consider switching to WQ_UNBOUND
>   workqueue: ht16k33_seg14_update hogged CPU for >10000us 128 times,
> consider switching to WQ_UNBOUND
>   workqueue: mmc_rescan hogged CPU for >10000us 128 times, consider
> switching to WQ_UNBOUND

Got one more after a while:

workqueue: neigh_managed_work hogged CPU for >10000us 4 times,
consider switching to WQ_UNBOUND

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
