Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DF4ACAE7F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 15:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E9D10E519;
	Mon,  2 Jun 2025 13:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ivnGhoHI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A29B10E51A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 13:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748869530; x=1780405530;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=H568FxVEZlGiJFy0RPATsOPZ24o2IPx/SM2md2PJdwE=;
 b=ivnGhoHIfDyD2SKUD3cPhrSpd1/owm1cASzT6MBNlDrjmlFXo2cdedZM
 +DuhJsVR/ZpohuIhymO9NN+UZPT9zCyE122VU5ZZgqS+TiPdpaLUqEGWy
 oTa/oiVNA+kRbEfjYAks8kqgtfy6XDH/e3mtJ5cyyK5GugRJrKayoxH7A
 NC6i5FFSXtKda7cvrRR2GVkOnvICOq+XtjGN306VMeigNJ/qxU2gePT2/
 4gF6Hd1ua2YzakFf053tGd1b6274nJDLXgH9oksCIraQqVTdCHtx6sjgr
 LHwgVvN0PRbaecp1G+iko6mM6dEOvchzhQSRpNUJcOX82L6n70uF8QTKu g==;
X-CSE-ConnectionGUID: i/BTjlanTc6ApdCCPm4zwg==
X-CSE-MsgGUID: n5gBpWmxRze9FmFlaaxHqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="73406306"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="73406306"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 06:05:30 -0700
X-CSE-ConnectionGUID: /S1V5dB2QcqIypvX5THjaQ==
X-CSE-MsgGUID: P2XEzj+5QvuWVxgOvbqzkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="149309252"
Received: from vmusin-mobl1.ger.corp.intel.com (HELO [10.245.112.120])
 ([10.245.112.120])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 06:05:28 -0700
Message-ID: <861208c3-3505-4386-848f-a7c7a9508604@linux.intel.com>
Date: Mon, 2 Jun 2025 15:05:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Trigger device recovery on engine
 reset/resume failure
To: Lizhi Hou <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, Karol Wachowski <karol.wachowski@intel.com>,
 stable@vger.kernel.org
References: <20250528154253.500556-1-jacek.lawrynowicz@linux.intel.com>
 <5b8763f2-3c1c-3621-912f-995af0076d91@amd.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <5b8763f2-3c1c-3621-912f-995af0076d91@amd.com>
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

On 5/28/2025 7:53 PM, Lizhi Hou wrote:
> 
> On 5/28/25 08:42, Jacek Lawrynowicz wrote:
>> From: Karol Wachowski <karol.wachowski@intel.com>
>>
>> Trigger full device recovery when the driver fails to restore device state
>> via engine reset and resume operations. This is necessary because, even if
>> submissions from a faulty context are blocked, the NPU may still process
>> previously submitted faulty jobs if the engine reset fails to abort them.
>> Such jobs can continue to generate faults and occupy device resources.
>> When engine reset is ineffective, the only way to recover is to perform
>> a full device recovery.
>>
>> Fixes: dad945c27a42 ("accel/ivpu: Add handling of VPU_JSM_STATUS_MVNCI_CONTEXT_VIOLATION_HW")
>> Cc: <stable@vger.kernel.org> # v6.15+
>> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_job.c     | 6 ++++--
>>   drivers/accel/ivpu/ivpu_jsm_msg.c | 9 +++++++--
>>   2 files changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
>> index 1c8e283ad9854..fae8351aa3309 100644
>> --- a/drivers/accel/ivpu/ivpu_job.c
>> +++ b/drivers/accel/ivpu/ivpu_job.c
>> @@ -986,7 +986,8 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
>>           return;
>>         if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW)
>> -        ivpu_jsm_reset_engine(vdev, 0);
>> +        if (ivpu_jsm_reset_engine(vdev, 0))
>> +            return;
> 
> Is it possible the context aborting is entered again before the full device recovery work is executed?

This is a good point but ivpu_context_abort_work_fn() is triggered by an IRQ and the first thing we do when triggering recovery is disabling IRQs.
The recovery work also flushes context_abort_work before staring to tear down everything, so we should be safe.

Regards,
Jacek

