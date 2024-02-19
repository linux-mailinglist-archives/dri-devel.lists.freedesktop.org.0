Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E8C85A400
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 14:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C2910E3AB;
	Mon, 19 Feb 2024 13:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hNvVP5eJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984D810E39F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 13:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5qNukvwI5J+WhJcjMJnY/X5lVkB1aXkjZTCK9IXiajE=; b=hNvVP5eJPkhd/NFull+TE5ZHls
 ZoctWHrrczVTZEthc2CGYOETZVx2CmEeZi/3Ll3BHPdEPyc5EPdFD32CAkr8XYmJvQzUVTaQuZzRL
 aXiFQ26ngXGdNBTDyEqOahv2hSNqg9uznn1De/uV4qEUmwF2UYBTG1l39eK2LCa4AtOKevRbj40SL
 pqKOei8NiBcwd4wrwEfPJUHJQdsfHpCFXkY3ZIhS/HzTFJXjq82E3JZe3WuzMHZgiy+7u3w2KxG3U
 jT9yoBxIgLA4cwmOBE5Ck5Xue94oHT/0ei342/fUfVBE/6Ms8RwY7PAIljUE3nN2p5Sx+dTketO4T
 fjgX3Hng==;
Received: from [179.234.233.159] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rc3Fm-001GgM-Ki; Mon, 19 Feb 2024 14:00:14 +0100
Message-ID: <4b77a870-8598-4d11-b14f-9144e84a6679@igalia.com>
Date: Mon, 19 Feb 2024 10:00:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Enable V3D to use different PAGE_SIZE
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Phil Elwell <phil@raspberrypi.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240214193503.164462-1-mcanal@igalia.com>
 <66cfdb02177a5ba6419b13163df44f5c8f967232.camel@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <66cfdb02177a5ba6419b13163df44f5c8f967232.camel@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Iago,

On 2/19/24 09:56, Iago Toral wrote:
> Hi Maíra,
> 
> El mié, 14-02-2024 a las 16:34 -0300, Maíra Canal escribió:
>> Currently, the V3D driver uses PAGE_SHIFT over the assumption that
>> PAGE_SHIFT = 12, as the PAGE_SIZE = 4KB. But, the RPi 5 is using
>> PAGE_SIZE = 16KB, so the MMU PAGE_SHIFT is different than the
>> system's
>> PAGE_SHIFT.
>>
>> Enable V3D to be used in system's with any PAGE_SIZE by making sure
>> that
>> everything MMU-related uses the MMU page shift.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_bo.c      | 12 ++++++------
>>   drivers/gpu/drm/v3d/v3d_debugfs.c |  2 +-
>>   drivers/gpu/drm/v3d/v3d_drv.h     |  2 ++
>>   drivers/gpu/drm/v3d/v3d_irq.c     |  2 +-
>>   drivers/gpu/drm/v3d/v3d_mmu.c     |  2 --
>>   5 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c
>> b/drivers/gpu/drm/v3d/v3d_bo.c
>> index 1bdfac8beafd..a07ede668cc1 100644
>> --- a/drivers/gpu/drm/v3d/v3d_bo.c
>> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> 
> I think we need the same change in v3d_get_bo_vaddr, no?

No, that one uses the PAGE_SHIFT of the CPU, because obj->pages is in
the CPU.

Best Regards,
- Maíra

> 
> Iago
> 
>> @@ -40,7 +40,7 @@ void v3d_free_object(struct drm_gem_object *obj)
>>
>>   	mutex_lock(&v3d->bo_lock);
>>   	v3d->bo_stats.num_allocated--;
>> -	v3d->bo_stats.pages_allocated -= obj->size >> PAGE_SHIFT;
>> +	v3d->bo_stats.pages_allocated -= obj->size >>
>> V3D_MMU_PAGE_SHIFT;
>>   	mutex_unlock(&v3d->bo_lock);
>>
>>   	spin_lock(&v3d->mm_lock);
>> @@ -109,8 +109,8 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
>>   	 * lifetime of the BO.
>>   	 */
>>   	ret = drm_mm_insert_node_generic(&v3d->mm, &bo->node,
>> -					 obj->size >> PAGE_SHIFT,
>> -					 GMP_GRANULARITY >>
>> PAGE_SHIFT, 0, 0);
>> +					 obj->size >>
>> V3D_MMU_PAGE_SHIFT,
>> +					 GMP_GRANULARITY >>
>> V3D_MMU_PAGE_SHIFT, 0, 0);
>>   	spin_unlock(&v3d->mm_lock);
>>   	if (ret)
>>   		return ret;
>> @@ -118,7 +118,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
>>   	/* Track stats for /debug/dri/n/bo_stats. */
>>   	mutex_lock(&v3d->bo_lock);
>>   	v3d->bo_stats.num_allocated++;
>> -	v3d->bo_stats.pages_allocated += obj->size >> PAGE_SHIFT;
>> +	v3d->bo_stats.pages_allocated += obj->size >>
>> V3D_MMU_PAGE_SHIFT;
>>   	mutex_unlock(&v3d->bo_lock);
>>
>>   	v3d_mmu_insert_ptes(bo);
>> @@ -201,7 +201,7 @@ int v3d_create_bo_ioctl(struct drm_device *dev,
>> void *data,
>>   	if (IS_ERR(bo))
>>   		return PTR_ERR(bo);
>>
>> -	args->offset = bo->node.start << PAGE_SHIFT;
>> +	args->offset = bo->node.start << V3D_MMU_PAGE_SHIFT;
>>
>>   	ret = drm_gem_handle_create(file_priv, &bo->base.base,
>> &args->handle);
>>   	drm_gem_object_put(&bo->base.base);
>> @@ -246,7 +246,7 @@ int v3d_get_bo_offset_ioctl(struct drm_device
>> *dev, void *data,
>>   	}
>>   	bo = to_v3d_bo(gem_obj);
>>
>> -	args->offset = bo->node.start << PAGE_SHIFT;
>> +	args->offset = bo->node.start << V3D_MMU_PAGE_SHIFT;
>>
>>   	drm_gem_object_put(gem_obj);
>>   	return 0;
>> diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c
>> b/drivers/gpu/drm/v3d/v3d_debugfs.c
>> index dc3cf708d02e..19e3ee7ac897 100644
>> --- a/drivers/gpu/drm/v3d/v3d_debugfs.c
>> +++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
>> @@ -219,7 +219,7 @@ static int v3d_debugfs_bo_stats(struct seq_file
>> *m, void *unused)
>>   	seq_printf(m, "allocated bos:          %d\n",
>>   		   v3d->bo_stats.num_allocated);
>>   	seq_printf(m, "allocated bo size (kb): %ld\n",
>> -		   (long)v3d->bo_stats.pages_allocated <<
>> (PAGE_SHIFT - 10));
>> +		   (long)v3d->bo_stats.pages_allocated <<
>> (V3D_MMU_PAGE_SHIFT - 10));
>>   	mutex_unlock(&v3d->bo_lock);
>>
>>   	return 0;
>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h
>> b/drivers/gpu/drm/v3d/v3d_drv.h
>> index 3c7d58866570..1950c723dde1 100644
>> --- a/drivers/gpu/drm/v3d/v3d_drv.h
>> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
>> @@ -19,6 +19,8 @@ struct reset_control;
>>
>>   #define GMP_GRANULARITY (128 * 1024)
>>
>> +#define V3D_MMU_PAGE_SHIFT 12
>> +
>>   #define V3D_MAX_QUEUES (V3D_CPU + 1)
>>
>>   static inline char *v3d_queue_to_string(enum v3d_queue queue)
>> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c
>> b/drivers/gpu/drm/v3d/v3d_irq.c
>> index afc76390a197..2e04f6cb661e 100644
>> --- a/drivers/gpu/drm/v3d/v3d_irq.c
>> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
>> @@ -70,7 +70,7 @@ v3d_overflow_mem_work(struct work_struct *work)
>>   	list_add_tail(&bo->unref_head, &v3d->bin_job->render-
>>> unref_list);
>>   	spin_unlock_irqrestore(&v3d->job_lock, irqflags);
>>
>> -	V3D_CORE_WRITE(0, V3D_PTB_BPOA, bo->node.start <<
>> PAGE_SHIFT);
>> +	V3D_CORE_WRITE(0, V3D_PTB_BPOA, bo->node.start <<
>> V3D_MMU_PAGE_SHIFT);
>>   	V3D_CORE_WRITE(0, V3D_PTB_BPOS, obj->size);
>>
>>   out:
>> diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c
>> b/drivers/gpu/drm/v3d/v3d_mmu.c
>> index 5a453532901f..14f3af40d6f6 100644
>> --- a/drivers/gpu/drm/v3d/v3d_mmu.c
>> +++ b/drivers/gpu/drm/v3d/v3d_mmu.c
>> @@ -21,8 +21,6 @@
>>   #include "v3d_drv.h"
>>   #include "v3d_regs.h"
>>
>> -#define V3D_MMU_PAGE_SHIFT 12
>> -
>>   /* Note: All PTEs for the 1MB superpage must be filled with the
>>    * superpage bit set.
>>    */
>> --
>> 2.43.0
>>
>>
> 
