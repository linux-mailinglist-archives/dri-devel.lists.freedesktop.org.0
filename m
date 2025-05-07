Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF89AADED1
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 14:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4CD10E78A;
	Wed,  7 May 2025 12:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="CalMWjbE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DBA10E79B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 12:18:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1746620286; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KtTHTt1Tjx7DRmxnUa9DJHsNAEMmV461KJtLIp8tKBOc4i5L/JXgNwgIn4g0iXQkpS1GX7cSbvrWaJENuOlQZi8G4MsT8kWJOtKPwLDHEXnVDv/PTWjYKqZc8x9R4P5ftVpbYE5Gq7Lage4Nvaa9YTU99sJHHefE6QncryCKx2g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1746620286;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=nZ7VTUUkmW3UEk+ji4BAHEasrORLr0NrzBoKdLXASRo=; 
 b=HFxz19i0bshOjnSTzZih/URhXWJ/4+pjSQrrS565sSf4rUL2W0e7Opvee+sn0EMC/7a2AHldIIiLKKCYpTnQA/rPzOJR64rStQuJTYJGe/39Znd2cP08j92o8Y5OxZDthNvU7vz6DQw2gtopgauSW4BbsBekWOj2NOulq1py2J8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746620286; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=nZ7VTUUkmW3UEk+ji4BAHEasrORLr0NrzBoKdLXASRo=;
 b=CalMWjbEBD6V/6fivu+afK14IPeSN9qjWclnu+r1Ke4Thcfnaf06l0V26R1DKDrx
 s9vc55TEUOv/zi+Mw7MbclZOmrIusONGfuTUgilhJNkQTEbrnEuHj8x8NKjijfHjuMS
 wZheagKjM4feZMKMQQ6JLKEqtk3/N8Wt8QEi9Lbg=
Received: by mx.zohomail.com with SMTPS id 17466202814781023.8071911712406;
 Wed, 7 May 2025 05:18:01 -0700 (PDT)
Message-ID: <bfb05572-7596-40b9-b12d-a501f7c62689@collabora.com>
Date: Wed, 7 May 2025 15:17:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Fix NULL pointer deref in
 virtgpu_dma_buf_free_obj()
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
References: <20250501232419.180337-1-vivek.kasireddy@intel.com>
 <ba724d8e-f2e2-49e7-88ac-4b0ae5b49e4d@collabora.com>
 <IA0PR11MB718590309CEFD76B9B9D35D3F888A@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <IA0PR11MB718590309CEFD76B9B9D35D3F888A@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 5/7/25 05:51, Kasireddy, Vivek wrote:
> Hi Dmitry,
> 
>> Subject: Re: [PATCH] drm/virtio: Fix NULL pointer deref in
>> virtgpu_dma_buf_free_obj()
>>
>> On 5/2/25 02:24, Vivek Kasireddy wrote:
>>> There is a chance that obj->dma_buf would be NULL by the time
>>> virtgpu_dma_buf_free_obj() is called. This can happen for imported
>>> prime objects, when drm_gem_object_exported_dma_buf_free() gets
>> called
>>> on them before drm_gem_object_free(). This is because
>>> drm_gem_object_exported_dma_buf_free() explicitly sets
>>> obj->dma_buf to NULL.
>>>
>>> Therefore, fix this issue by storing the dma_buf pointer in the
>>> virtio_gpu_object instance and using it in virtgpu_dma_buf_free_obj.
>>> This stored pointer is guaranteed to be valid until the object is
>>> freed as we took a reference on it in virtgpu_gem_prime_import().
>>>
>>> Fixes: 415cb45895f4 ("drm/virtio: Use dma_buf from GEM object
>>> instance")
>>> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>>> ---
>>>  drivers/gpu/drm/virtio/virtgpu_drv.h   | 1 +
>>>  drivers/gpu/drm/virtio/virtgpu_prime.c | 3 ++-
>>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h
>>> b/drivers/gpu/drm/virtio/virtgpu_drv.h
>>> index f17660a71a3e..f7def8b42068 100644
>>> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
>>> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
>>> @@ -88,6 +88,7 @@ struct virtio_gpu_object_params {
>>>
>>>  struct virtio_gpu_object {
>>>  	struct drm_gem_shmem_object base;
>>> +	struct dma_buf *dma_buf;
>>>  	struct sg_table *sgt;
>>>  	uint32_t hw_res_handle;
>>>  	bool dumb;
>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c
>>> b/drivers/gpu/drm/virtio/virtgpu_prime.c
>>> index 1118a0250279..722cde5e2d86 100644
>>> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
>>> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
>>> @@ -206,7 +206,7 @@ static void virtgpu_dma_buf_free_obj(struct
>> drm_gem_object *obj)
>>>  	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
>>>
>>>  	if (drm_gem_is_imported(obj)) {
>>> -		struct dma_buf *dmabuf = obj->dma_buf;
>>> +		struct dma_buf *dmabuf = bo->dma_buf;
>>
>> drm_gem_is_imported() checks whether obj->dma_buf is NULL, hence
>> drm_gem_is_imported() can't be used here too?
> Unless I am missing something, it looks like drm_gem_is_imported() does
> not seem to check obj->dma_buf:
> 
> static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
> {
>         return !!obj->import_attach;
> }

Indeed, it was changed a month ago by [1].
Then the patch looks okay, thanks. Will merge soon.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8260731ccad0451207b45844bb66eb161a209218

-- 
Best regards,
Dmitry
