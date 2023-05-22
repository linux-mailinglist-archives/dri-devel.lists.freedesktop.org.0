Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D606B70BFBF
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 15:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADE910E158;
	Mon, 22 May 2023 13:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0A910E158;
 Mon, 22 May 2023 13:28:03 +0000 (UTC)
Received: from [192.168.2.171] (109-252-147-95.dynamic.spd-mgts.ru
 [109.252.147.95])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4B93C6606D84;
 Mon, 22 May 2023 14:27:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1684762079;
 bh=keD/935Zu/vg8AvzQ/mBIJs8+l9o00PBHzFnRJHLzSg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DIyoGQY28KPe9vMso5QxUo+B+LjI47cH/U4JwbRsIiakuaiBSF/Y7imIYc/jDeXp8
 +wc9lthaCS+AlUh+d5looWfz4hmwb0n/H5azQr5MVPfR8jaUD0R1SXwnufnJTrVL69
 lIBXFbCYtxb4/OQ0m3YJveSKWwZ9TPETWj8txE4eYmPaSpI8XCkV+N8L/IHlhJPafV
 59NZeqgqi1BB3nFLZVrnu28Pi4a+LFs8cpygwYjTK3JjRmaL/WujfMnZlzN7hVte1B
 71W3VJWvV4T+e7VJJgD7pcZyh2Ry2S0QAlJtUkubAkrX9ypCaFK2g6cfDyKmqSBVwG
 YSaELA4697lcw==
Message-ID: <abc2a8ab-0969-fbb6-8dec-b15c81df38e4@collabora.com>
Date: Mon, 22 May 2023 16:27:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 6/6] drm/shmem-helper: Switch to reservation lock
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20230521205112.150206-1-dmitry.osipenko@collabora.com>
 <20230521205112.150206-7-dmitry.osipenko@collabora.com>
 <CACvgo52QvmZw5k_9dmBHPB25rTdLZJzVG_vNFr8or+3f5sVO=Q@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CACvgo52QvmZw5k_9dmBHPB25rTdLZJzVG_vNFr8or+3f5sVO=Q@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 intel-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomi Valkeinen <tomba@kernel.org>,
 linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 Tomasz Figa <tfiga@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/22/23 16:02, Emil Velikov wrote:
> Hi Dmitry,
> 
> Saw v3 fly by, so I had a quick look. Original RB still stands,
> although I noticed a couple of non-blocking nitpicks.
> 
> On Sun, 21 May 2023 at 22:00, Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
> 
>> -static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
>> +static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
>>  {
> 
> Should this getter have a dma_resv_assert_held(shmem->base.resv); like
> it's put brethren?
> 
> 
>> -void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
>> +static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
>> +{
>> +       int ret;
>> +
>> +       dma_resv_assert_held(shmem->base.resv);
>> +
>> +       ret = drm_gem_shmem_get_pages(shmem);
>> +
>> +       return ret;
> 
> With the assert_held in the getter, it would be less confusing to
> inline this and the unpin_locked functions.
> 
>> +}
>> +
>> +static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
>>  {
>> -       mutex_lock(&shmem->pages_lock);
>> -       drm_gem_shmem_put_pages_locked(shmem);
>> -       mutex_unlock(&shmem->pages_lock);
>> +       dma_resv_assert_held(shmem->base.resv);
>> +
>> +       drm_gem_shmem_put_pages(shmem);
> 
> Side note: the putter has an assert_held so the extra one here seems quite odd.
> 
> As said at the top - with or w/o these nitpicks, the original RB still stands.

Good catch. I actually added assert_held to get_pages(), but in a later
patch that is not part of this series.

-- 
Best regards,
Dmitry

