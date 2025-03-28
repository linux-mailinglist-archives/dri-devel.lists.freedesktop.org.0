Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E72EFA7454C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 09:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6143610E065;
	Fri, 28 Mar 2025 08:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jqCAaJHW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FFD10E065
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 08:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743150241; x=1774686241;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eGI32WhpgyzFIHFK5QikFy6F+lcZCPEkmnoatYyfojk=;
 b=jqCAaJHWn6Fio4zSaysnGo+QTTr0/BR88bqOWjw5emqL9uoYBK2tXJ8r
 g9D9Jr6dS4Y+u4/8Dli/3ARlV9dOi6sMGxrU6Yg7HBo+/sUMnqh3IanaB
 hcNcM4Ka6tWOorqZmuomtBWdmlSFlVcrtzfoOL5uK/bIjEhcc8L0coziW
 i5CB2ipwpZwZo31b8qKw68NPhueeWIdRxdgF3upd60LOK7m+7VtVr2Yvb
 XvjTnHcmDK5pPUI7d5wGEO8KwWUPmeS7tL+HECl/dn2QHOA7Z2qa72csk
 LF4OFJJaiH4j28dLtOOCB1jVVRWRdDnhtVnP57t2oOr4NrypeTMIHhu4V Q==;
X-CSE-ConnectionGUID: 95c6J+WcRtukkzJc1IdtbA==
X-CSE-MsgGUID: EJXy0FMuSPuLqT6PbBfAZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44635232"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="44635232"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 01:24:00 -0700
X-CSE-ConnectionGUID: gF2iXmXYSxqjZdUZih+0tg==
X-CSE-MsgGUID: /IyywgYtRMq8bdbaQky+FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="125839079"
Received: from tmilea-mobl3.ger.corp.intel.com (HELO [10.245.115.15])
 ([10.245.115.15])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 01:23:58 -0700
Message-ID: <a4365e8a-093d-488c-be79-6eda6b29ddde@linux.intel.com>
Date: Fri, 28 Mar 2025 09:23:57 +0100
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
 <17c82a42-2174-425f-a4c4-4df18176f7a1@linux.intel.com>
 <40a4d432-aa18-6a60-adcc-e73eb3c7fcb7@amd.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <40a4d432-aa18-6a60-adcc-e73eb3c7fcb7@amd.com>
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



On 3/27/2025 6:38 PM, Lizhi Hou wrote:
> 
> On 3/26/25 01:06, Jacek Lawrynowicz wrote:
>> Hi,
>>
>> On 3/25/2025 9:50 PM, Lizhi Hou wrote:
>>> On 3/25/25 04:43, Maciej Falkowski wrote:
>>>> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>>>
>>>> Fix deadlock in ivpu_ms_cleanup() by preventing runtime resume after
>>>> file_priv->ms_lock is acquired.
>>>>
>>>> During a failure in runtime resume, a cold boot is executed, which
>>>> calls ivpu_ms_cleanup_all(). This function calls ivpu_ms_cleanup()
>>>> that acquires file_priv->ms_lock and causes the deadlock.
>>>>
>>>> Fixes: cdfad4db7756 ("accel/ivpu: Add NPU profiling support")
>>>> Cc: <stable@vger.kernel.org> # v6.11+
>>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>>>> ---
>>>>    drivers/accel/ivpu/ivpu_ms.c | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/accel/ivpu/ivpu_ms.c b/drivers/accel/ivpu/ivpu_ms.c
>>>> index ffe7b10f8a76..eb485cf15ad6 100644
>>>> --- a/drivers/accel/ivpu/ivpu_ms.c
>>>> +++ b/drivers/accel/ivpu/ivpu_ms.c
>>>> @@ -4,6 +4,7 @@
>>>>     */
>>>>      #include <drm/drm_file.h>
>>>> +#include <linux/pm_runtime.h>
>>>>      #include "ivpu_drv.h"
>>>>    #include "ivpu_gem.h"
>>>> @@ -281,6 +282,9 @@ int ivpu_ms_get_info_ioctl(struct drm_device *dev, void *data, struct drm_file *
>>>>    void ivpu_ms_cleanup(struct ivpu_file_priv *file_priv)
>>>>    {
>>>>        struct ivpu_ms_instance *ms, *tmp;
>>>> +    struct ivpu_device *vdev = file_priv->vdev;
>>>> +
>>>> +    pm_runtime_get_sync(vdev->drm.dev);
>>> Could get_sync() be failed here? Maybe it is better to add warning for failure?
>> Yes, this could fail but we already have detailed warnings in runtime resume callback (ivpu_pm_runtime_resume_cb()).
> 
> Will the deadlock still happens if this function fails?

No. The deadlock was caused by runtime resume in free_instance().
pm_runtime_get_sync() will always bump PM usage counter, so there will be no resume regardless if it fails or not.

>>>>          mutex_lock(&file_priv->ms_lock);
>>>>    @@ -293,6 +297,8 @@ void ivpu_ms_cleanup(struct ivpu_file_priv *file_priv)
>>>>            free_instance(file_priv, ms);
>>>>          mutex_unlock(&file_priv->ms_lock);
>>>> +
>>>> +    pm_runtime_put_autosuspend(vdev->drm.dev);
>>>>    }
>>>>      void ivpu_ms_cleanup_all(struct ivpu_device *vdev)
>> Regards,
>> Jacek
>>

