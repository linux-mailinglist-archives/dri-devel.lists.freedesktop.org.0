Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A0B55FADF
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 10:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2443410F7DA;
	Wed, 29 Jun 2022 08:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7384610FFA2;
 Wed, 29 Jun 2022 08:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 2A07C3F496;
 Wed, 29 Jun 2022 10:43:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.11
X-Spam-Level: 
X-Spam-Status: No, score=-2.11 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4hntFlTqeXsy; Wed, 29 Jun 2022 10:43:49 +0200 (CEST)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id BD3173F380;
 Wed, 29 Jun 2022 10:43:46 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 009DD3600FE;
 Wed, 29 Jun 2022 10:43:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1656492226; bh=x90oW/9huaBEVhlYQnplarSqAv+GdIC9FB+WPge8YXg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=To+37xln8JJvgy8na/moijj7u3YDsnUNuVyQoNBDexiiEMSNqGDIeVvz1kBQFzukt
 YcG6WWmRdCE6ePPgCuKLz9/xnAc5XIr2/e3dHA4nZ+veHTgrFehSwVxq0B1yIKdGKa
 7lAinpshdXw/bjo7xkx8+5chsPjxtjKahuceuJ/M=
Message-ID: <b4086751-9bff-ea5e-93fc-ce2c513b129b@shipmail.org>
Date: Wed, 29 Jun 2022 10:43:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 02/22] drm/gem: Move mapping of imported dma-bufs to
 drm_gem_mmap_obj()
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <20220526235040.678984-3-dmitry.osipenko@collabora.com>
 <b8271f0c-d6a3-4194-1959-e112859756a3@shipmail.org>
 <c0273ac2-c87c-2612-03d4-dc52510b22f7@collabora.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <c0273ac2-c87c-2612-03d4-dc52510b22f7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-media@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, amd-gfx@lists.freedesktop.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/29/22 10:22, Dmitry Osipenko wrote:
> On 6/29/22 09:40, Thomas Hellström (Intel) wrote:
>> On 5/27/22 01:50, Dmitry Osipenko wrote:
>>> Drivers that use drm_gem_mmap() and drm_gem_mmap_obj() helpers don't
>>> handle imported dma-bufs properly, which results in mapping of something
>>> else than the imported dma-buf. For example, on NVIDIA Tegra we get a
>>> hard
>>> lockup when userspace writes to the memory mapping of a dma-buf that was
>>> imported into Tegra's DRM GEM.
>>>
>>> To fix this bug, move mapping of imported dma-bufs to drm_gem_mmap_obj().
>>> Now mmaping of imported dma-bufs works properly for all DRM drivers.
>> Same comment about Fixes: as in patch 1,
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>> ---
>>>    drivers/gpu/drm/drm_gem.c              | 3 +++
>>>    drivers/gpu/drm/drm_gem_shmem_helper.c | 9 ---------
>>>    drivers/gpu/drm/tegra/gem.c            | 4 ++++
>>>    3 files changed, 7 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>> index 86d670c71286..7c0b025508e4 100644
>>> --- a/drivers/gpu/drm/drm_gem.c
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -1038,6 +1038,9 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj,
>>> unsigned long obj_size,
>>>        if (obj_size < vma->vm_end - vma->vm_start)
>>>            return -EINVAL;
>>>    +    if (obj->import_attach)
>>> +        return dma_buf_mmap(obj->dma_buf, vma, 0);
>> If we start enabling mmaping of imported dma-bufs on a majority of
>> drivers in this way, how do we ensure that user-space is not blindly
>> using the object mmap without calling the needed DMA_BUF_IOCTL_SYNC
>> which is needed before and after cpu access of mmap'ed dma-bufs?
>>
>> I was under the impression (admittedly without looking) that the few
>> drivers that actually called into dma_buf_mmap() had some private
>> user-mode driver code in place that ensured this happened.
> Since it's a userspace who does the mapping, then it should be a
> responsibility of userspace to do all the necessary syncing.

Sure, but nothing prohibits user-space to ignore the syncing thinking 
"It works anyway", testing those drivers where the syncing is a NOP. And 
when a driver that finally needs syncing is tested it's too late to fix 
all broken user-space.

>   I'm not
> sure whether anyone in userspace really needs to map imported dma-bufs
> in practice. Nevertheless, this use-case is broken and should be fixed
> by either allowing to do the mapping or prohibiting it.
>
Then I'd vote for prohibiting it, at least for now. And for the future 
moving forward we could perhaps revisit the dma-buf need for syncing, 
requiring those drivers that actually need it to implement emulated 
coherent memory which can be done not too inefficiently (vmwgfx being 
one example).

/Thomas


