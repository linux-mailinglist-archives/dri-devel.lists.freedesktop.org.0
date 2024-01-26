Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174C383E09E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 18:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C3B10FCAC;
	Fri, 26 Jan 2024 17:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C752710FCAC
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 17:40:39 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40QHeXWl021653;
 Fri, 26 Jan 2024 11:40:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1706290833;
 bh=tWS35G6oFLiiMUQqjg0s6kl4zM+dd3KKTVNV/pAk5Y8=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=wSW0X7YMB25+s9Adtm+MqZ7ac14ct+DkrUMn9JhSHS+1xDbU+enE72YXiIDfo4Lhk
 t7noOQnkWwvVuVcLmyN3OSHS+HX9RBI0L+LVpnhhxXuD8uqHiaLY38FRiUno2POFpE
 ZGpSz+ZGMDD8IHe1V3jWkQzvM+3iBd/4MJ7DMnjg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40QHeXfV057999
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 26 Jan 2024 11:40:33 -0600
Received: from flwvowa02.ent.ti.com (10.64.41.53) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 Jan 2024 11:40:33 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by flwvowa02.ent.ti.com
 (10.64.41.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Fri, 26 Jan
 2024 11:40:32 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 Jan 2024 11:40:32 -0600
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40QHeWG0086250;
 Fri, 26 Jan 2024 11:40:32 -0600
Message-ID: <1fb28a2f-8f42-42b4-9019-d0fc670c291c@ti.com>
Date: Fri, 26 Jan 2024 11:40:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] udmabuf: Sync buffer mappings for attached devices
Content-Language: en-US
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Paul Cercueil
 <paul@crapouillou.net>
References: <20240123221227.868341-1-afd@ti.com>
 <20240123221227.868341-2-afd@ti.com>
 <IA0PR11MB7185DDD7A972ED546B4CEA10F87B2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <7872f641-8a72-424f-b345-99c27403d7c6@ti.com>
 <IA0PR11MB7185C799B08748C87F215434F8792@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <IA0PR11MB7185C799B08748C87F215434F8792@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/24 1:25 AM, Kasireddy, Vivek wrote:
>>>> Currently this driver creates a SGT table using the CPU as the
>>>> target device, then performs the dma_sync operations against
>>>> that SGT. This is backwards to how DMA-BUFs are supposed to behave.
>>>> This may have worked for the case where these buffers were given
>>>> only back to the same CPU that produced them as in the QEMU case.
>>>> And only then because the original author had the dma_sync
>>>> operations also backwards, syncing for the "device" on begin_cpu.
>>>> This was noticed and "fixed" in this patch[0].
>>>>
>>>> That then meant we were sync'ing from the CPU to the CPU using
>>>> a pseudo-device "miscdevice". Which then caused another issue
>>>> due to the miscdevice not having a proper DMA mask (and why should
>>>> it, the CPU is not a DMA device). The fix for that was an even
>>>> more egregious hack[1] that declares the CPU is coherent with
>>>> itself and can access its own memory space..
>>>>
>>>> Unwind all this and perform the correct action by doing the dma_sync
>>>> operations for each device currently attached to the backing buffer.
>>> Makes sense.
>>>
>>>>
>>>> [0] commit 1ffe09590121 ("udmabuf: fix dma-buf cpu access")
>>>> [1] commit 9e9fa6a9198b ("udmabuf: Set the DMA mask for the udmabuf
>>>> device (v2)")
>>>>
>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>> ---
>>>>    drivers/dma-buf/udmabuf.c | 41 +++++++++++++++------------------------
>>>>    1 file changed, 16 insertions(+), 25 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>>>> index 3a23f0a7d112a..ab6764322523c 100644
>>>> --- a/drivers/dma-buf/udmabuf.c
>>>> +++ b/drivers/dma-buf/udmabuf.c
>>>> @@ -26,8 +26,6 @@ MODULE_PARM_DESC(size_limit_mb, "Max size of a
>>>> dmabuf, in megabytes. Default is
>>>>    struct udmabuf {
>>>>    	pgoff_t pagecount;
>>>>    	struct page **pages;
>>>> -	struct sg_table *sg;
>>>> -	struct miscdevice *device;
>>>>    	struct list_head attachments;
>>>>    	struct mutex lock;
>>>>    };
>>>> @@ -169,12 +167,8 @@ static void unmap_udmabuf(struct
>>>> dma_buf_attachment *at,
>>>>    static void release_udmabuf(struct dma_buf *buf)
>>>>    {
>>>>    	struct udmabuf *ubuf = buf->priv;
>>>> -	struct device *dev = ubuf->device->this_device;
>>>>    	pgoff_t pg;
>>>>
>>>> -	if (ubuf->sg)
>>>> -		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
>>> What happens if the last importer maps the dmabuf but erroneously
>>> closes it immediately? Would unmap somehow get called in this case?
>>>
>>
>> Good question, had to scan the framework code a bit here. I thought
>> closing a DMABUF handle would automatically unwind any current
>> attachments/mappings, but it seems nothing in the framework does that.
>>
>> Looks like that is up to the importing drivers[0]:
>>
>>> Once a driver is done with a shared buffer it needs to call
>>> dma_buf_detach() (after cleaning up any mappings) and then
>>> release the reference acquired with dma_buf_get() by
>>> calling dma_buf_put().
>>
>> So closing a DMABUF after mapping without first unmapping it would
>> be a bug in the importer, it is not the exporters problem to check
> It may be a bug in the importer but wouldn't the memory associated
> with the sg table and attachment get leaked if unmap doesn't get called
> in this scenario?
> 

Yes the attachment data would be leaked if unattach was not called,
but that is true for all DMABUF exporters. The .release() callback
is meant to be the mirror of the export function and it only cleans
up that. Same for attach/unattach, map/unmap, etc.. If these calls
are not balanced then yes they can leak memory.

Since balance is guaranteed by the API, checking the balance should
be done at that level, not in each and every exporter. If your
comment is that we should add those checks into the DMABUF framework
layer then I would agree.

Andrew

> Thanks,
> Vivek
> 
>> for (although some more warnings in the framework checking for that
>> might not be a bad idea..).
>>
>> Andrew
>>
>> [0] https://www.kernel.org/doc/html/v6.7/driver-api/dma-buf.html
>>
>>> Thanks,
>>> Vivek
>>>
>>>> -
>>>>    	for (pg = 0; pg < ubuf->pagecount; pg++)
>>>>    		put_page(ubuf->pages[pg]);
>>>>    	kfree(ubuf->pages);
>>>> @@ -185,33 +179,31 @@ static int begin_cpu_udmabuf(struct dma_buf
>>>> *buf,
>>>>    			     enum dma_data_direction direction)
>>>>    {
>>>>    	struct udmabuf *ubuf = buf->priv;
>>>> -	struct device *dev = ubuf->device->this_device;
>>>> -	int ret = 0;
>>>> -
>>>> -	if (!ubuf->sg) {
>>>> -		ubuf->sg = get_sg_table(dev, buf, direction);
>>>> -		if (IS_ERR(ubuf->sg)) {
>>>> -			ret = PTR_ERR(ubuf->sg);
>>>> -			ubuf->sg = NULL;
>>>> -		}
>>>> -	} else {
>>>> -		dma_sync_sg_for_cpu(dev, ubuf->sg->sgl, ubuf->sg->nents,
>>>> -				    direction);
>>>> -	}
>>>> +	struct udmabuf_attachment *a;
>>>>
>>>> -	return ret;
>>>> +	mutex_lock(&ubuf->lock);
>>>> +
>>>> +	list_for_each_entry(a, &ubuf->attachments, list)
>>>> +		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
>>>> +
>>>> +	mutex_unlock(&ubuf->lock);
>>>> +
>>>> +	return 0;
>>>>    }
>>>>
>>>>    static int end_cpu_udmabuf(struct dma_buf *buf,
>>>>    			   enum dma_data_direction direction)
>>>>    {
>>>>    	struct udmabuf *ubuf = buf->priv;
>>>> -	struct device *dev = ubuf->device->this_device;
>>>> +	struct udmabuf_attachment *a;
>>>>
>>>> -	if (!ubuf->sg)
>>>> -		return -EINVAL;
>>>> +	mutex_lock(&ubuf->lock);
>>>> +
>>>> +	list_for_each_entry(a, &ubuf->attachments, list)
>>>> +		dma_sync_sgtable_for_device(a->dev, a->table, direction);
>>>> +
>>>> +	mutex_unlock(&ubuf->lock);
>>>>
>>>> -	dma_sync_sg_for_device(dev, ubuf->sg->sgl, ubuf->sg->nents,
>>>> direction);
>>>>    	return 0;
>>>>    }
>>>>
>>>> @@ -307,7 +299,6 @@ static long udmabuf_create(struct miscdevice
>>>> *device,
>>>>    	exp_info.priv = ubuf;
>>>>    	exp_info.flags = O_RDWR;
>>>>
>>>> -	ubuf->device = device;
>>>>    	buf = dma_buf_export(&exp_info);
>>>>    	if (IS_ERR(buf)) {
>>>>    		ret = PTR_ERR(buf);
>>>> --
>>>> 2.39.2
>>>
