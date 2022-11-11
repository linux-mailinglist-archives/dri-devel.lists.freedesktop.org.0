Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FED626355
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 22:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BDE10E87B;
	Fri, 11 Nov 2022 20:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855B710E88F;
 Fri, 11 Nov 2022 20:59:54 +0000 (UTC)
Received: from [192.168.2.108] (unknown [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5CDA66602A68;
 Fri, 11 Nov 2022 20:59:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668200392;
 bh=TrKdFBPru086RSsfc5wIzyFVxFZ3a1YCkJzhICjKkFM=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=kTzmPkaJO6D9W0IEssnpVYn8a0dml3ZRppn1qMWG4J42UsMw0cTQn/a79AsEqsy6X
 QMrYQYyC8OxRUVB5zQFJrKCVAXk0bJ8lzcA/P1uBAGVtFYj/6P3E36H7NotZfUXQlA
 m2J00IbXu60OvZGQx0RMmb7M4IIYhWVFKyaPRVOkHD/eqZ5Wfj3ySQg/WI6Ad+DAef
 nPvkNldq/VIa3A2nmhJSI7PnY0IhPvdxhv49NeWamYwI+4Mfs5X4K69Hy0Kql9cqfk
 7XBjipx8WNWslnDHQMpiUXQCpO0KfknfBszxAN5doYyGy+65O+6Y9l+KzgTo5o0jdg
 3B3qBv+X+50cg==
Message-ID: <b4dd0426-05fc-e33e-66b1-a2131c8c47dc@collabora.com>
Date: Fri, 11 Nov 2022 23:59:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 0/6] Move dma_buf_mmap_internal() to dynamic locking
 specification
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>
References: <20221110201349.351294-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20221110201349.351294-1-dmitry.osipenko@collabora.com>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/10/22 23:13, Dmitry Osipenko wrote:
> Hello,
> 
> Recently, dma-buf got a common locking convention for importers and
> exporters. All the dma-buf functions were moved to the new locking
> convention, apart from the dma_buf_mmap_internal() that was missed out
> by accident. This series moves dma_buf_mmap_internal() to the dynamic
> locking specification and updates drivers that support mmaping of
> dma-bufs to use the debug-assert of the lock.
> 
> Thanks to Daniel Vetter for spotting the missed function!
> 
> Dmitry Osipenko (6):
>   dma-buf: Move dma_buf_mmap_internal() to dynamic locking specification
>   drm: Assert held reservation lock for dma-buf mmapping
>   udmabuf: Assert held reservation lock for dma-buf mmapping
>   dma-buf/heaps: Assert held reservation lock for dma-buf mmapping
>   media: videobuf2: Assert held reservation lock for dma-buf mmapping
>   fastrpc: Assert held reservation lock for dma-buf mmapping
> 
>  drivers/dma-buf/dma-buf.c                             | 7 ++++++-
>  drivers/dma-buf/heaps/cma_heap.c                      | 3 +++
>  drivers/dma-buf/heaps/system_heap.c                   | 3 +++
>  drivers/dma-buf/udmabuf.c                             | 3 +++
>  drivers/gpu/drm/drm_prime.c                           | 2 ++
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c            | 2 ++
>  drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c             | 2 ++
>  drivers/gpu/drm/tegra/gem.c                           | 2 ++
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 3 +++
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 3 +++
>  drivers/media/common/videobuf2/videobuf2-vmalloc.c    | 3 +++
>  drivers/misc/fastrpc.c                                | 3 +++
>  12 files changed, 35 insertions(+), 1 deletion(-)
> 

Applied to drm-misc-next

-- 
Best regards,
Dmitry

