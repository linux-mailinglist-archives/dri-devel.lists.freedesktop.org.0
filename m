Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B68AC759E05
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 20:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE52F10E4F4;
	Wed, 19 Jul 2023 18:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA48710E4F4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 18:58:33 +0000 (UTC)
Received: from [192.168.2.126] (109-252-154-2.dynamic.spd-mgts.ru
 [109.252.154.2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 741D16607050;
 Wed, 19 Jul 2023 19:58:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689793112;
 bh=TGv8e/l9mvStXaorCqqEd0PI/jyLliAA3UPEWTX1zOQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QMOeHeeq581u0o/Yojl7ZQXaaSpfb+YSkQDIJm7JB1gQBXriCBCQ3mOgUNTGc5CjO
 9EiaZLo3u5PTyFjPjs/jYOBj0WO54mAhCdD7mQCVvDy0ZUxUqFNQJx1uezHjoqLpSe
 +SvrpOuuSSZVl632BV6+Qtrj39yFOcsOttrd51MBQtBn5dXNzv6MBWRF6fIt5AQrLC
 n1kpPFcxRAdWjpYBNKCPZoh+A34ShjsUKT/4sQRUMQxjV4/u5/4st6bnFt23geL4W7
 ZggrLuc5zlm2kCmqU+Db2gp41LwdkvlwBhjvbxshPr9M+FIxwHOMgY5mI4Mfw19E8v
 LrVTlCnM6Qetg==
Message-ID: <259ffa89-39d9-5c00-c70c-0cb26a6aab65@collabora.com>
Date: Wed, 19 Jul 2023 21:58:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v6 3/3] drm/virtio: Support sync objects
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
 <20230416115237.798604-4-dmitry.osipenko@collabora.com>
 <CAMuHMdVrJsmQx8X-_Tnxir9W752Mdh8ye7ob2srtY+6HFDEMGw@mail.gmail.com>
 <0ca8034d-0377-26b9-51c8-8caff6c4174a@collabora.com>
 <CAMuHMdWfE=6xFsYFv=mCACpwZp45AiCzFxEB=suEFBhv9ry5aw@mail.gmail.com>
 <2f4d3e96-1e10-3662-bfc5-8c361a4c1366@collabora.com>
 <CAMuHMdV924gJs1X1nMUbQ5LEbFe8hrrXgxxvgZ_dXf95O0bK5Q@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAMuHMdV924gJs1X1nMUbQ5LEbFe8hrrXgxxvgZ_dXf95O0bK5Q@mail.gmail.com>
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 kernel@collabora.com, virtualization@lists.linux-foundation.org,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

27.06.2023 15:01, Geert Uytterhoeven пишет:
> Hi Dmitry,
> 
> On Mon, Jun 26, 2023 at 6:11 PM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>> On 6/25/23 18:36, Geert Uytterhoeven wrote:
>>> On Sun, Jun 25, 2023 at 2:41 PM Dmitry Osipenko
>>> <dmitry.osipenko@collabora.com> wrote:
>>>> On 6/25/23 11:47, Geert Uytterhoeven wrote:
>>>>> On Sun, Apr 16, 2023 at 1:55 PM Dmitry Osipenko
>>>>> <dmitry.osipenko@collabora.com> wrote:
>>>>>> Add sync object DRM UAPI support to VirtIO-GPU driver. Sync objects
>>>>>> support is needed by native context VirtIO-GPU Mesa drivers, it also will
>>>>>> be used by Venus and Virgl contexts.
>>>>>>
>>>>>> Reviewed-by; Emil Velikov <emil.velikov@collabora.com>
>>>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>>>
>>>>> Thanks for your patch!
>>>>>
>>>>>> --- a/drivers/gpu/drm/virtio/virtgpu_submit.c
>>>>>> +++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
>>>>>
>>>>>> +static int
>>>>>> +virtio_gpu_parse_deps(struct virtio_gpu_submit *submit)
>>>>>> +{
>>>>>> +       struct drm_virtgpu_execbuffer *exbuf = submit->exbuf;
>>>>>> +       struct drm_virtgpu_execbuffer_syncobj syncobj_desc;
>>>>>> +       size_t syncobj_stride = exbuf->syncobj_stride;
>>>>>> +       u32 num_in_syncobjs = exbuf->num_in_syncobjs;
>>>>>> +       struct drm_syncobj **syncobjs;
>>>>>> +       int ret = 0, i;
>>>>>> +
>>>>>> +       if (!num_in_syncobjs)
>>>>>> +               return 0;
>>>>>> +
>>>>>> +       /*
>>>>>> +        * kvalloc at first tries to allocate memory using kmalloc and
>>>>>> +        * falls back to vmalloc only on failure. It also uses GFP_NOWARN
>>>>>
>>>>> GFP_NOWARN does not exist.
>>>>
>>>> https://elixir.bootlin.com/linux/v6.4-rc7/source/include/linux/gfp_types.h#L38
>>>
>>> That line defines "__GFP_NOWARN", not "GFP_NOWARN".
>>> C is case- and underscore-sensitive. as is "git grep -w" ;-)
>>
>> The removal of underscores was done intentionally for improving
>> readability of the comment
> 
> Please don't do that, as IMHO it actually hampers readability:
>   1. For some xxx, both GFP_xxx and __GFP_xxx are defined,
>      so it does matter which one you are referring to,
>   2. After dropping the underscores, "git grep -w" can no longer find
>      the definition, nor its users.
> 
> Thanks!

Alright, I'll change it

-- 
Best regards,
Dmitry

