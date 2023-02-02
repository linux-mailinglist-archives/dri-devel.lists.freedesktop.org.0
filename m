Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFDE687352
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 03:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B869A10E2CF;
	Thu,  2 Feb 2023 02:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB8F10E2CF
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 02:24:40 +0000 (UTC)
Received: from [192.168.2.198] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A465E6602EDA;
 Thu,  2 Feb 2023 02:24:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675304678;
 bh=O7D57L/MkShqbKOayb5xmFxvMtKT+SAzvwX0Avef/Eg=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=lD0JJntIMIBzhxQKEQ4z0hUzoTcK4C/p946u3F+Ifqwm7134WuLI9wnIbEbKF97ps
 j2a+OV+GOhiiUnlmF0mZe89DyVVQGpTEirfhTqciDJznLC+gFRYsnkykUNds8WJCvo
 0J9/lIqKk+fD1AeXWWh2hkhGyH2kT1iO0OfosfoVEL+z1DqTGGzrgXU8ojiuTDInA1
 uelYh6pgk+WcdrchmjAAIY7bsf5h9W5mPwPQVrYEBfQ8TrsUwsEAucxX793spfquAy
 yX6xYrITvelzvuLI/vxcTFqycRvr8DQOyjlQzkACQ/7YHJDLrK+q1f7MPmiZJJLeHN
 BfLFBkp6t1i+g==
Message-ID: <3d347ccc-5867-4a64-a94c-c6141624571e@collabora.com>
Date: Thu, 2 Feb 2023 05:24:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/virtio: exbuf->fence_fd unmodified on interrupted wait
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Rob Clark <robdclark@chromium.org>
References: <20230126225815.1518839-1-ryanneph@chromium.org>
 <dee14d1b-fc28-e867-b425-ab11c31d799d@collabora.com>
 <CAJs_Fx4w-a0t9ekHvV55Ys6dYuTsKMa=az9E3UZcsej5AYNdGQ@mail.gmail.com>
 <08560b81-5f97-bd6f-3af0-68cba6bc0bd8@collabora.com>
In-Reply-To: <08560b81-5f97-bd6f-3af0-68cba6bc0bd8@collabora.com>
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
Cc: Ryan Neph <ryanneph@chromium.org>, Yiwei Zhang <zzyiwei@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/2/23 05:17, Dmitry Osipenko wrote:
> On 2/1/23 18:48, Rob Clark wrote:
>> On Wed, Feb 1, 2023 at 5:28 AM Dmitry Osipenko
>> <dmitry.osipenko@collabora.com> wrote:
>>>
>>> On 1/27/23 01:58, Ryan Neph wrote:
>>>> An interrupted dma_fence_wait() becomes an -ERESTARTSYS returned
>>>> to userspace ioctl(DRM_IOCTL_VIRTGPU_EXECBUFFER) calls, prompting to
>>>> retry the ioctl(), but the passed exbuf->fence_fd has been reset to -1,
>>>> making the retry attempt fail at sync_file_get_fence().
>>>>
>>>> The uapi for DRM_IOCTL_VIRTGPU_EXECBUFFER is changed to retain the
>>>> passed value for exbuf->fence_fd when returning ERESTARTSYS or EINTR.
>>>>
>>>> Fixes: 2cd7b6f08bc4 ("drm/virtio: add in/out fence support for explicit synchronization")
>>>> Signed-off-by: Ryan Neph <ryanneph@chromium.org>
>>>> ---
>>>>
>>>>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 9 ++++++---
>>>>  include/uapi/drm/virtgpu_drm.h         | 3 +++
>>>>  2 files changed, 9 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
>>>> index 9f4a90493aea..ffce4e2a409a 100644
>>>> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
>>>> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
>>>> @@ -132,6 +132,8 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>>>>       uint64_t fence_ctx;
>>>>       uint32_t ring_idx;
>>>>
>>>> +     exbuf->fence_fd = -1;
>>>> +
>>>>       fence_ctx = vgdev->fence_drv.context;
>>>>       ring_idx = 0;
>>>>
>>>> @@ -152,8 +154,6 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>>>>               ring_idx = exbuf->ring_idx;
>>>>       }
>>>>
>>>> -     exbuf->fence_fd = -1;
>>>
>>> Is there any userspace relying on this -1 behaviour? Wouldn't be better
>>> to remove this offending assignment?
>>
>> Looking at current mesa, removing the assignment should be ok (and
>> more consistent with other drivers).  But I can't say if this was
>> always true, or that there aren't other non-mesa users, so I can see
>> the argument for the more conservative uabi change that this patch
>> went with.
> 
> Realistically, Mesa is the only user of this IOCTL. In general, in a
> such case of doubt, I'll do the UABI change and then wait for complains.
> If there is a complaint, then the change is reverted. Also will be good
> to know about existence of other users :)
> 
> Given that -1 already wasn't consistently set for all error code paths,
> it's tempting to see it removed.
> 
> The code change of this patch is trivial, hence should fine to keep the
> -1 if you prefer that, but the patch won't apply cleanly to the stable
> kernels because of the "exbuf->fence_fd = -1" movement. If stable
> maintainers won't put effort into rebasing the patch, then better to do
> the removal and live with a cleaner driver code, IMO.

Although, there will be a merge conflict either way. I'll give the r-b,
still removing -1 feels more attractive to me.

-- 
Best regards,
Dmitry

