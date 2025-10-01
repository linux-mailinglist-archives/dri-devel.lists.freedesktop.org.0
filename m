Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC8CBAF886
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 10:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5290610E6A9;
	Wed,  1 Oct 2025 08:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bZBJD/MI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12B610E6B0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 08:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759305790; x=1790841790;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=CvEAaXfCgVAlO8M69cQEQA3jRjY2ZkSkaUnqDSZ4Oqg=;
 b=bZBJD/MIXIOwMMG87k1HU6DE160HxyN7OKvmnlv0JjBOjFhqXc/3l0Kn
 viP57AFonmPPIlCKe42dVL0eM6Ic0FOd68aDaEyx0HtNN3SQHmd0/yIEi
 DjIkgyUJSDX0ZbxiutWmmSjCKx4exOLQs9bQblnjkwVF7UWn0AKqv0KJH
 q5QBPXXjr76nU+bBJJEjiua8lEDilcvxo7+y4s9yVqkdXWCFDNMbyEKfN
 cKv8OMU7QheLwiJlMQv4PW4VT4Pr27k1hSTYWlmhuxxtHB4K+AS+jfrXq
 x/h7YbpV18cgZlGrZODCLgnCvtXhW9Rxln2uSh5h4uEpMBjA4xjrylepc w==;
X-CSE-ConnectionGUID: fVEW7SQ9Q12N28rkpYwnrA==
X-CSE-MsgGUID: M1pu/qvVRn2btQ5nabXzWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61680311"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="61680311"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 01:03:09 -0700
X-CSE-ConnectionGUID: V1PZai7fS6ijtLI6V3XNqQ==
X-CSE-MsgGUID: LFhJgAmDT0uLSf75yTwZEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="209444060"
Received: from unknown (HELO [10.102.88.152]) ([10.102.88.152])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 01:03:07 -0700
Message-ID: <d1c3259e-d29f-4d7d-8a5b-dabd469a7c7c@linux.intel.com>
Date: Wed, 1 Oct 2025 10:03:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Fix page fault in
 ivpu_bo_unbind_all_bos_from_context()
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
References: <20250925145114.1446283-1-maciej.falkowski@linux.intel.com>
 <d01c8939-0555-4810-8995-849d33a00085@linux.intel.com>
Content-Language: en-US
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <d01c8939-0555-4810-8995-849d33a00085@linux.intel.com>
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

Applied to drm-misc-next

On 10/1/2025 9:50 AM, Karol Wachowski wrote:
> Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>
> On 9/25/2025 4:51 PM, Maciej Falkowski wrote:
>> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>
>> Don't add BO to the vdev->bo_list in ivpu_gem_create_object().
>> When failure happens inside drm_gem_shmem_create(), the BO is not
>> fully created and ivpu_gem_bo_free() callback will not be called
>> causing a deleted BO to be left on the list.
>>
>> Fixes: 8d88e4cdce4f ("accel/ivpu: Use GEM shmem helper for all buffers")
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>> ---
>>  drivers/accel/ivpu/ivpu_gem.c | 22 ++++++++++++++++------
>>  1 file changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
>> index 0cb48aff396c..38ecf933d144 100644
>> --- a/drivers/accel/ivpu/ivpu_gem.c
>> +++ b/drivers/accel/ivpu/ivpu_gem.c
>> @@ -194,7 +194,6 @@ void ivpu_bo_unbind_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_m
>>  
>>  struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t size)
>>  {
>> -	struct ivpu_device *vdev = to_ivpu_device(dev);
>>  	struct ivpu_bo *bo;
>>  
>>  	if (size == 0 || !PAGE_ALIGNED(size))
>> @@ -209,20 +208,17 @@ struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t siz
>>  
>>  	INIT_LIST_HEAD(&bo->bo_list_node);
>>  
>> -	mutex_lock(&vdev->bo_list_lock);
>> -	list_add_tail(&bo->bo_list_node, &vdev->bo_list);
>> -	mutex_unlock(&vdev->bo_list_lock);
>> -
>> -	ivpu_dbg(vdev, BO, " alloc: bo %8p size %9zu\n", bo, size);
>>  	return &bo->base.base;
>>  }
>>  
>>  struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
>>  					     struct dma_buf *dma_buf)
>>  {
>> +	struct ivpu_device *vdev = to_ivpu_device(dev);
>>  	struct device *attach_dev = dev->dev;
>>  	struct dma_buf_attachment *attach;
>>  	struct drm_gem_object *obj;
>> +	struct ivpu_bo *bo;
>>  	int ret;
>>  
>>  	attach = dma_buf_attach(dma_buf, attach_dev);
>> @@ -240,6 +236,14 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
>>  	obj->import_attach = attach;
>>  	obj->resv = dma_buf->resv;
>>  
>> +	bo = to_ivpu_bo(obj);
>> +
>> +	mutex_lock(&vdev->bo_list_lock);
>> +	list_add_tail(&bo->bo_list_node, &vdev->bo_list);
>> +	mutex_unlock(&vdev->bo_list_lock);
>> +
>> +	ivpu_dbg(vdev, BO, "import: bo %8p size %9zu\n", bo, ivpu_bo_size(bo));
>> +
>>  	return obj;
>>  
>>  fail_detach:
>> @@ -270,6 +274,12 @@ static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 fla
>>  	bo->base.map_wc = flags & DRM_IVPU_BO_WC;
>>  	bo->flags = flags;
>>  
>> +	mutex_lock(&vdev->bo_list_lock);
>> +	list_add_tail(&bo->bo_list_node, &vdev->bo_list);
>> +	mutex_unlock(&vdev->bo_list_lock);
>> +
>> +	ivpu_dbg(vdev, BO, " alloc: bo %8p size %9llu\n", bo, size);
>> +
>>  	return bo;
>>  }
>>  
