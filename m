Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCDC596361
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 21:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE51112FF0;
	Tue, 16 Aug 2022 19:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27F2113090
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 19:55:59 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-13.nat.spd-mgts.ru
 [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2BC5C660037D;
 Tue, 16 Aug 2022 20:55:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1660679758;
 bh=QUXUXYkhFymxKXOLeAezfOww+02sMdDSnE//u2RiUFM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CVM4id76n+RhaUefcyoNI4yah3kDGdYyN68LKYUcBxQy6kRNp16EuhrcSBTm7BxN/
 1okQMK8mg83NetPZXjRBPYQr5xe5pPctN7Tj8kWrJ0Ed8Jk6E8SEd1Y9qLJGJg6VMI
 ANvZj/dqHo84JivmR8Qr0MnboYLog7JlWO+nVEjy9HhMEBIF2XF8frWBlcS//ZuwCq
 dMbGTF2wy1/70Skx2C9muNyZTNkW95vijAHW4X7/8tzDHWiQj+b71rvCL+p7P/6BdL
 qNqkAVP0hp6clTF16+kJXWqby9L2e5++00yZavOGTJ8VEiQ383euMrJUgzyhkHSiII
 SDR3f8LvCxx0Q==
Message-ID: <cf8cd8da-08d2-5e70-a239-2a67da37c9ea@collabora.com>
Date: Tue, 16 Aug 2022 22:55:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v8 2/2] drm/gem: Don't map imported GEMs
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rob Clark <robdclark@gmail.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <20220701090240.1896131-1-dmitry.osipenko@collabora.com>
 <20220701090240.1896131-3-dmitry.osipenko@collabora.com>
 <2bb95e80-b60a-36c0-76c8-a06833032c77@amd.com>
 <CAF6AEGtqPeF1DjmBKgzWK39Yi81YiNjTjDNn85TKx7uwicFTSA@mail.gmail.com>
 <2a646ce4-c2ec-3b11-77a0-cc720afd6fe1@collabora.com>
 <YvOav/vF2awVWIu0@phenom.ffwll.local>
 <CAF6AEGvfAJgwBe4+sK0gAkZ++MwH9x4=698C8XSnmfYNMFZqfA@mail.gmail.com>
 <9674d00e-c0d6-ceba-feab-5dc475bda694@collabora.com>
 <CAF6AEGv1cVC9ZNMwpwFOki5CrwD3kSAHM9EUFZGWY-y5zcQsCg@mail.gmail.com>
 <fc019528-7ec7-9e5b-1b6d-c44da14346cf@collabora.com>
 <CAF6AEGv8zSd0fEYB9hd2QOyTt53gFSQoL8JdZtCvtCdYfMfB2Q@mail.gmail.com>
 <73b51dde-689f-64ce-a1c8-0d7c84a2ed66@collabora.com>
 <CAF6AEGuR1cRQYaQBYGnMBzy=XJUcN2o2gzabZaGO2Dj62Uq1DA@mail.gmail.com>
 <CAF6AEGvvR1NUd_GKP=Bxp3VTDMBYT+OwTkkgOWxgYFijZaVVEQ@mail.gmail.com>
 <5f118e10-db7a-a128-1e87-c9dddb65b2ac@collabora.com>
 <2ce5ff0a-9ab2-d146-04db-487a64714fce@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <2ce5ff0a-9ab2-d146-04db-487a64714fce@gmail.com>
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
Cc: kernel@collabora.com, dri-devel <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/16/22 15:03, Christian König wrote:
> Am 16.08.22 um 13:44 schrieb Dmitry Osipenko:
>> [SNIP]
>>> The other complication I noticed is that we don't seem to keep around
>>> the fd after importing to a GEM handle.  And I could imagine that
>>> doing so could cause issues with too many fd's.  So I guess the best
>>> thing is to keep the status quo and let drivers that cannot mmap
>>> imported buffers just fail mmap?
>> That actually should be all the drivers excluding those that use
>> DRM-SHMEM because only DRM-SHMEM uses dma_buf_mmap(), that's why it
>> works for Panfrost. I'm pretty sure mmaping of imported GEMs doesn't
>> work for the MSM driver, isn't it?
>>
>> Intel and AMD drivers don't allow to map the imported dma-bufs. Both
>> refuse to do the mapping.
>>
>> Although, AMDGPU "succeeds" to do the mapping using
>> AMDGPU_GEM_DOMAIN_GTT, but then touching the mapping causes bus fault,
>> hence mapping actually fails. I think it might be the AMDGPU
>> driver/libdrm bug, haven't checked yet.
> 
> That's then certainly broken somehow. Amdgpu should nerve ever have
> allowed to mmap() imported DMA-bufs and the last time I check it didn't.

I'll take a closer look. So far I can only tell that it's a kernel
driver issue because once I re-applied this "Don't map imported GEMs"
patch, AMDGPU began to refuse mapping AMDGPU_GEM_DOMAIN_GTT.

>> So we're back to the point that neither of DRM drivers need to map
>> imported dma-bufs and this was never tested. In this case this patch is
>> valid, IMO.

Actually, I'm now looking at Etnaviv and Nouveau and seems they should
map imported dma-buf properly. I know that people ran Android on
Etnaviv. So maybe devices with a separated GPU/display need to map
imported display BO for Android support. Wish somebody who ran Android
on one of these devices using upstream drivers could give a definitive
answer. I may try to test Nouveau later on.

-- 
Best regards,
Dmitry
