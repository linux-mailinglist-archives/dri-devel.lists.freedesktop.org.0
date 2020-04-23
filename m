Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660DC1B6734
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0714F6EA61;
	Thu, 23 Apr 2020 22:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2AEB56E5D4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 16:58:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85EE330E;
 Thu, 23 Apr 2020 09:58:22 -0700 (PDT)
Received: from [10.37.12.89] (unknown [10.37.12.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B9B73F68F;
 Thu, 23 Apr 2020 09:57:48 -0700 (PDT)
Subject: Re: [PATCH v6 04/10] PM / EM: add support for other devices than CPUs
 in Energy Model
To: Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-5-lukasz.luba@arm.com>
 <20200423151250.GB65632@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <ff1c8cc5-f64d-6156-7d30-97b8426c6f99@arm.com>
Date: Thu, 23 Apr 2020 17:57:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200423151250.GB65632@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, mka@chromium.org, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 agross@kernel.org, b.zolnierkie@samsung.com, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, linux-imx@nxp.com,
 rui.zhang@intel.com, mgorman@suse.de, orjan.eide@arm.com,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/23/20 4:12 PM, Daniel Lezcano wrote:
> On Fri, Apr 10, 2020 at 09:42:04AM +0100, Lukasz Luba wrote:
>> Add support for other devices that CPUs. The registration function
>> does not require a valid cpumask pointer and is ready to handle new
>> devices. Some of the internal structures has been reorganized in order to
>> keep consistent view (like removing per_cpu pd pointers). To track usage
>> of the Energy Model structures, they are protected with kref.
> 
> Why not add the energy model structure in the struct device directly?

Do you mean this structure?
https://elixir.bootlin.com/linux/latest/source/include/linux/device.h#L537

and to put something like:
struct device {
...
	struct dev_pm_domain	*pm_domain;
#ifdef CONFIG_ENERGY_MODEL
	struct em_perf_domain	*em_pd;
#endif
...
};

> 
> For instance for the em_cpu_get() function, the cpu id allows to retrieve the
> cpu device and then from there, the energy model instead of browsing another
> list. The em_device life cycle will be tied to the struct device.

That would be perfect.

> 
> Then when the struct device and the em_device are connected, add the debugfs
> with a struct device list for those which are energy aware, so you end up with
> a structure:
> 
> struct em_device {
> 	struct device *dev;
> 	struct list_head em_dev_list;
> };
> 
> (a global single dentry for debugfs to do a recursive delete is enough).
> 
> Locks when inspecting and add/removal called from the struct device release
> function. So no need of an extra refcounting.
> 
> Does it make sense?
> 

Indeed it looks much cleaner/simpler.

I will try to address this idea and get rid of refcounting.

This should be doable in this patch (4/10). In the v7 I will keep your
ACKs for other patches that you have already commented.

Thank you for your suggestions and review.

Regards,
Lukasz

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
