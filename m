Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA4574F0CC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 15:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF2710E05F;
	Tue, 11 Jul 2023 13:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DAF10E05F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 13:55:40 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-5634db21a58so4404781eaf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 06:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689083739; x=1691675739;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZXQMJc+mkFZtu2vLefW5Re8NpovkJxJKped5EUiUKOE=;
 b=fRxfuuE8O86balda0vv3eWcgnNJjOx5NeKAOnZ0iDnDmGErnPpW5mzEkhZUj+Uc0hH
 xwdIsmUKNevzrr0iZo17N0P3Ldz1OHmF5eWV/To/qPsGMUye0J7meRiraxOxnjvJWqVO
 boti5Bv4s9gxx9Xr4jmyz3VUbFi5WL0D5TuMaygfwMwrXwl7OFBWxrwkpt0PD7l5aaHP
 5OZlUB0m95cWGiETdkohs4OjIQRcIstbitPhfSy6jncWhPOfZIfnupmowNgnlYIr7bzt
 Za7kI9NJGeCPynX0z9uDcy0Ip075H3gugWnBh0bDLzi4SoQYSf2NIr+YOs03htkRPli3
 WCaw==
X-Gm-Message-State: ABy/qLY42uGA93frcGSual6GiA/Go72CX1gacCDWAD1srLqbR70o8njp
 FU6xLkW/1NPuEO71VqayDSYMEj5kxl8DBg==
X-Google-Smtp-Source: APBJJlEP8xBkkwc/XmdTuhHqmsTTm1I+dD3xIsfOdNfF/gEhQTgKrDa5atHYHP0hqvwoa7Q0tmJ7Lg==
X-Received: by 2002:aca:2308:0:b0:3a1:b638:9c2c with SMTP id
 e8-20020aca2308000000b003a1b6389c2cmr14364088oie.55.1689083739643; 
 Tue, 11 Jul 2023 06:55:39 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com.
 [209.85.128.171]) by smtp.gmail.com with ESMTPSA id
 o206-20020a815ad7000000b005771d1c7756sm573995ywb.51.2023.07.11.06.55.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 06:55:39 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-5703cb4bcb4so61090837b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 06:55:39 -0700 (PDT)
X-Received: by 2002:a81:6e8b:0:b0:570:85b2:e6dd with SMTP id
 j133-20020a816e8b000000b0057085b2e6ddmr17111816ywc.17.1689083738977; Tue, 11
 Jul 2023 06:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230511181931.869812-1-tj@kernel.org>
 <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
In-Reply-To: <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Jul 2023 15:55:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
Message-ID: <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
Subject: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2 6/7]
 workqueue: Report work funcs that trigger automatic CPU_INTENSIVE mechanism)
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

Hi Tejun,

On Fri, May 12, 2023 at 9:54=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
> Workqueue now automatically marks per-cpu work items that hog CPU for too
> long as CPU_INTENSIVE, which excludes them from concurrency management an=
d
> prevents stalling other concurrency-managed work items. If a work functio=
n
> keeps running over the thershold, it likely needs to be switched to use a=
n
> unbound workqueue.
>
> This patch adds a debug mechanism which tracks the work functions which
> trigger the automatic CPU_INTENSIVE mechanism and report them using
> pr_warn() with exponential backoff.
>
> v2: Drop bouncing through kthread_worker for printing messages. It was to
>     avoid introducing circular locking dependency but wasn't effective as=
 it
>     still had pool lock -> wci_lock -> printk -> pool lock loop. Let's ju=
st
>     print directly using printk_deferred().
>
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>

Thanks for your patch, which is now commit 6363845005202148
("workqueue: Report work funcs that trigger automatic CPU_INTENSIVE
mechanism") in v6.5-rc1.

I guess you are interested to know where this triggers.
I enabled CONFIG_WQ_CPU_INTENSIVE_REPORT=3Dy, and tested
the result on various machines...

SH/R-Mobile:

  workqueue: genpd_power_off_work_fn hogged CPU for >10000us 4 times,
consider switching to WQ_UNBOUND

Atmark Techno Armadillo800-EVA with shmob_drm:

  workqueue: drm_fb_helper_damage_work hogged CPU for >10000us 16
times, consider switching to WQ_UNBOUND

R-Car Gen2:

  workqueue: rtc_timer_do_work hogged CPU for >10000us 4 times,
consider switching to WQ_UNBOUND

R-Car Gen2/Gen3:

  workqueue: pm_runtime_work hogged CPU for >10000us 4 times, consider
switching to WQ_UNBOUND

R-Car Gen3:

  workqueue: kfree_rcu_work hogged CPU for >10000us 4 times, consider
switching to WQ_UNBOUND

OrangeCrab/Linux-on-LiteX-VexRiscV with ht16k33 14-seg display and ssd130xd=
rmfb:

  workqueue: check_lifetime hogged CPU for >10000us 4 times, consider
switching to WQ_UNBOUND
  workqueue: drm_fb_helper_damage_work hogged CPU for >10000us 1024
times, consider switching to WQ_UNBOUND
  workqueue: fb_flashcursor hogged CPU for >10000us 128 times,
consider switching to WQ_UNBOUND
  workqueue: ht16k33_seg14_update hogged CPU for >10000us 128 times,
consider switching to WQ_UNBOUND
  workqueue: mmc_rescan hogged CPU for >10000us 128 times, consider
switching to WQ_UNBOUND

Atari (ARAnyM):

  workqueue: ata_sff_pio_task hogged CPU for >10000us 64 times,
consider switching to WQ_UNBOUND

The OrangeCrab is a slow machine, so it's not that surprising to see these
messages...

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
