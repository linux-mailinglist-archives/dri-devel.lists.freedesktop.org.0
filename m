Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E08DA3DB54
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 14:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA1E10E19F;
	Thu, 20 Feb 2025 13:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="UXoL0xvt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EF310E19F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 13:31:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1740058282; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nZ+99W4l2bOwH34wjrLy0cykDdkPJYNYyEnfRIVnig2i8J8r+j2f9e0y30C9hLSucrchccpVIPt9Uad4Pjqi5nbXVv22R8ssGE4WmGwX4pBG/MyyM0wIpImqtBw95f8N5NZfJXJ/E1WZzMzVcRvfc6ufuUpSDhIuqsi5fimDcw4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1740058282;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=WwGtYpVbiHbXyNtzNp28/hsmWCNhDI4FpbukfWmffb0=; 
 b=iefjYKVOzPMb3GNZCgitH+a2lYbiFWDw4Bcl3xX73CZw9VXUFjYVEQLjL8V6uetqHMNehd0zXeb7wOacMf6M/NR72Fp2ocfN0mr2VLCSqafXqV4Hd2c2fy55KTLbGx3cfodvL46iG3NVEbE8c5QxwvZusn+GisBHU8Z1lGjiSb4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740058282; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=WwGtYpVbiHbXyNtzNp28/hsmWCNhDI4FpbukfWmffb0=;
 b=UXoL0xvtm1lIvSi8Qhx3+eUWHgoWc6aT95gQemoue/dUPAH5uIAJ59Wxr8AUxK4Q
 O53477u7GJjPs/aAThqhTxS4zQ0ghojo/vdGMtf5DM/o4b7VMWXm9640ZgsixJDsvYV
 YSbGscqSf2gKSTkPxE6L7OsNsie8FYZPqsv+DEPQ=
Received: by mx.zohomail.com with SMTPS id 1740058280296164.49908263796294;
 Thu, 20 Feb 2025 05:31:20 -0800 (PST)
Message-ID: <ca0dfb6d-4fc6-4963-a092-f4c0b3afb7a4@collabora.com>
Date: Thu, 20 Feb 2025 16:31:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/5] virtio-mmio: read shm region page size
To: Sergio Lopez Pascual <slp@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Daniel Verkamp <dverkamp@chromium.org>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 fnkl.kernel@gmail.com
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250214-virtio-shm-page-size-v2-0-aa1619e6908b@redhat.com>
 <20250214-virtio-shm-page-size-v2-4-aa1619e6908b@redhat.com>
 <1f9a86a5-97d6-41d5-9a30-0422fc9ec137@collabora.com>
 <CAAiTLFXihV_DUpd25Mc-OcgsNJ5tVJx7XYsETgxh+7cFuicuHA@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <CAAiTLFXihV_DUpd25Mc-OcgsNJ5tVJx7XYsETgxh+7cFuicuHA@mail.gmail.com>
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

On 2/20/25 13:24, Sergio Lopez Pascual wrote:
> Dmitry Osipenko <dmitry.osipenko@collabora.com> writes:
> 
>> On 2/14/25 18:16, Sergio Lopez wrote:
>>> Use the newly introduced SHM_PAGE_SHIFT register to read the page shift
>>> for the shared memory region, derive the page size from it and store the
>>> resulting value into virtio_shm_region.
>>>
>>> Signed-off-by: Sergio Lopez <slp@redhat.com>
>>> ---
>>>  drivers/virtio/virtio_mmio.c     | 11 ++++++++++-
>>>  include/uapi/linux/virtio_mmio.h |  3 +++
>>>  2 files changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
>>> index 1f594b626d7a7734e8ec58766737a118c26bad94..0f892770739ea84b3e7be5615332773049b10ab1 100644
>>> --- a/drivers/virtio/virtio_mmio.c
>>> +++ b/drivers/virtio/virtio_mmio.c
>>> @@ -537,6 +537,7 @@ static bool vm_get_shm_region(struct virtio_device *vdev,
>>>  			      struct virtio_shm_region *region, u8 id)
>>>  {
>>>  	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
>>> +	u8 page_shift = 0;
>>>  	u64 len, addr;
>>>
>>>  	/* Select the region we're interested in */
>>> @@ -560,7 +561,15 @@ static bool vm_get_shm_region(struct virtio_device *vdev,
>>>
>>>  	region->addr = addr;
>>>
>>> -	region->page_size = 4096;
>>> +	/* If supported by the device transport, read the region page size.
>>> +	 * The page_shift variable is initialized to zero above, so if this
>>> +	 * feature isn't supported it will result in a page_size of 4096, a
>>> +	 * default safe value.
>>> +	 */
>>> +	if (__virtio_test_bit(vdev, VIRTIO_F_SHM_PAGE_SIZE))
>>> +		page_shift = (u8) readl(vm_dev->base + VIRTIO_MMIO_SHM_PAGE_SHIFT);
>>> +
>>> +	region->page_size = 1 << (page_shift + 12);
>>>
>>>  	return true;
>>>  }
>>> diff --git a/include/uapi/linux/virtio_mmio.h b/include/uapi/linux/virtio_mmio.h
>>> index 0650f91bea6c70f935764070d825d181a2379afb..43348be30eff90ee228b6490b9d3c35ba4c50aa5 100644
>>> --- a/include/uapi/linux/virtio_mmio.h
>>> +++ b/include/uapi/linux/virtio_mmio.h
>>> @@ -133,6 +133,9 @@
>>>  #define VIRTIO_MMIO_SHM_BASE_LOW        0x0b8
>>>  #define VIRTIO_MMIO_SHM_BASE_HIGH       0x0bc
>>>
>>> +/* Shared memory region page shift */
>>> +#define VIRTIO_MMIO_SHM_PAGE_SHIFT      0x0c4
>>
>> What's the logic behind choosing 0x0c4, why not 0x0c0?
> 
> It seems like Linux doesn't support it yet, but in the specs 0x0c0 is
> already reserved for QueueReset.

See QueueReset in the spec now, thanks.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
