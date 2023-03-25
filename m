Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A541D6C8EEE
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 15:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D9210E03B;
	Sat, 25 Mar 2023 14:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B072010E002;
 Sat, 25 Mar 2023 14:58:47 +0000 (UTC)
Received: from [192.168.2.204] (109-252-120-116.nat.spd-mgts.ru
 [109.252.120.116])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0455F6603103;
 Sat, 25 Mar 2023 14:58:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1679756326;
 bh=dU1D86JTqo/yGLLA5mJPUROTMQUYgMAFWoNb6lY2hgc=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=bUQ9ZL5vbpwKPXHcT8taJDSRfEanqwsD9J953DywnuIp0FSwWHV/2wSRf9J5xU5zx
 XW/mdsIIfoghLBKjfQPkeYiqvdZ4f2JwUM/BltUQ+07OYxCfHr7IVeuimMghXooJ7l
 j6BGYFM/wSBHC7XY04Yf3fRtkEBUjO/65qTpM6NqPcXZ0jLYq9eS+/7yTQXAkaMOHF
 4RADMreTDjWabykjnZ8jDzKDl3FAfokQR1jscEGg2MIisWZodEGMeVeKlDDh+9cWdS
 Jrvvad0aDK1RldZWLJsqSmE4u14RvF1KiHvjxBpA7tYCfxUCovyjj5ySAkoIobWdxZ
 CEdgGP1UzPc9Q==
Message-ID: <20c88807-8513-a816-aed9-5cd67eb5c1ed@collabora.com>
Date: Sat, 25 Mar 2023 17:58:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v13 01/10] drm/shmem-helper: Switch to reservation lock
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20230314022659.1816246-1-dmitry.osipenko@collabora.com>
 <20230314022659.1816246-2-dmitry.osipenko@collabora.com>
 <6b5644cf-6229-f99b-d429-a45d724493ee@collabora.com>
Content-Language: en-US
In-Reply-To: <6b5644cf-6229-f99b-d429-a45d724493ee@collabora.com>
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
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, kernel@collabora.com,
 Sumit Semwal <sumit.semwal@linaro.org>, Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 intel-gfx@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 linux-kernel@vger.kernel.org, Qiang Yu <yuq825@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/15/23 16:46, Dmitry Osipenko wrote:
> On 3/14/23 05:26, Dmitry Osipenko wrote:
>> @@ -633,7 +605,10 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
>>  		return ret;
>>  	}
>>  
>> +	dma_resv_lock(shmem->base.resv, NULL);
>>  	ret = drm_gem_shmem_get_pages(shmem);
>> +	dma_resv_unlock(shmem->base.resv);
> 
> Intel CI reported locking problem [1] here. It actually was also
> reported for v12, but I missed that report because of the other noisy
> reports.
> 
> [1]
> https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_114671v2/shard-snb5/igt@prime_vgem@sync@rcs0.html
> 
> The test does the following:
> 
> 1. creates vgem
> 2. export it do dmabuf
> 3. mmaps dmabuf
> 
> There is an obvious deadlock there. The DRM code assumes that mmap() is
> unlocked, while for dma-buf it's locked. I'll see how to fix it for v14.
> 

Christian, there is a deadlock problem in drm_gem_shmem_mmap() once we
move drm-shmem to use resv lock. The current dma-buf locking policy
claims that importer holds the lock for mmap(), but DRM code assumes
that obj->mmap() handles the locking itself and then the same
obj->mmap() code path is used by both dma-buf DRM and a usual DRM object
paths. Hence importer -> dma_buf_mmap_internal()[takes the lock] ->
exporter -> drm_gem_shmem_mmap()[takes the lock] deadlocks.

I was looking at how to fix it and to me the best option is to change
the dma-buf locking policy, making exporter responsible for handling the
resv lock. Changing DRM code mmap lockings might be possible too [moving
locking to drm_gem_mmap_obj()], but will be very messy and doesn't feel
intuitive.

Want to get yours thoughts on this before sending out the dma-buf mmap()
policy-change patch. Does the new mmap() locking policy sound good to
you? Thanks!

-- 
Best regards,
Dmitry

