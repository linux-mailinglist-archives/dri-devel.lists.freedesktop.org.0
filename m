Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF5FAC6EAE
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 19:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1640710E670;
	Wed, 28 May 2025 17:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EjSr4hRO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB3710E6AD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 17:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748451882; x=1779987882;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5EtuRLonphyCCnc+QgxsWcjVjIo63t4LM9wqQ2viGwk=;
 b=EjSr4hROg2yQJvPJ+NSdJjmiZsozS38YOauBkzeNbHOI3MlG46sujzGk
 QtTx/b5GrvUwBzFarcvxsGu3NtSKePuQ3mC2EPhnh+YXFYdAOm/PF6qak
 C0+qUhYY8VJJ7podDBl5A8jjvVsqJ8YWPT7gV3sBI05/JuJKfE6W93PK4
 RuKiUZ2cJVnEDunWzJ/ZM0JgmTuXxbMHfOGvB2CbbqI1i8DA3yLIDzQuU
 3uRM9K1PHPIU3v3/RBnGH8zYgjeRBebvYrxpX2MuKHzkQMAJvBsBn1DY9
 7dWCemDiYocyaS57dgY4+NRoafPnppA9qgyShyw6kHkbwZIEVw+IGmMjJ g==;
X-CSE-ConnectionGUID: k0991AjHRwqt4NiNXssV5Q==
X-CSE-MsgGUID: BGW0YS9kRQG7jdkuq5LHmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="49736911"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="49736911"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 10:04:41 -0700
X-CSE-ConnectionGUID: tKyUjOaZTjiRp1cnt/rs+w==
X-CSE-MsgGUID: 6ejF+RmdRM2Inh925j6rDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="148600786"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO [10.245.252.12])
 ([10.245.252.12])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 10:04:41 -0700
Message-ID: <64bc9a8d-a358-4f96-8721-970a8363961c@linux.intel.com>
Date: Wed, 28 May 2025 19:04:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Fix warning in ivpu_gem_bo_free()
To: Lizhi Hou <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, stable@vger.kernel.org
References: <20250528154225.500394-1-jacek.lawrynowicz@linux.intel.com>
 <f2cc768c-3daa-3219-a0e4-703cee8abd78@amd.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <f2cc768c-3daa-3219-a0e4-703cee8abd78@amd.com>
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

On 5/28/2025 6:33 PM, Lizhi Hou wrote:
> On 5/28/25 08:42, Jacek Lawrynowicz wrote:
>> Don't WARN if imported buffers are in use in ivpu_gem_bo_free() as they
>> can be indeed used in the original context/driver.
>>
>> Fixes: 647371a6609d ("accel/ivpu: Add GEM buffer object management")
>> Cc: <stable@vger.kernel.org> # v6.3
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_gem.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
>> index 5908268ca45e9..0371a8b4a474f 100644
>> --- a/drivers/accel/ivpu/ivpu_gem.c
>> +++ b/drivers/accel/ivpu/ivpu_gem.c
>> @@ -285,7 +285,8 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
>>       list_del(&bo->bo_list_node);
>>       mutex_unlock(&vdev->bo_list_lock);
>>   -    drm_WARN_ON(&vdev->drm, !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
>> +    drm_WARN_ON(&vdev->drm, !bo->base.base.import_attach &&
>> +            !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
> 
> Probably drm_gem_is_imported()?

Yep, I will send v2.

