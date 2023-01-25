Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F2F67C03A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 23:55:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A867610E0F3;
	Wed, 25 Jan 2023 22:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E891E10E0F3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 22:55:15 +0000 (UTC)
Received: from [192.168.2.197] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4AC3C6602D1F;
 Wed, 25 Jan 2023 22:55:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674687314;
 bh=3KgCvkiMWuw1advwxtDNvcxv2KngByLwOXF9vKgP06k=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=YnJHI30zZohHLfInL1M102KVG7aDB4zyDl9JeidmzFJOnpyPGCEZJzzrXJWGV0q6X
 QLzt+lGGzDOJjkzm4OQd7du3QeyODeIlGPizmQHDmlTZ+ug6QSr3p9reYn4uRfJMar
 EwXw+P4krJQo+OZ2KArfEIZTDqdFqRbWeXjGYChH5nK4uXD+nT1/pagQsnb8JbIB/J
 PfX0UtNWY3sgFerI4nxqSXwlYOxcMyi6riIpo1k0ieeBQZMsfb999bzPKDVYrzsja9
 ic8x/sl66WetMSLWjZyH7vob1UEP2hjtNpaNHWsBuf0o5kcpei/eW3DK3XkQ3bnYPb
 FIzYr3XntbicA==
Message-ID: <e5e9e8dd-a5b6-cfd2-44d6-4d5aa768e56c@collabora.com>
Date: Thu, 26 Jan 2023 01:55:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 00/11] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
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
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas and Gerd,

On 1/9/23 00:04, Dmitry Osipenko wrote:
> This series:
> 
>   1. Makes minor fixes for drm_gem_lru and Panfrost
>   2. Brings refactoring for older code
>   3. Adds common drm-shmem memory shrinker
>   4. Enables shrinker for VirtIO-GPU driver
>   5. Switches Panfrost driver to the common shrinker
> 
> Changelog:
> 
> v10:- Rebased on a recent linux-next.
> 
>     - Added Rob's ack to MSM "Prevent blocking within shrinker loop" patch.
> 
>     - Added Steven's ack/r-b/t-b for the Panfrost patches.
> 
>     - Fixed missing export of the new drm_gem_object_evict() function.
> 
>     - Added fixes tags to the first two patches that are making minor fixes,
>       for consistency.

Do you have comments on this version? Otherwise ack will be appreciated.
Thanks in advance!

-- 
Best regards,
Dmitry

