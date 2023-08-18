Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7A37803A8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 04:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745FF10E2F4;
	Fri, 18 Aug 2023 02:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA29210E2F4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 02:09:59 +0000 (UTC)
Received: from [192.168.2.146] (109-252-150-127.dynamic.spd-mgts.ru
 [109.252.150.127])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F06A66607193;
 Fri, 18 Aug 2023 03:09:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692324598;
 bh=UYAYpYdw9HyHYtqGw7PLw8FtBxlDzj1CdX+HEsJ4mN8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=A/m62qJzVe1yHtuD1hQPzgDk+JFm3dD5+tD11DP33P1q8JKuxfMPACjx8+1fmNB7u
 SWL0Oqf5y9ccPd8LsnTFouVS7BsyiZqgW2oxXnOT1FQAmNksC+NVdnl2U2Levjkw0u
 bdxxKtS23Hzjk7sLvR+ZpGxFP/CmnI/D1M4Vbpy2looJPa+0OMYowycFk3+Re5I3XP
 1P/JZ2A/QPyr24XrnUPfsEm5WrnFNhKwy7oZE0W2bRNGaMj/YQnnHC1N5tKVZ+FB2w
 CaHUo8GjXSqr7cRZbi1tBcn8DRoM+VbkVshK7/bj9Zr2zbZd1lkRFSthSXOMQANb09
 mVH1P9oz52Ajg==
Message-ID: <4544317b-12e9-2bb1-d356-8072eabe3644@collabora.com>
Date: Fri, 18 Aug 2023 05:09:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 1/3] drm/virtio: .release ops for virtgpu fence release
To: "Kim, Dongwon" <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org
References: <20230712224424.30158-1-dongwon.kim@intel.com>
 <20230712224424.30158-2-dongwon.kim@intel.com>
 <b82d4b66-d65c-16d6-9fed-5be50977ff86@collabora.com>
 <ff7d16ce-887e-98a9-5bc4-fd3aeef6ea00@intel.com>
 <853f28d6-91e5-1482-d923-5f7fd0e6d018@collabora.com>
 <dbee5945-f9d6-5de6-0358-23cf7a14534c@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <dbee5945-f9d6-5de6-0358-23cf7a14534c@intel.com>
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/17/23 08:25, Kim, Dongwon wrote:
...
> Yeah, I know it frees 'struct dma_fence *f' but what about 'struct
> virtio_gpu_fence *fence'? This is a device specific fence that contains
> struct dma_fence *f. But hold on... so when fence->ops->release is
> called then dma_fence_free won't be called here:
> 
>     if (fence->ops->release)
>         fence->ops->release(fence);
>     else
>         dma_fence_free(fence);
> 
> In that case, I think virtio_gpu_fence_release should do
> "dma_fence_free(f)" before freeing virtio_gpu_fence? Am I right?
> Like,
> 
> static void virtio_gpu_fence_release(struct dma_fence *f)
> {
>     struct virtio_gpu_fence *fence = to_virtio_gpu_fence(f);
> 
>     dma_fence_free(f);
>     kfree(fence);
> }

That is a double free and wrong of course. Both dma_fence *f and
virtio_gpu_fence *fence point at the same kmemory object. See
to_virtio_gpu_fence() and please research how container_of() works.

-- 
Best regards,
Dmitry

