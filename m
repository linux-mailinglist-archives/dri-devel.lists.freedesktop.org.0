Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9D1738E57
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 20:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233EA10E348;
	Wed, 21 Jun 2023 18:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3EB10E344;
 Wed, 21 Jun 2023 18:16:37 +0000 (UTC)
Received: from [192.168.2.254] (109-252-154-132.dynamic.spd-mgts.ru
 [109.252.154.132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 61D736606FAC;
 Wed, 21 Jun 2023 19:16:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687371394;
 bh=PQA2rc/Gs+XDzpOTYaQqwgwiDRANnpvkFuiUXn6B45A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=a6uFWwMGM2Wn9oqIqY7w7ZXRsmW9BSZjBsI4Ir5fTcMPux5toiFC6wlyILN77QVfb
 0L+ZFaptUWmBOJZm2yvNv0eh15H4wUN+1EiHsUsv63mFz6hu/moMeG3T4oQV6i35F0
 sHKIlQJA6GxprALI1nuPl+VQIhbWRMZVczzPnrUz21ntwNTap1H/IueLMyT7eRukEz
 N3GdhDZdinRaXuMBSFTeA1MUT7KUhYwb+koIItqlM5t/HFmZVenSeMDvjEPNqpSvPr
 WnQ/f7ngy10rNR4q+TxKWqOltsVMxB7/UwzmOPEST6X3Ell8COhkS5FvW3+wJ2ZV00
 b/tPSDkrH1Jtg==
Message-ID: <106bc72b-9358-de06-6f3f-06fdfa3859cd@collabora.com>
Date: Wed, 21 Jun 2023 21:16:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v4 2/6] dma-buf/heaps: Don't assert held reservation lock
 for dma-buf mmapping
Content-Language: en-US
To: "T.J. Mercier" <tjmercier@google.com>
References: <20230529223935.2672495-1-dmitry.osipenko@collabora.com>
 <20230529223935.2672495-3-dmitry.osipenko@collabora.com>
 <CABdmKX2RU2iYyUssBpwS17zA1dfegjzdo4pxp0r8cOCWcY9=kg@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CABdmKX2RU2iYyUssBpwS17zA1dfegjzdo4pxp0r8cOCWcY9=kg@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 intel-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomi Valkeinen <tomba@kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/21/23 20:21, T.J. Mercier wrote:
> On Mon, May 29, 2023 at 3:46 PM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>>
>> Don't assert held dma-buf reservation lock on memory mapping of exported
>> buffer.
>>
>> We're going to change dma-buf mmap() locking policy such that exporters
>> will have to handle the lock. The previous locking policy caused deadlock
>> problem for DRM drivers in a case of self-imported dma-bufs once these
>> drivers are moved to use reservation lock universally. The problem
>> solved by moving the lock down to exporters. This patch prepares dma-buf
>> heaps for the locking policy update.
>>
> Hi Dmitry,
> 
> I see that in patch 6 of this series calls to
> dma_resv_lock/dma_resv_unlock have been added to the
> drm_gem_shmem_helper functions and some exporters. But I'm curious why
> no dma_resv_lock/dma_resv_unlock calls were added to these two dma-buf
> heap exporters for mmap?

DMA-buf heaps are exporters, drm_gem_shmem_helper is importer. Locking
rules are different for importers and exporters.

DMA-heaps use own locking, they can be moved to resv lock in the future.

DMA-heaps don't protect internal data in theirs mmap() implementations,
nothing to protect there.

-- 
Best regards,
Dmitry

