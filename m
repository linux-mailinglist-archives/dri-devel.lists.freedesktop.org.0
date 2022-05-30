Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC529537B86
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AB210E877;
	Mon, 30 May 2022 13:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0D510E865;
 Mon, 30 May 2022 13:26:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id B1F391F42E89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653917216;
 bh=y8CpXrtP+c6Qf6iu5Rkh+8kR5t7I7EuM/mXJ3s9H5Zs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CZBBpXpJJByM/6l1wreC73qyaYOtUyAY912FO23xX9hwne0P8DnGHVfuPN4nMsGCT
 8SkJMvb9QBciZR6HQOm2m0Pv+tBSMrQzbTJhWEU/RA9xCdqbSQHUQ/nV0EfPj5Fh0g
 /Bz633BDtP5oWyr2aY9l9/qknO9qze9TgXSMV4ZjAyn/uZyDn95jjXsxnqKUHAFUYj
 Xl1HS7BN4ZwJ0JAX6Azh2TmYj2i3WjRR80SU/1ps37ciW04RwtS6XWFaZAru9NCxqG
 jz7LyKVTcMBV9YNtk3fQE7sBherW3XwtioZyr1RjqcTCj2d+TQiehKVmn3qh2wdHis
 oxYI+SRObIGUA==
Message-ID: <e6e17c52-43c2-064b-500e-325bb3ba3b2c@collabora.com>
Date: Mon, 30 May 2022 16:26:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 14/22] dma-buf: Introduce new locking convention
Content-Language: en-US
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
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Qiang Yu <yuq825@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <20220526235040.678984-15-dmitry.osipenko@collabora.com>
 <0a02a31d-a256-4ca4-0e35-e2ea1868a8ae@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <0a02a31d-a256-4ca4-0e35-e2ea1868a8ae@amd.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Christian,

On 5/30/22 09:50, Christian König wrote:
> Hi Dmitry,
> 
> First of all please separate out this patch from the rest of the series,
> since this is a complex separate structural change.

I assume all the patches will go via the DRM tree in the end since the
rest of the DRM patches in this series depend on this dma-buf change.
But I see that separation may ease reviewing of the dma-buf changes, so
let's try it.

> Am 27.05.22 um 01:50 schrieb Dmitry Osipenko:
>> All dma-bufs have dma-reservation lock that allows drivers to perform
>> exclusive operations over shared dma-bufs. Today's dma-buf API has
>> incomplete locking specification, which creates dead lock situation
>> for dma-buf importers and exporters that don't coordinate theirs locks.
> 
> Well please drop that sentence. The locking specifications are actually
> very well defined, it's just that some drivers are a bit broken
> regarding them.
> 
> What you do here is rather moving all the non-dynamic drivers over to
> the dynamic locking specification (which is really nice to have).

Indeed, this will be a better description, thank you! I'll update it.

> I have tried this before and failed because catching all the locks in
> the right code paths are very tricky. So expect some fallout from this
> and make sure the kernel test robot and CI systems are clean.

Sure, I'll fix up all the reported things in the next iteration.

BTW, have you ever posted yours version of the patch? Will be great if
we could compare the changed code paths.

>> This patch introduces new locking convention for dma-buf users. From now
>> on all dma-buf importers are responsible for holding dma-buf reservation
>> lock around operations performed over dma-bufs.
>>
>> This patch implements the new dma-buf locking convention by:
>>
>>    1. Making dma-buf API functions to take the reservation lock.
>>
>>    2. Adding new locked variants of the dma-buf API functions for drivers
>>       that need to manage imported dma-bufs under the held lock.
> 
> Instead of adding new locked variants please mark all variants which
> expect to be called without a lock with an _unlocked postfix.
> 
> This should make it easier to remove those in a follow up patch set and
> then fully move the locking into the importer.

Do we really want to move all the locks to the importers? Seems the
majority of drivers should be happy with the dma-buf helpers handling
the locking for them.

>>    3. Converting all drivers to the new locking scheme.
> 
> I have strong doubts that you got all of them. At least radeon and
> nouveau should grab the reservation lock in their ->attach callbacks
> somehow.

Radeon and Nouveau use gem_prime_import_sg_table() and they take resv
lock already, seems they should be okay (?)

I assume all the basics should covered in this v6. At minimum Intel,
Tegra, Panfrost, Lima and Rockchip drivers should be good. If I missed
something, then please let me know and I'll correct it.

>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>   drivers/dma-buf/dma-buf.c                     | 270 +++++++++++-------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   6 +-
>>   drivers/gpu/drm/drm_client.c                  |   4 +-
>>   drivers/gpu/drm/drm_gem.c                     |  33 +++
>>   drivers/gpu/drm/drm_gem_framebuffer_helper.c  |   6 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  10 +-
>>   drivers/gpu/drm/qxl/qxl_object.c              |  17 +-
>>   drivers/gpu/drm/qxl/qxl_prime.c               |   4 +-
>>   .../common/videobuf2/videobuf2-dma-contig.c   |  11 +-
>>   .../media/common/videobuf2/videobuf2-dma-sg.c |  11 +-
>>   .../common/videobuf2/videobuf2-vmalloc.c      |  11 +-
>>   include/drm/drm_gem.h                         |   3 +
>>   include/linux/dma-buf.h                       |  14 +-
>>   13 files changed, 241 insertions(+), 159 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 32f55640890c..64a9909ccfa2 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -552,7 +552,6 @@ struct dma_buf *dma_buf_export(const struct
>> dma_buf_export_info *exp_info)
>>       file->f_mode |= FMODE_LSEEK;
>>       dmabuf->file = file;
>>   -    mutex_init(&dmabuf->lock);
> 
> Please make removing dmabuf->lock a separate change.

Alright

-- 
Best regards,
Dmitry
