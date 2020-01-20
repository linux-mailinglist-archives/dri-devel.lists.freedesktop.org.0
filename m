Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9635F143849
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 09:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5986EBE3;
	Tue, 21 Jan 2020 08:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 417DE6EA57
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 18:27:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A249731B;
 Mon, 20 Jan 2020 10:27:34 -0800 (PST)
Received: from [192.168.0.7] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2843F3F68E;
 Mon, 20 Jan 2020 10:27:28 -0800 (PST)
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
To: Quentin Perret <qperret@google.com>, Lukasz Luba <lukasz.luba@arm.com>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
 <20200117105437.GA211774@google.com>
 <40587d98-0e8d-cbac-dbf5-d26501d47a8c@arm.com>
 <20200120150918.GA164543@google.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Message-ID: <8332c4ac-2a7d-1e2d-76e9-7c979a666257@arm.com>
Date: Mon, 20 Jan 2020 19:27:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200120150918.GA164543@google.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 21 Jan 2020 08:32:00 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, Morten.Rasmussen@arm.com,
 amit.kucheria@verdurent.com, vincent.guittot@linaro.org, khilman@kernel.org,
 agross@kernel.org, daniel.lezcano@linaro.org, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, linux-imx@nxp.com,
 rui.zhang@intel.com, kernel-team@android.com, mgorman@suse.de,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, shawnguo@kernel.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
 kernel@pengutronix.de, sudeep.holla@arm.com, ionela.voinescu@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/01/2020 16:09, Quentin Perret wrote:
> Hey Lukasz,
> 
> On Monday 20 Jan 2020 at 14:52:07 (+0000), Lukasz Luba wrote:
>> On 1/17/20 10:54 AM, Quentin Perret wrote:
>>> Suggested alternative: have two registration functions like so:
>>>
>>> 	int em_register_dev_pd(struct device *dev, unsigned int nr_states,
>>> 			       struct em_data_callback *cb);
>>> 	int em_register_cpu_pd(cpumask_t *span, unsigned int nr_states,
>>> 			       struct em_data_callback *cb);
>>
>> Interesting, in the internal review Dietmar asked me to remove these two
>> functions. I had the same idea, which would simplify a bit the
>> registration and it does not need to check the dev->bus if it is CPU.
>>
>> Unfortunately, we would need also two function in drivers/opp/of.c:
>> dev_pm_opp_of_register_cpu_em(policy->cpus);
>> and
>> dev_pm_opp_of_register_dev_em(dev);
>>
>> Thus, I have created only one registration function, which you can see
>> in this patch set.
> 
> Right, I can see how having a unified API would be appealing, but the
> OPP dependency is a nono, so we'll need to work around one way or
> another.
> 
> FWIW, I don't think having separate APIs for CPUs and other devices is
> that bad given that we already have entirely different frameworks to
> drive their respective frequencies. And the _cpu variants are basically
> just wrappers around the _dev ones, so not too bad either IMO :).

It's true that we need the policy->cpus cpumask only for cpu devices and
we have it available when we call em_register_perf_domain()
[scmi-cpufreq.c driver] or the OPP wrapper dev_pm_opp_of_register_em()
[e.g. cpufreq-dt.c driver].

And we shouldn't make EM code dependent on OPP.

But can't we add 'struct cpumask *mask' as an additional argument to
both which can be set to NULL for (devfreq) devices?

We can check in em_register_perf_domain() that we got a valid cpumask
for a cpu device and ignore it for (devfreq) devices.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
