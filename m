Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4552078664C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 05:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1805310E4DC;
	Thu, 24 Aug 2023 03:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4712B10E4DC
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 03:52:41 +0000 (UTC)
Received: from [192.168.2.140] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 870806606F7E;
 Thu, 24 Aug 2023 04:52:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692849159;
 bh=aiizSf7cqexCebKr3P/0O6hFaSD8hMGdv6+zNqXvdLU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Bg7l0AYDVB6WgpDo5zRv//faUBuwIn7NVF81s47kpjZ0/duIoXPnwiQgz0EPP7Njo
 OFhN4/glNzvJyxafs1B8ebZpAW0PZPko+7/jfQ5qnYG0mcWrlGRYEOp0ZQVH715atC
 vgEZCQ+FdHjpWcDtg/jzUD4fLz9hiWlH1TQpGnJOXC15mQn5l3bUSaV9SGeSGNbYIO
 Qw89eC+upwxG0N6ldgjeSTA5k755hbgyLou8fFF4CC8iKENLTmmSpWxlR/sVIT82L3
 BQW1tZ4GkKKIYCsVZa7/anvp5qpsAHGvHLYEAbgVFEdGq3eXCnSvKAABzmZHJI/Cr/
 Cufi6uZ9lgrqA==
Message-ID: <535626da-0958-7c42-7bc1-6f7c0f805634@collabora.com>
Date: Thu, 24 Aug 2023 06:52:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 3/3] drm/virtio: drm_gem_plane_helper_prepare_fb for
 obj synchronization
To: "Kim, Dongwon" <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org
References: <20230712224424.30158-1-dongwon.kim@intel.com>
 <20230712224424.30158-4-dongwon.kim@intel.com>
 <04181690-adc2-fc30-d1b4-b6ca5b02a142@collabora.com>
 <8689536c-4760-a32b-76f4-65c022b5eadc@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <8689536c-4760-a32b-76f4-65c022b5eadc@intel.com>
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

On 8/20/23 23:58, Kim, Dongwon wrote:
> On 8/17/2023 7:33 PM, Dmitry Osipenko wrote:
>> On 7/13/23 01:44, Dongwon Kim wrote:
>>> This helper is needed for framebuffer synchronization. Old
>>> framebuffer data
>>> is often displayed on the guest display without this helper.
>>>
>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
>>> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
>>> ---
>>>   drivers/gpu/drm/virtio/virtgpu_plane.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c
>>> b/drivers/gpu/drm/virtio/virtgpu_plane.c
>>> index a063f06ab6c5..e197299489ce 100644
>>> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
>>> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
>>> @@ -26,6 +26,7 @@
>>>   #include <drm/drm_atomic_helper.h>
>>>   #include <drm/drm_damage_helper.h>
>>>   #include <drm/drm_fourcc.h>
>>> +#include <drm/drm_gem_atomic_helper.h>
>>>     #include "virtgpu_drv.h"
>>>   @@ -271,6 +272,9 @@ static int virtio_gpu_plane_prepare_fb(struct
>>> drm_plane *plane,
>>>       vgfb = to_virtio_gpu_framebuffer(new_state->fb);
>>>       vgplane_st = to_virtio_gpu_plane_state(new_state);
>>>       bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
>>> +
>>> +    drm_gem_plane_helper_prepare_fb(plane, new_state);
>> The implicit display BO sync should happen on a host side, unless you're
>> rendering with Venus and then displaying with virgl. Doing it on guest
>> side should be a major performance hit. Please provide a complete
>> description of your setup: what VMM you use, config options, what tests
>> you're running.
> 
> We use virtio-gpu as a kms device while using i915 as the render device
> in our setup.
> And we use QEMU as VMM. Virtio-gpu driver flushes the scanout to QEMU as
> a blob resource
> (reference to the buffer). QEMU then creates a dmabuf using udmabuf for
> the blob
> then renders it as a texture using OGL. The test I ran is simple. Just
> starting terminal
> app and typing things to see if there is any frame regression. I believe
> this helper is
> required since the BO on the guest is basically dmabuf that is being
> shared between i915
> and virtio-gpu driver. I didn't think about the performance impact. If
> the impact is
> too much and that is not acceptable, is there any other suggestions or
> some tests I can try?

You can do fence-wait in the guest userspace/Mesa after blitting/drawing
to the udmabuf.

You may run popular vk/gl gfx benchmarks using gl/sdl outputs to see the
fps impact.

Virglrender today supports native contexts. The method you're using for
GPU priming was proven to be slow in comparison to multi-gpu native
contexts. There is ongoing work for supporting fence passing from guest
to host [1] that allows to do fence-syncing on host. You'll find links
to the WIP virtio-intel native context in [1] as well. You won't find
GPU priming support using native context in [1], patches hasn't been
published yet.

[1]
https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1138

Note that in general it's not acceptable to upstream patches that serve
downstream only. Yours display sync issue is irrelevant to the upstream
stack unless you're going to upstream all the VMM and guest userspace
patches, and in such case you should always publish all the patches and
provide links.

So, you need to check the performance impact and publish all the patches
to the relevant upstream projects.

-- 
Best regards,
Dmitry

