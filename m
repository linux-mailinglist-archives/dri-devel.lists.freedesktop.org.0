Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE32A720B4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 22:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9BB10E1EE;
	Wed, 26 Mar 2025 21:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="CxmClNSo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1E110E1EE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 21:22:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743024131; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cKzydkRwzMML0dFq1QwWo5mQNbZH7VKmBO/9x0obrGaaqlKTxTfpQWBaxhzyTQNyxQurq0bY+4UN76LBfWzTWfr3szrdOHs+6GD5bC0SBWAA6mxezPyIbXqUQrJKGsmxzRr9+zRPVyiRPQYH/hSkdn9Mgbv/+1h2eWRbUtB9IZo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743024131;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ecdKAuG2jRLDCxv2+1xMrN3chSJ5mRsZ4WrWxiAqDz0=; 
 b=hg8Ir5I25FcAhMyEOjMxGkOUqKyvYw/IO2O69oQvrIRMeiYrHaQOZfWgLOyQbKt1by6nDdt97go71rjR1rxuP23N/Zyu+iysixsh3oulawHYX2MDi69tP0ETaQqfVI3Q2PQm9ECi9tTHiZVC+HzW6aH++FTVlWLqDfsfXauyXsE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743024131; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ecdKAuG2jRLDCxv2+1xMrN3chSJ5mRsZ4WrWxiAqDz0=;
 b=CxmClNSoR3Tqzf4TsrB5KFoxW3PVVMC1K7v0e0ukHkU6vZZnLIJgMsbawsm2Wv4W
 BoORolC9pcQ3OQmRff6KFkq3fmCnfaYdvVV0vUR/ag8kKDZ8TK6RrcIWct1hFqc0fRh
 VV2RFilOukxF3bjQGyr2KYHdT7wADTFH2fk9K0+s=
Received: by mx.zohomail.com with SMTPS id 1743024129011797.9257975691486;
 Wed, 26 Mar 2025 14:22:09 -0700 (PDT)
Message-ID: <ccf6daba-aa12-4ef1-aa90-3cc36a8ba4a7@collabora.com>
Date: Thu, 27 Mar 2025 00:22:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Fix flickering issue seen with imported
 dmabufs
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20250325201021.1315080-1-vivek.kasireddy@intel.com>
 <314238f1-9c89-4dab-a338-a40765076fd9@collabora.com>
 <IA0PR11MB7185CD8F060130F041A5A209F8A62@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <IA0PR11MB7185CD8F060130F041A5A209F8A62@IA0PR11MB7185.namprd11.prod.outlook.com>
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

On 3/26/25 08:13, Kasireddy, Vivek wrote:
>> Subject: Re: [PATCH] drm/virtio: Fix flickering issue seen with imported
>> dmabufs
>>
>> On 3/25/25 23:10, Vivek Kasireddy wrote:
>>> We need to save the reservation object pointer associated with the
>>> imported dmabuf in the newly created GEM object to allow
>>> drm_gem_plane_helper_prepare_fb() to extract the exclusive fence
>>> from it and attach it to the plane state during prepare phase.
>>> This is needed to ensure that drm_atomic_helper_wait_for_fences()
>>> correctly waits for the relevant fences (move, etc) associated with
>>> the reservation object, thereby implementing proper synchronization.
>>>
>>> Otherwise, artifacts or slight flickering can be seen when apps
>>> are dragged across the screen when running Gnome (Wayland). This
>>> problem is mostly seen with dGPUs in the case where the FBs are
>>> allocated in VRAM but need to be migrated to System RAM as they
>>> are shared with virtio-gpu.
>>>
>>> Fixes: ca77f27a2665 ("drm/virtio: Import prime buffers from other devices as
>> guest blobs")
>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
>>> Cc: Chia-I Wu <olvaffe@gmail.com>
>>> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>>> ---
>>>  drivers/gpu/drm/virtio/virtgpu_prime.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c
>> b/drivers/gpu/drm/virtio/virtgpu_prime.c
>>> index fe6a0b018571..ceb0401a000b 100644
>>> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
>>> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
>>> @@ -332,6 +332,7 @@ struct drm_gem_object
>> *virtgpu_gem_prime_import(struct drm_device *dev,
>>>  	}
>>>
>>>  	obj->import_attach = attach;
>>> +	obj->resv = buf->resv;
>>>  	get_dma_buf(buf);
>>>
>>>  	ret = virtgpu_dma_buf_init_obj(dev, bo, attach);
>>
>> Will be better to set obj->resv before drm_gem_private_object_init()
>> since it checks whether obj->resv was pre-inited. I'll change it while
>> applying, thanks.
> Sounds good. Thank you Dmitry!

Applied to misc-fixes, thanks!

Will keep an eye on the patch status in the misc. Too early to apply now
to misc-fixes, I rushed a bit by accident.

-- 
Best regards,
Dmitry
