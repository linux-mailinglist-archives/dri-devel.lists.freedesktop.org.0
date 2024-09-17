Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDA697B5B4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 00:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AB110E073;
	Tue, 17 Sep 2024 22:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="bEbt+zpw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62BE10E073
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 22:25:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1726611932; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TK3QtPoln0vigcTnUyuqlE0nGwp1r+aK6TuJqtxT20kIY426qq3nTgY4Q7ZdtXUaLVCh7Y9DkuyTrlrq+whjs/MnTmTQCvbHHLlFCIoWTRSNBIHe/ulIUV5WgkRH6jKOLL1TsGpl036zaN3dqjp0lmcGyKKSkJV/CSHbzlS7nkU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1726611932;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=rsH7dvW1ZumATf6cE8qsAtsxeyH/9HLwWHD7YdY+nfM=; 
 b=JgJ41jYFNH7gsAixWdkKoPFiRhb7la94zUo1QtOh75YZ6wOxD3JHqQy4e9Y7jBlyq1/fw/qzibLfneWgk5ZmI50Hag+aMkgFoD1tyjOpf8gtf+Gqa8v8C20xmXkx4IiYS5PbVausUZcRn5Dn8AfBIsx7/gSC595iTTYNiC7F7Uc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726611932; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=rsH7dvW1ZumATf6cE8qsAtsxeyH/9HLwWHD7YdY+nfM=;
 b=bEbt+zpw29f1/+DkjKLtQ8xEIFKsb1GDqiccbtiwsLgUo8WQLkBL9LRcPdpGhx9A
 oFP5ZlL+ZH6c1kExsMWjVmEu+vs46oO6TpQNDMQxSsQ2x522HdNMcXtoD2vosNh7ZeL
 /rfFXEL5OGr617gdBldngsve/1V4iDu+7v+on8H4=
Received: by mx.zohomail.com with SMTPS id 1726611930725708.4577627445916;
 Tue, 17 Sep 2024 15:25:30 -0700 (PDT)
Message-ID: <add9612c-807e-4cc6-83fe-620ba7a905d1@collabora.com>
Date: Wed, 18 Sep 2024 01:25:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/virtio: Defer the host dumb buffer creation
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
References: <20240903075414.297622-1-jfalempe@redhat.com>
 <dc88e7b9-ff0d-4405-88d1-bd94df550ae7@collabora.com>
 <958c8191-7266-4ed6-b745-01cb0e4560f8@redhat.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <958c8191-7266-4ed6-b745-01cb0e4560f8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

On 9/11/24 11:04, Jocelyn Falempe wrote:
...
>>> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
>>> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
>>> @@ -75,7 +75,6 @@ int virtio_gpu_mode_dumb_create(struct drm_file
>>> *file_priv,
>>>       args->size = pitch * args->height;
>>>       args->size = ALIGN(args->size, PAGE_SIZE);
>>>   -    params.format =
>>> virtio_gpu_translate_format(DRM_FORMAT_HOST_XRGB8888);
>>
>> This will break the guest blob code path in virtio_gpu_object_create(),
>> AFAICT.
> 
> The params.format is not used in virtio_gpu_cmd_resource_create_3d() nor
> in virtio_gpu_cmd_resource_create_blob(), it's only used for dumb buffer
> creation. So it shouldn't break the guest blob path.

Indeed

>>>       params.width = args->width;
>>>       params.height = args->height;
>>>       params.size = args->size;
>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c
>>> b/drivers/gpu/drm/virtio/virtgpu_object.c
>>> index c7e74cf130221..b5a537a761294 100644
>>> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
>>> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
>>> @@ -67,6 +67,8 @@ void virtio_gpu_cleanup_object(struct
>>> virtio_gpu_object *bo)
>>>         virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
>>>       if (virtio_gpu_is_shmem(bo)) {
>>> +        if (bo->deferred)
>>> +            kvfree(bo->ents);
>>>           drm_gem_shmem_free(&bo->base);
>>>       } else if (virtio_gpu_is_vram(bo)) {
>>>           struct virtio_gpu_object_vram *vram = to_virtio_gpu_vram(bo);
>>> @@ -228,10 +230,13 @@ int virtio_gpu_object_create(struct
>>> virtio_gpu_device *vgdev,
>>>           virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
>>>                             objs, fence);
>>>           virtio_gpu_object_attach(vgdev, bo, ents, nents);
>>> -    } else {
>>> -        virtio_gpu_cmd_create_resource(vgdev, bo, params,
>>> -                           objs, fence);
>>> -        virtio_gpu_object_attach(vgdev, bo, ents, nents);
>>> +    } else if (params->dumb) {
>>> +        /* Create the host resource in
>>> virtio_gpu_user_framebuffer_create()
>>> +         * because the pixel format is not specified yet
>>> +         */
>>> +        bo->ents = ents;
>>> +        bo->nents = nents;
>>> +        bo->deferred = true;
>>>       }
>>
>> AFAICS, the "params.dumb = true" should be set in
>> virtio_gpu_mode_dumb_create() and not in virtio_gpu_deferred_create().
>> Was this patch tested?
> 
> You're right that params.dumb is not used in
> virtio_gpu_cmd_create_resource() so it's useless to set it in
> virtio_gpu_deferred_create(). I can remove that line.
> But it's also set in virtio_gpu_mode_dumb_create() and I didn't change
> that with this patch.
> 
> I'm testing on a s390x machine, and it allows wayland compositor to
> work. (The colors are still a mess, but at least it starts with this
> patch).

The commit message of patch #2 says that it's fbdev that doesn't work
because it uses BGRX8888, i.e. wayland should work without this patch,
isn't it?

Please try to find why colors are wrong, could become that we won't need
this patch anymore once you'll figure out the root of the problem.

-- 
Best regards,
Dmitry

