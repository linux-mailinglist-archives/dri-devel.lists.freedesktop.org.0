Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5F35A94F4
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 12:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC0C10E566;
	Thu,  1 Sep 2022 10:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EF810E566;
 Thu,  1 Sep 2022 10:44:50 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-13.nat.spd-mgts.ru
 [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7A7B86601E0A;
 Thu,  1 Sep 2022 11:44:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662029088;
 bh=4/2i4aqnQm0eD8QgJbBg2gvDYzIG/ZG1bPLe6WFo/t0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cLbqiE/dnqUzM66LeoPYWJt2ssxBDaSl7PG8koINMEoIuFiNO/S9FSirvSfstFJ7/
 +3XhwZuh6bULact7FUzNWp72rHVbpmo2vfjnT0bf8Qj3J1aisyK0iDijIGVuyPUkDB
 689ZWSP7OUdwJ6ZIL39SHAz6ocxJBaJqGoDfR10OvPmQYhlYOeoFfhDQEJIIzPL5bM
 BWvpDwgsTAnxEDtdvqtdec6MQmmV7eYnMN7pOGy4F132JMmubuV2LOmiSr77PlVDIj
 IQxQiPZ80EOR+8X3A/Gd+GCivXKpjYEhlMm0HDBHJ+PEbywTNtlYeAJTvojNfYCGzX
 QegYZmzerNARQ==
Message-ID: <213eb3d6-53aa-915e-9565-3209491feeee@collabora.com>
Date: Thu, 1 Sep 2022 13:44:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 06/21] drm/i915: Prepare to dynamic dma-buf locking
 specification
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
References: <20220831153757.97381-1-dmitry.osipenko@collabora.com>
 <20220831153757.97381-7-dmitry.osipenko@collabora.com>
 <2463ccb0-6620-8760-fc06-532847835207@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <2463ccb0-6620-8760-fc06-532847835207@amd.com>
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
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Gustavo Padovan <gustavo.padovan@collabora.com>, linux-media@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Juergen Gross <jgross@suse.com>,
 David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomba@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Qiang Yu <yuq825@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/1/22 09:45, Christian König wrote:
> Am 31.08.22 um 17:37 schrieb Dmitry Osipenko:
>> Prepare i915 driver to the common dynamic dma-buf locking convention
>> by starting to use the unlocked versions of dma-buf API functions
>> and handling cases where importer now holds the reservation lock.
>>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> Acked-by: Christian König <christian.koenig@amd.com>, but it's probably
> best if somebody from the Intel guys take a look as well.

+ Chris Wilson, who touched locks of __i915_gem_free_objects() recently

>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c       |  2 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c       | 12 ++++++++++++
>>   .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 16 ++++++++--------
>>   3 files changed, 21 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> index f5062d0c6333..07eee1c09aaf 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> @@ -72,7 +72,7 @@ static int i915_gem_dmabuf_vmap(struct dma_buf
>> *dma_buf,
>>       struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
>>       void *vaddr;
>>   -    vaddr = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
>> +    vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
>>       if (IS_ERR(vaddr))
>>           return PTR_ERR(vaddr);
>>   diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> index 389e9f157ca5..7e2a9b02526c 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -331,7 +331,19 @@ static void __i915_gem_free_objects(struct
>> drm_i915_private *i915,
>>               continue;
>>           }
>>   +        /*
>> +         * dma_buf_unmap_attachment() requires reservation to be
>> +         * locked. The imported GEM shouldn't share reservation lock,
>> +         * so it's safe to take the lock.
>> +         */
>> +        if (obj->base.import_attach)
>> +            i915_gem_object_lock(obj, NULL);
>> +
>>           __i915_gem_object_pages_fini(obj);
>> +
>> +        if (obj->base.import_attach)
>> +            i915_gem_object_unlock(obj);
>> +
>>           __i915_gem_free_object(obj);
>>             /* But keep the pointer alive for RCU-protected lookups */
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>> index 62c61af77a42..9e3ed634aa0e 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>> @@ -213,7 +213,7 @@ static int igt_dmabuf_import_same_driver(struct
>> drm_i915_private *i915,
>>           goto out_import;
>>       }
>>   -    st = dma_buf_map_attachment(import_attach, DMA_BIDIRECTIONAL);
>> +    st = dma_buf_map_attachment_unlocked(import_attach,
>> DMA_BIDIRECTIONAL);
>>       if (IS_ERR(st)) {
>>           err = PTR_ERR(st);
>>           goto out_detach;
>> @@ -226,7 +226,7 @@ static int igt_dmabuf_import_same_driver(struct
>> drm_i915_private *i915,
>>           timeout = -ETIME;
>>       }
>>       err = timeout > 0 ? 0 : timeout;
>> -    dma_buf_unmap_attachment(import_attach, st, DMA_BIDIRECTIONAL);
>> +    dma_buf_unmap_attachment_unlocked(import_attach, st,
>> DMA_BIDIRECTIONAL);
>>   out_detach:
>>       dma_buf_detach(dmabuf, import_attach);
>>   out_import:
>> @@ -296,7 +296,7 @@ static int igt_dmabuf_import(void *arg)
>>           goto out_obj;
>>       }
>>   -    err = dma_buf_vmap(dmabuf, &map);
>> +    err = dma_buf_vmap_unlocked(dmabuf, &map);
>>       dma_map = err ? NULL : map.vaddr;
>>       if (!dma_map) {
>>           pr_err("dma_buf_vmap failed\n");
>> @@ -337,7 +337,7 @@ static int igt_dmabuf_import(void *arg)
>>         err = 0;
>>   out_dma_map:
>> -    dma_buf_vunmap(dmabuf, &map);
>> +    dma_buf_vunmap_unlocked(dmabuf, &map);
>>   out_obj:
>>       i915_gem_object_put(obj);
>>   out_dmabuf:
>> @@ -358,7 +358,7 @@ static int igt_dmabuf_import_ownership(void *arg)
>>       if (IS_ERR(dmabuf))
>>           return PTR_ERR(dmabuf);
>>   -    err = dma_buf_vmap(dmabuf, &map);
>> +    err = dma_buf_vmap_unlocked(dmabuf, &map);
>>       ptr = err ? NULL : map.vaddr;
>>       if (!ptr) {
>>           pr_err("dma_buf_vmap failed\n");
>> @@ -367,7 +367,7 @@ static int igt_dmabuf_import_ownership(void *arg)
>>       }
>>         memset(ptr, 0xc5, PAGE_SIZE);
>> -    dma_buf_vunmap(dmabuf, &map);
>> +    dma_buf_vunmap_unlocked(dmabuf, &map);
>>         obj = to_intel_bo(i915_gem_prime_import(&i915->drm, dmabuf));
>>       if (IS_ERR(obj)) {
>> @@ -418,7 +418,7 @@ static int igt_dmabuf_export_vmap(void *arg)
>>       }
>>       i915_gem_object_put(obj);
>>   -    err = dma_buf_vmap(dmabuf, &map);
>> +    err = dma_buf_vmap_unlocked(dmabuf, &map);
>>       ptr = err ? NULL : map.vaddr;
>>       if (!ptr) {
>>           pr_err("dma_buf_vmap failed\n");
>> @@ -435,7 +435,7 @@ static int igt_dmabuf_export_vmap(void *arg)
>>       memset(ptr, 0xc5, dmabuf->size);
>>         err = 0;
>> -    dma_buf_vunmap(dmabuf, &map);
>> +    dma_buf_vunmap_unlocked(dmabuf, &map);
>>   out:
>>       dma_buf_put(dmabuf);
>>       return err;
> 


-- 
Best regards,
Dmitry
