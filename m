Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB0E44E29E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 08:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53F06EADB;
	Fri, 12 Nov 2021 07:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2FB6EB04
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 07:50:58 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id d10so21604917ybe.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 23:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8hsJfBjpLQBnNYoC8zh5y1uUfpVlm2S4eitLUmrS0SI=;
 b=JBV6L1OHMnp6AQ9vM+jo8Lrg6xtxiG3nXWTz5o5RSYI39xgwe0ng8XHLP+9bwUfd/o
 hLaQgG26lHY6x1a83Ds1FJTIr5fS/v/wX3KIBeoHC1nprvQVCHfzIE+4aCnJeLuyehSH
 2ihTrpFqGF2kb8SwhGO6OW+FSEbQjeuKjzY1+UfqqOXAbJihZjyMqZe2EH/Rxf+EAgS8
 0QbRoGuuGB7teAMvE3SCmg8nvr7PHDXsd7df5FoOjjfmgCXvzWDRGt5tG/3pum5zp4WI
 y7ZVZjpA6HR0bWMug27ecBkz14v4Tk7SdQTOqRatzShMMu8ZQwXakG74WjW7H5JOHl4H
 q4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8hsJfBjpLQBnNYoC8zh5y1uUfpVlm2S4eitLUmrS0SI=;
 b=BpXB2G8W8iqZ2OEycDZODzmXjvpXdPIi3FOQw7T2QJGtBMLzYF13qmUDKOgOxxWR2w
 Qo3k6fiImfULsR35705pENh3ZCusCc9qRuk1o37a/36clKMJdi3mxVhZYR5vs4hhHPg+
 tdW+TVmDXiVU0Qezb5QUUg0Y0TdgECKt/XkAHxHNFCYIz2Tv0tWEfkis3J8wm7z8EBCZ
 KPZL/GhtFbOWZnJJxiNMom8JTWJmp55+xyEVS92F5LVq9h+10+sROp3J6uU6gRnzu59c
 bxXTVQpii3+//DtSnDB4vm1gs9jaVBUgyF8ZJZQ7StYHC3fDJ9l7oWFMDlapRqWQ2ipp
 0mfw==
X-Gm-Message-State: AOAM530ePiJSVg7+p/Z9sq2jWWMvdKv/pz6fsDt//+ZrIcwzHxiTK1Ue
 ikzdLE2GKOugZftPLudwF1ao6M1VYzdSNiui9CHqMQ==
X-Google-Smtp-Source: ABdhPJxYnWdOcV5iPRaYM7MejstD+Cx3j6SwdJdRMaK1kX1sZPdfnECqq3bvWSXTyWwZRDugM5kEUr51wLDc3Vui35E=
X-Received: by 2002:a25:a427:: with SMTP id f36mr14333170ybi.245.1636703458115; 
 Thu, 11 Nov 2021 23:50:58 -0800 (PST)
MIME-Version: 1.0
References: <YYrU2PdmdNkulWSM@sultan-box.localdomain>
 <20211109213847.GY174703@worktop.programming.kicks-ass.net>
 <CAKfTPtC_A-_sfQ+rm440oHwd2gUZ222FMwsi-JTkyLPc-x0qrw@mail.gmail.com>
 <YYwihj21abVmf9Ag@sultan-box.localdomain>
In-Reply-To: <YYwihj21abVmf9Ag@sultan-box.localdomain>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 12 Nov 2021 08:50:46 +0100
Message-ID: <CAKfTPtDaO9KGhWGYnr6CNRy=h1UuVXTJEqcVFz3dzvi=xqMv4A@mail.gmail.com>
Subject: Re: printk deadlock due to double lock attempt on current CPU's
 runqueue
To: Sultan Alsawaf <sultan@kerneltoast.com>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 dri-devel@lists.freedesktop.org, Ben Segall <bsegall@google.com>,
 Anton Vorontsov <anton@enomsg.org>, David Airlie <airlied@linux.ie>,
 Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
 Petr Mladek <pmladek@suse.com>, Kees Cook <keescook@chromium.org>,
 John Ogness <john.ogness@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 mkoutny@suse.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Colin Cross <ccross@android.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Nov 2021 at 20:50, Sultan Alsawaf <sultan@kerneltoast.com> wrote:
>
> On Wed, Nov 10, 2021 at 10:00:35AM +0100, Vincent Guittot wrote:
> > Is it the same SCHED_WARN_ON(rq->tmp_alone_branch !=
> > &rq->leaf_cfs_rq_list); that generates the deadlock on v5.15 too ?
> >
> > one remaining tmp_alone_branch warning has been fixed in v5.15 with
> > 2630cde26711 ("sched/fair: Add ancestors of unthrottled undecayed cfs_rq")
>
> I should clarify that I didn't actually reproduce the issue on v5.15; I just saw
> that the call chain leading to the deadlock still existed in v5.15 after looking
> through the code.

Thanks for the clarification

>
> Failing the SCHED_WARN_ON(rq->tmp_alone_branch != &rq->leaf_cfs_rq_list); assert
> is extremely rare in my experience, and I don't have a reproducer. It has only
> happened once after months of heavy usage (with lots of reboots too, so not with
> crazy high uptime).
>
> Sultan
