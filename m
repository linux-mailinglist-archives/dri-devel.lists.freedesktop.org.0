Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 745B66C58ED
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 22:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5482610E153;
	Wed, 22 Mar 2023 21:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E9210E153
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 21:45:15 +0000 (UTC)
Received: from [192.168.2.179] (unknown [109.252.120.116])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 12D4F6602083;
 Wed, 22 Mar 2023 21:45:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1679521514;
 bh=seWGQIGl/GWRMShC0zUqh8cUcoPkOeMdh8a+mR1+vXQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ReCz5boSXxxMwOF861bUZDq51ks4KXye2uB6kG2I6XtEOP2B1LHXW15a83+GGDbbx
 Q1bAlhreT55dnsb50+CWuhAAESmNsF62Lo+5l5SPqi6m41f99e1UJhKMZQ3L3z9Rzz
 j403gFvR8slF1QIROSvAiuTR1XeXq06BcHtVE0WJj0HFDGoF+cYFz1q8rjdazUJtiw
 AMT6HKDzhpCiMqToSGLP5I0wvKfWvMh2pw5cr1Gf0FlgDOvLxdhtavKd4PSTTbEWDb
 FKAdrWEwpdMaoTdCGeJLZhU3G7k2ztZW11NJ76sFom6kbRZBoB0EYBA9713uRuGO/R
 01r/UQ6J13Uug==
Message-ID: <ffdc843c-86ae-4838-9201-9028f2624933@collabora.com>
Date: Thu, 23 Mar 2023 00:45:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] drm/virtio: Refactor job submission code path
To: Rob Clark <robdclark@gmail.com>
References: <20230319160802.3297643-1-dmitry.osipenko@collabora.com>
 <20230319160802.3297643-2-dmitry.osipenko@collabora.com>
 <CAF6AEGu0WNgX+T2sjrA_-sgvO35wNjz39p6hc9zh02goPrkExQ@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAF6AEGu0WNgX+T2sjrA_-sgvO35wNjz39p6hc9zh02goPrkExQ@mail.gmail.com>
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 kernel@collabora.com, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/23/23 00:25, Rob Clark wrote:
...
>> +static int virtio_gpu_dma_fence_wait(struct virtio_gpu_submit *submit,
>> +                                    struct dma_fence *fence)
>> +{
>> +       struct dma_fence *itr;
>> +       int idx, err;
>> +
>> +       dma_fence_array_for_each(itr, idx, fence) {
> 
> I guess unwrapping is for the later step of host waits?
> 
> At any rate, I think you should use dma_fence_unwrap_for_each() to
> handle the fence-chain case as well?

Yes, seems so. I actually missed the dma_fence_unwrap, thanks!

...
>> +static int virtio_gpu_init_submit(struct virtio_gpu_submit *submit,
>> +                                 struct drm_virtgpu_execbuffer *exbuf,
>> +                                 struct drm_device *dev,
>> +                                 struct drm_file *file,
>> +                                 uint64_t fence_ctx, uint32_t ring_idx)
>> +{
>> +       struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
>> +       struct virtio_gpu_device *vgdev = dev->dev_private;
>> +       struct virtio_gpu_fence *out_fence;
>> +       int err;
>> +
>> +       memset(submit, 0, sizeof(*submit));
>> +
>> +       out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
>> +       if (!out_fence)
>> +               return -ENOMEM;
>> +
>> +       err = virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
>> +       if (err) {
>> +               dma_fence_put(&out_fence->f);
>> +               return err;
>> +       }
> 
> If we fail at any point after here, where is the out_fence referenced dropped?

Good catch, don't see either where it's dropped. Perhaps the drop got
lost after moving the code around, will fix.

...
>> +/*
>> + * Usage of execbuffer:
>> + * Relocations need to take into account the full VIRTIO_GPUDrawable size.
>> + * However, the command as passed from user space must *not* contain the initial
>> + * VIRTIO_GPUReleaseInfo struct (first XXX bytes)
>> + */
> 
> I know this is just getting moved from the old location, but I'm not
> even sure what this comment means ;-)
> 
> At least it doesn't make any sense for non-virgl contexts.. I haven't
> looked too closely at virgl protocol itself

Had exactly the same thought :) Well, if nobody will clarify, then I'm
happy with removing it in v3.

-- 
Best regards,
Dmitry

