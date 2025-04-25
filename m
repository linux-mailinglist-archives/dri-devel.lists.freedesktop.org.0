Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AE5A9C0DC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B2910E0E3;
	Fri, 25 Apr 2025 08:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjmLsaSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F7610E0E3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 08:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745569382; x=1777105382;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mM9Dkv+5w/EtRpnZmN6iIy3PC5eTmKCVuLGs/ca4NnM=;
 b=fjmLsaSsVdvHdm7Jn5aUtJHDo3TxB74K2lD6Ujkzyy5VEVDC7Xu7T7wz
 i4YnXNGLOPIJBQLz6imY37rQ4QL9/9dXvwqX0HzmBBX4G78TloC6vwv+Y
 bZgxb9U2x6nvxjdcF5MMGvVfHTej+uaNi0K1LEoBPLsQa4sjyNHQ5r/BD
 7Xc62ATKdyj4Tp4eHhE0mlWjKn2IJ9FYGb/cnsEIukgUgcwgTZfuUJ396
 omI17OQp2mRH6HaU1tS8jpAKvvNN/E4Bfks0MQ2iwuClv9B2J79DmuMCK
 iiTO/79t4B2CMklhr7aqSmynvI4d+fdg28dHR4aIp0x+61bJ0dPUsk7uI w==;
X-CSE-ConnectionGUID: jk6OoKy2R/+sTyD3296nfw==
X-CSE-MsgGUID: sobXFjL7QECY9ovHTSzqKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46457034"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="46457034"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 01:23:02 -0700
X-CSE-ConnectionGUID: UA8gUz67TDG5DSubX98lxQ==
X-CSE-MsgGUID: u1suGBVnSs6oM02KjdEdBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="132736500"
Received: from pwilma-mobl1.ger.corp.intel.com (HELO [10.245.252.249])
 ([10.245.252.249])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 01:23:00 -0700
Message-ID: <1043bb88-3da0-4489-9341-f2a0dae5b5a6@linux.intel.com>
Date: Fri, 25 Apr 2025 10:22:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Implement heartbeat-based TDR mechanism
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@intel.com>
References: <20250416102555.384526-1-maciej.falkowski@linux.intel.com>
 <c6b4aaad-aa5f-4f46-948f-de150dfc60fe@quicinc.com>
 <edbd4421-e3b4-47a9-834e-200faf6fbda9@linux.intel.com>
 <ecaeb3ec-8956-48f9-9102-27ebb774cab9@oss.qualcomm.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ecaeb3ec-8956-48f9-9102-27ebb774cab9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 4/23/2025 4:23 PM, Jeff Hugo wrote:
> On 4/23/2025 1:23 AM, Jacek Lawrynowicz wrote:
>> Hi,
>>
>> On 4/18/2025 5:27 PM, Jeffrey Hugo wrote:
>>> On 4/16/2025 4:25 AM, Maciej Falkowski wrote:
>>>> From: Karol Wachowski <karol.wachowski@intel.com>
>>>>
>>>> Introduce a heartbeat-based Timeout Detection and Recovery (TDR) mechanism.
>>>> The enhancement aims to improve the reliability of device hang detection by
>>>> monitoring heartbeat updates.
>>>>
>>>> Each progressing inference will update heartbeat counter allowing driver to
>>>> monitor its progression. Limit maximum number of reschedules when heartbeat
>>>> indicates progression to 30.
>>>
>>> Code looks good.  However, why 30?  This would artificially limit how long a job could run, no?
>>
>> Yes, we still need a time based limit. There may be workloads that are stuck in infinite loop for example.
>> With this patch the max time the job can run is extended from 2 to 60 seconds.
>> We are not aware of any workloads that exceed this timeout at the moment.
> 
> Infinite loop vs something that just happens to be running long by design is a difficult problem.  60 seconds does not seem all that long to me.  Perhaps consider some kind of override so that if/when a workload comes along that needs more than 60 seconds, the user doesn't need to recompile their kernel to make it work?  I suspect that would be outside the scope of this change.
> 
> For this change, I think it would be good to add some info from your response.  I think the commit text would be improved by stating this increases the max runtime from 2 seconds to 60, and that this covers all known workloads.  Also, I think a comment on PM_TDR_HEARTBEAT_LIMIT that tells how long the limit is (60 seconds) would be helpful to future readers, instead of needing to parse through multiple functions and how they all interact.
> 
> With the commit text update -
> 
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> 
> The PM_TDR_HEARTBEAT_LIMIT comment is optional to me.

OK, I will update the commit message.

There is a module param that can be used to increase the overall timeout (tdr_timeout_ms).
The total timeout is (tdr_timeout_ms * 30) but this is not too intuitive after this change.
I will figure better solution that's easier to use.


Regards,
Jacek

