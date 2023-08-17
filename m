Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A44C77F001
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 07:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A583410E3EB;
	Thu, 17 Aug 2023 05:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B810D10E3EB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 05:05:28 +0000 (UTC)
Received: from [192.168.2.160] (109-252-150-127.dynamic.spd-mgts.ru
 [109.252.150.127])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1A5B6660721F;
 Thu, 17 Aug 2023 06:05:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692248727;
 bh=e25pQoJ9OohWOZigUaEnna8LnwiXKRuP4JO477ch8Dc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=btVRlLgHNRa49N8d/KeNi7nceTRmRQkLNXwdHR1DWe2PH29vKlymxTDiFOsnMbTwQ
 bNi4Oxa1IOncyjlcyruQoe0t9nwo2BFd2v5qRLrWS8nq0jzCkvWH5VYmgBO1BDyz+0
 JJ9s1BJTISdpQdxPd13UODVfKXtLns565ur/4n/T74iOGj5bDNsC68VAmgxJPlqM1O
 RVFoopQe5geVfLVDnx2j7Hvd+bdjBs1BBFCn2B7w1hFyajpR7GGOD4b1l0Kh26W57h
 zPIy1pHOVfpH6VvekOwxRubEO8AVdcQ3vFTMxUgIGjSWPTknDtSAa8lNuIkuw2D1DE
 AHk5TPLSN+BDA==
Message-ID: <853f28d6-91e5-1482-d923-5f7fd0e6d018@collabora.com>
Date: Thu, 17 Aug 2023 08:05:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 1/3] drm/virtio: .release ops for virtgpu fence release
Content-Language: en-US
To: "Kim, Dongwon" <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org
References: <20230712224424.30158-1-dongwon.kim@intel.com>
 <20230712224424.30158-2-dongwon.kim@intel.com>
 <b82d4b66-d65c-16d6-9fed-5be50977ff86@collabora.com>
 <ff7d16ce-887e-98a9-5bc4-fd3aeef6ea00@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <ff7d16ce-887e-98a9-5bc4-fd3aeef6ea00@intel.com>
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/16/23 21:10, Kim, Dongwon wrote:
> Hi,
> 
> On 8/14/2023 9:18 PM, Dmitry Osipenko wrote:
>> On 7/13/23 01:44, Dongwon Kim wrote:
>>> virtio_gpu_fence_release is added to free virtio-gpu-fence
>>> upon release of dma_fence.
>>>
>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
>>> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
>>> ---
>>>   drivers/gpu/drm/virtio/virtgpu_fence.c | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c
>>> b/drivers/gpu/drm/virtio/virtgpu_fence.c
>>> index f28357dbde35..ba659ac2a51d 100644
>>> --- a/drivers/gpu/drm/virtio/virtgpu_fence.c
>>> +++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
>>> @@ -63,12 +63,20 @@ static void virtio_gpu_timeline_value_str(struct
>>> dma_fence *f, char *str,
>>>            (u64)atomic64_read(&fence->drv->last_fence_id));
>>>   }
>>>   +static void virtio_gpu_fence_release(struct dma_fence *f)
>>> +{
>>> +    struct virtio_gpu_fence *fence = to_virtio_gpu_fence(f);
>>> +
>>> +    kfree(fence);
>>> +}
>>> +
>>>   static const struct dma_fence_ops virtio_gpu_fence_ops = {
>>>       .get_driver_name     = virtio_gpu_get_driver_name,
>>>       .get_timeline_name   = virtio_gpu_get_timeline_name,
>>>       .signaled            = virtio_gpu_fence_signaled,
>>>       .fence_value_str     = virtio_gpu_fence_value_str,
>>>       .timeline_value_str  = virtio_gpu_timeline_value_str,
>>> +    .release         = virtio_gpu_fence_release,
>>>   };
>>>     struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct
>>> virtio_gpu_device *vgdev,
>> This change doesn't do anything practically useful, AFAICT.
> 
> The intention of this ".release" is to free virtio_gpu_fence when the
> last dma_fence_put is done for the associated dma fence.

What makes you think that fence won't be freed otherwise? Sounds like
haven't tried to check what dma_fence_release() code does, have you?

-- 
Best regards,
Dmitry

