Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F115748C7D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 20:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E4C10E3B2;
	Wed,  5 Jul 2023 18:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1FE10E3B2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 18:59:27 +0000 (UTC)
Received: from [192.168.2.30] (109-252-155-235.dynamic.spd-mgts.ru
 [109.252.155.235])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3220566018CF;
 Wed,  5 Jul 2023 19:59:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688583565;
 bh=CexknV7/SU5lHUebxxs/uEIkZiZ0ru3vnAvxJnTXf7s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dpsJYv4Qq2IYplSPBXTjimxbivXJYH0XFUyTNrtZC8jxUbGaw4YdFKeKWKWcOIa9U
 PPOv5MMnEnLJHcHZw4m/oinR4vfEgoYV34FIMw06ciyeIRx3uXO+1OjMRELqljb8k8
 qeUde5HPWkX+i/16zaZwMfWoyYO1Kpca/bRQA7QdCtrihsXK+I66op+FS3CHWlZ5fF
 4Eq4CcmGllN4P7AuEdKCOae9QxhwwsDTO02sxh8TNO48w9iW7k6HP4Osnbq9b2TgXP
 FBLpP6jf9QkBqVO7Gt1On2NA6QenEJxG7idp4MYdf1lvm4LoWqzLB4lMlMHQc7QrmR
 EI1rJmnEcG9qQ==
Message-ID: <f256ff4e-f796-c8de-8090-5d4cfefa9531@collabora.com>
Date: Wed, 5 Jul 2023 21:59:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v2] drm/virtio: conditionally allocate virtio_gpu_fence
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org
References: <20230628155838.589-1-gurchetansingh@chromium.org>
 <CAAfnVB=zei+ci2xsEEcJpD+APi7kkWo_e4M+zytSsKV8mryBaw@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAAfnVB=zei+ci2xsEEcJpD+APi7kkWo_e4M+zytSsKV8mryBaw@mail.gmail.com>
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
Cc: kraxel@redhat.com, acourbot@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/5/23 18:54, Gurchetan Singh wrote:
> On Wed, Jun 28, 2023 at 8:58 AM Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
>>
>> We don't want to create a fence for every command submission.  It's
>> only necessary when userspace provides a waitable token for submission.
>> This could be:
>>
>> 1) bo_handles, to be used with VIRTGPU_WAIT
>> 2) out_fence_fd, to be used with dma_fence apis
>> 3) a ring_idx provided with VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK
>>    + DRM event API
>> 4) syncobjs in the future
>>
>> The use case for just submitting a command to the host, and expected
>> no response.  For example, gfxstream has GFXSTREAM_CONTEXT_PING that
>> just wakes up the host side worker threads.  There's also
>> CROSS_DOMAIN_CMD_SEND which just sends data to the Wayland server.
>>
>> This prevents the need to signal the automatically created
>> virtio_gpu_fence.
>>
>> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
>> Reviewed-by: <dmitry.osipenko@collabora.com>
>> ---
>>  v2: Fix indent (Dmitry)
>>
>>  drivers/gpu/drm/virtio/virtgpu_submit.c | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/virtio/virtgpu_submit.c
>> index cf3c04b16a7a..8c7e15c31164 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_submit.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
>> @@ -168,9 +168,13 @@ static int virtio_gpu_init_submit(struct virtio_gpu_submit *submit,
>>
>>         memset(submit, 0, sizeof(*submit));
>>
>> -       out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
>> -       if (!out_fence)
>> -               return -ENOMEM;
>> +       if ((exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) ||
>> +           ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX) &&
>> +           (vfpriv->ring_idx_mask & BIT_ULL(ring_idx))) ||
>> +           exbuf->num_bo_handles)
>> +               out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
>> +       else
>> +               out_fence = NULL;
>>
>>         err = virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
>>         if (err) {
>> --
> 
> Ping for additional reviews or merge.

I tested this patch with virgl,venus and nctx. No problems spotted.
Going to apply it tomorrow if there won't be additional comments from
anyone.

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

