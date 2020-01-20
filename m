Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6BD14309F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 18:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804AF6EA36;
	Mon, 20 Jan 2020 17:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8FE786E9BD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 15:27:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 154E130E;
 Mon, 20 Jan 2020 07:27:42 -0800 (PST)
Received: from [10.37.12.169] (unknown [10.37.12.169])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FF413F52E;
 Mon, 20 Jan 2020 07:27:32 -0800 (PST)
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
To: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-imx@nxp.com
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
 <17b77e0c-9455-0479-d37b-c57717c784c7@arm.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <7d620ad0-9baa-7c0b-d596-a534bccaad64@arm.com>
Date: Mon, 20 Jan 2020 15:27:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <17b77e0c-9455-0479-d37b-c57717c784c7@arm.com>
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
 viresh.kumar@linaro.org, bjorn.andersson@linaro.org, bsegall@google.com,
 Morten.Rasmussen@arm.com, amit.kucheria@verdurent.com,
 vincent.guittot@linaro.org, khilman@kernel.org, daniel.lezcano@linaro.org,
 steven.price@arm.com, cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de,
 rui.zhang@intel.com, alyssa.rosenzweig@collabora.com, b.zolnierkie@samsung.com,
 s.hauer@pengutronix.de, rostedt@goodmis.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 shawnguo@kernel.org, rjw@rjwysocki.net, agross@kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 ionela.voinescu@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dietmar,

On 1/20/20 2:53 PM, Dietmar Eggemann wrote:
> On 16/01/2020 16:20, lukasz.luba@arm.com wrote:
>> From: Lukasz Luba <lukasz.luba@arm.com>
>>
>> Add support of other devices into the Energy Model framework not only the
>> CPUs. Change the interface to be more unified which can handle other
>> devices as well.
> 
> [...]
> 
>> -The source of the information about the power consumed by CPUs can vary greatly
>> +The source of the information about the power consumed by devices can vary greatly
>>   from one platform to another. These power costs can be estimated using
>>   devicetree data in some cases. In others, the firmware will know better.
>>   Alternatively, userspace might be best positioned. And so on. In order to avoid
>> @@ -26,7 +28,7 @@ framework, and interested clients reading the data from it::
>>          | Thermal (IPA) |  | Scheduler (EAS) |  |     Other     |
>>          +---------------+  +-----------------+  +---------------+
>>                  |                   | em_pd_energy()    |
>> -               |                   | em_cpu_get()      |
>> +               |  em_dev_get()     | em_cpu_get()      |
> 
> Looked really hard but can't find a em_dev_get() in the code? You mean
> em_get_pd() ? And why em_get_pd() and not em_pd_get()?

It was it the old implementation, I will remove 'em_dev_get()' from
the doc. The em_pd_get() is OK for me, I can change it.

> 
>>                  +---------+         |         +---------+
>>                            |         |         |
>>                            v         v         v
>> @@ -47,12 +49,12 @@ framework, and interested clients reading the data from it::
>>           | Device Tree  |   |   Firmware    |  |      ?       |
>>           +--------------+   +---------------+  +--------------+
> 
> [...]
> 
>> +There is two API functions which provide the access to the energy model:
>> +em_cpu_get() which takes CPU id as an argument and em_dev_get() with device
>> +pointer as an argument. It depends on the subsystem which interface it is
>> +going to use.
> 
> Would be really nice if this wouldn't be required. We should really aim
> for 1 framework == 1 set of interfaces.
> 
> What happens if someone calls em_get_pd() on a CPU EM?
> 
> E.g:
> 
>   static struct perf_domain *pd_init(int cpu)
>   {
> -       struct em_perf_domain *obj = em_cpu_get(cpu);
> +       struct device *dev = get_cpu_device(cpu);
> +       struct em_perf_domain *obj = em_pd_get(dev);
>          struct perf_domain *pd;
> 
> Two versions of one functionality will confuse API user from the
> beginning ...

Right, I could modify the pd_init code to use one 'em_get_pd' API
and remove the 'em_cpu_get'.

> 
> [...]
> 
>> +enum em_type {
>> +	EM_SIMPLE,
>> +	EM_CPU,
>> +};
> 
> s/EM_SIMPLE/EM_DEV ?
> 
> Right now I only see energy models and _one_ specific type (the CPU EM).
> So a tag 'is a CPU EM' would suffice. No need for EM_SIMPE ...

The EM_SIMPLE is set in the em_register_perf_domain() to distinguish
CPU device which has populated 'priv' pointer and set EM_CPU.
We can just rely on 'priv == NULL' to check if we are dealing with a
CPU EM. Do you prefer this approach and get rid of em_type?

Then the code would look like:

if (em_pd->priv)
	seq_puts(s, "EM_CPU\n");
else
	seq_puts(s, "EM_SIMPLE\n");


Regards,
Lukasz

> 
> [...]
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
