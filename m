Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665F9BB7D4D
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 20:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEDC10E956;
	Fri,  3 Oct 2025 18:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="czZf3HS7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5687710E956
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 18:03:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759514622; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PE2UQ3zTEK230/Tbl6seFwiZtM/+eSTFaiTndqb5aaLFgZ+Pwa6cYTpn7XW2WhrxMuVPrKGTAVp1d7b1jkFhGwzmVO+A1k0zV7BtBgIs09hNnHrqDPxi+SCZZfw3KbckmhEeElcdwaR7lUUcMSktdgfsjxcObk6SzQW7ujbDpKg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759514622;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=a+N/uyjWJh/W+RxkqtxaKiV8fcfIbAlZZkoQxaUYWl0=; 
 b=Tg5S7gKJXtz/UUSedkPtVT1l7Z1kv+0SF49UOUnlhpgk8grhcOU++8uqgSPvH2Fbu9A9DgGCb4HP42jVQX76MNN9m46Cac57+51oJ8Zmjp1/fVKecWjr4bPh5jk1WTX1BA+TEz69VbqpSz0kXrUmS4aAxE82c4496BSazOu4xuw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759514622; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=a+N/uyjWJh/W+RxkqtxaKiV8fcfIbAlZZkoQxaUYWl0=;
 b=czZf3HS7OgEjH67eECwAocYNe2+V0s+nmNa6OKQWguiOSkFt10TAWMJhYXvYOZIU
 manzMhNeivdzYwTM8hRYuTqzCwAG7iUt7Y2AOS+LtXyTzx2zYcb+g6bEXmVdTKDdIb5
 R1jVxEVh7kuigx3D72YooN+ZbUtZZvqagPnL9Hzg=
Received: by mx.zohomail.com with SMTPS id 1759514619963818.5401262678981;
 Fri, 3 Oct 2025 11:03:39 -0700 (PDT)
Message-ID: <ef77d1e3-adea-4120-a23f-b2925ca23b38@collabora.com>
Date: Fri, 3 Oct 2025 21:03:36 +0300
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
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <PH0PR11MB51125B8A88CBFAE48E7BDC62FAE4A@PH0PR11MB5112.namprd11.prod.outlook.com>
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

On 10/3/25 20:01, Kim, Dongwon wrote:
> Hi Dmitry,
> 
>> Subject: Re: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
>> virtio_gpu_objects
>>
>> On 10/3/25 08:34, dongwon.kim@intel.com wrote:
>>> +int virtio_gpu_object_restore_all(struct virtio_gpu_device *vgdev) {
>>> +	struct virtio_gpu_object *bo, *tmp;
>>> +	struct virtio_gpu_mem_entry *ents;
>>> +	unsigned int nents;
>>> +	int ret = 0;
>>> +
>>> +	spin_lock(&vgdev->obj_restore_lock);
>>> +	list_for_each_entry_safe(bo, tmp, &vgdev->obj_restore_list, list) {
>>> +		ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
>>> +		if (ret)
>>> +			break;
>>> +
>>> +		if (bo->params.blob) {
>>> +			virtio_gpu_cmd_resource_create_blob(vgdev, bo, &bo-
>>> params,
>>> +							    ents, nents);
>>> +		} else if (bo->params.virgl) {
>>> +			virtio_gpu_cmd_resource_create_3d(vgdev, bo, &bo-
>>> params,
>>> +							  NULL, NULL);
>>> +
>>> +			if (bo->attached) {
>>> +				bo->attached = false;
>>> +				virtio_gpu_object_attach(vgdev, bo, ents,
>> nents);
>>> +			}
>>> +		} else {
>>
>> No need to restore blob and 3d resources that we don't support restore of and
>> that won't be in the obj_restore_list since only shmem objs are added to the
>> list.
>>
>  
> We are very interested in restoration of blob as well. It is actually the primary type of resource we
> want to recover because those are used as guest frame buffer we render in QEMU.  Can you tell me
> why it should be excluded? Would it be because of ambiguity of the location of backing pages for it
> (e.g. VRAM)?
> 
> And 3D is not our primary interest so I don't have any issue excluding it but it would be great if you can
> explain the reason for it as well.
> 
> Thanks!

Good point, only host blobs should be excluded. We can't restore VRAM on
resume as hostmem is lost on host side after entering S4.

Actually, now I don't see where imported dmabuf guest blob added to the
restore_list in virtgpu_dma_buf_init_obj(). Please make sure restoring
guest blobs tested properly.

-- 
Best regards,
Dmitry
