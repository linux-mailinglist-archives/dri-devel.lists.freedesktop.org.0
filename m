Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9545371517A
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 00:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BFA10E301;
	Mon, 29 May 2023 22:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085B410E2FD;
 Mon, 29 May 2023 22:05:54 +0000 (UTC)
Received: from [192.168.2.2] (109-252-150-34.dynamic.spd-mgts.ru
 [109.252.150.34])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 26C94660217A;
 Mon, 29 May 2023 23:05:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1685397952;
 bh=E8D9UsqcqdEvEaSPqwft+gP6ubYKoB1Svo0H0BTDyFA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=P6uFKmXC0TuQ4UYU9RsteNwepJOX/EuIwZ3L7kLP8gvVCzg0XXjllPHK/tLG5xcGx
 VJDkSEKqLLRaaDkqDA2Hf3zPtNqI4QWffOKLx5/FByohz6tXFlgep4mKsnMP5uwn3J
 ITdsL7oiuo7wEZNTU8EDVMvfsF+ONOzX1R+omxBBDun/jsdmTI3x84WaBr4jCTXgfr
 tI6vDNXbD0B0JM8bMmC22PwJqZMhYPK/Q6UTa7HnDxLhfJH9ZyAYCFj8XL7I/p7eZ8
 OMtQvEIhBWLr1Wmp8g1qFwPQodk8FA+dembDBoTf4wzxgIvxEG8mqJnTxmV0pQ8l/e
 hmFRL6ZZZSLFg==
Message-ID: <d813304a-cb9e-7e97-ebba-13b6126c6b9a@collabora.com>
Date: Tue, 30 May 2023 01:05:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 6/6] drm/shmem-helper: Switch to reservation lock
Content-Language: en-US
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20230521205112.150206-1-dmitry.osipenko@collabora.com>
 <20230521205112.150206-7-dmitry.osipenko@collabora.com>
 <CACvgo52QvmZw5k_9dmBHPB25rTdLZJzVG_vNFr8or+3f5sVO=Q@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CACvgo52QvmZw5k_9dmBHPB25rTdLZJzVG_vNFr8or+3f5sVO=Q@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 intel-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomi Valkeinen <tomba@kernel.org>,
 linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 Tomasz Figa <tfiga@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/22/23 16:02, Emil Velikov wrote:
>> -void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
>> +static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
>> +{
>> +       int ret;
>> +
>> +       dma_resv_assert_held(shmem->base.resv);
>> +
>> +       ret = drm_gem_shmem_get_pages(shmem);
>> +
>> +       return ret;
> With the assert_held in the getter, it would be less confusing to
> inline this and the unpin_locked functions.

Sorry, missed this comment earlier. The reason why it's a separate
function is because there will be another caller once we'll add the
drm-shrinker.

-- 
Best regards,
Dmitry

