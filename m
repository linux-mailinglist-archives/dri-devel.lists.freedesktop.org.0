Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE259B018B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 13:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFA310E1B2;
	Fri, 25 Oct 2024 11:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FskVdLwK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0336A10E1B2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 11:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729856696; x=1761392696;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=KNtMFSkkMw5Z7wPypV/SsQQ8kRVVuQXMwCoZUfucozA=;
 b=FskVdLwKizt6mHmuDHOoyY/kqC9pyOGgKw+6h+zVNsMmrProUSueeYY4
 LqMGO7VhObU19o3eTqesbJgwoBiO2/r/4ZdSAQM+/DBSFcnIAFFnYMwuc
 GT/WmqlLIbxGTT3pKgVli9sJQWmm2r1LuHBa2Ut4lAalD7PGtYEkL2/93
 T2CgdCIHUYivRE3oVbn5ZOU3XVi2PhrR0zH9XaUtFLeWouR+koNeQZkGx
 rezpaq+1t30F/qyNU75vYw6osAj9R53cyxDQRuEVP5mZGe4pWe3nxse9S
 5AO6bZCU39+N7CBCafOLeKneGnYo2Ah4xxYS4kMsbQ6LmvGtJ4R1rlkPq Q==;
X-CSE-ConnectionGUID: VSdv6BZ8SWugd3NhfUlXeg==
X-CSE-MsgGUID: 2bQMpOuSQlagfWMM3WoTDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="54927915"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="54927915"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 04:44:55 -0700
X-CSE-ConnectionGUID: e4lmiVdQRd260MRAcDmOYQ==
X-CSE-MsgGUID: 3QVLhxFxT0uTYxU1TkUuMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="85474371"
Received: from lwesiers-mobl.ger.corp.intel.com (HELO [10.245.115.50])
 ([10.245.115.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 04:44:55 -0700
Message-ID: <9e1174db-3404-42bd-a847-cb1e72bc91b7@linux.intel.com>
Date: Fri, 25 Oct 2024 13:44:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Fix NOC firewall interrupt handling
To: dri-devel@lists.freedesktop.org
References: <20241017144958.79327-1-jacek.lawrynowicz@linux.intel.com>
 <96bfcac0-603e-0cc8-b267-e9ba43fe913e@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <96bfcac0-603e-0cc8-b267-e9ba43fe913e@quicinc.com>
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

On 10/18/2024 10:44 PM, Jeffrey Hugo wrote:
> On 10/17/2024 8:49 AM, Jacek Lawrynowicz wrote:
>> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>
>> The NOC firewall interrupt means that the HW prevented
>> unauthorized access to a protected resource, so there
>> is no need to trigger device reset in such case.
>>
>> To facilitate security testing add firewall_irq_counter
>> debugfs file that tracks firewall interrupts.
>>
>> Fixes: 8a27ad81f7d3 ("accel/ivpu: Split IP and buttress code")
>> Cc: <stable@vger.kernel.org> # v6.11+
>> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_debugfs.c | 9 +++++++++
>>   drivers/accel/ivpu/ivpu_hw.c      | 1 +
>>   drivers/accel/ivpu/ivpu_hw.h      | 1 +
>>   drivers/accel/ivpu/ivpu_hw_ip.c   | 5 ++++-
>>   4 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
>> index 8958145c49adb..8180b95ed69dc 100644
>> --- a/drivers/accel/ivpu/ivpu_debugfs.c
>> +++ b/drivers/accel/ivpu/ivpu_debugfs.c
>> @@ -116,6 +116,14 @@ static int reset_pending_show(struct seq_file *s, void *v)
>>       return 0;
>>   }
>>   +static int firewall_irq_counter_show(struct seq_file *s, void *v)
>> +{
>> +    struct ivpu_device *vdev = seq_to_ivpu(s);
>> +
>> +    seq_printf(s, "%d\n", atomic_read(&vdev->hw->firewall_irq_counter));
>> +    return 0;
>> +}
>> +
>>   static const struct drm_debugfs_info vdev_debugfs_list[] = {
>>       {"bo_list", bo_list_show, 0},
>>       {"fw_name", fw_name_show, 0},
>> @@ -125,6 +133,7 @@ static const struct drm_debugfs_info vdev_debugfs_list[] = {
>>       {"last_bootmode", last_bootmode_show, 0},
>>       {"reset_counter", reset_counter_show, 0},
>>       {"reset_pending", reset_pending_show, 0},
>> +    {"firewall_irq_counter", firewall_irq_counter_show, 0},
>>   };
>>     static int dvfs_mode_get(void *data, u64 *dvfs_mode)
>> diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
>> index 09ada8b500b99..4e1054f3466e8 100644
>> --- a/drivers/accel/ivpu/ivpu_hw.c
>> +++ b/drivers/accel/ivpu/ivpu_hw.c
>> @@ -252,6 +252,7 @@ int ivpu_hw_init(struct ivpu_device *vdev)
>>       platform_init(vdev);
>>       wa_init(vdev);
>>       timeouts_init(vdev);
>> +    atomic_set(&vdev->hw->firewall_irq_counter, 0);
>>         return 0;
>>   }
>> diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
>> index dc5518248c405..fc4dbfc980c81 100644
>> --- a/drivers/accel/ivpu/ivpu_hw.h
>> +++ b/drivers/accel/ivpu/ivpu_hw.h
>> @@ -51,6 +51,7 @@ struct ivpu_hw_info {
>>       int dma_bits;
>>       ktime_t d0i3_entry_host_ts;
>>       u64 d0i3_entry_vpu_ts;
>> +    atomic_t firewall_irq_counter;
> 
> Why atomic?
 
So we don't have to worry about synchronization and barriers.

