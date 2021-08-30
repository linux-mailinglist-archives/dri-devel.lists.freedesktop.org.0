Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9523FBDD8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 23:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8310989F63;
	Mon, 30 Aug 2021 21:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2275089C0A;
 Mon, 30 Aug 2021 21:04:15 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so403377pjr.1; 
 Mon, 30 Aug 2021 14:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=DR2Bm1R7YKSILao3MIz9gdsriioL6L4Hdgm+Hq95yfk=;
 b=ah+4CA5h+kOwFd9qrEibSKfYAPfYPA83e3z19xKkl0kEPGZHX9BjvNNIlNCmuCTkXX
 OmMkgnLYCbXJFPMl/uNwnZ7tGJd9XFnyVK5rD+PPYOjgk9EhpGul2WjEs/kNX+h2CQix
 bDevhwEQZAchriHqTe8K2o7x4pbEeMPBILP1vLOOSXFb8wGKzXjRJHqqB591CppFPJpS
 7k7ACVFs9omrP3aTjkTx3K4LwCNocbanA6eC7hRPlw0/8xD6o2t3uJnBfKBeXbGJ1cEL
 JvjGWRXh76BC39zDasi/DXiNmZwP/TCyXDbjekiUeEikZJrcl1u3AKpJbERDh9fuopj6
 /92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DR2Bm1R7YKSILao3MIz9gdsriioL6L4Hdgm+Hq95yfk=;
 b=SbyH7l51rXlSYilfOvipZmX6oB4YDdunIbTTmdSjJczhxSE+s1G7P4a8fiAfQBQgkm
 P9BLYZDU3+FbI8jc7rZCbrjQFpZSbEtn2DGcjFIJKoTuKBmCzrCQko0SbAK7HkirxG39
 iodcJO4ikSa4rW8hp7SZMFCrR+QBtHiScioA2iuhFhFZMu6aLfCJsbEX3iw1jzEAXHE9
 tTAM+/1QzQWxOlWFFPcfzMPP5xgDg0lq/h0taXLq8Xl494hgpE9GbxK1U9TVvbUuxoza
 9/aVvFaoJedaj/hbd0Ktozgvwvg6CzFySnf+83g6ZJMCVnfq2V0FrJvrQVqWioUnZEvq
 GIlw==
X-Gm-Message-State: AOAM531+BvrdXUqNyL8bjx+2tYWpQOJN/Xqalr4+QMmHvCl8L9aU7RkN
 i+Kfs7cxmqfU9m+35GrxDXU=
X-Google-Smtp-Source: ABdhPJyRz3j8yhGjQruBYt5HogHLyYwlaJCVaG/s7Dn3Fl+divZ4zxqIxw55Rs0lx0A5X/d1yV/xyQ==
X-Received: by 2002:a17:902:9682:b0:138:e2f9:720d with SMTP id
 n2-20020a170902968200b00138e2f9720dmr1366038plp.57.1630357454505; 
 Mon, 30 Aug 2021 14:04:14 -0700 (PDT)
Received: from [10.80.16.166] ([103.137.210.137])
 by smtp.gmail.com with ESMTPSA id w4sm362753pjj.15.2021.08.30.14.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:04:13 -0700 (PDT)
Subject: Re: [PATCH v8 3/7] drm: lock drm_global_mutex earlier in the ioctl
 handler
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
 matthew.auld@intel.com, dan.carpenter@oracle.com, tvrtko.ursulin@intel.com,
 matthew.d.roper@intel.com, lucas.demarchi@intel.com, karthik.b.s@intel.com,
 jose.souza@intel.com, manasi.d.navare@intel.com, airlied@redhat.com,
 aditya.swarup@intel.com, andrescj@chromium.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
 <20210826020122.1488002-4-desmondcheongzx@gmail.com>
 <YSdltHVQnIr+vkTn@phenom.ffwll.local>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <c9e08f10-035f-63dd-698c-faa93c935cd6@gmail.com>
Date: Tue, 31 Aug 2021 05:04:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSdltHVQnIr+vkTn@phenom.ffwll.local>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
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

On 26/8/21 5:58 pm, Daniel Vetter wrote:
> On Thu, Aug 26, 2021 at 10:01:18AM +0800, Desmond Cheong Zhi Xi wrote:
>> In a future patch, a read lock on drm_device.master_rwsem is
>> held in the ioctl handler before the check for ioctl
>> permissions. However, this inverts the lock hierarchy of
>> drm_global_mutex --> master_rwsem.
>>
>> To avoid this, we do some prep work to grab the drm_global_mutex
>> before checking for ioctl permissions.
>>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> ---
>>   drivers/gpu/drm/drm_ioctl.c | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>> index d25713b09b80..158629d88319 100644
>> --- a/drivers/gpu/drm/drm_ioctl.c
>> +++ b/drivers/gpu/drm/drm_ioctl.c
>> @@ -772,19 +772,19 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
>>   	if (drm_dev_is_unplugged(dev))
>>   		return -ENODEV;
>>   
>> +	/* Enforce sane locking for modern driver ioctls. */
>> +	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))
> 
> Maybe have a local bool locked_ioctl for this so it's extremely clear it's
> the same condition in both?
> 
> Either way: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 

Thanks for the suggestion and review. Sounds good, I'll update and send 
out a new version.

(Sorry for delays, been busy with moving)

>> +		mutex_lock(&drm_global_mutex);
>> +
>>   	retcode = drm_ioctl_permit(flags, file_priv);
>>   	if (unlikely(retcode))
>> -		return retcode;
>> +		goto out;
>>   
>> -	/* Enforce sane locking for modern driver ioctls. */
>> -	if (likely(!drm_core_check_feature(dev, DRIVER_LEGACY)) ||
>> -	    (flags & DRM_UNLOCKED))
>> -		retcode = func(dev, kdata, file_priv);
>> -	else {
>> -		mutex_lock(&drm_global_mutex);
>> -		retcode = func(dev, kdata, file_priv);
>> +	retcode = func(dev, kdata, file_priv);
>> +
>> +out:
>> +	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))
>>   		mutex_unlock(&drm_global_mutex);
>> -	}
>>   	return retcode;
>>   }
>>   EXPORT_SYMBOL(drm_ioctl_kernel);
>> -- 
>> 2.25.1
>>
> 

