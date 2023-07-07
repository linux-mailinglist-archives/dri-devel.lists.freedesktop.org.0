Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D098B74B774
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 21:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B1210E048;
	Fri,  7 Jul 2023 19:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D4210E048
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 19:46:53 +0000 (UTC)
Received: from [192.168.2.30] (109-252-155-235.dynamic.spd-mgts.ru
 [109.252.155.235])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A49AD6606FF1;
 Fri,  7 Jul 2023 20:46:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688759211;
 bh=Hrdc2Bh3sC2wZ+4iekQsGRMWYj9QbpXzoacoXKXCQmM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Erc7LoDFCJIb5qPwvCnotsw9i/AF1M4UWRWwttlFpQPUvR8MEXKwhpdytq1JiuZuK
 c1Yp96/8XHPcADeyqXf8m6iqWFqnz/L+ugtpYC+9MFBmX7BpXbKryRwW3iao48XIdd
 AJRswIHt8+wyh90IWQPvHMwotpT8b8R/TVaJlyT3MAMO6b2oblwrsioWD3oOGfN/3g
 DPaZApbrGZZoXfYqLbTV83IUC3cHwG3v8rlN1QnbrNTMNjfPkwJ9Xf5Qj+VSD6xQeD
 EfLQK80o8FE4We83zf27Zzlijceb+4zuXd/9hIVrsqVHy1/ZRXwp15FG+pbnQ2sa5+
 U+CZ2NdzQimWA==
Message-ID: <2cc27163-c8d2-45bc-abd7-26ea567c4aea@collabora.com>
Date: Fri, 7 Jul 2023 22:46:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v3] drm/virtio: conditionally allocate virtio_gpu_fence
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>
References: <77c241ff-b3b6-d399-59db-0291dc9d2812@collabora.com>
 <20230707154337.620-1-gurchetansingh@chromium.org>
 <2be0ec9f-5e40-1b23-48ed-e284e97a93d1@collabora.com>
 <0a581623-1241-5bc3-aed9-c355053131bc@collabora.com>
 <CAAfnVBmON-0Jb+3YFtP5vkjHUion7pWWzckEF+e7=VNE6hrd=w@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAAfnVBmON-0Jb+3YFtP5vkjHUion7pWWzckEF+e7=VNE6hrd=w@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/7/23 20:59, Gurchetan Singh wrote:
///
>>> Previously, when VIRTGPU_EXECBUF_RING_IDX flag wasn't specified, the
>>> fence event was created for a default ring_idx=0. Now you changed this
>>> behaviour and event will never be created without
>>> VIRTGPU_EXECBUF_RING_IDX flag being set.
> 
> ring_idx = 0 is fine, but without VIRTGPU_EXECBUF_RING_IDX that means
> the global timeline.
> 
> It's an additional check for where the userspace specifies they want
> to use per-context fencing and polling, but actually uses the global
> timeline.  Userspace never does this since it wouldn't work, so it's a
> bit of a pathological edge case check than any UAPI change.
> 
>>>
>>> Could you please point me at the corresponding userspace code that polls
>>> DRM FD fence event?
> 
> https://chromium.googlesource.com/chromiumos/platform2/+/HEAD/vm_tools/sommelier/virtualization/virtgpu_channel.cc#216
> 
> Used with the following flow:
> 
> https://crosvm.dev/book/devices/wayland.html
> 
> If you wish to test, please do apply this change:
> 
> https://chromium-review.googlesource.com/c/chromiumos/platform2/+/4605854

Thanks for the links! I tested v2 with sommelier, though wasn't aware
about CL4605854 and alternatives to sommelier

>>> It's unclear whether there is a possible userspace regression here or
>>> not. If there is no regression, then in general such behavioural changes
>>> should be done in a separate commit having detailed description
>>> explaining why behaviour changes.
> 
> Sommelier isn't formally packaged yet in the Linux distro style and it
> always specifies RING_IDX when polling, so no regressions here.  Maybe
> a separate commit is overkill (since the 2nd commit would delete the
> newly added checks), what about just more detail in the commit
> message?

More detail will be fine

>> I see that venus does the polling and ring_idx_mask is a
>> context-specific param, hence it's irrelevant to a generic ctx 0. Still
>> it's now necessary to specify the EXECBUF_RING_IDX flag even if ctx has
>> one ring, which is UAPI change.
> 
> It doesn't seem like venus enables POLL_RINGS_MASK to poll since that
> param is zero?
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/virtio/vulkan/vn_renderer_virtgpu.c#L617

Indeed, good catch

-- 
Best regards,
Dmitry

