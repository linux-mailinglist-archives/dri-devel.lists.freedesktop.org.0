Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458CE74A929
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 04:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081B310E4FE;
	Fri,  7 Jul 2023 02:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A108F10E4FE
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 02:53:16 +0000 (UTC)
Received: from [192.168.2.30] (109-252-155-235.dynamic.spd-mgts.ru
 [109.252.155.235])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3D2EF6606FD3;
 Fri,  7 Jul 2023 03:53:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688698393;
 bh=ivnYgygFTEWZZfemfaJgvqmJsyqn03111LwTIkj7m40=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=di4wlVn9XW9Fj1yTk3mQ/lVx8wcn0BPW6IyDDqQyoeQv1wUMOwHj3EsD2Dd1QWRSg
 Qjd513/yueQqq5NroKaHhV6o3e5WJsCoqM8UKylzpSRNiebC9OH5/3Q7zq7J2RcOHV
 rSXDCWUF9QVgEqu6Uc9sHn/50YBQeTZDq+9kgGgm+QGucjEooS5s2f8uo52ARq3785
 LHEVJ4BNNEH2nulNukYAWHQoWlqisiBQwidI0a0hpxkYdaWVJfueZRIm0LED+NdgVu
 BCXnhH2Y2l1lEyaKG9m3W5QWVs9bCrOuCuOz+JLiq7ydMS+endNwZwx4YLWBaS7dV6
 BLmDUnA71Fk2g==
Message-ID: <b3392f4d-a9f7-9ef9-4201-38575fc758c0@collabora.com>
Date: Fri, 7 Jul 2023 05:53:10 +0300
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
In-Reply-To: <0b96a5cc-1855-1d83-a559-f87a1556f137@collabora.com>
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

On 7/7/23 05:49, Dmitry Osipenko wrote:
> On 6/28/23 18:58, Gurchetan Singh wrote:
>> @@ -168,9 +168,13 @@ static int virtio_gpu_init_submit(struct virtio_gpu_submit *submit,
>>  
>>  	memset(submit, 0, sizeof(*submit));
>>  
>> -	out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
>> -	if (!out_fence)
>> -		return -ENOMEM;
>> +	if ((exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) ||
>> +	    ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX) &&
>> +	    (vfpriv->ring_idx_mask & BIT_ULL(ring_idx))) ||
> 
> Looks like there is a problem here. The virtio_gpu_fence_event_create()
> doesn't check whether VIRTGPU_EXECBUF_RING_IDX flag is set, so it's
> possible to trigger NULL-deref in that function if userspace will set
> ring_idx_mask=1. Perhaps virtio_gpu_fence_event_create() need to be
> changed to check the flag presence.

Or check whether fence is NULL

-- 
Best regards,
Dmitry

