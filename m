Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27465457FF6
	for <lists+dri-devel@lfdr.de>; Sat, 20 Nov 2021 19:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B6F6E0C6;
	Sat, 20 Nov 2021 18:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8836E0D4;
 Sat, 20 Nov 2021 18:03:04 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id b12so24164900wrh.4;
 Sat, 20 Nov 2021 10:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h+uDZ8B0+FIrUaufpROus9M3fzWHj1TqAl6ALRsgs/E=;
 b=Q6CcTalyhJMl2dU/MAJyRRlblfIlEttDPBMil8TaLI4h7opkrbYU5tzyoXt1F0ZrHY
 o+Lz9MruepobD7dYWDgnj1BPPsY7L6VtnjiXonzpU5khi3onjforwR5JZ+hnS63yuXwo
 xMe1IdyqZQHrQUW3uSlrw9Zp3G+C8KKcF7vXfTWhiLduh1vbq/8nu5iiK8dN9h/7Vz79
 3+/Kh47F7V8utZJTPPokfjUYtw3zbMXSpzn9A0GoI00r74BEpSEHpBwli543CMQkoC6L
 JhZigBri8wRRz487LTX/+PKbAMP8pzNfjs9NBcGrtsvzYVQ/4byKleJqKdmzmNaHHlux
 obEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h+uDZ8B0+FIrUaufpROus9M3fzWHj1TqAl6ALRsgs/E=;
 b=Lj6UjilEIvRRp4xT0ICOX8lGZ0wzCH7vgfp4bSO076W7nMjal5g8lj9D8AWPFwRbjU
 D/g6ZQyk5hljbBwB1JTiC8uXnrMvNbDDan24BJ4GJYsUgE4PE19gFvA5pkc+buwQzIW2
 XLDi/sI1VDqXajzrVntSd/OOjJul5y90pjSGehiM53D45AzkO9BiRJC0QzQ01Nie76p1
 7AIgjGIa15ibfTyBuigtkYJYUoTXtzG2TeveMfA9Nc+TY/D8b4ggRPYxumX1a0fbw4jk
 f97dVYfoFm7uHsgziRE4YRy8g1iW8roqF7vWP/tri90fKnlzR+xCO9kdb/ThrTz2zKk6
 XgZQ==
X-Gm-Message-State: AOAM533/nX44afA4ZbSFbw+4NDXm96KgMI7kvms44UC0o5Alfit18zZl
 dEIGMuUAVwotZduVltwswnVJVR1lPqXmN6EoZ5M=
X-Google-Smtp-Source: ABdhPJwwyY+STeb0nl/i0vQ3mmaky2ZZuZ4AgHjsdhPpIv2/FoV9tz401ElWhB2WZA0pL56egYeBhMACEWBqwxbnln8=
X-Received: by 2002:a05:6000:1862:: with SMTP id
 d2mr19504472wri.251.1637431383136; 
 Sat, 20 Nov 2021 10:03:03 -0800 (PST)
MIME-Version: 1.0
References: <20211119225157.984706-1-robdclark@gmail.com>
 <20211119225157.984706-2-robdclark@gmail.com>
 <CAD=FV=UraStftJyUDHp5=iKoh4tnCQiTgBZJBNF3-q=HDZUPZw@mail.gmail.com>
In-Reply-To: <CAD=FV=UraStftJyUDHp5=iKoh4tnCQiTgBZJBNF3-q=HDZUPZw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 20 Nov 2021 10:08:07 -0800
Message-ID: <CAF6AEGvU7nbdbKCRcXUEnrWmp7xJfSJxmwzQP2LwW_UzuS0Zjw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/gpu: Respect PM QoS constraints
To: Doug Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 4:21 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Nov 19, 2021 at 2:47 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > +void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
> > +{
> > +       struct msm_gpu_devfreq *df = &gpu->devfreq;
> > +       unsigned long freq;
> > +
> > +       freq = get_freq(gpu);
> > +       freq *= factor;
> > +       freq /= HZ_PER_KHZ;
>
> Should it do the divide first? I don't know for sure, but it feels
> like GPU frequency could conceivably be near-ish the u32 overflow? (~4
> GHz). Better to be safe and do the / 1000 first?
>

It looks like on 8998 we have some GPU OPPs that are not integer # of
KHz.. although that would not change the integer math result unless
factor > 10.

We are a bit aways for 32b overflow (highest freq for current things
is 825MHz, but I guess we could see things closer to 1GHz in the
future.. generally GPUs aren't clocked nearly as high as CPUs.. slow
but wide, and all that).. but maybe this should just be 64b math
instead to be safe?

>
> > @@ -201,26 +217,14 @@ static void msm_devfreq_idle_work(struct kthread_work *work)
> >         struct msm_gpu_devfreq *df = container_of(work,
> >                         struct msm_gpu_devfreq, idle_work.work);
> >         struct msm_gpu *gpu = container_of(df, struct msm_gpu, devfreq);
> > -       unsigned long idle_freq, target_freq = 0;
> >
> >         if (!df->devfreq)
> >                 return;
>
> Why does the msm_devfreq_idle_work() need a check for "!df->devfreq"
> but the boost work doesn't? Maybe you don't need it anymore now that
> you're not reaching into the mutex? ...or maybe the boost work does
> need it?
>
> ...and if "df->devfreq" is NULL then doesn't it mean that
> msm_hrtimer_work_init() was never called? That seems bad...

Looks like 658f4c829688 ("drm/msm/devfreq: Add 1ms delay before
clamping freq") was badly rebased on top of efb8a170a367 ("drm/msm:
Fix devfreq NULL pointer dereference on a3xx").. I'll send a separate
patch to fix that

BR,
-R
