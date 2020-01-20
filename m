Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2789143096
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 18:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54CF6EA30;
	Mon, 20 Jan 2020 17:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C6C0689A88
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 16:21:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EDB731B;
 Mon, 20 Jan 2020 08:21:01 -0800 (PST)
Received: from [10.37.12.169] (unknown [10.37.12.169])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C2703F6C4;
 Mon, 20 Jan 2020 08:20:51 -0800 (PST)
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
To: Quentin Perret <qperret@google.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
 <17b77e0c-9455-0479-d37b-c57717c784c7@arm.com>
 <20200120152804.GB164543@google.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <453034e5-f7b9-20f7-4e26-5d0d7164edd1@arm.com>
Date: Mon, 20 Jan 2020 16:20:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200120152804.GB164543@google.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 20 Jan 2020 17:09:27 +0000
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
 rui.zhang@intel.com, mgorman@suse.de, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, shawnguo@kernel.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 ionela.voinescu@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/20/20 3:28 PM, Quentin Perret wrote:
> On Monday 20 Jan 2020 at 15:53:35 (+0100), Dietmar Eggemann wrote:
>> Would be really nice if this wouldn't be required. We should really aim
>> for 1 framework == 1 set of interfaces.
>>
>> What happens if someone calls em_get_pd() on a CPU EM?
>>
>> E.g:
>>
>>   static struct perf_domain *pd_init(int cpu)
>>   {
>> -       struct em_perf_domain *obj = em_cpu_get(cpu);
>> +       struct device *dev = get_cpu_device(cpu);
>> +       struct em_perf_domain *obj = em_pd_get(dev);
>>          struct perf_domain *pd;
>>
>> Two versions of one functionality will confuse API user from the
>> beginning ...
> 
> Agreed, this looks a bit confusing. It should be trivial to make
> em_dev_get() (or whatever we end up calling it) work for CPUs too,
> though. And we could always have a em_cpu_get(int cpu) API that is a
> basically a wrapper around em_dev_get() for convenience.

The problem not only here is that we have a CPU index 'int cpu'
and if we ask for device like:

struct device *dev = get_cpu_device(cpu);

It might be not the same device that was used during the
registration, when we had i.e. 4 CPUs for the same policy:

int cpu_id = cpumask_first(policy->cpus);
struct device *cpu_dev = get_cpu_device(cpu_id);
em_register_perf_domain(cpu_dev, nr_opp, &em_cb);

That's why the em_cpu_get() is different than em_get_pd(), mainly by:
if (cpumask_test_cpu(cpu, em_span_cpus(em_pd)))

It won't be simple wrapper, let me think how it could be handled
differently than it is now.

Regards,
Lukasz

> 
> Thanks,
> Quentin
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
