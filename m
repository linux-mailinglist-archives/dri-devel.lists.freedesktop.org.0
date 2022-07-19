Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE90957A7F3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 22:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB56113631;
	Tue, 19 Jul 2022 20:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1E5112639;
 Tue, 19 Jul 2022 20:05:38 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-232.nat.spd-mgts.ru
 [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8773166019F4;
 Tue, 19 Jul 2022 21:05:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658261136;
 bh=87heNz60iY2xXlfWeCdMcHlfvOyIp4RDnOqiE+7EyOg=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=klOb5xsgl6l9ubftW1+ax0k9cZtkpR2szLSY0RrNAUUhC80j9cYIvyx7gq8L/l4sQ
 sCPxodFYLm8cs6LJuLmCgfGJsD8BX8RJ0cpaixj0UjYBDHsXPcXAJbLfScrWaMUl5X
 p/wkh4kyop0Xmmtp+8262aY0Wor62j5jd4HSYKZ370A48M7D5QrqJnsIscNmaC3Eia
 0j8c8rYOSxeZEg/93bpTWiR3rdmQr/8qej0g5rWxZsP9s0FIXV53EAVH1lMqfFhgYw
 HuVA4WjPXUPCS8++l3ROc0LKS5ut6fthJb9IwFqa8va09T/4H3uZb2AiQ7A5DufA3O
 IE4FiFlv7vybg==
Message-ID: <43446124-b99a-32d8-f797-7ec0cdca9ee4@collabora.com>
Date: Tue, 19 Jul 2022 23:05:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 4/6] dma-buf: Acquire wait-wound context on attachment
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
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
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>
References: <20220715005244.42198-1-dmitry.osipenko@collabora.com>
 <20220715005244.42198-5-dmitry.osipenko@collabora.com>
 <5ec9313e-8498-2838-0320-331c347ce905@amd.com>
 <1ce233a2-36c9-3698-59f0-c4ff902bec60@collabora.com>
In-Reply-To: <1ce233a2-36c9-3698-59f0-c4ff902bec60@collabora.com>
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/15/22 09:59, Dmitry Osipenko wrote:
> On 7/15/22 09:50, Christian König wrote:
>> Am 15.07.22 um 02:52 schrieb Dmitry Osipenko:
>>> Intel i915 GPU driver uses wait-wound mutex to lock multiple GEMs on the
>>> attachment to the i915 dma-buf. In order to let all drivers utilize
>>> shared
>>> wait-wound context during attachment in a general way, make dma-buf
>>> core to
>>> acquire the ww context internally for the attachment operation and update
>>> i915 driver to use the importer's ww context instead of the internal one.
>>>
>>>  From now on all dma-buf exporters shall use the importer's ww context
>>> for
>>> the attachment operation.
>>>
>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>> ---
>>>   drivers/dma-buf/dma-buf.c                     |  8 +++++-
>>>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  2 +-
>>>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
>>>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  6 ++---
>>>   drivers/gpu/drm/i915/i915_gem_evict.c         |  2 +-
>>>   drivers/gpu/drm/i915/i915_gem_ww.c            | 26 +++++++++++++++----
>>>   drivers/gpu/drm/i915/i915_gem_ww.h            | 15 +++++++++--
>>>   7 files changed, 47 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index 0ee588276534..37545ecb845a 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -807,6 +807,8 @@ static struct sg_table * __map_dma_buf(struct
>>> dma_buf_attachment *attach,
>>>    * Optionally this calls &dma_buf_ops.attach to allow
>>> device-specific attach
>>>    * functionality.
>>>    *
>>> + * Exporters shall use ww_ctx acquired by this function.
>>> + *
>>>    * Returns:
>>>    *
>>>    * A pointer to newly created &dma_buf_attachment on success, or a
>>> negative
>>> @@ -822,6 +824,7 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf
>>> *dmabuf, struct device *dev,
>>>                   void *importer_priv)
>>>   {
>>>       struct dma_buf_attachment *attach;
>>> +    struct ww_acquire_ctx ww_ctx;
>>>       int ret;
>>>         if (WARN_ON(!dmabuf || !dev))
>>> @@ -841,7 +844,8 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf
>>> *dmabuf, struct device *dev,
>>>       attach->importer_ops = importer_ops;
>>>       attach->importer_priv = importer_priv;
>>>   -    dma_resv_lock(dmabuf->resv, NULL);
>>> +    ww_acquire_init(&ww_ctx, &reservation_ww_class);
>>> +    dma_resv_lock(dmabuf->resv, &ww_ctx);
>>
>> That won't work like this. The core property of a WW context is that you
>> need to unwind all the locks and re-quire them with the contended one
>> first.
>>
>> When you statically lock the imported one here you can't do that any more.
> 
> You're right. I felt that something is missing here, but couldn't
> notice. I'll think more about this and enable
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH. Thank you!
> 

Christian, do you think we could make an excuse for the attach()
callback and make the exporter responsible for taking the resv lock? It
will be inconsistent with the rest of the callbacks, where importer
takes the lock, but it will be the simplest and least invasive solution.
It's very messy to do a cross-driver ww locking, I don't think it's the
right approach.

-- 
Best regards,
Dmitry
