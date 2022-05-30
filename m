Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A43AD537E4B
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A230210ECFA;
	Mon, 30 May 2022 13:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3B310ECFA;
 Mon, 30 May 2022 13:57:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id B98F41F417FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653919049;
 bh=2XRBuky6ctLBMkVpHH42tRbnrHaVzoRJDfOS/8wLl/E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mPwSP+W1lUR0EdMvCliWfZoiylZ8CVpOpjwgflCUTZaI9WHJh5tJXhk8DyguPhNeN
 HogdCkNBgtGD2G8U9Ep2K49/vmqE56g1BgD7MA21xGk1ZVBj+VJcIxxm08FCLdNgVK
 RmZOwzc+caJBzV5axbiwKDrCGcHjZmvJd24egZXw9xLh3XfQFPhTT3EpgfN70g8mqC
 9sjT+smifz0WHNiGEqr7+RZqCI9QQehNyQ19Mpiv9LWCOB9wzR78FM0tska4e7lqKe
 50oVtOr/eGMjVeh2uPvpXIVZhL/NQ2LFQ3MNEmBcidBDh44gsd28fmmYzNC+2ue0aj
 H9xWHCkQ7dKmg==
Message-ID: <7372dd1b-06f7-5336-4738-15f9b4d4d4b3@collabora.com>
Date: Mon, 30 May 2022 16:57:22 +0300
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
 <e6e17c52-43c2-064b-500e-325bb3ba3b2c@collabora.com>
 <02e7946b-34ca-b48e-1ba6-e7b63740a2d9@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <02e7946b-34ca-b48e-1ba6-e7b63740a2d9@amd.com>
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

On 5/30/22 16:41, Christian König wrote:
> Hi Dmitry,
> 
> Am 30.05.22 um 15:26 schrieb Dmitry Osipenko:
>> Hello Christian,
>>
>> On 5/30/22 09:50, Christian König wrote:
>>> Hi Dmitry,
>>>
>>> First of all please separate out this patch from the rest of the series,
>>> since this is a complex separate structural change.
>> I assume all the patches will go via the DRM tree in the end since the
>> rest of the DRM patches in this series depend on this dma-buf change.
>> But I see that separation may ease reviewing of the dma-buf changes, so
>> let's try it.
> 
> That sounds like you are underestimating a bit how much trouble this
> will be.
> 
>>> I have tried this before and failed because catching all the locks in
>>> the right code paths are very tricky. So expect some fallout from this
>>> and make sure the kernel test robot and CI systems are clean.
>> Sure, I'll fix up all the reported things in the next iteration.
>>
>> BTW, have you ever posted yours version of the patch? Will be great if
>> we could compare the changed code paths.
> 
> No, I never even finished creating it after realizing how much work it
> would be.
> 
>>>> This patch introduces new locking convention for dma-buf users. From
>>>> now
>>>> on all dma-buf importers are responsible for holding dma-buf
>>>> reservation
>>>> lock around operations performed over dma-bufs.
>>>>
>>>> This patch implements the new dma-buf locking convention by:
>>>>
>>>>     1. Making dma-buf API functions to take the reservation lock.
>>>>
>>>>     2. Adding new locked variants of the dma-buf API functions for
>>>> drivers
>>>>        that need to manage imported dma-bufs under the held lock.
>>> Instead of adding new locked variants please mark all variants which
>>> expect to be called without a lock with an _unlocked postfix.
>>>
>>> This should make it easier to remove those in a follow up patch set and
>>> then fully move the locking into the importer.
>> Do we really want to move all the locks to the importers? Seems the
>> majority of drivers should be happy with the dma-buf helpers handling
>> the locking for them.
> 
> Yes, I clearly think so.
> 
>>
>>>>     3. Converting all drivers to the new locking scheme.
>>> I have strong doubts that you got all of them. At least radeon and
>>> nouveau should grab the reservation lock in their ->attach callbacks
>>> somehow.
>> Radeon and Nouveau use gem_prime_import_sg_table() and they take resv
>> lock already, seems they should be okay (?)
> 
> You are looking at the wrong side. You need to fix the export code path,
> not the import ones.
> 
> See for example attach on radeon works like this
> drm_gem_map_attach->drm_gem_pin->radeon_gem_prime_pin->radeon_bo_reserve->ttm_bo_reserve->dma_resv_lock.

Yeah, I was looking at the both sides, but missed this one.

> Same for nouveau and probably a few other exporters as well. That will
> certainly cause a deadlock if you don't fix it.
> 
> I strongly suggest to do this step by step, first attach/detach and then
> the rest.

Thank you very much for the suggestions. I'll implement them in the next
version.

-- 
Best regards,
Dmitry
