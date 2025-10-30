Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D385CC1ED65
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 08:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3A710E8F0;
	Thu, 30 Oct 2025 07:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDKi6RKP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F47210E8F0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 07:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761810369; x=1793346369;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=vuaUiNMEV0X8JMPwi/b8xI/210Cvx0C75+BaWdoEN40=;
 b=XDKi6RKPzdcKU5y4TnfwdalXYqlsLJdjkEixZ6XvRHQXqE6mkiTtgLNu
 spi/xpo/RiS5ctG9fuT6dc7FVW0zz5XLLqD4nNT6NxAWZp2pdE0AJ1Z/z
 Ye16Egk0jpbII2iNWFSbkrVOjEN7HAfdypQ7kWi4Amct9jjebjH05rD2Q
 Rd1SA/WF2PjvDhvrrl+8mpPTrTgEuL3Q6LArQRsWmWJLdgtYfq0wVDA3o
 uHEzyfmPj5YpMI2Broq+mfkNTVZ0x38Oi1X4A3LqdM+CUMbzVdp254+I8
 6MxlPgHSuq7JeRWv/F0sAHlqhu9w+yvEuIXpTQDNRZE22A2FZf/fn8wgV g==;
X-CSE-ConnectionGUID: krKsTmGwTSu+ccavRX7Pyg==
X-CSE-MsgGUID: oecmH6uaSvK8ajerzFJ12Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64040612"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="64040612"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 00:46:09 -0700
X-CSE-ConnectionGUID: PRRlbPuHS36EwSQFDrAsKg==
X-CSE-MsgGUID: y2+ZtTdDRayW7YURyIrzRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="190219305"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.246.16.226])
 ([10.246.16.226])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 00:46:06 -0700
Message-ID: <485ced4a-78bb-48a7-9494-b9705db9b650@linux.intel.com>
Date: Thu, 30 Oct 2025 08:46:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] accel/ivpu: replace use of system_unbound_wq with
 system_dfl_wq
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
References: <20251029165642.364488-1-marco.crivellari@suse.com>
 <20251029165642.364488-2-marco.crivellari@suse.com>
 <f18e26c0-f4f3-4221-ba92-218698ec088e@linux.intel.com>
Content-Language: en-US
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <f18e26c0-f4f3-4221-ba92-218698ec088e@linux.intel.com>
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

On 10/29/2025 9:01 PM, Karol Wachowski wrote:
> On 10/29/2025 5:56 PM, Marco Crivellari wrote:
>> Currently if a user enqueue a work item using schedule_delayed_work() the
>> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
>> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
>> schedule_work() that is using system_wq and queue_work(), that makes use
>> again of WORK_CPU_UNBOUND.
>>
>> This lack of consistency cannot be addressed without refactoring the API.
>>
>> system_unbound_wq should be the default workqueue so as not to enforce
>> locality constraints for random work whenever it's not required.
>>
>> Adding system_dfl_wq to encourage its use when unbound work should be used.
>>
>> The old system_unbound_wq will be kept for a few release cycles.
>>
>> Suggested-by: Tejun Heo <tj@kernel.org>
>> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
>> ---
>>  drivers/accel/ivpu/ivpu_pm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
>> index 475ddc94f1cf..ffa2ba7cafe2 100644
>> --- a/drivers/accel/ivpu/ivpu_pm.c
>> +++ b/drivers/accel/ivpu/ivpu_pm.c
>> @@ -186,7 +186,7 @@ void ivpu_pm_trigger_recovery(struct ivpu_device *vdev, const char *reason)
>>  	if (atomic_cmpxchg(&vdev->pm->reset_pending, 0, 1) == 0) {
>>  		ivpu_hw_diagnose_failure(vdev);
>>  		ivpu_hw_irq_disable(vdev); /* Disable IRQ early to protect from IRQ storm */
>> -		queue_work(system_unbound_wq, &vdev->pm->recovery_work);
>> +		queue_work(system_dfl_wq, &vdev->pm->recovery_work);
>>  	}
>>  }
> Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>>  
Pushed to drm-misc-next.
-Karol
