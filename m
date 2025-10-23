Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0CFBFFFA6
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F0610E8E6;
	Thu, 23 Oct 2025 08:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="igiHR0Sj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6042E10E8E6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761208967;
 bh=sn155PxY4c6KoChuMd294Ou+jNKdIOB15aowevCx2w4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=igiHR0SjfmIarvQk/NjsVaXyggKa7DLNKihy7JDojejk6ToxCdKqI/hSLZccxT67W
 tpX9hvWL4q8HZc4ioHrQ20yMd/FHDys2VK/g1xh9DQUx0FkxEaO44wEU15zUJUAshd
 ftfJHXIsACb0ykiS5OVplw8HDNQqdITDPUrKv9Vw8DrTTxaHhYx1SBS6nuWrzHpXh+
 Jn6MI3ftrjKYPNMOhTsB1Og72LlpKju9+zKvK6b5Yen08RmM1+/+jFqsJwVK6frQUk
 tlLUpTj2bO8b5fFV/EwIDIQ/2gn4DSvuP5oQ0Z5gtQP27Kws3tXb0vXiWTYCNtGPEY
 NPe8nR5SyEKqw==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 77CA917E127F;
 Thu, 23 Oct 2025 10:42:47 +0200 (CEST)
Message-ID: <b25aa269-6dc8-43d4-a3f3-85691ace134e@collabora.com>
Date: Thu, 23 Oct 2025 11:42:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/rockchip: Set VOP for the DRM DMA device
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Daniel Stone <daniels@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251022161948.199731-1-dmitry.osipenko@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20251022161948.199731-1-dmitry.osipenko@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/22/25 7:19 PM, Dmitry Osipenko wrote:
> Use VOP for DMA operations performed by DRM core. Rockchip DRM driver
> is backed by a virtual device that isn't IOMMU-capable, while VOP is the
> actual display controller device backed by IOMMU. Fixes "swiotlb buffer
> is full" warning messages originated from GEM prime code paths.
> 
> Note, that backporting is non-trivial as this depends on 143ec8d3f9396
> ("drm/prime: Support dedicated DMA device for dma-buf imports"), which
> landed in v6.16 and 421be3ee36a4 ("drm/rockchip: Refactor IOMMU
> initialisation"), which landed in v5.19.
> 
> Reported-by: Daniel Stone <daniels@collabora.com>
> Fixes: 2048e3286f34 ("drm: rockchip: Add basic drm driver")
> Cc: stable@vger.kernel.org # v6.16+
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---

With the patch applied I'm not able to fire those warnings anymore - tested on
my ROCK 5B (RK3588) and ROCK 4D (RK3576) boards.  Hence you may add:

Tested-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

