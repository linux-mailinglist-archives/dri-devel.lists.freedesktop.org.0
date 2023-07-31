Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD3976964B
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 14:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5015C10E280;
	Mon, 31 Jul 2023 12:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B4610E280
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 12:27:37 +0000 (UTC)
Received: from [192.168.2.174] (109-252-150-127.dynamic.spd-mgts.ru
 [109.252.150.127])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CA89666020AE;
 Mon, 31 Jul 2023 13:27:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690806456;
 bh=t+kNYnRp3JEhtRu3dv/EMffqWCWXTjQlm8JAtUsnSlM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kkjTv2by5suJcB3axLiTbVi3kI0kXtHBEYujiRVXo2butVE3i6rgt5aDFhldO4kFO
 46lQhNIa3g762H7hnJliI5g7bhudEfjySh66SsOYXp9N3X5pPTQWycMZkiGe1qVyDA
 I+Y+xW2zs0qWP+VdYgZQ0I17Md9tWp1TO18GvgioAuf7DwEOEEO8xYVH0WH1mECbPn
 OgrjJ2YSzOhgVf+JnJfHN+l6p6BcX+IkrKfdM9it6o+nOFdxSl1yIua5/YJtp+pths
 mxf+EJtBVHxK/R0qE5rwqsjXcLq/MBb3UEKip7EC3vsLppqOjxi/RlJYzo+1WLEDsR
 uzfU8t+dBOYbA==
Message-ID: <4c5fa735-9bfd-f92a-8deb-888c7368f89e@collabora.com>
Date: Mon, 31 Jul 2023 15:27:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v14 02/12] drm/shmem-helper: Add pages_pin_count field
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230722234746.205949-1-dmitry.osipenko@collabora.com>
 <20230722234746.205949-3-dmitry.osipenko@collabora.com>
 <20230725092709.51356f39@collabora.com>
 <20230725103234.0c8923f1@collabora.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230725103234.0c8923f1@collabora.com>
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/25/23 11:32, Boris Brezillon wrote:
>> Can we make it an atomic_t, so we can avoid taking the lock when the
>> GEM has already been pinned. That's something I need to be able to grab
>> a pin-ref in a path where the GEM resv lock is already held[1]. We could
>> of course expose the locked version,
> My bad, that's actually not true. The problem is not that I call
> drm_gem_shmem_pin() with the resv lock already held, but that I call
> drm_gem_shmem_pin() in a dma-signaling path where I'm not allowed to
> take a resv lock. I know for sure pin_count > 0, because all GEM objects
> mapped to a VM have their memory pinned right now, and this should
> stand until we decide to add support for live-GEM eviction, at which
> point we'll probably have a way to detect when a GEM is evicted, and
> avoid calling drm_gem_shmem_pin() on it.
> 
> TLDR; I can't trade the atomic_t for a drm_gem_shmem_pin_locked(),
> because that wouldn't solve my problem. The other solution would be to
> add an atomic_t at the driver-GEM level, and only call
> drm_gem_shmem_[un]pin() on 0 <-> 1 transitions, but I thought using an
> atomic at the GEM-shmem level, to avoid locking when we can, would be
> beneficial to the rest of the eco-system. Let me know if that's not an
> option, and I'll go back to the driver-specific atomic_t.

Could you please explain why do you need to pin GEM in a signal handler?
This is not something drivers usually do or need to do. You likely also
shouldn't need to detect that GEM is evicted in yours driver. I'd expect
that Panthor shouldn't differ from Panfrost in regards to how GEM memory
management is done and Panfrost doesn't need to do anything special.

Note that patch #14 makes locked pin/unpin functions public and turns
the unlocked variants into helpers, you'll be able to experiment with
these funcs in the Panthor driver.

In general, using atomic_t or kref should be a good thing to do, but
AFAICS it shouldn't bring benefits to the today's drm-shmem users. I'd
want to understand what you're trying to achieve in the Panthor driver.

-- 
Best regards,
Dmitry

