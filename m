Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ADD55FA41
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 10:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3846710E75A;
	Wed, 29 Jun 2022 08:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE51F10E81E;
 Wed, 29 Jun 2022 08:22:09 +0000 (UTC)
Received: from [192.168.2.145] (unknown [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 96AF966018F1;
 Wed, 29 Jun 2022 09:22:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656490928;
 bh=XVQSgsxJcmy7E9dO6ydXkj4ChuEFXc7MVQ+QygUQC8s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XDA5Kxe1tQjVWoYM/BGtNXeKxwfzbPWBe/P8pqnkFIaP99Cob4KetSZp2mOV5ryP3
 u7HvrxECrEmyBllUyLM9aJt9NxlBWJIjI1vH3F6cyKv3t6zcOoQ5eEnHwrBxui1qxj
 dhHHwgtCyjFiz0GVKfGTNTYY/r/P8cU6ccDNK3YajGTlvfcYzw3D0HBZvWZG99gBdw
 g3iqha1unBFwIZIh55U+Qs/ChxM3VgIRVZFM+pX3989oy8OqosWoTMbE+652VhJgHQ
 FAJaw4N5wVvjKnuA74fSOiQp7M9aReCv8cXtUS2LQKv6/MwDyHx8fBx07oNXwQjIzB
 fo3DQeZjKtWZw==
Message-ID: <c0273ac2-c87c-2612-03d4-dc52510b22f7@collabora.com>
Date: Wed, 29 Jun 2022 11:22:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 02/22] drm/gem: Move mapping of imported dma-bufs to
 drm_gem_mmap_obj()
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <20220526235040.678984-3-dmitry.osipenko@collabora.com>
 <b8271f0c-d6a3-4194-1959-e112859756a3@shipmail.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <b8271f0c-d6a3-4194-1959-e112859756a3@shipmail.org>
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

On 6/29/22 09:40, Thomas Hellström (Intel) wrote:
> 
> On 5/27/22 01:50, Dmitry Osipenko wrote:
>> Drivers that use drm_gem_mmap() and drm_gem_mmap_obj() helpers don't
>> handle imported dma-bufs properly, which results in mapping of something
>> else than the imported dma-buf. For example, on NVIDIA Tegra we get a
>> hard
>> lockup when userspace writes to the memory mapping of a dma-buf that was
>> imported into Tegra's DRM GEM.
>>
>> To fix this bug, move mapping of imported dma-bufs to drm_gem_mmap_obj().
>> Now mmaping of imported dma-bufs works properly for all DRM drivers.
> Same comment about Fixes: as in patch 1,
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>   drivers/gpu/drm/drm_gem.c              | 3 +++
>>   drivers/gpu/drm/drm_gem_shmem_helper.c | 9 ---------
>>   drivers/gpu/drm/tegra/gem.c            | 4 ++++
>>   3 files changed, 7 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 86d670c71286..7c0b025508e4 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -1038,6 +1038,9 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj,
>> unsigned long obj_size,
>>       if (obj_size < vma->vm_end - vma->vm_start)
>>           return -EINVAL;
>>   +    if (obj->import_attach)
>> +        return dma_buf_mmap(obj->dma_buf, vma, 0);
> 
> If we start enabling mmaping of imported dma-bufs on a majority of
> drivers in this way, how do we ensure that user-space is not blindly
> using the object mmap without calling the needed DMA_BUF_IOCTL_SYNC
> which is needed before and after cpu access of mmap'ed dma-bufs?
> 
> I was under the impression (admittedly without looking) that the few
> drivers that actually called into dma_buf_mmap() had some private
> user-mode driver code in place that ensured this happened.

Since it's a userspace who does the mapping, then it should be a
responsibility of userspace to do all the necessary syncing. I'm not
sure whether anyone in userspace really needs to map imported dma-bufs
in practice. Nevertheless, this use-case is broken and should be fixed
by either allowing to do the mapping or prohibiting it.

-- 
Best regards,
Dmitry
