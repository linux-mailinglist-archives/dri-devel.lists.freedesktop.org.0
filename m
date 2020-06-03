Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0501EDDBF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 09:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615F46E288;
	Thu,  4 Jun 2020 07:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3A3BE89BDB
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 15:26:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85D2A55D;
 Wed,  3 Jun 2020 08:26:02 -0700 (PDT)
Received: from [10.37.12.87] (unknown [10.37.12.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A4FB3F52E;
 Wed,  3 Jun 2020 08:25:51 -0700 (PDT)
Subject: Re: [PATCH v8 4/8] PM / EM: add support for other devices than CPUs
 in Energy Model
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20200527095854.21714-1-lukasz.luba@arm.com>
 <20200527095854.21714-5-lukasz.luba@arm.com>
 <d45e5592-8e11-858b-d3a3-2ec9ce1d1f54@linaro.org>
 <7201e161-6952-6e28-4036-bd0f0353ec30@arm.com>
 <CAJZ5v0jwoNSYOz3nGqNshd=5btsLxOp-di-Dot+cHqAQZEQVRw@mail.gmail.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <d6a0d345-53ef-523c-836d-3bc4ea4c6e66@arm.com>
Date: Wed, 3 Jun 2020 16:25:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0jwoNSYOz3nGqNshd=5btsLxOp-di-Dot+cHqAQZEQVRw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 04 Jun 2020 07:11:42 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/3/20 4:13 PM, Rafael J. Wysocki wrote:
> On Tue, Jun 2, 2020 at 1:31 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
>>
>> Hi Daniel,
>>
>> On 6/1/20 10:44 PM, Daniel Lezcano wrote:
>>> On 27/05/2020 11:58, Lukasz Luba wrote:
>>>> Add support for other devices than CPUs. The registration function
>>>> does not require a valid cpumask pointer and is ready to handle new
>>>> devices. Some of the internal structures has been reorganized in order to
>>>> keep consistent view (like removing per_cpu pd pointers).
>>>>
>>>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
>>>> ---
>>>
>>> [ ... ]
>>>
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(em_register_perf_domain);
>>>> +
>>>> +/**
>>>> + * em_dev_unregister_perf_domain() - Unregister Energy Model (EM) for a device
>>>> + * @dev             : Device for which the EM is registered
>>>> + *
>>>> + * Try to unregister the EM for the specified device (but not a CPU).
>>>> + */
>>>> +void em_dev_unregister_perf_domain(struct device *dev)
>>>> +{
>>>> +    if (IS_ERR_OR_NULL(dev) || !dev->em_pd)
>>>> +            return;
>>>> +
>>>> +    if (_is_cpu_device(dev))
>>>> +            return;
>>>> +
>>>> +    mutex_lock(&em_pd_mutex);
>>>
>>> Is the mutex really needed?
>>
>> I just wanted to align this unregister code with register. Since there
>> is debugfs dir lookup and the device's EM existence checks I thought it
>> wouldn't harm just to lock for a while and make sure the registration
>> path is not used. These two paths shouldn't affect each other, but with
>> modules loading/unloading I wanted to play safe.
>>
>> I can change it maybe to just dmb() and the end of the function if it's
>> a big performance problem in this unloading path. What do you think?
> 
> I would rather leave the mutex locking as is.
> 
> However, the question to ask is what exactly may go wrong without that
> locking in place?  Is there any specific race condition that you are
> concerned about?
> 

I tried to test this with module loading & unloading with panfrost
driver and CPU hotplug (which should bail out quickly) and was OK.
I don't see any particular race. I don't too much about the
debugfs code, though. That's why I tried to protect from some
scripts/services which try to re-load the driver.

Apart from that, maybe just this dev->em = NULL to be populated to all
CPUs, which mutex_unlock synchronizes for free here.

Regards,
Lukasz


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
