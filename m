Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC5B73D10C
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 14:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A277610E166;
	Sun, 25 Jun 2023 12:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BB610E166
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 12:41:48 +0000 (UTC)
Received: from [192.168.2.254] (109-252-154-132.dynamic.spd-mgts.ru
 [109.252.154.132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D7F6F66031BB;
 Sun, 25 Jun 2023 13:41:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687696905;
 bh=0I1rLltUXkTnuQd/Jvq/oa9s7KLLg1FujdfDbdaVAKk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=P5ZIZ4UQKOsnlyXzqxUVqKQrAzvPU4bSOV3uz5j0Nmdim+LPgprXn5ucXF9fiCKSp
 76huK/CIkDaX9pT7AHfWvykF+cyojiAgGZ9TdRQuQiD0Yia7xueQWSiFFMzny7FNhS
 8O73csA8e/KRNaqvaseQhERP++r+ocEBniHGrcpLP76mfyrXsjIBffwoHtCbzjrfIu
 TXGDf4XZ4hEtDNVgVuT3jZgtfwdcIgAdlInclE2TezCUEdswbBevWdD2mXKA8F8ssW
 21GKN5ubwDAnXRtNOiPA7oVseYQzj6ri51mDCzxEeLzcSYHhPZxVk62XD93C5G9BMg
 ognpTBMa0dhxw==
Message-ID: <0ca8034d-0377-26b9-51c8-8caff6c4174a@collabora.com>
Date: Sun, 25 Jun 2023 15:41:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v6 3/3] drm/virtio: Support sync objects
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
 <20230416115237.798604-4-dmitry.osipenko@collabora.com>
 <CAMuHMdVrJsmQx8X-_Tnxir9W752Mdh8ye7ob2srtY+6HFDEMGw@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAMuHMdVrJsmQx8X-_Tnxir9W752Mdh8ye7ob2srtY+6HFDEMGw@mail.gmail.com>
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

On 6/25/23 11:47, Geert Uytterhoeven wrote:
> Hi Dmitry,
> 
> On Sun, Apr 16, 2023 at 1:55 PM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>> Add sync object DRM UAPI support to VirtIO-GPU driver. Sync objects
>> support is needed by native context VirtIO-GPU Mesa drivers, it also will
>> be used by Venus and Virgl contexts.
>>
>> Reviewed-by; Emil Velikov <emil.velikov@collabora.com>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/gpu/drm/virtio/virtgpu_submit.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
> 
>> +static int
>> +virtio_gpu_parse_deps(struct virtio_gpu_submit *submit)
>> +{
>> +       struct drm_virtgpu_execbuffer *exbuf = submit->exbuf;
>> +       struct drm_virtgpu_execbuffer_syncobj syncobj_desc;
>> +       size_t syncobj_stride = exbuf->syncobj_stride;
>> +       u32 num_in_syncobjs = exbuf->num_in_syncobjs;
>> +       struct drm_syncobj **syncobjs;
>> +       int ret = 0, i;
>> +
>> +       if (!num_in_syncobjs)
>> +               return 0;
>> +
>> +       /*
>> +        * kvalloc at first tries to allocate memory using kmalloc and
>> +        * falls back to vmalloc only on failure. It also uses GFP_NOWARN
> 
> GFP_NOWARN does not exist.

https://elixir.bootlin.com/linux/v6.4-rc7/source/include/linux/gfp_types.h#L38

-- 
Best regards,
Dmitry

