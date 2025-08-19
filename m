Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E766B2C570
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 15:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7950110E5FE;
	Tue, 19 Aug 2025 13:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 33E0D10E60D;
 Tue, 19 Aug 2025 13:25:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CEF116A3;
 Tue, 19 Aug 2025 06:25:42 -0700 (PDT)
Received: from [10.1.196.50] (e121345-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 884583F738;
 Tue, 19 Aug 2025 06:25:46 -0700 (PDT)
Message-ID: <271daf71-3c57-49a5-a65f-c58ac670864f@arm.com>
Date: Tue, 19 Aug 2025 14:25:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/19] perf: Garbage-collect event_init checks
From: Robin Murphy <robin.murphy@arm.com>
To: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 mark.rutland@arm.com, acme@kernel.org, namhyung@kernel.org,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
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
 <ace3532a8a438a96338bf349a27636d8294c7111.1755096883.git.robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <ace3532a8a438a96338bf349a27636d8294c7111.1755096883.git.robin.murphy@arm.com>
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

On 13/08/2025 6:01 pm, Robin Murphy wrote:
[...]
> diff --git a/arch/x86/events/intel/uncore.c b/arch/x86/events/intel/uncore.c
> index 297ff5adb667..98ffab403bb4 100644
> --- a/arch/x86/events/intel/uncore.c
> +++ b/arch/x86/events/intel/uncore.c
> @@ -731,24 +731,11 @@ static int uncore_pmu_event_init(struct perf_event *event)
>   	struct hw_perf_event *hwc = &event->hw;
>   	int ret;
>   
> -	if (event->attr.type != event->pmu->type)
> -		return -ENOENT;
> -
>   	pmu = uncore_event_to_pmu(event);
>   	/* no device found for this pmu */
>   	if (!pmu->registered)
>   		return -ENOENT;
>   
> -	/* Sampling not supported yet */
> -	if (hwc->sample_period)
> -		return -EINVAL;
> -
> -	/*
> -	 * Place all uncore events for a particular physical package
> -	 * onto a single cpu
> -	 */
> -	if (event->cpu < 0)
> -		return -EINVAL;

Oopsie, I missed that this isn't just the usual boilerplate as the 
comment kind of implies, but is also necessary to prevent the 
uncore_pmu_to_box() lookup going wrong (since the core code won't reject 
a task-bound event until later). I'll put this back with an updated 
comment for v2 (and double-check everything else again...), thanks LKP!

Robin.


>   	box = uncore_pmu_to_box(pmu, event->cpu);
>   	if (!box || box->cpu < 0)
>   		return -EINVAL;
