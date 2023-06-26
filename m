Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B4873E454
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 18:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C07710E237;
	Mon, 26 Jun 2023 16:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A2310E237
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 16:11:49 +0000 (UTC)
Received: from [192.168.2.254] (109-252-154-132.dynamic.spd-mgts.ru
 [109.252.154.132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7E6D566003AC;
 Mon, 26 Jun 2023 17:11:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687795908;
 bh=9EZs0izTC9fT3uhYtjpxEXL0MLcsJc+fn/xx7LDWC30=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eW9yYPq6r+yhdEvGBX0mFerL6rT+zA/f5p+Aq+i+1Gvz7TmqJ3PZZCbxm5O9mxC0q
 +wsB3qZtEg6L+HAx2svRPhQWQW+uAjqweSzb5ZVPE96+wB2K6lfsiabzOX2s7HHEth
 vT+clsYUfkiTRmR+8m1P4NMY6iBMVAYZemw2KTMwYfdrud9xHPfIVtghLSrypMxSO1
 8mOxPCsDdm7DtudciYaTh1sRBkpx6H0zjiINaLQPalZvz59ETD2dSxQ2K4Us+qd8Nh
 f7DDiZEqwu3PHqtmtAnUgJaeZtg1Q1W4U9OfbF43uyvrvIQEhg5lpm2KKMvk1lAeW6
 7hsT1XtYiMYOA==
Message-ID: <2f4d3e96-1e10-3662-bfc5-8c361a4c1366@collabora.com>
Date: Mon, 26 Jun 2023 19:11:44 +0300
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
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAMuHMdWfE=6xFsYFv=mCACpwZp45AiCzFxEB=suEFBhv9ry5aw@mail.gmail.com>
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

On 6/25/23 18:36, Geert Uytterhoeven wrote:
> Hi Dmitry,
> 
> On Sun, Jun 25, 2023 at 2:41 PM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>> On 6/25/23 11:47, Geert Uytterhoeven wrote:
>>> On Sun, Apr 16, 2023 at 1:55 PM Dmitry Osipenko
>>> <dmitry.osipenko@collabora.com> wrote:
>>>> Add sync object DRM UAPI support to VirtIO-GPU driver. Sync objects
>>>> support is needed by native context VirtIO-GPU Mesa drivers, it also will
>>>> be used by Venus and Virgl contexts.
>>>>
>>>> Reviewed-by; Emil Velikov <emil.velikov@collabora.com>
>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>
>>> Thanks for your patch!
>>>
>>>> --- a/drivers/gpu/drm/virtio/virtgpu_submit.c
>>>> +++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
>>>
>>>> +static int
>>>> +virtio_gpu_parse_deps(struct virtio_gpu_submit *submit)
>>>> +{
>>>> +       struct drm_virtgpu_execbuffer *exbuf = submit->exbuf;
>>>> +       struct drm_virtgpu_execbuffer_syncobj syncobj_desc;
>>>> +       size_t syncobj_stride = exbuf->syncobj_stride;
>>>> +       u32 num_in_syncobjs = exbuf->num_in_syncobjs;
>>>> +       struct drm_syncobj **syncobjs;
>>>> +       int ret = 0, i;
>>>> +
>>>> +       if (!num_in_syncobjs)
>>>> +               return 0;
>>>> +
>>>> +       /*
>>>> +        * kvalloc at first tries to allocate memory using kmalloc and
>>>> +        * falls back to vmalloc only on failure. It also uses GFP_NOWARN
>>>
>>> GFP_NOWARN does not exist.
>>
>> https://elixir.bootlin.com/linux/v6.4-rc7/source/include/linux/gfp_types.h#L38
> 
> That line defines "__GFP_NOWARN", not "GFP_NOWARN".
> C is case- and underscore-sensitive. as is "git grep -w" ;-)

The removal of underscores was done intentionally for improving
readability of the comment

-- 
Best regards,
Dmitry

