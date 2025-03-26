Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D49A71206
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 09:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566AE10E65E;
	Wed, 26 Mar 2025 08:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PhFDyktU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8D910E658
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 08:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742976422; x=1774512422;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1h14r4Gq72zE+uCNNVQUHEuRRZWjoHzu+rsjHlpWOUg=;
 b=PhFDyktUYXipu5jxPsY1lwwAdNj7GXF/+NmiXwt7Hxb52M65Ssy02WUo
 oYPasjZrP217mDC5notsU3BI/Y7BRK0kwduj/ZtuOLsxV1lJma6BWmFcb
 ke03IvyJZlWf2Je2FggCbcH4MHy1lhhlUWbVrH6eOOMoZhTfLN6sfz2o3
 tL7y5stPqRcO3UgPrHm3XeFWXWvSfYSox9fn4zuOuw+lF2wTzoJyWHfdh
 duhLXxhPjbTMBvButZmBVjD20289tClRqBlRDfoUVe+oreBNTnOC6lmM4
 0Rw/hGWXK3EIf6Z+iSeblLtyAVdniI9vSSv3ttQ6xOSWjUtyX+oAQZWGD A==;
X-CSE-ConnectionGUID: OkMsYIzpQCCN9vuGJp2jYA==
X-CSE-MsgGUID: LRYdnR1JR3KSZyZGhTAFlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44139692"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="44139692"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 01:07:01 -0700
X-CSE-ConnectionGUID: BokTjAbjRGa7Q2WQF5G3TQ==
X-CSE-MsgGUID: 2o5xN5B0TqGGq7R2n+/Wdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="129360645"
Received: from kwywiol-mobl1.ger.corp.intel.com (HELO [10.245.83.152])
 ([10.245.83.152])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 01:06:59 -0700
Message-ID: <17c82a42-2174-425f-a4c4-4df18176f7a1@linux.intel.com>
Date: Wed, 26 Mar 2025 09:06:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] accel/ivpu: Fix deadlock in ivpu_ms_cleanup()
To: Lizhi Hou <lizhi.hou@amd.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com, stable@vger.kernel.org
References: <20250325114306.3740022-1-maciej.falkowski@linux.intel.com>
 <20250325114306.3740022-2-maciej.falkowski@linux.intel.com>
 <a0d93faa-40e0-4fc9-8b86-1e30c3946124@amd.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <a0d93faa-40e0-4fc9-8b86-1e30c3946124@amd.com>
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

On 3/25/2025 9:50 PM, Lizhi Hou wrote:
> 
> On 3/25/25 04:43, Maciej Falkowski wrote:
>> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>
>> Fix deadlock in ivpu_ms_cleanup() by preventing runtime resume after
>> file_priv->ms_lock is acquired.
>>
>> During a failure in runtime resume, a cold boot is executed, which
>> calls ivpu_ms_cleanup_all(). This function calls ivpu_ms_cleanup()
>> that acquires file_priv->ms_lock and causes the deadlock.
>>
>> Fixes: cdfad4db7756 ("accel/ivpu: Add NPU profiling support")
>> Cc: <stable@vger.kernel.org> # v6.11+
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_ms.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_ms.c b/drivers/accel/ivpu/ivpu_ms.c
>> index ffe7b10f8a76..eb485cf15ad6 100644
>> --- a/drivers/accel/ivpu/ivpu_ms.c
>> +++ b/drivers/accel/ivpu/ivpu_ms.c
>> @@ -4,6 +4,7 @@
>>    */
>>     #include <drm/drm_file.h>
>> +#include <linux/pm_runtime.h>
>>     #include "ivpu_drv.h"
>>   #include "ivpu_gem.h"
>> @@ -281,6 +282,9 @@ int ivpu_ms_get_info_ioctl(struct drm_device *dev, void *data, struct drm_file *
>>   void ivpu_ms_cleanup(struct ivpu_file_priv *file_priv)
>>   {
>>       struct ivpu_ms_instance *ms, *tmp;
>> +    struct ivpu_device *vdev = file_priv->vdev;
>> +
>> +    pm_runtime_get_sync(vdev->drm.dev);
> 
> Could get_sync() be failed here? Maybe it is better to add warning for failure?

Yes, this could fail but we already have detailed warnings in runtime resume callback (ivpu_pm_runtime_resume_cb()).
> 
>>         mutex_lock(&file_priv->ms_lock);
>>   @@ -293,6 +297,8 @@ void ivpu_ms_cleanup(struct ivpu_file_priv *file_priv)
>>           free_instance(file_priv, ms);
>>         mutex_unlock(&file_priv->ms_lock);
>> +
>> +    pm_runtime_put_autosuspend(vdev->drm.dev);
>>   }
>>     void ivpu_ms_cleanup_all(struct ivpu_device *vdev)

Regards,
Jacek

