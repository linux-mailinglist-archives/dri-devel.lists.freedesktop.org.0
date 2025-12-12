Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBE4CB8E30
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 14:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF66F10E35F;
	Fri, 12 Dec 2025 13:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RzkblH/1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E45010E72A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 13:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765545685; x=1797081685;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sYua/rYNh25DKcJ+3pQtTJfl1kvjZmt5EtEa/b0ggnM=;
 b=RzkblH/1tghPt0bTgnqpZO9LqF9ooyCRSD96eKqHwG1d43AUqZRndpOe
 JIAOhy6UgiUEgZhoauOT8sfjahHPoaPxErcv/IB3sGnU90Owsq74N1SLT
 DKsPUX70nOy61cB2GldkL0jzOaofaywrmlJq3BcaWrBj6to1GkwLimljq
 uPnfHperEkWPRF5mp6TRmT38CLdmjy4miZw5JJ2kyD4ZPCk0LpoKKsdd2
 WC36otuOn3TD1f9GPURtBVDxX65CKpLYG3+Jxl+VWbJwG8CxeC++iVT33
 1GCFZKlBau7j6bDMyC6XYLnwlX+ZiJ0WFUYz8hVsq29oDUPGUVJs1dNtG Q==;
X-CSE-ConnectionGUID: FJwcrNb2RZeJ0BFll/Ew2g==
X-CSE-MsgGUID: 1XqZfpfXSde9w6DYwsniRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67621158"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="67621158"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 05:21:24 -0800
X-CSE-ConnectionGUID: k9kxDZGYSWCemWaxESp70g==
X-CSE-MsgGUID: Vlnmw+c2QgGJaB+YOy7nuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="202009148"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.94.253.106])
 ([10.94.253.106])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 05:21:21 -0800
Message-ID: <1022011b-fadf-4cca-afab-25a2a41628ea@linux.intel.com>
Date: Fri, 12 Dec 2025 14:21:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Fix object leak in DRM_IOCTL_GEM_CHANGE_HANDLE
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David.Francis@amd.com
Cc: felix.kuehling@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 sumit.semwal@linaro.org, andrzej.kacprowski@linux.intel.com,
 maciej.falkowski@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org
References: <20251212130238.472833-1-karol.wachowski@linux.intel.com>
 <e35a9c5d-a09c-4716-959b-2720c72bf383@amd.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <e35a9c5d-a09c-4716-959b-2720c72bf383@amd.com>
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

On 12/12/2025 2:06 PM, Christian König wrote:
> On 12/12/25 14:02, Karol Wachowski wrote:
>> Add missing drm_gem_object_put() call when drm_gem_object_lookup()
>> successfully returns an object. This fixes a GEM object reference
>> leak that can prevent driver modules from unloading when using
>> prime buffers.
> 
> Good catch.
> 
>> Fixes: 53096728b891 ("drm: Add DRM prime interface to reassign GEM handle")
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> 
> CC: stable 6.18?

Good idea - added CC: stable in v2.

> 
>> ---
>>  drivers/gpu/drm/drm_gem.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index ca1956608261..e150bc1ce65a 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -1001,7 +1001,7 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>>  {
>>  	struct drm_gem_change_handle *args = data;
>>  	struct drm_gem_object *obj;
>> -	int ret;
>> +	int ret = 0;
> 
> Please set ret explicitly in the if branch below.
> 
> Always initializing return values is usually considered bad coding style.

Totally agree, moved setting to suggested place in v2.

> 
> Apart from that looks good to me.
> 
> Thanks,
> Christian.

Thanks,
Karol.>
>>  
>>  	if (!drm_core_check_feature(dev, DRIVER_GEM))
>>  		return -EOPNOTSUPP;
>> @@ -1011,7 +1011,7 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>>  		return -ENOENT;
>>  
>>  	if (args->handle == args->new_handle)
>> -		return 0;
>> +		goto out;
>>  
>>  	mutex_lock(&file_priv->prime.lock);
>>  
>> @@ -1043,6 +1043,8 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>>  
>>  out_unlock:
>>  	mutex_unlock(&file_priv->prime.lock);
>> +out:
>> +	drm_gem_object_put(obj);
>>  
>>  	return ret;
>>  }
> 

