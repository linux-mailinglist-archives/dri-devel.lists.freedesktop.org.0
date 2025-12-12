Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B59CB8E98
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 14:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB6A10E5C4;
	Fri, 12 Dec 2025 13:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SpTXb8Gr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D2D10E5C4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 13:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765546956; x=1797082956;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DVad8Eg0HmNrzuHWvrIMlG/z/3SGSTg05iCBpqXLZv8=;
 b=SpTXb8Gru24t6iKVOdm99cUbcjAMdIAYyOHG7uF0oBSNl8TtevUfY/3i
 usy6ko6UqXBmsOtzXykAXpaw24cGxgXcsGFubjc5VhpUw3MjWY1dsAM2a
 V7w/r1KWyRemXX2aoTTDDEDuwjlO6M25eO3XYlr+Yf1r1jGAHxea9rsBl
 493yZwAS+iK0DvnjciZmkMttTWMpNIyNPzU8Ddqhq7KJBWjDZS8YERl//
 ZRN7Hh224dKAzQ06JJHry/P5XyGAjuGH1aqqjpInNzckdytUR0klG9WWw
 Pyex+Onrb0+4OmMmDCfOQG42bIRDutIPoBfv+MmvSVS31tP0qJiKixL4r A==;
X-CSE-ConnectionGUID: BL+nefy3SVufdlox1PrsVQ==
X-CSE-MsgGUID: QfWsUPWWT2mRObsrf0FFyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="79006086"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="79006086"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 05:42:35 -0800
X-CSE-ConnectionGUID: t0+c7T9BT5C2EjpN2VFAww==
X-CSE-MsgGUID: B6UiDZahQAyXM+lcrFX8hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="197581074"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.94.253.106])
 ([10.94.253.106])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 05:42:32 -0800
Message-ID: <bfb21cc8-3b11-435b-93a7-3215333d946e@linux.intel.com>
Date: Fri, 12 Dec 2025 14:42:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: Fix object leak in DRM_IOCTL_GEM_CHANGE_HANDLE
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David.Francis@amd.com
Cc: felix.kuehling@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 sumit.semwal@linaro.org, andrzej.kacprowski@linux.intel.com,
 maciej.falkowski@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20251212132052.474096-1-karol.wachowski@linux.intel.com>
 <ce82901a-1c65-4aaa-a092-7b67b81253d5@amd.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ce82901a-1c65-4aaa-a092-7b67b81253d5@amd.com>
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

On 12/12/2025 2:28 PM, Christian König wrote:
> On 12/12/25 14:20, Karol Wachowski wrote:
>> Add missing drm_gem_object_put() call when drm_gem_object_lookup()
>> successfully returns an object. This fixes a GEM object reference
>> leak that can prevent driver modules from unloading when using
>> prime buffers.
>>
>> Fixes: 53096728b891 ("drm: Add DRM prime interface to reassign GEM handle")
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> 
>> ---
>> Changes between v1 and v2:
>>  - move setting ret value under if branch as suggested in review
>>  - add Cc: stable 6.18+
> 
> Oh don't CC the stable list on the review mail directly, just add "CC: stable@vger.kernel.org # 6.18+" to the tags. Greg is going to complain about that :(

Oops, sorry about that. I've just sent V3 with (hopefully) correctly set
Cc: tag this time.

> With that done Reviewed-by: Christian König <christian.koenig@amd.com> and please push to drm-misc-fixes.
> 
> If you don't have commit rights for drm-misc-fixes please ping me and I'm going to push that.
> 
> Thanks,
> Christian.
> 
>> ---
>>  drivers/gpu/drm/drm_gem.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index ca1956608261..bcc08a6aebf8 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -1010,8 +1010,10 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>>  	if (!obj)
>>  		return -ENOENT;
>>  
>> -	if (args->handle == args->new_handle)
>> -		return 0;
>> +	if (args->handle == args->new_handle) {
>> +		ret = 0;
>> +		goto out;
>> +	}
>>  
>>  	mutex_lock(&file_priv->prime.lock);
>>  
>> @@ -1043,6 +1045,8 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>>  
>>  out_unlock:
>>  	mutex_unlock(&file_priv->prime.lock);
>> +out:
>> +	drm_gem_object_put(obj);
>>  
>>  	return ret;
>>  }
> 

