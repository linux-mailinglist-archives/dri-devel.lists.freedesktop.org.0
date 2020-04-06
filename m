Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3F61A08F6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5217D6E5B9;
	Tue,  7 Apr 2020 08:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 459466E095
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 13:35:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEA2F7FA;
 Mon,  6 Apr 2020 06:35:17 -0700 (PDT)
Received: from [10.37.12.4] (unknown [10.37.12.4])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8230E3F52E;
 Mon,  6 Apr 2020 06:35:07 -0700 (PDT)
Subject: Re: [PATCH v5 4/5] thermal: devfreq_cooling: Refactor code and switch
 to use Energy Model
To: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200318114548.19916-1-lukasz.luba@arm.com>
 <20200318114548.19916-5-lukasz.luba@arm.com>
 <f3e9f127-47b1-9f30-2148-3c95a5933a92@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <4bf6cc66-8df4-3224-418d-0549026a3672@arm.com>
Date: Mon, 6 Apr 2020 14:35:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f3e9f127-47b1-9f30-2148-3c95a5933a92@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:31 +0000
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
 viresh.kumar@linaro.org, liviu.dudau@arm.com, bjorn.andersson@linaro.org,
 bsegall@google.com, Morten.Rasmussen@arm.com, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 steven.price@arm.com, cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de,
 rui.zhang@intel.com, alyssa.rosenzweig@collabora.com, orjan.eide@arm.com,
 b.zolnierkie@samsung.com, s.hauer@pengutronix.de, rostedt@goodmis.org,
 matthias.bgg@gmail.com, Dietmar.Eggemann@arm.com, airlied@linux.ie,
 javi.merino@arm.com, tomeu.vizoso@collabora.com, qperret@google.com,
 sboyd@kernel.org, mka@chromium.org, rdunlap@infradead.org, rjw@rjwysocki.net,
 agross@kernel.org, kernel@pengutronix.de, sudeep.holla@arm.com,
 patrick.bellasi@matbug.net, shawnguo@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/3/20 6:44 PM, Daniel Lezcano wrote:
> On 18/03/2020 12:45, Lukasz Luba wrote:
>> The overhauled Energy Model (EM) framework support also devfreq devices.
>> The unified API interface of the EM can be used in the thermal subsystem to
>> not duplicate code. The power table now is taken from EM structure and
>> there is no need to maintain calculation for it locally. In case when the
>> EM is not provided by the device a simple interface for cooling device is
>> used.
>>
>> There is also an improvement in code related to enabling/disabling OPPs,
>> which prevents from race condition with devfreq governors.
>>
>> [lkp: Reported the build warning]
>> Reported-by: kbuild test robot <lkp@intel.com>
>> Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org> # for tracing code
>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> 
> The changes are too big, please split this patch into smaller chunks.

OK, I will split it and re-base on top of thermal testing.

> 
>> ---
>>   drivers/thermal/devfreq_cooling.c | 474 ++++++++++++++++--------------
>>   include/linux/devfreq_cooling.h   |  39 +--
>>   include/trace/events/thermal.h    |  19 +-
>>   3 files changed, 277 insertions(+), 255 deletions(-)
>>
>> diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
> 
> [ ... ]
> 
>>   struct devfreq_cooling_device {
>>   	int id;
>>   	struct thermal_cooling_device *cdev;
>>   	struct devfreq *devfreq;
>>   	unsigned long cooling_state;
>> -	u32 *power_table;
>>   	u32 *freq_table;
>> -	size_t freq_table_size;
>> +	size_t max_level;
> 
> Could you rename it to 'max_state' ?

Yes.

Thank you for your comments.

Regards,
Lukasz

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
