Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C08416F913
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0543E6E1D7;
	Wed, 26 Feb 2020 08:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 18D6B6EA88
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:56:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80E7A30E;
 Tue, 25 Feb 2020 02:56:46 -0800 (PST)
Received: from [10.37.12.155] (unknown [10.37.12.155])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75D703F6CF;
 Tue, 25 Feb 2020 02:56:36 -0800 (PST)
Subject: Re: [PATCH v3 1/4] PM / EM: add devices to Energy Model
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200221194731.13814-1-lukasz.luba@arm.com>
 <20200221194731.13814-2-lukasz.luba@arm.com>
 <4ac6a187-1a09-335d-5c05-bf810ff81aaa@infradead.org>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <cf0d6bf7-ad87-4fbf-0392-646d5aa6d52b@arm.com>
Date: Tue, 25 Feb 2020 10:56:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4ac6a187-1a09-335d-5c05-bf810ff81aaa@infradead.org>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
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
 daniel.lezcano@linaro.org, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, mgorman@suse.de, rui.zhang@intel.com,
 alyssa.rosenzweig@collabora.com, orjan.eide@arm.com, b.zolnierkie@samsung.com,
 s.hauer@pengutronix.de, rostedt@goodmis.org, matthias.bgg@gmail.com,
 Dietmar.Eggemann@arm.com, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rjw@rjwysocki.net, agross@kernel.org, kernel@pengutronix.de,
 sudeep.holla@arm.com, patrick.bellasi@matbug.net, shawnguo@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

Thank you for taking the time to look into this patch.

On 2/22/20 12:42 AM, Randy Dunlap wrote:
> Hi,
> One minor nit. Please see inline:
> 
> On 2/21/20 11:47 AM, Lukasz Luba wrote:
>> Add support of other devices into the Energy Model framework not only the
>> CPUs. Change the interface to be more unified which can handle other
>> devices as well.
>>
>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
>> ---
>>   Documentation/power/energy-model.rst     | 133 ++++----
>>
>> diff --git a/Documentation/power/energy-model.rst b/Documentation/power/energy-model.rst
>> index 90a345d57ae9..7576820664e5 100644
>> --- a/Documentation/power/energy-model.rst
>> +++ b/Documentation/power/energy-model.rst
> 
>> @@ -85,13 +89,20 @@ API.
>>   2.3 Accessing performance domains
>>   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>   
>> +There is two API functions which provide the access to the energy model:
> 
>     There are two

Indeed a mistake, I will fix it.

> 
>> +em_cpu_get() which takes CPU id as an argument and em_pd_get() with device
>> +pointer as an argument. It depends on the subsystem which interface it is
>> +going to use, but in case of CPU devices both functions return the same
>> +performance domain.
>> +
> 
> 
> cheers.
> 

Regards,
Lukasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
