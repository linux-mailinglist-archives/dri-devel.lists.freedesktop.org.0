Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD1283DFF2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 18:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A25E10FC87;
	Fri, 26 Jan 2024 17:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4264810FC80
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 17:24:42 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40QHOa9Y014930;
 Fri, 26 Jan 2024 11:24:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1706289876;
 bh=8iWkQOhPfAcRIse+3USGqVWLH26NmLTX6brrBHnE9EA=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=xHJ7ahUHqbB1E3bx6+PZ4gJBB+4ueIxEqM3ZaJ8hBBx00SoX4BesPdB4VqHcvg4ai
 H6J5N8FSiG06MCJfncBkozP6Eolb/9RQ645Cnb6Ao2CWTTdZ3OiaNCpd1/zN4Lpz+f
 9DtC2l4oVat7zVrKOCEeb5fcCLMeazVpWbTxJwfw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40QHOa9h083675
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 26 Jan 2024 11:24:36 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 Jan 2024 11:24:36 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 Jan 2024 11:24:36 -0600
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40QHOZ75065085;
 Fri, 26 Jan 2024 11:24:36 -0600
Message-ID: <9105137a-058d-4314-83de-3424f82a838e@ti.com>
Date: Fri, 26 Jan 2024 11:24:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH 2/3] udmabuf: Sync buffer mappings for
 attached devices
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Paul Cercueil
 <paul@crapouillou.net>,
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
References: <20240123221227.868341-1-afd@ti.com>
 <20240123221227.868341-2-afd@ti.com> <ZbLE6FYXFVzTLh28@phenom.ffwll.local>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <ZbLE6FYXFVzTLh28@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/25/24 2:30 PM, Daniel Vetter wrote:
> On Tue, Jan 23, 2024 at 04:12:26PM -0600, Andrew Davis wrote:
>> Currently this driver creates a SGT table using the CPU as the
>> target device, then performs the dma_sync operations against
>> that SGT. This is backwards to how DMA-BUFs are supposed to behave.
>> This may have worked for the case where these buffers were given
>> only back to the same CPU that produced them as in the QEMU case.
>> And only then because the original author had the dma_sync
>> operations also backwards, syncing for the "device" on begin_cpu.
>> This was noticed and "fixed" in this patch[0].
>>
>> That then meant we were sync'ing from the CPU to the CPU using
>> a pseudo-device "miscdevice". Which then caused another issue
>> due to the miscdevice not having a proper DMA mask (and why should
>> it, the CPU is not a DMA device). The fix for that was an even
>> more egregious hack[1] that declares the CPU is coherent with
>> itself and can access its own memory space..
>>
>> Unwind all this and perform the correct action by doing the dma_sync
>> operations for each device currently attached to the backing buffer.
>>
>> [0] commit 1ffe09590121 ("udmabuf: fix dma-buf cpu access")
>> [1] commit 9e9fa6a9198b ("udmabuf: Set the DMA mask for the udmabuf device (v2)")
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
> 
> So yeah the above hacks are terrible, but I don't think this is better.
> What you're doing now is that you're potentially doing the flushing
> multiple times, so if you have a lot of importers with life mappings this
> is a performance regression.

I'd take lower performing but correct than fast and broken. :)

Syncing for CPU/device is about making sure the CPU/device can see
the data produced by the other. Some devices might be dma-coherent
and syncing for them would be a NOP, but we cant know that here
in this driver. Let's say we have two attached devices, one that
is cache coherent and one that isn't. If we only sync for first
attached device then that is converted to a NOP and we never flush
like the second device needed.

Same is true for devices behind IOMMU or with an L3 cache when
syncing in the other direction for CPU. So we have to sync for all
attached devices to ensure we get even the lowest common denominator
device sync'd. It is up to the DMA-API layer to decide which syncs
need to actually do something. If all attached devices are coherent
then all syncs will be NOPs and we have no performance penalty.

> 
> It's probably time to bite the bullet and teach the dma-api about flushing
> for multiple devices. Or some way we can figure out which is the one
> device we need to pick which gives us the right amount of flushing.
> 

Seems like a constraint solving micro-optimization. The DMA-API layer
would have to track which buffers have already been flushed from CPU
cache and also track that nothing has been written into those caches
since that point, only then could it skip the flush. But that is already
the point of the dirty bit in the caches themselves, cleaning already
clean cache lines is essentially free in hardware. And so is invalidating
lines, it is just flipping a bit.

Andrew

> Cheers, Sima
> 
>> ---
>>   drivers/dma-buf/udmabuf.c | 41 +++++++++++++++------------------------
>>   1 file changed, 16 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 3a23f0a7d112a..ab6764322523c 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -26,8 +26,6 @@ MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is
>>   struct udmabuf {
>>   	pgoff_t pagecount;
>>   	struct page **pages;
>> -	struct sg_table *sg;
>> -	struct miscdevice *device;
>>   	struct list_head attachments;
>>   	struct mutex lock;
>>   };
>> @@ -169,12 +167,8 @@ static void unmap_udmabuf(struct dma_buf_attachment *at,
>>   static void release_udmabuf(struct dma_buf *buf)
>>   {
>>   	struct udmabuf *ubuf = buf->priv;
>> -	struct device *dev = ubuf->device->this_device;
>>   	pgoff_t pg;
>>   
>> -	if (ubuf->sg)
>> -		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
>> -
>>   	for (pg = 0; pg < ubuf->pagecount; pg++)
>>   		put_page(ubuf->pages[pg]);
>>   	kfree(ubuf->pages);
>> @@ -185,33 +179,31 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
>>   			     enum dma_data_direction direction)
>>   {
>>   	struct udmabuf *ubuf = buf->priv;
>> -	struct device *dev = ubuf->device->this_device;
>> -	int ret = 0;
>> -
>> -	if (!ubuf->sg) {
>> -		ubuf->sg = get_sg_table(dev, buf, direction);
>> -		if (IS_ERR(ubuf->sg)) {
>> -			ret = PTR_ERR(ubuf->sg);
>> -			ubuf->sg = NULL;
>> -		}
>> -	} else {
>> -		dma_sync_sg_for_cpu(dev, ubuf->sg->sgl, ubuf->sg->nents,
>> -				    direction);
>> -	}
>> +	struct udmabuf_attachment *a;
>>   
>> -	return ret;
>> +	mutex_lock(&ubuf->lock);
>> +
>> +	list_for_each_entry(a, &ubuf->attachments, list)
>> +		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
>> +
>> +	mutex_unlock(&ubuf->lock);
>> +
>> +	return 0;
>>   }
>>   
>>   static int end_cpu_udmabuf(struct dma_buf *buf,
>>   			   enum dma_data_direction direction)
>>   {
>>   	struct udmabuf *ubuf = buf->priv;
>> -	struct device *dev = ubuf->device->this_device;
>> +	struct udmabuf_attachment *a;
>>   
>> -	if (!ubuf->sg)
>> -		return -EINVAL;
>> +	mutex_lock(&ubuf->lock);
>> +
>> +	list_for_each_entry(a, &ubuf->attachments, list)
>> +		dma_sync_sgtable_for_device(a->dev, a->table, direction);
>> +
>> +	mutex_unlock(&ubuf->lock);
>>   
>> -	dma_sync_sg_for_device(dev, ubuf->sg->sgl, ubuf->sg->nents, direction);
>>   	return 0;
>>   }
>>   
>> @@ -307,7 +299,6 @@ static long udmabuf_create(struct miscdevice *device,
>>   	exp_info.priv = ubuf;
>>   	exp_info.flags = O_RDWR;
>>   
>> -	ubuf->device = device;
>>   	buf = dma_buf_export(&exp_info);
>>   	if (IS_ERR(buf)) {
>>   		ret = PTR_ERR(buf);
>> -- 
>> 2.39.2
>>
>> _______________________________________________
>> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
>> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org
> 
