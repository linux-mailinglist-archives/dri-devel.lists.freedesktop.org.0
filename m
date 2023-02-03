Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF19689187
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 09:05:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6163310E0AD;
	Fri,  3 Feb 2023 08:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE6D10E0AD
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 08:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675411514; x=1706947514;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oUhUyYsFdSGc0UwrWATMvieAyz7TShaMJgLdW8LDtCQ=;
 b=msigzABq/F2nzIYC68/guJE66/vO2SM2nGR6kU0JYmA7YTCl+Eb1vPQ5
 nx9X+HHsU0LJlLRG3mGY4Rj0OUMxF7+4Ixz+lMapHsVDSGTpuKg+7CVvZ
 DxzwgpouCRRtoegyp4gNmufg5RxNTHf7katLK0UU/bHFmgkRr2pcjq1WG
 F8UIVIGJVkqVBGvBzNuxmEbYZ/w7wvSo2XskUCg1l1y/hhNFFl/uWRLRr
 etEle/2hbDWVlW4HQoI40z3UPMbM4z1t2V1uA91Dol5Nm0Br5x+vaAbhD
 igZSWDNaU0PbXrqYxCXZGQdwBgPaQwwFDiswzOV7g3MvXHFGnMi+MdiLK A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="393278900"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; d="scan'208";a="393278900"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 00:05:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="615619477"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; d="scan'208";a="615619477"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.139.5])
 ([10.249.139.5])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 00:05:11 -0800
Message-ID: <7085c059-11f3-b113-13ac-a5ed0e4103f9@linux.intel.com>
Date: Fri, 3 Feb 2023 09:05:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] accel/ivpu: Fix FW API data alignment issues
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230202092114.2637452-1-stanislaw.gruszka@linux.intel.com>
 <20230202092114.2637452-2-stanislaw.gruszka@linux.intel.com>
 <64efca60-2625-9b85-8d39-fb637b6d8b99@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <64efca60-2625-9b85-8d39-fb637b6d8b99@quicinc.com>
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
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 02.02.2023 16:04, Jeffrey Hugo wrote:
> On 2/2/2023 2:21 AM, Stanislaw Gruszka wrote:
>> From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
>>
>> FW API structures have been updated to fix misaligned
>> structure members.
>>
>> Also changed JSM message header format to account for
>> future improvements.
>>
>> Added explicit check for minimum supported JSM API version.
>>
>> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
>> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> 
> 
>>   /*
>>    * Job format.
>> @@ -119,7 +119,7 @@ struct vpu_job_queue_entry {
>>       u64 root_page_table_update_counter; /**< Page tables update events counter */
>>       u64 preemption_buffer_address; /**< Address of the preemption buffer to use for this job */
>>       u64 preemption_buffer_size; /**< Size of the preemption buffer to use for this job */
>> -    u8 reserved[VPU_JOB_RESERVED_BYTES];
>> +    u8 reserved_0[VPU_JOB_RESERVED_BYTES];
> 
> This seems spurious, just adding "_0" to the name.  Seems like the majority of the changes are like this (although you have a _1 at the very end).  Are you anticipating adding additional reserved fields in the near future?
> 

These headers are our HW/FW interface and we (as a KMD team) do not have full control over them.
The FW team has its own conventions which could probably treated the same as some auto generated HW interface headers accepted as-is.
We could modify them on import but it would be harder then maintain them.
If this doesn't bug you too much I would prefer to leave them as-is, OK?

Regards,
Jacek
