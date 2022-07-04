Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEAA5669B2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE3711324F;
	Tue,  5 Jul 2022 11:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA57812ADBD;
 Tue,  5 Jul 2022 07:00:04 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-232.nat.spd-mgts.ru
 [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8554E660199E;
 Mon,  4 Jul 2022 23:44:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656974665;
 bh=GphHsd4+TzSAb7tj4o+YMEvu0hP9uR9DEZi//JxrDEU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TIETcXt54Z6zAdCbC52DXacxsnFDzGdC3JpBIsizmA7N//ZHlPueCwy+HM8YdAAb2
 HUI9viWT++O6etVqrNckxFUgP9ozk1r55Cb+PUEXrb9WRcAzHpJE00AbqEgjt9blxt
 RLJPB3XA3/+NfDsNwvjz2N41JPYRlCQxI6JAKkkmyIz1E91Q4VSjNoW8LqOHM8EB8q
 BQtx36ekmIe1Jt7JJZIQ79AGm28biDD4zfoAXWLmsCdqmX/9y9h9W6jOIDRVw65pq1
 TNelVxwhjBX9if0FXgHlKZ/rVDPcxkXat5eT5ZTW/eMhrDqRk/HMeHceHosUPvp2Bo
 sroGV1SbIfvsw==
Message-ID: <3e9fbf88-c1bd-d336-b0e0-86fb208a952e@collabora.com>
Date: Tue, 5 Jul 2022 01:44:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Linaro-mm-sig] Re: [PATCH v6 02/22] drm/gem: Move mapping of
 imported dma-bufs to drm_gem_mmap_obj()
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <20220526235040.678984-3-dmitry.osipenko@collabora.com>
 <b8271f0c-d6a3-4194-1959-e112859756a3@shipmail.org>
 <c0273ac2-c87c-2612-03d4-dc52510b22f7@collabora.com>
 <b4086751-9bff-ea5e-93fc-ce2c513b129b@shipmail.org>
 <467a1cee-ba8c-98f3-0398-2a7a5a90b5c3@collabora.com>
 <0335814b-dc11-4a54-9f24-bb4e9dbef35c@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <0335814b-dc11-4a54-9f24-bb4e9dbef35c@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, amd-gfx@lists.freedesktop.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 Emil Velikov <"emil.l.veli kov"@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/4/22 15:33, Christian König wrote:
> Am 30.06.22 um 01:06 schrieb Dmitry Osipenko:
>> On 6/29/22 11:43, Thomas Hellström (Intel) wrote:
>>> On 6/29/22 10:22, Dmitry Osipenko wrote:
>>>> On 6/29/22 09:40, Thomas Hellström (Intel) wrote:
>>>>> On 5/27/22 01:50, Dmitry Osipenko wrote:
>>>>>> Drivers that use drm_gem_mmap() and drm_gem_mmap_obj() helpers don't
>>>>>> handle imported dma-bufs properly, which results in mapping of
>>>>>> something
>>>>>> else than the imported dma-buf. For example, on NVIDIA Tegra we get a
>>>>>> hard
>>>>>> lockup when userspace writes to the memory mapping of a dma-buf that
>>>>>> was
>>>>>> imported into Tegra's DRM GEM.
>>>>>>
>>>>>> To fix this bug, move mapping of imported dma-bufs to
>>>>>> drm_gem_mmap_obj().
>>>>>> Now mmaping of imported dma-bufs works properly for all DRM drivers.
>>>>> Same comment about Fixes: as in patch 1,
>>>>>> Cc: stable@vger.kernel.org
>>>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/drm_gem.c              | 3 +++
>>>>>>     drivers/gpu/drm/drm_gem_shmem_helper.c | 9 ---------
>>>>>>     drivers/gpu/drm/tegra/gem.c            | 4 ++++
>>>>>>     3 files changed, 7 insertions(+), 9 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>>>> index 86d670c71286..7c0b025508e4 100644
>>>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>>>> @@ -1038,6 +1038,9 @@ int drm_gem_mmap_obj(struct drm_gem_object
>>>>>> *obj,
>>>>>> unsigned long obj_size,
>>>>>>         if (obj_size < vma->vm_end - vma->vm_start)
>>>>>>             return -EINVAL;
>>>>>>     +    if (obj->import_attach)
>>>>>> +        return dma_buf_mmap(obj->dma_buf, vma, 0);
>>>>> If we start enabling mmaping of imported dma-bufs on a majority of
>>>>> drivers in this way, how do we ensure that user-space is not blindly
>>>>> using the object mmap without calling the needed DMA_BUF_IOCTL_SYNC
>>>>> which is needed before and after cpu access of mmap'ed dma-bufs?
>>>>>
>>>>> I was under the impression (admittedly without looking) that the few
>>>>> drivers that actually called into dma_buf_mmap() had some private
>>>>> user-mode driver code in place that ensured this happened.
>>>> Since it's a userspace who does the mapping, then it should be a
>>>> responsibility of userspace to do all the necessary syncing.
>>> Sure, but nothing prohibits user-space to ignore the syncing thinking
>>> "It works anyway", testing those drivers where the syncing is a NOP. And
>>> when a driver that finally needs syncing is tested it's too late to fix
>>> all broken user-space.
>>>
>>>>    I'm not
>>>> sure whether anyone in userspace really needs to map imported dma-bufs
>>>> in practice. Nevertheless, this use-case is broken and should be fixed
>>>> by either allowing to do the mapping or prohibiting it.
>>>>
>>> Then I'd vote for prohibiting it, at least for now. And for the future
>>> moving forward we could perhaps revisit the dma-buf need for syncing,
>>> requiring those drivers that actually need it to implement emulated
>>> coherent memory which can be done not too inefficiently (vmwgfx being
>>> one example).
>> Alright, I'll change it to prohibit the mapping. This indeed should be a
>> better option.
> 
> Oh, yes please. But I would expect that some people start screaming.
> 
> Over time I've got tons of TTM patches because people illegally tried to
> mmap() imported DMA-bufs in their driver.
> 
> Anyway this is probably the right thing to do and we can work on fixing
> the fallout later on.

I already sent out the patch [1] that prohibits the mapping. Would be
great if you all could take a look and give a r-b, thanks in advance.

[1] https://patchwork.freedesktop.org/patch/492148/

-- 
Best regards,
Dmitry
