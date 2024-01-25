Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F83F83CEF7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 22:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C5C10E0F7;
	Thu, 25 Jan 2024 21:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E95F10E0F7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 21:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706219811;
 bh=a8hfMqHEGvH+hPCINRceKqJZjJJ3zaZm6oEEjXubXRo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=39qnnPbdvuaxnc0JNHB37AqfHZ2dDcwUCODaMGK3NDGhG3Z1pwywzkSb4/dk4w+RO
 oa2tf+XNJLuYgc+yPLAlmMzEyIupgjUqQGGLhAYl4pxNyXK2/+uVG8G+tjuRlSfjjs
 uar3dsg+Zi+i4HsOUXTDQoNS99T9wr/YXMH9g+jUxhHjrCzyr6SLyKcTY2HlvaL2pV
 RcC8tY53zLvW8a6WaYbhMc4y0aMSYDAk1X8IHSQT0G5sRdwSObfNvAJtvIpCrZcz0C
 0q+PBIp4FH4P4i+hpiD4Adr1/oVdXKBy1p5FEugk/ALABkPNqKqIB3kR14S2/DBpKY
 lpGTII6la0koQ==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5803137813DA;
 Thu, 25 Jan 2024 21:56:50 +0000 (UTC)
Message-ID: <f4870543-e7f8-4ee6-924a-68ec7c25b293@collabora.com>
Date: Fri, 26 Jan 2024 00:56:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 22/30] drm/shmem-helper: Add common memory shrinker
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-23-dmitry.osipenko@collabora.com>
 <20240125111946.797a1e1e@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240125111946.797a1e1e@collabora.com>
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/25/24 13:19, Boris Brezillon wrote:
> On Fri,  5 Jan 2024 21:46:16 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
>> +static bool drm_gem_shmem_is_evictable(struct drm_gem_shmem_object *shmem)
>> +{
>> +	return (shmem->madv >= 0) && shmem->base.funcs->evict &&
>> +		refcount_read(&shmem->pages_use_count) &&
>> +		!refcount_read(&shmem->pages_pin_count) &&
>> +		!shmem->base.dma_buf && !shmem->base.import_attach &&
>> +		!shmem->evicted;
> 
> Are we missing
> 
>                 && dma_resv_test_signaled(shmem->base.resv,
> 					  DMA_RESV_USAGE_BOOKKEEP)
> 
> to make sure the GPU is done using the BO?
> The same applies to drm_gem_shmem_is_purgeable() BTW.
> 
> If you don't want to do this test here, we need a way to let drivers
> provide a custom is_{evictable,purgeable}() test.
> 
> I guess we should also expose drm_gem_shmem_shrinker_update_lru_locked()
> to let drivers move the GEMs that were used most recently (those
> referenced by a GPU job) at the end of the evictable LRU.

We have the signaled-check in the common drm_gem_evict() helper:

https://elixir.bootlin.com/linux/v6.8-rc1/source/drivers/gpu/drm/drm_gem.c#L1496

-- 
Best regards,
Dmitry

