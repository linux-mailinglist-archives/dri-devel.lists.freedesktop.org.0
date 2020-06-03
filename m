Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3141ED31B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 17:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB5A89B99;
	Wed,  3 Jun 2020 15:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCCE89B99
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 15:13:41 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id m67so2107712oif.4
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 08:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cz2BiX6d4n6x62rcneWGjZMN7VkN9rwUibKP2R8rjL8=;
 b=IKLKegpTBkFV8yuXBeBN5yUbsycJlcyhbP8d1h1nlw/On0KHFJPQPdG+C1fRokXthM
 iaJywtkLBVRoC+plZ2fEstmreFrjIUtaRmxSJ5kq0eK8+uK5qQ9S1h/+5a3FFoHQT3NZ
 lHVSP+H2fgTlhlZvMVDSBX20QGelkuTqHADl1UNRaGUOdCGDbnw+ofPLGqhIEtqoDeI0
 8K2LVE+CTvgYcEAbBM52cwkP97iYo2TPx1btiB1YOiB5T5LnrpRxlXeTkHNWSaT8CFgP
 ahL3JHVVYuygBeUDDRp2SLrhCJ/NwOotiezRmUkYbLkl1yQunkG8mMH7qcl7/m5hrxOz
 /iqg==
X-Gm-Message-State: AOAM532s8iV20YQDQ8ZhJRP5oSpXrrAxtHDPR+V44KSI7XV9THT0METn
 xbiSOe8FEyt2Vh2gYFUWfzd6Mj954JLeBHQ0bwo=
X-Google-Smtp-Source: ABdhPJwl2C6njoLHvec0+7Z+pvFglKeo2x6xe974h+nkdR52l4Zy34+b5UkPp73bI+Pl0F3UJP8s0n7smqKuM+QPGx4=
X-Received: by 2002:aca:ad88:: with SMTP id w130mr122356oie.103.1591197220440; 
 Wed, 03 Jun 2020 08:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200527095854.21714-1-lukasz.luba@arm.com>
 <20200527095854.21714-5-lukasz.luba@arm.com>
 <d45e5592-8e11-858b-d3a3-2ec9ce1d1f54@linaro.org>
 <7201e161-6952-6e28-4036-bd0f0353ec30@arm.com>
In-Reply-To: <7201e161-6952-6e28-4036-bd0f0353ec30@arm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 3 Jun 2020 17:13:29 +0200
Message-ID: <CAJZ5v0jwoNSYOz3nGqNshd=5btsLxOp-di-Dot+cHqAQZEQVRw@mail.gmail.com>
Subject: Re: [PATCH v8 4/8] PM / EM: add support for other devices than CPUs
 in Energy Model
To: Lukasz Luba <lukasz.luba@arm.com>
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
Cc: Nishanth Menon <nm@ti.com>, Juri Lelli <juri.lelli@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benjamin Segall <bsegall@google.com>, alyssa.rosenzweig@collabora.com,
 Matthias Kaehlcke <mka@chromium.org>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Andy Gross <agross@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, steven.price@arm.com,
 Chanwoo Choi <cw00.choi@samsung.com>, Ingo Molnar <mingo@redhat.com>,
 dl-linux-imx <linux-imx@nxp.com>, "Zhang, Rui" <rui.zhang@intel.com>,
 Mel Gorman <mgorman@suse.de>, orjan.eide@arm.com,
 Linux PM <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 Dietmar Eggemann <Dietmar.Eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 David Airlie <airlied@linux.ie>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Quentin Perret <qperret@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sascha Hauer <kernel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>,
 patrick.bellasi@matbug.net, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 2, 2020 at 1:31 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
>
> Hi Daniel,
>
> On 6/1/20 10:44 PM, Daniel Lezcano wrote:
> > On 27/05/2020 11:58, Lukasz Luba wrote:
> >> Add support for other devices than CPUs. The registration function
> >> does not require a valid cpumask pointer and is ready to handle new
> >> devices. Some of the internal structures has been reorganized in order to
> >> keep consistent view (like removing per_cpu pd pointers).
> >>
> >> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> >> ---
> >
> > [ ... ]
> >
> >>   }
> >>   EXPORT_SYMBOL_GPL(em_register_perf_domain);
> >> +
> >> +/**
> >> + * em_dev_unregister_perf_domain() - Unregister Energy Model (EM) for a device
> >> + * @dev             : Device for which the EM is registered
> >> + *
> >> + * Try to unregister the EM for the specified device (but not a CPU).
> >> + */
> >> +void em_dev_unregister_perf_domain(struct device *dev)
> >> +{
> >> +    if (IS_ERR_OR_NULL(dev) || !dev->em_pd)
> >> +            return;
> >> +
> >> +    if (_is_cpu_device(dev))
> >> +            return;
> >> +
> >> +    mutex_lock(&em_pd_mutex);
> >
> > Is the mutex really needed?
>
> I just wanted to align this unregister code with register. Since there
> is debugfs dir lookup and the device's EM existence checks I thought it
> wouldn't harm just to lock for a while and make sure the registration
> path is not used. These two paths shouldn't affect each other, but with
> modules loading/unloading I wanted to play safe.
>
> I can change it maybe to just dmb() and the end of the function if it's
> a big performance problem in this unloading path. What do you think?

I would rather leave the mutex locking as is.

However, the question to ask is what exactly may go wrong without that
locking in place?  Is there any specific race condition that you are
concerned about?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
