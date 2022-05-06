Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CAD51CDA5
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 02:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F3410FF46;
	Fri,  6 May 2022 00:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048E410FF55
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 00:10:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id D9EA71F45E0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651795847;
 bh=8HWc5okoCATXQtSjnHcBZ94vd08tA8gZnAW7NIzIUzc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=E69M8Dpbytxm+liBztEXWxOxgJF11w/CzN4vstE4Ks1/CK+R54ymWAG8WhQ11Z3it
 UTIE6yFWtxaLarXDEtc1FXzyvLjbznINeNlstPpA/8NTxjU+0cl6o7qv4HCz9h8i2o
 YM3d+HYGQ09TSTZDF+orUvlE6/iycVSKZ98/O8I54xjCdcd8/z5KAFanNwPBZIRDQq
 QDCWPKlrh/drnIXxITfMDB+g+ErN5tUhFyTcnvdRojYEy1/dguLfyKPtPIXA7ynU7a
 5af+OKmMvexH7qR6EjSif8Bdmzw4QMIXr7cl/RyeaX8mvcbPPS7sASgtcr6r7aQrRL
 bjxSeX9NGH/gQ==
Message-ID: <ff97790a-fb64-1e15-74b4-59c807bce0b9@collabora.com>
Date: Fri, 6 May 2022 03:10:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 11/15] drm/shmem-helper: Add generic memory shrinker
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20220417223707.157113-1-dmitry.osipenko@collabora.com>
 <20220417223707.157113-12-dmitry.osipenko@collabora.com>
 <e6108e9c-6e67-2d71-0665-654e11d9c3a5@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <e6108e9c-6e67-2d71-0665-654e11d9c3a5@suse.de>
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
Cc: Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/5/22 11:34, Thomas Zimmermann wrote:
> Hi
> 
> Am 18.04.22 um 00:37 schrieb Dmitry Osipenko:
>> Introduce a common DRM SHMEM shrinker. It allows to reduce code
>> duplication among DRM drivers that implement theirs own shrinkers.
>> This is initial version of the shrinker that covers basic needs of
>> GPU drivers, both purging and eviction of shmem objects are supported.
>>
>> This patch is based on a couple ideas borrowed from Rob's Clark MSM
>> shrinker and Thomas' Zimmermann variant of SHMEM shrinker.
>>
>> In order to start using DRM SHMEM shrinker drivers should:
>>
>> 1. Implement new purge(), evict() + swap_in() GEM callbacks.
>> 2. Register shrinker using drm_gem_shmem_shrinker_register(drm_device).
>> 3. Use drm_gem_shmem_set_purgeable_and_evictable(shmem) and alike API
>>     functions to activate shrinking of GEMs.
> 
> Honestly speaking, after reading the patch and the discussion here I
> really don't like where all tis is going. The interfaces and
> implementation are overengineered.  Descisions about evicting and
> purging should be done by the memory manager. For the most part, it's
> none of the driver's business.

Daniel mostly suggesting to make interface more flexible for future
drivers, so we won't need to re-do it later on. My version of the
interface is based on what drivers need today.

Why do you think it's a problem to turn shmem helper into the simple
generic memory manager? I don't see how it's better to have drivers
duplicating the exactly same efforts and making different mistakes.

The shmem shrinker implementation is mostly based on the freedreno's
shrinker and it's very easy to enable generic shrinker for VirtIO and
Panfrost drivers. I think in the future freedreno and other drivers
could switch to use drm shmem instead of open coding the memory management.

> I'd like to ask you to reduce the scope of the patchset and build the
> shrinker only for virtio-gpu. I know that I first suggested to build
> upon shmem helpers, but it seems that it's easier to do that in a later
> patchset.

The first version of the VirtIO shrinker didn't support memory eviction.
Memory eviction support requires page fault handler to be aware of the
evicted pages, what should we do about it? The page fault handling is a
part of memory management, hence to me drm-shmem is already kinda a MM.
