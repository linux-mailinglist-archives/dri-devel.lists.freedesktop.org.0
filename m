Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EA11DF665
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7116EA51;
	Sat, 23 May 2020 09:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 888E56E0C9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 12:58:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07F76D6E;
 Fri, 22 May 2020 05:58:26 -0700 (PDT)
Received: from [10.37.12.7] (unknown [10.37.12.7])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D8533F68F;
 Fri, 22 May 2020 05:58:13 -0700 (PDT)
Subject: Re: [PATCH v7 00/15] Add support for devices in the Energy Model
To: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <abff69b6-b033-18e2-f380-ceccb42c6b01@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <3f6652a5-ad9b-15cb-08a8-160becd3f912@arm.com>
Date: Fri, 22 May 2020 13:58:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <abff69b6-b033-18e2-f380-ceccb42c6b01@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 23 May 2020 09:33:36 +0000
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
 bsegall@google.com, mka@chromium.org, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 steven.price@arm.com, cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de,
 rui.zhang@intel.com, alyssa.rosenzweig@collabora.com, orjan.eide@arm.com,
 b.zolnierkie@samsung.com, s.hauer@pengutronix.de, rostedt@goodmis.org,
 matthias.bgg@gmail.com, Dietmar.Eggemann@arm.com, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, agross@kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On 5/22/20 11:43 AM, Daniel Lezcano wrote:
> 
> Hi Lukasz,
> 
> On 11/05/2020 13:18, Lukasz Luba wrote:
>> Hi all,
>>
>> This patch set introduces support for devices in the Energy Model (EM)
>> framework. It will unify the power model for thermal subsystem. It will
>> make simpler to add support for new devices willing to use more
>> advanced features (like Intelligent Power Allocation). Now it should
>> require less knowledge and effort for driver developer to add e.g.
>> GPU driver with simple energy model. A more sophisticated energy model
>> in the thermal framework is also possible, driver needs to provide
>> a dedicated callback function. More information can be found in the
>> updated documentation file.
>>
>> First 7 patches are refactoring Energy Model framework to add support
>> of other devices that CPUs. They change:
>> - naming convention from 'capacity' to 'performance' state,
>> - API arguments adding device pointer and not rely only on cpumask,
>> - change naming when 'cpu' was used, now it's a 'device'
>> - internal structure to maintain registered devices
>> - update users to the new API
>> Patch 8 updates OPP framework helper function to be more generic, not
>> CPU specific.
>> Patches 9-14 change devfreq cooling, dropping part of old power model and
>> adding registration with Energy Model via exported GPL function.
>> The last path is a simple change for Panfrost GPU driver.
>>
>> The patch set is based on linux-next tag next-20200508.
> 
> Do you think it is possible to respin against linux-pm next ?

Yes, I will do it and send the v8.

> 
> I wanted to try the series but I'm getting non trivial conflicts with
> the devfreq_cooling changes
> 
> 

Let me take care of this.

Regards,
Lukasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
