Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62D3BBF996
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 23:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1F410E133;
	Mon,  6 Oct 2025 21:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="KFYSjOjI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E0610E133
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 21:46:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759787161; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ay0t1l9JfgIaawXIxQw1dROat1r2NMtghzBfipE5sB87NVh2eADNaVt5/R+G0sACKoxdGMyqC+nEsum8GYgCa0+ukHbyJSnABeGFlgqY0jQiaRmz+M6BYZfYlpvP37lp7RLIAlZ56jUGep1fqQjDUi5fCBmzLm3yvtYQ96nVaN0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759787161;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2gaJe6SKSeZfX6MubIGKK6GSgb4FoNa0aGAlBeaOd9U=; 
 b=Z+lYwpbH86eL3r+XGMK88p/IIuaGvfyjwraJaoXcDKsK6Gacqh8InRMyF3Vh2rVm5A6brC5TY5GkWHhazlXXhMveam9Q2h22OU9RDilwg5kxD3w+IHnmJOVnHY4QQzn21utcqlBSA2Qzy36Hz+Wqv6LbENu7ypyPvcMPPmss44w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759787161; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=2gaJe6SKSeZfX6MubIGKK6GSgb4FoNa0aGAlBeaOd9U=;
 b=KFYSjOjIhIlBgriRyhAAlK9Q00qsYg1Fzi2BhDAQkJH/buQYRlWyjgqBAgfXZ5rJ
 bnt4Ol0k5Fn2gobHdZgJBxhWKA16rUWjjGMeWl0J9qZl/zf/8vffJge2v+q98WIvGZg
 X/lDVnOlinTvsUtAh/76rL9DRJbrpJDaGA8NYvqA=
Received: by mx.zohomail.com with SMTPS id 175978715775463.74686780919694;
 Mon, 6 Oct 2025 14:45:57 -0700 (PDT)
Message-ID: <11358030-ec48-4e07-b056-d5be29a38707@collabora.com>
Date: Tue, 7 Oct 2025 00:45:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
To: "Kim, Dongwon" <dongwon.kim@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "nirmoyd@nvidia.com" <nirmoyd@nvidia.com>
References: <20251003053402.732218-1-dongwon.kim@intel.com>
 <20251003053402.732218-3-dongwon.kim@intel.com>
 <059d3074-dc1f-47cf-9bdd-ca582e150511@collabora.com>
 <PH0PR11MB51125B8A88CBFAE48E7BDC62FAE4A@PH0PR11MB5112.namprd11.prod.outlook.com>
 <ef77d1e3-adea-4120-a23f-b2925ca23b38@collabora.com>
 <PH0PR11MB5112BF73084A79F3F0E785F6FAE4A@PH0PR11MB5112.namprd11.prod.outlook.com>
 <0fef25c6-c423-4d00-bbca-1744c2305afb@collabora.com>
 <PH0PR11MB511295459D829356E4416957FAE3A@PH0PR11MB5112.namprd11.prod.outlook.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <PH0PR11MB511295459D829356E4416957FAE3A@PH0PR11MB5112.namprd11.prod.outlook.com>
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

On 10/6/25 21:35, Kim, Dongwon wrote:
> Hi Dmitry,
> 
>> Subject: Re: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
>> virtio_gpu_objects
>>
>> On 10/3/25 21:59, Kim, Dongwon wrote:
>>> Hi Dmitry,
>>>
>>>> Subject: Re: [PATCH v5 2/3] drm/virtio: Add support for saving and
>>>> restoring virtio_gpu_objects
>>>>
>>>> On 10/3/25 20:01, Kim, Dongwon wrote:
>>>>> Hi Dmitry,
>>>>>
>>>>>> Subject: Re: [PATCH v5 2/3] drm/virtio: Add support for saving and
>>>>>> restoring virtio_gpu_objects
>>>>>>
>>>>>> On 10/3/25 08:34, dongwon.kim@intel.com wrote:
>>>>>>> +int virtio_gpu_object_restore_all(struct virtio_gpu_device *vgdev) {
>>>>>>> +	struct virtio_gpu_object *bo, *tmp;
>>>>>>> +	struct virtio_gpu_mem_entry *ents;
>>>>>>> +	unsigned int nents;
>>>>>>> +	int ret = 0;
>>>>>>> +
>>>>>>> +	spin_lock(&vgdev->obj_restore_lock);
>>>>>>> +	list_for_each_entry_safe(bo, tmp, &vgdev->obj_restore_list, list) {
>>>>>>> +		ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
>>>>>>> +		if (ret)
>>>>>>> +			break;
>>>>>>> +
>>>>>>> +		if (bo->params.blob) {
>>>>>>> +			virtio_gpu_cmd_resource_create_blob(vgdev, bo, &bo-
>>>>>>> params,
>>>>>>> +							    ents, nents);
>>>>>>> +		} else if (bo->params.virgl) {
>>>>>>> +			virtio_gpu_cmd_resource_create_3d(vgdev, bo, &bo-
>>>>>>> params,
>>>>>>> +							  NULL, NULL);
>>>>>>> +
>>>>>>> +			if (bo->attached) {
>>>>>>> +				bo->attached = false;
>>>>>>> +				virtio_gpu_object_attach(vgdev, bo, ents,
>>>>>> nents);
>>>>>>> +			}
>>>>>>> +		} else {
>>>>>>
>>>>>> No need to restore blob and 3d resources that we don't support
>>>>>> restore of and that won't be in the obj_restore_list since only
>>>>>> shmem objs are added to the list.
>>>>>>
>>>>>
>>>>> We are very interested in restoration of blob as well. It is
>>>>> actually the primary type of resource we want to recover because
>>>>> those are used as guest frame buffer we render in QEMU.  Can you
>>>>> tell me why it should be excluded? Would it be because of ambiguity
>>>>> of the location of
>>>> backing pages for it (e.g. VRAM)?
>>>>>
>>>>> And 3D is not our primary interest so I don't have any issue
>>>>> excluding it but it would be great if you can explain the reason for it as well.
>>>>>
>>>>> Thanks!
>>>>
>>>> Good point, only host blobs should be excluded. We can't restore VRAM
>>>> on resume as hostmem is lost on host side after entering S4.
>>>>
>>>> Actually, now I don't see where imported dmabuf guest blob added to
>>>> the restore_list in virtgpu_dma_buf_init_obj(). Please make sure
>>>> restoring guest blobs tested properly.
>>>
>>> Right, you got some critical point there.. I forgot about this object with
>> imported dmabuf.
>>> We will have to store the case virtio_gpu_objects backed by imported
>>> dmabuf as well in case the backing storage is still valid. By the way,
>>> so far we are not using imported buffer as a guest framebuffer. All
>>> scanouts are originated from virtio_gpu itself, which would be the reason it
>> has worked so far.
>>>
>>> Anyhow, no matter whether it's imported or created by virtio-gpu
>>> driver, I guess storing only blobs with bo->attached=true would be
>>> enough assuming host blob doesn't have any backing pages. What do you
>> think?
>>> (I will also modify the code to store objects backed by imported dmabuf.)
>>
>> The bo->attached only means whether pages are attached to shmem BO on
>> host at the moment.
>>
>> The whole state should be restored on resume - all shmem BOs re-created and
>> pages attached to them when bo->attached=true.
> 
> Got it. By the way, regarding exclusion of host blob, I guess you meant only blobs with
> "!guest_blob && host3d_blob". If that is the case, it is automatically excluded as 
> virtio_gpu_object_create is not even called. Or did you also mean blobs with both 
> flags - host3d_blob and guest_blob set should also be excluded?

There is no need to re-create resources on host that we can't restore,
i.e. "!guest_blob && host3d_blob". Restore all BOs that can be fully
restored on resume.

Also, reject hibernation on PM_HIBERNATION_PREPARE with a error msg if
virgl is enabled.

-- 
Best regards,
Dmitry
