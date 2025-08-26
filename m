Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B052B36A45
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 16:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D997510E67D;
	Tue, 26 Aug 2025 14:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5B18C10E67C;
 Tue, 26 Aug 2025 14:35:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CB231A25;
 Tue, 26 Aug 2025 07:35:50 -0700 (PDT)
Received: from [10.57.4.86] (unknown [10.57.4.86])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E899E3F694;
 Tue, 26 Aug 2025 07:35:51 -0700 (PDT)
Message-ID: <ab80cb84-42b2-4ce8-aa6c-4ce6be7a12b7@arm.com>
Date: Tue, 26 Aug 2025 15:35:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] perf/hisilicon: Fix group validation
To: Mark Rutland <mark.rutland@arm.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org, acme@kernel.org, 
 namhyung@kernel.org, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
 irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, coresight@lists.linaro.org,
 iommu@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1755096883.git.robin.murphy@arm.com>
 <c7b877e66ba0d34d8558c5af8bbb620e8c0e47d9.1755096883.git.robin.murphy@arm.com>
 <aK2XS_GhLw1EQ2ml@J2N7QTR9R3>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aK2XS_GhLw1EQ2ml@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2025-08-26 12:15 pm, Mark Rutland wrote:
> On Wed, Aug 13, 2025 at 06:00:54PM +0100, Robin Murphy wrote:
>> The group validation logic shared by the HiSilicon HNS3/PCIe drivers is
>> a bit off, in that given a software group leader, it will consider that
>> event *in place of* the actual new event being opened. At worst this
>> could theoretically allow an unschedulable group if the software event
>> config happens to look like one of the hardware siblings.
>>
>> The uncore framework avoids that particular issue,
> 
> What is "the uncore framework"? I'm not sure exactly what you're
> referring to, nor how that composes with the problem described above.

Literally that hisi_uncore_pmu.c is actually a framework for half a 
dozen individual sub-drivers rather than a "driver" itself per se, but I 
suppose that detail doesn't strictly matter at this level.

>> but all 3 also share the common issue of not preventing racy access to
>> the sibling list,
> 
> Can you please elaborate on this racy access to the silbing list? I'm
> not sure exactly what you're referring to.

Hmm, yes, I guess an actual race is probably impossible since if we're 
still in the middle of opening the group leader event then we haven't 
yet allocated the fd that userspace would need to start adding siblings, 
even if it tried to guess. I leaned on "racy" as a concise way to infer 
"when it isn't locked (even though the reasons for that are more 
subtle)" repeatedly over several patches - after all, the overall theme 
of this series is that I dislike repetitive boilerplate :)

I'll dedicate some time for polishing commit messages for v2, especially 
the common context for these "part 1" patches per your feedback on patch #1.

>> and some redundant checks which can be cleaned up.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/perf/hisilicon/hisi_pcie_pmu.c   | 17 ++++++-----------
>>   drivers/perf/hisilicon/hisi_uncore_pmu.c | 23 +++++++----------------
>>   drivers/perf/hisilicon/hns3_pmu.c        | 17 ++++++-----------
>>   3 files changed, 19 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/perf/hisilicon/hisi_pcie_pmu.c b/drivers/perf/hisilicon/hisi_pcie_pmu.c
>> index c5394d007b61..3b0b2f7197d0 100644
>> --- a/drivers/perf/hisilicon/hisi_pcie_pmu.c
>> +++ b/drivers/perf/hisilicon/hisi_pcie_pmu.c
>> @@ -338,21 +338,16 @@ static bool hisi_pcie_pmu_validate_event_group(struct perf_event *event)
>>   	int counters = 1;
>>   	int num;
>>   
>> -	event_group[0] = leader;
>> -	if (!is_software_event(leader)) {
>> -		if (leader->pmu != event->pmu)
>> -			return false;
>> +	if (leader == event)
>> +		return true;
>>   
>> -		if (leader != event && !hisi_pcie_pmu_cmp_event(leader, event))
>> -			event_group[counters++] = event;
>> -	}
>> +	event_group[0] = event;
>> +	if (leader->pmu == event->pmu && !hisi_pcie_pmu_cmp_event(leader, event))
>> +		event_group[counters++] = leader;
> 
> Looking at this, the existing logic to share counters (which
> hisi_pcie_pmu_cmp_event() is trying to permit) looks to be bogus, given
> that the start/stop callbacks will reprogram the HW counters (and hence
> can fight with one another).

Yeah, this had a dodgy smell when I first came across it, but after 
doing all the digging I think it does actually work out - the trick 
seems to be the group_leader check in hisi_pcie_pmu_get_event_idx(), 
with the implication the PMU is going to be stopped while scheduling 
in/out the whole group, so assuming hisi_pcie_pmu_del() doesn't clear 
the counter value in hardware (even though the first call nukes the rest 
of the event configuration), then the events should stay in sync.

It does seem somewhat nonsensical to have multiple copies of the same 
event in the same group, but I imagine it could happen with some sort of 
scripted combination of metrics, and supporting it at this level saves 
needing explicit deduplication further up. So even though my initial 
instinct was to rip it out too, in the end I concluded that that doesn't 
seem justified.

Thanks,
Robin.

> I suspect that can be removed *entirely*, and this can be simplified
> down to allocating N counters, without a quadratic event comparison.  We
> don't try to share counters in other PMU drivers, and there was no
> rationale for trying to do this when this wa introduced in commit:
> 
>    8404b0fbc7fbd42e ("drivers/perf: hisi: Add driver for HiSilicon PCIe PMU")
> 
> The 'link' tag in that comment goes to v13, which doesn't link to prior
> postings, so I'm not going to dig further.
> 
> Mark.
> 
>>   
>>   	for_each_sibling_event(sibling, event->group_leader) {
>> -		if (is_software_event(sibling))
>> -			continue;
>> -
>>   		if (sibling->pmu != event->pmu)
>> -			return false;
>> +			continue;
>>   
>>   		for (num = 0; num < counters; num++) {
>>   			/*
>> diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
>> index a449651f79c9..3c531b36cf25 100644
>> --- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
>> +++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
>> @@ -101,26 +101,17 @@ static bool hisi_validate_event_group(struct perf_event *event)
>>   	/* Include count for the event */
>>   	int counters = 1;
>>   
>> -	if (!is_software_event(leader)) {
>> -		/*
>> -		 * We must NOT create groups containing mixed PMUs, although
>> -		 * software events are acceptable
>> -		 */
>> -		if (leader->pmu != event->pmu)
>> -			return false;
>> +	if (leader == event)
>> +		return true;
>>   
>> -		/* Increment counter for the leader */
>> -		if (leader != event)
>> -			counters++;
>> -	}
>> +	/* Increment counter for the leader */
>> +	if (leader->pmu == event->pmu)
>> +		counters++;
>>   
>>   	for_each_sibling_event(sibling, event->group_leader) {
>> -		if (is_software_event(sibling))
>> -			continue;
>> -		if (sibling->pmu != event->pmu)
>> -			return false;
>>   		/* Increment counter for each sibling */
>> -		counters++;
>> +		if (sibling->pmu == event->pmu)
>> +			counters++;
>>   	}
>>   
>>   	/* The group can not count events more than the counters in the HW */
>> diff --git a/drivers/perf/hisilicon/hns3_pmu.c b/drivers/perf/hisilicon/hns3_pmu.c
>> index c157f3572cae..382e469257f9 100644
>> --- a/drivers/perf/hisilicon/hns3_pmu.c
>> +++ b/drivers/perf/hisilicon/hns3_pmu.c
>> @@ -1058,21 +1058,16 @@ static bool hns3_pmu_validate_event_group(struct perf_event *event)
>>   	int counters = 1;
>>   	int num;
>>   
>> -	event_group[0] = leader;
>> -	if (!is_software_event(leader)) {
>> -		if (leader->pmu != event->pmu)
>> -			return false;
>> +	if (leader == event)
>> +		return true;
>>   
>> -		if (leader != event && !hns3_pmu_cmp_event(leader, event))
>> -			event_group[counters++] = event;
>> -	}
>> +	event_group[0] = event;
>> +	if (leader->pmu == event->pmu && !hns3_pmu_cmp_event(leader, event))
>> +		event_group[counters++] = leader;
>>   
>>   	for_each_sibling_event(sibling, event->group_leader) {
>> -		if (is_software_event(sibling))
>> -			continue;
>> -
>>   		if (sibling->pmu != event->pmu)
>> -			return false;
>> +			continue;
>>   
>>   		for (num = 0; num < counters; num++) {
>>   			/*
>> -- 
>> 2.39.2.101.g768bb238c484.dirty
>>
