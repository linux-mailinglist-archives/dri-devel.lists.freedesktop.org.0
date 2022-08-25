Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D1C5A1139
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 14:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC0F10E1ED;
	Thu, 25 Aug 2022 12:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E80810E1ED;
 Thu, 25 Aug 2022 12:55:39 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-13.nat.spd-mgts.ru
 [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9EE1B6601DC3;
 Thu, 25 Aug 2022 13:55:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661432138;
 bh=8ivHC7JnTHAfG9ihlha3bu++8MKRkyY9YpxvJiw/v5A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BnLPmjiVEH4pa5B6MTFbNKfs40dmMNj8CIx/RwT09kuxL5i/LtGW4LvAUtP+LtZLa
 Ne3G7ntS5elIx2uEXOi9TM/I0PKayAcOV7qxsuqa6Ccrgvt1kT6jj8htyGtaa+XJ1S
 ErdKSqnINd+JDnKk7nUfzPcWP1/J2h/idt9HUwWVkx0dUKbnibZ3AXJem/5plydRQT
 mV3Zsl9bewPF12cslSAL4xvqRDDjsO1+ijRRqEbVewsqR2KqHrNE8dvKvveU/RwNOe
 kpxwemh83WVAwbJwgBdo/DgYklBQrXXZMCkA9uRFEnT8uWm5NNZ+uMqETXuzY6cmoU
 Tl/TsRTeVUs3A==
Message-ID: <bb1e159b-26f3-a158-0263-9e6b9cef0174@collabora.com>
Date: Thu, 25 Aug 2022 15:55:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [Linaro-mm-sig] [PATCH v3 6/9] dma-buf: Move dma-buf attachment
 to dynamic locking specification
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>
References: <20220824102248.91964-1-dmitry.osipenko@collabora.com>
 <20220824102248.91964-7-dmitry.osipenko@collabora.com>
 <055c3c05-ac4c-430e-f2b9-08f000acf435@gmail.com>
 <25d6b7e7-bbcc-7613-42d1-13c2b9ab2937@collabora.com>
 <e7576ab7-ff1e-e6da-b0fd-0315f1b37ed1@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <e7576ab7-ff1e-e6da-b0fd-0315f1b37ed1@amd.com>
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
Cc: lima@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/24/22 20:45, Christian König wrote:
> Am 24.08.22 um 17:49 schrieb Dmitry Osipenko:
>> On 8/24/22 18:24, Christian König wrote:
>>> Am 24.08.22 um 12:22 schrieb Dmitry Osipenko:
>>>> Move dma-buf attachment API functions to the dynamic locking
>>>> specification.
>>>> The strict locking convention prevents deadlock situations for dma-buf
>>>> importers and exporters.
>>>>
>>>> Previously, the "unlocked" versions of the attachment API functions
>>>> weren't taking the reservation lock and this patch makes them to take
>>>> the lock.
>>>>
>>>> Intel and AMD GPU drivers already were mapping the attached dma-bufs
>>>> under
>>>> the held lock during attachment, hence these drivers are updated to use
>>>> the locked functions.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>> ---
>>>>    drivers/dma-buf/dma-buf.c                  | 115
>>>> ++++++++++++++-------
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |   4 +-
>>>>    drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |   8 +-
>>>>    drivers/gpu/drm/i915/gem/i915_gem_object.c |  12 +++
>>>>    include/linux/dma-buf.h                    |  20 ++--
>>>>    5 files changed, 110 insertions(+), 49 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>>> index 4556a12bd741..f2a5a122da4a 100644
>>>> --- a/drivers/dma-buf/dma-buf.c
>>>> +++ b/drivers/dma-buf/dma-buf.c
>>>> @@ -559,7 +559,7 @@ static struct file *dma_buf_getfile(struct dma_buf
>>>> *dmabuf, int flags)
>>>>     * 2. Userspace passes this file-descriptors to all drivers it wants
>>>> this buffer
>>>>     *    to share with: First the file descriptor is converted to a
>>>> &dma_buf using
>>>>     *    dma_buf_get(). Then the buffer is attached to the device using
>>>> - *    dma_buf_attach().
>>>> + *    dma_buf_attach_unlocked().
>>> Now I get why this is confusing me so much.
>>>
>>> The _unlocked postfix implies that there is another function which
>>> should be called with the locks already held, but this is not the case
>>> for attach/detach (because they always need to grab the lock
>>> themselves).
>> That's correct. The attach/detach ops of exporter can take the lock
>> (like i915 exporter does it), hence importer must not grab the lock
>> around dma_buf_attach() invocation.
>>
>>> So I suggest to drop the _unlocked postfix for the attach/detach
>>> functions. Another step would then be to unify attach/detach with
>>> dynamic_attach/dynamic_detach when both have the same locking convention
>>> anyway.
>> It's not a problem to change the name, but it's unclear to me why we
>> should do it. The _unlocked postfix tells importer that reservation must
>> be unlocked and it must be unlocked in case of dma_buf_attach().
>>
>> Dropping the postfix will make dma_buf_attach() inconsistent with the
>> rest of the _unlocked functions(?). Are you sure we need to rename it?
> 
> The idea of the postfix was to distinguish between two different
> versions of the same function, e.g. dma_buf_vmap_unlocked() vs normal
> dma_buf_vmap().
> 
> When we don't have those two types of the same function I don't think it
> makes to much sense to keep that. We should just properly document which
> functions expect what and that's what your documentation patch does.

Thank you for the clarification. I'll change the names in v4 like you're
suggesting, we can always improve naming later on if will be necessary.

-- 
Best regards,
Dmitry
