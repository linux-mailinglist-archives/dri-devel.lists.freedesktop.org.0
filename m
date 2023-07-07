Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AC074A933
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 05:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE77810E503;
	Fri,  7 Jul 2023 03:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4D110E503
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 03:04:20 +0000 (UTC)
Received: from [192.168.2.30] (109-252-155-235.dynamic.spd-mgts.ru
 [109.252.155.235])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 97D456606FD3;
 Fri,  7 Jul 2023 04:04:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688699058;
 bh=WlPyb9wIxpGCEB+59+FdDYT9Htdmlii/t2gcpGZKEpk=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=UyVUewJR3GpXemdeQaqNItouLGQhC1DRnhwV3q6rUalfSqb95KgUbL/FS0uGOQ/dq
 Fa9ChTtQ1E/iVZNEV+1adadA7J0QZNQZr7ZADaNiZbKrhr/7c3j0/VquRKaEXkHG1o
 8sjtvI+sizrmjDWUF8JBKNtNP9e/R1A26v8quq8pSGDymhOrnB/Y8F/d6wxbFItTdD
 ScLo4ogS/4tM6U3efCXplzhUdfc4453asPpbWHbHL4Xo1gKzJwg9bc640qhlIuSamK
 3UeuvKIxnRjeAfYm3QnIGKBQgsYgNFldI/BB987U6jmuFZF/2qUHZg5zw3+wHNnPc1
 7166VDhXu0XRA==
Message-ID: <77c241ff-b3b6-d399-59db-0291dc9d2812@collabora.com>
Date: Fri, 7 Jul 2023 06:04:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v2] drm/virtio: conditionally allocate virtio_gpu_fence
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org
References: <20230628155838.589-1-gurchetansingh@chromium.org>
 <0b96a5cc-1855-1d83-a559-f87a1556f137@collabora.com>
 <b3392f4d-a9f7-9ef9-4201-38575fc758c0@collabora.com>
In-Reply-To: <b3392f4d-a9f7-9ef9-4201-38575fc758c0@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: kraxel@redhat.com, acourbot@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/7/23 05:53, Dmitry Osipenko wrote:
> On 7/7/23 05:49, Dmitry Osipenko wrote:
>> On 6/28/23 18:58, Gurchetan Singh wrote:
>>> @@ -168,9 +168,13 @@ static int virtio_gpu_init_submit(struct virtio_gpu_submit *submit,
>>>  
>>>  	memset(submit, 0, sizeof(*submit));
>>>  
>>> -	out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
>>> -	if (!out_fence)
>>> -		return -ENOMEM;
>>> +	if ((exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) ||
>>> +	    ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX) &&
>>> +	    (vfpriv->ring_idx_mask & BIT_ULL(ring_idx))) ||
>>
>> Looks like there is a problem here. The virtio_gpu_fence_event_create()
>> doesn't check whether VIRTGPU_EXECBUF_RING_IDX flag is set, so it's
>> possible to trigger NULL-deref in that function if userspace will set
>> ring_idx_mask=1. Perhaps virtio_gpu_fence_event_create() need to be
>> changed to check the flag presence.
> 
> Or check whether fence is NULL

Actually, maybe this code shouldn't check VIRTGPU_EXECBUF_RING_IDX flag
at all. This flag tells which ring to use fo submission, but not which
ring to poll. Please check and correct it in v3.

-- 
Best regards,
Dmitry

