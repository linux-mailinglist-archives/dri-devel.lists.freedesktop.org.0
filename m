Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD103BAF8AC
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 10:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1761010E6A5;
	Wed,  1 Oct 2025 08:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A8rjK5Bs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9298410E6A5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 08:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759305932; x=1790841932;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=Rx1dTfQ2Yn3VDKsVU9XvdR2ZvFDDjA+GdU0X5OTYsM4=;
 b=A8rjK5BskIbJxiLeq5fzEIu2VqCbs8VziK7u0RrIxvRXVHuGOlZvxBY7
 pwtFl06oDyjcC7C+OrNzTeIbJD1xGkZrGdQkN19QeAdBNKm81kYyDeBbz
 E0H12jtAV61ZnhNkWwji2ZqaAMQEkElFVJfwEROG18JJSEY2sFDE6EkQZ
 P/3Ekd/81nIJU2KdDv/KkcMW1uXCIOQx3DiBycuFT//AdzwB9poSzCDrk
 wscdSvciuZya34hLD3Y4wK15U+8Y1CVU0P3ute8lV3c6Osa2a1AQcqeGv
 v/EXZh8ompS1kxdnMG1PYYw/jAjnx49zHsN98FeQ7QF7/5aipZ3mtu1zr g==;
X-CSE-ConnectionGUID: h8XFq9gARvKks1NdoKYAhg==
X-CSE-MsgGUID: YSpNHJ9NSVeKwkB+U7eSmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72186983"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="72186983"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 01:05:32 -0700
X-CSE-ConnectionGUID: Qkg5/6YfQC2JKXQVWBydLQ==
X-CSE-MsgGUID: gQKsRuwrR+WDhGVbPAksjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="177857162"
Received: from unknown (HELO [10.102.88.152]) ([10.102.88.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 01:05:30 -0700
Message-ID: <c233f445-45fb-48a8-8106-6c836504cef8@linux.intel.com>
Date: Wed, 1 Oct 2025 10:05:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Improve BO alloc/free warnings
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
References: <20250925145154.1446427-1-maciej.falkowski@linux.intel.com>
 <3fa5c368-726e-42f7-9900-cdbe3189a57c@linux.intel.com>
Content-Language: en-US
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <3fa5c368-726e-42f7-9900-cdbe3189a57c@linux.intel.com>
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

On 10/1/2025 9:51 AM, Karol Wachowski wrote:
> Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>
> On 9/25/2025 4:51 PM, Maciej Falkowski wrote:
>> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>
>> Add additional warnings related to allocation and
>> deallocation of buffer objects to better track possible
>> memory leaks and generally the BO's lifecycle.
>>
>> Introduce checks for handle_count to ensure it is zero
>> before creating a new handle, and exactly one
>> after successfully creating a handle.
>>
>> Introduce also a check to warn if the VMA node is not
>> empty when freeing the buffer object.
>>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>> ---
>>  drivers/accel/ivpu/ivpu_gem.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
>> index 38ecf933d144..e9830ad48d4b 100644
>> --- a/drivers/accel/ivpu/ivpu_gem.c
>> +++ b/drivers/accel/ivpu/ivpu_gem.c
>> @@ -332,6 +332,7 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
>>  	drm_WARN_ON(&vdev->drm, bo->ctx);
>>  
>>  	drm_WARN_ON(obj->dev, refcount_read(&bo->base.pages_use_count) > 1);
>> +	drm_WARN_ON(obj->dev, bo->base.base.vma_node.vm_files.rb_node);
>>  	drm_gem_shmem_free(&bo->base);
>>  }
>>  
>> @@ -370,12 +371,16 @@ int ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
>>  		return PTR_ERR(bo);
>>  	}
>>  
>> +	drm_WARN_ON(&vdev->drm, bo->base.base.handle_count != 0);
>> +
>>  	ret = drm_gem_handle_create(file, &bo->base.base, &args->handle);
>> -	if (ret)
>> +	if (ret) {
>>  		ivpu_err(vdev, "Failed to create handle for BO: %pe (ctx %u size %llu flags 0x%x)",
>>  			 bo, file_priv->ctx.id, args->size, args->flags);
>> -	else
>> +	} else {
>>  		args->vpu_addr = bo->vpu_addr;
>> +		drm_WARN_ON(&vdev->drm, bo->base.base.handle_count != 1);
>> +	}
>>  
>>  	drm_gem_object_put(&bo->base.base);
>>  
