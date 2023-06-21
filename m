Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E55E9738FBD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 21:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A090410E351;
	Wed, 21 Jun 2023 19:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3552310E34F;
 Wed, 21 Jun 2023 19:13:30 +0000 (UTC)
Received: from [192.168.2.254] (109-252-154-132.dynamic.spd-mgts.ru
 [109.252.154.132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 028EE6606F8B;
 Wed, 21 Jun 2023 20:13:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687374808;
 bh=31gqMqJTvRFMt5UXxpnNL/tjjOgIsbFkFx6XfkMlUWM=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=A3Y7bDPAKpM3rcSGHIFA8PI0m/Ja56hIfliBp5aUB9qJ3o4hKjENUg8ePC+LfMPay
 Ti7i29x1tskVZzHLppVRK4oHAfpc8p/+1bGshpQPYQ+qkH61xfOQ517Wc46UKrRyQs
 /dw/JkFPO1RqCuEiDoBHiGVzYr3WmzNDaYFA5vNR5vTGZA1k7BX2dIHNaXRm6Z/nPH
 Isr3BK5oFu+AwckPA0Ho3iD9RoDguo0aozKqX+qqJ67YGCsuvWJnYYsF+/jBvRLWY/
 R8pAonWP+H681L4/wbk8RMCWx3GWIyq+RgVg8jLOA54yM4nAhJ+YHaInxf40qaUZIT
 Iz40NQBqG0/oA==
Message-ID: <bad6b25d-15e6-5655-b017-3c2cc4a59ec3@collabora.com>
Date: Wed, 21 Jun 2023 22:13:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v4 0/6] Move dma-buf mmap() reservation locking down to
 exporters
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>
References: <20230529223935.2672495-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20230529223935.2672495-1-dmitry.osipenko@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/30/23 01:39, Dmitry Osipenko wrote:
> This patchset makes dma-buf exporters responisble for taking care of
> the reservation lock. I also included patch that moves drm-shmem to use
> reservation lock, to let CI test the whole set. I'm going to take all
> the patches via the drm-misc tree, please give an ack.
> 
> Previous policy stated that dma-buf core takes the lock around mmap()
> callback. Which meant that both importers and exporters shouldn't touch
> the reservation lock in the mmap() code path. This worked well until
> Intel-CI found a deadlock problem in a case of self-imported dma-buf [1].
> 
> The problem happens when userpace mmaps a self-imported dma-buf, i.e.
> mmaps the dma-buf FD. DRM core treats self-imported dma-bufs as own GEMs
> [2]. There is no way to differentiate a prime GEM from a normal GEM for
> drm-shmem in drm_gem_shmem_mmap(), which resulted in a deadlock problem
> for drm-shmem mmap() code path once it's switched to use reservation lock.
> 
> It was difficult to fix the drm-shmem problem without adjusting dma-buf
> locking policy. In parctice not much changed from importers perspective
> because previosly dma-buf was taking the lock in between of importers
> and exporters. Now this lock is shifted down to exporters.
> 
> [1] https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_114671v2/shard-snb5/igt@prime_vgem@sync@rcs0.html
> [2] https://elixir.bootlin.com/linux/v6.3-rc4/source/drivers/gpu/drm/drm_prime.c#L924

Applied to misc-next

-- 
Best regards,
Dmitry

