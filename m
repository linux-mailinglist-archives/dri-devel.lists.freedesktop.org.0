Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5AB60F55F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 12:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C50E10E0F1;
	Thu, 27 Oct 2022 10:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CF410E0F1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 10:35:01 +0000 (UTC)
Received: from [192.168.2.208] (109-252-112-196.nat.spd-mgts.ru
 [109.252.112.196])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2B1A966028CF;
 Thu, 27 Oct 2022 11:34:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666866900;
 bh=B42Mjq5Xz6ezZDdiM34GBP0U3MZxhlYaL9Mqx4TnvWc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BMSNB4CyHeqKWHd1Vu4K+jL9R8vKCa8B9/8qfUi0oVBXR+M03p1Q4eYSv/QCfOmmk
 2bIwl4496z5xJxBDhYKpZUP6GEJIOEdr5k8RJD8ptzaIxE/IJzcm5hvpNwGhYfD2iW
 a9pS/QrBVAYJOW9T1Audi9jUDp1oDzGfZyxHDQh5LJSvHc6DTDNogxBh2D5yWvcjcG
 nzH0KhhEOGnIk64OEXHXVjrcMf9wmhtLUyZQaGKcR4VD2L6PQZca7YGACDhm1JWmKK
 u2nWFzOjqi5WkzjkQJivYBMQ4/VbTdPEgUUYVY8LPqzX+xiPn1iwsMpa5RuGHS1YkR
 l40SyhNQid90Q==
Message-ID: <46e22491-5891-cd24-850e-699fadb284ee@collabora.com>
Date: Thu, 27 Oct 2022 13:34:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1 1/2] dma-buf: Make locking consistent in
 dma_buf_detach()
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, noralf@tronnes.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20221026224640.7542-1-dmitry.osipenko@collabora.com>
 <20221026224640.7542-2-dmitry.osipenko@collabora.com>
 <01f62e6c-a40b-42e4-6cb0-338bd268b0a5@amd.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <01f62e6c-a40b-42e4-6cb0-338bd268b0a5@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/27/22 09:13, Christian König wrote:
> Am 27.10.22 um 00:46 schrieb Dmitry Osipenko:
>> The dma_buf_detach() locks attach->dmabuf->resv and then unlocks
>> dmabuf->resv, which could be a two different locks from a static
>> code checker perspective. In particular this triggers Smatch to
>> report the "double unlock" error. Make the locking pointers consistent.
>>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Link: https://lore.kernel.org/dri-devel/Y1fLfsccW3AS%2Fo+%2F@kili/
>> Fixes: 809d9c72c2f8 ("dma-buf: Move dma_buf_attach() to dynamic
>> locking specification")
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> It would be even cleaner if we completely drop the dmabuf parameter for
> the function and just use the inside the attachment.
> 
> Anyway patch is Reviewed-by: Christian König <christian.koenig@amd.com>
> for now, wider cleanups can come later on.

I had the same thought about dropping the dmabuf parameter.

Looking at this patch again, perhaps a better dmabuf sanity-check will be:

- 	if (WARN_ON(!dmabuf || !attach))
+ 	if (WARN_ON(!dmabuf || !attach || dmabuf != attach->dmabuf))

I'll switch to this version in v2, if there are no objections.

> 
>> ---
>>   drivers/dma-buf/dma-buf.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index c40d72d318fd..6e33ef4fde34 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -998,9 +998,10 @@ void dma_buf_detach(struct dma_buf *dmabuf,
>> struct dma_buf_attachment *attach)
>>       if (WARN_ON(!dmabuf || !attach))
>>           return;
>>   -    dma_resv_lock(attach->dmabuf->resv, NULL);
>> +    dma_resv_lock(dmabuf->resv, NULL);
>>         if (attach->sgt) {
>> +        WARN_ON(dmabuf != attach->dmabuf);
>>             __unmap_dma_buf(attach, attach->sgt, attach->dir);
>>   
> 

-- 
Best regards,
Dmitry

