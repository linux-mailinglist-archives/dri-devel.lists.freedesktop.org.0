Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF48073E42D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 18:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132AE10E234;
	Mon, 26 Jun 2023 16:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2751C10E234
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 16:07:02 +0000 (UTC)
Received: from [192.168.2.254] (109-252-154-132.dynamic.spd-mgts.ru
 [109.252.154.132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id ECD50660714C;
 Mon, 26 Jun 2023 17:06:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687795619;
 bh=QX6LXaJywRXYShi7jP97CdK2lzLvI1diG9lW1p7JjVw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YjErjJeO3H7Qqc0fhZmw8HZd1JTLu4jLeIFB14Rc5vmhl41mMRI0vH2eWSTXBNFtP
 bf7xLjuBf5fiXsq1dYvvGX5M0Z8bfLjuFDCVMIKlPbQJDxaDqYCBkmkdO660YVbeu0
 Lcukk57GjYE6EAhx54ldTLAqj9D1bXBAm8mi2GApP0eeUSPWqvy//EKAhWFK/JBcnd
 FFeVe1KmhN2UNqyOrJF4Yz/GglG9cAx21yY/5YR3cBNzfRpTfTaPh7icrCVoC0Jyve
 wIofG6nPY1wGOLqcntqYWYV+W0Mz4Qd4UObcUj1ycPUOYwtx5tmRs38GsE7HcTXCMr
 UN2GaKqyG6isQ==
Message-ID: <393007f6-5a93-d541-6e22-c76f7f309bdb@collabora.com>
Date: Mon, 26 Jun 2023 19:06:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH 1/5] drm/panfrost: Stop using drm_gem_shmem_put_pages()
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230626120247.1337962-1-boris.brezillon@collabora.com>
 <20230626120247.1337962-2-boris.brezillon@collabora.com>
 <2182355e-2412-fd60-fb0d-5359b43d4e0c@collabora.com>
 <20230626174306.61671729@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230626174306.61671729@collabora.com>
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/26/23 18:43, Boris Brezillon wrote:
> On Mon, 26 Jun 2023 16:20:53 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
>> On 6/26/23 15:02, Boris Brezillon wrote:
>>> -err_pages:
>>> -	drm_gem_shmem_put_pages(&bo->base);
>>>  err_unlock:
>>>  	dma_resv_unlock(obj->resv);
>>> +
>>> +	if (ret && pinned)
>>> +		drm_gem_shmem_unpin(&bo->base);  
>>
>> The drm_gem_shmem_unpin() was supposed to be used only in conjunction
>> with drm_gem_shmem_pin(). I've a pending patch to enable the pin/unpin
>> refcounting needed by drm-shmem shrinker, it will prohibit invocation of
>> unpin without a previous pin.
>>
>> I'm wondering whether it will be okay to simply remove
>> drm_gem_shmem_put_pages() from the Panfrost code, letting pages to be
>> kept allocated in a error case. They will be freed once BO is destroyed.
>>
> 
> Okay, so after looking at your shmem-shrinker series, I confirm we need
> to take a pin ref here (hard-pin), otherwise the buffer might be
> evicted before the GPU is done, especially after you drop gpu_usecount
> and use only pin_count to check whether a GEM object can be evicted or
> not.

See the drm_gem_evict() [1], it checks whether GEM is busy, preventing
BO eviction while it is in-use by GPU. Note that in case of Panfrost,
shrinker isn't enabled for growable BOs.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/drm_gem.c?h=next-20230626#n1495

-- 
Best regards,
Dmitry

