Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D85A8C3FF8
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 13:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9A210E69A;
	Mon, 13 May 2024 11:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFTZ+F51";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4A710E69A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 11:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715600386; x=1747136386;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OoF0PKjZpfdPQ3MvJtFRBhXeyaTKRpfTXpoLj9HSdDo=;
 b=nFTZ+F51OPqMmVqOJJoJ1sucOqO3QIU+cQaGpfBlBr4XrzxXPotpBXyk
 UizOuyfJCoqZVdY5Bt25UxgS16BGTY/NyL2ZQMP7jkErNzzyvoB5Q4t+D
 djxUIAR3yUiDZfJkuYp+qSMN37HR7SuYnNlAVcRJlQI9Keyoe+fET5T+b
 EI4FP/uF4pdrudug+QfXW3Ph8vKoPrn0b6dPls+XY2Btg7r+E3oxm657F
 JdmhCqrOkP7uaCBaGiFNxBbYzTAVPJoRumenyYnc4K1UuYRaPsB1J6kii
 csOcrdZdi+gWNx1qAxS7d8Zg9SzYUbkDN9q2aOzf1IEWJlV3GT0FWa/ZV A==;
X-CSE-ConnectionGUID: NNO8Zt9JSFiLS7bM/T/NTg==
X-CSE-MsgGUID: SRBuCgMWTamnu8ufO3trKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22197605"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22197605"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 04:39:45 -0700
X-CSE-ConnectionGUID: vNGJVWnhTVWrkr23rTZgtA==
X-CSE-MsgGUID: O6o//m28QxaPkuV6rAKK7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30426808"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.246.3.118])
 ([10.246.3.118])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 04:39:43 -0700
Message-ID: <842dbe03-d410-4469-936f-cee68d32ba26@linux.intel.com>
Date: Mon, 13 May 2024 13:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] accel/ivpu: Share NPU busy time in sysfs
To: Tvrtko Ursulin <tursulin@ursulin.net>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
References: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
 <20240508132931.2388996-1-jacek.lawrynowicz@linux.intel.com>
 <aad0fac7-279a-0b40-569e-73acf8b77db2@quicinc.com>
 <dbd2e32c-a75e-4d8a-9653-6f23cc494924@linux.intel.com>
 <66cde8ee-b174-4061-bcfd-a6b6811af6ef@ursulin.net>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <66cde8ee-b174-4061-bcfd-a6b6811af6ef@ursulin.net>
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 13.05.2024 12:45, Tvrtko Ursulin wrote:
> 
> On 13/05/2024 11:22, Jacek Lawrynowicz wrote:
>> Hi,
>>
>> On 10.05.2024 18:55, Jeffrey Hugo wrote:
>>> On 5/8/2024 7:29 AM, Jacek Lawrynowicz wrote:
>>>> From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
>>>>
>>>> The driver tracks the time spent by NPU executing jobs
>>>> and shares it through sysfs `npu_busy_time_us` file.
>>>> It can be then used by user space applications to monitor device
>>>> utilization.
>>>>
>>>> NPU is considered 'busy' starting with a first job submitted
>>>> to firmware and ending when there is no more jobs pending/executing.
>>>>
>>>> Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
>>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>>
>>> This feels like something that would normally be handled by perf. Why not use that mechanism?
>>
>> Yeah, probably but we had several request to provide easy to use interface for this metric that
>> could be integrated in various user space apps/tools that do not use ftrace.
> 
> Probably more Perf/PMU aka performance counters? Which would be scriptable via $kernel/tools/perf or directly via perf_event_open(2) and read(2).
> 
> Note it is not easy to get right and in the i915 implementation (see i915_pmu.c) we have a known issue with PCI hot unplug and use after free which needs input from perf core folks.

OK, we will consider using perf/pmu for NPU but for the moment I would like to keep this sysfs interface.
It so simple it can be used from bash and it always can be removed if obsoleted by something fancier.
