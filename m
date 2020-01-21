Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D10144D7B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0196FB08;
	Wed, 22 Jan 2020 08:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2AC9B6EC57
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 10:49:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 553431FB;
 Tue, 21 Jan 2020 02:49:31 -0800 (PST)
Received: from [10.37.12.169] (unknown [10.37.12.169])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61FC23F6C4;
 Tue, 21 Jan 2020 02:49:21 -0800 (PST)
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
To: Quentin Perret <qperret@google.com>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
 <17b77e0c-9455-0479-d37b-c57717c784c7@arm.com>
 <20200120152804.GB164543@google.com>
 <453034e5-f7b9-20f7-4e26-5d0d7164edd1@arm.com>
 <20200121100854.GB157387@google.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <5621c137-7057-1d5c-646a-95707105df25@arm.com>
Date: Tue, 21 Jan 2020 10:49:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200121100854.GB157387@google.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, daniel.lezcano@linaro.org,
 peterz@infradead.org, viresh.kumar@linaro.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, Morten.Rasmussen@arm.com,
 amit.kucheria@verdurent.com, vincent.guittot@linaro.org, khilman@kernel.org,
 agross@kernel.org, b.zolnierkie@samsung.com, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, linux-imx@nxp.com,
 rui.zhang@intel.com, mgorman@suse.de, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, linux-omap@vger.kernel.org,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, shawnguo@kernel.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 sudeep.holla@arm.com, patrick.bellasi@matbug.net, ionela.voinescu@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/21/20 10:08 AM, Quentin Perret wrote:
> On Monday 20 Jan 2020 at 16:20:49 (+0000), Lukasz Luba wrote:
>> On 1/20/20 3:28 PM, Quentin Perret wrote:
>>> Agreed, this looks a bit confusing. It should be trivial to make
>>> em_dev_get() (or whatever we end up calling it) work for CPUs too,
>>> though. And we could always have a em_cpu_get(int cpu) API that is a
>>> basically a wrapper around em_dev_get() for convenience.
>>
>> The problem not only here is that we have a CPU index 'int cpu'
>> and if we ask for device like:
>>
>> struct device *dev = get_cpu_device(cpu);
>>
>> It might be not the same device that was used during the
>> registration, when we had i.e. 4 CPUs for the same policy:
>>
>> int cpu_id = cpumask_first(policy->cpus);
>> struct device *cpu_dev = get_cpu_device(cpu_id);
>> em_register_perf_domain(cpu_dev, nr_opp, &em_cb);
>>
>> That's why the em_cpu_get() is different than em_get_pd(), mainly by:
>> if (cpumask_test_cpu(cpu, em_span_cpus(em_pd)))
>>
>> It won't be simple wrapper, let me think how it could be handled
>> differently than it is now.
> 
> Right so I suppose the easiest solution would be to do the opposite of
> my first suggestion. That is, make em_get_pd() call em_cpu_get() if the
> device is a CPU device, or proceed to the PD list iteration for other
> devices. And em_cpu_get() can remain as you originally suggested (that
> is, iterate over the PDs and test the mask).

Exactly, something like:
---------------------------->8-------------------------
288 struct em_perf_domain *em_get_pd(struct device *dev)
289 {
290         struct em_device *em_dev;
291
292         if (IS_ERR_OR_NULL(dev))
293                 return NULL;
294
295         if (_is_cpu_device(dev))
296                 return em_cpu_get(dev->id);
....
------------------------8<-----------------------------

> 
> That should ensure em_get_pd() always works, em_cpu_get() is still there
> handy for the scheduler and such, and the two EM lookup functions (for
> CPUs or for devices) are kept cleanly separated.
> 
> Thoughts ?

Agree. Then we can have these two functions and em_get_pd() will also
work fine.

> 
> Thanks,
> Quentin
> 

Regards,
Lukasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
