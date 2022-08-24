Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 937C759FE28
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 17:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6F710F5F9;
	Wed, 24 Aug 2022 15:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB6010E583;
 Wed, 24 Aug 2022 15:22:06 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-13.nat.spd-mgts.ru
 [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F0606601E8F;
 Wed, 24 Aug 2022 16:22:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661354524;
 bh=0T3J2stygSQ46G6B6v9zKNnVQmlqX5H9hiMN/yLf2Co=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=C7kNvimP5fOeZ0pyknplgArACBn58oK40aC89jsu3KaqWXbcbY8TsmhOzQXGPZXJW
 HlOE9l3nkbpE4cq7o7VzS7BLHKZ7JbB/cOakl527Kh6ywLyq6Vl+/D6cQEe4Tgmdsa
 clxboeNEqjRMl0uZ8PhzGtLQXa+tn7p9f9fX0RM1Sox5gkFZodPnajK1NtmQiu0rUQ
 jCjwYKEH2ZVybOdU5ZggxwmEs9aj+6c4EZ1TaDGOCpNvzNJSTVyvlM7X8dNfWi6Qba
 4ht1LFVkuybaOjoAhoDb5lNkC/scx8bwroiq2hCKb3C5T+0VaVlNIxY0x7+lIxFlrq
 hHP83HoyFxTWA==
Message-ID: <76beb362-09c3-bbff-c50d-794a200cb641@collabora.com>
Date: Wed, 24 Aug 2022 18:22:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 6/9] dma-buf: Move dma-buf attachment to dynamic
 locking specification
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>
References: <20220824102248.91964-1-dmitry.osipenko@collabora.com>
 <20220824102248.91964-7-dmitry.osipenko@collabora.com>
 <17181951-1b40-cd39-48df-58b43cad117d@amd.com>
 <4af793fd-eccc-ad70-65c3-de78dced71f0@collabora.com>
 <b24017e9-e8e7-148e-951b-0f2a1dffdca7@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <b24017e9-e8e7-148e-951b-0f2a1dffdca7@amd.com>
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
Cc: lima@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/24/22 18:14, Christian König wrote:
> Am 24.08.22 um 17:03 schrieb Dmitry Osipenko:
>> On 8/24/22 17:08, Christian König wrote:
>>> Am 24.08.22 um 12:22 schrieb Dmitry Osipenko:
>>>> Move dma-buf attachment API functions to the dynamic locking
>>>> specification.
>>>> The strict locking convention prevents deadlock situations for dma-buf
>>>> importers and exporters.
>>>>
>>>> Previously, the "unlocked" versions of the attachment API functions
>>>> weren't taking the reservation lock and this patch makes them to take
>>>> the lock.
>>> Didn't we concluded that we need to keep the attach and detach callbacks
>>> without the lock and only move the map/unmap callbacks over?
>>>
>>> Otherwise it won't be possible for drivers to lock multiple buffers if
>>> they have to shuffle things around for a specific attachment.
>> We did conclude that. The attach/detach dma-buf ops are unlocked, but
>> the map_dma_buf/unmap_dma_buf must be invoked under lock and
>> dma_buf_dynamic_attach_unlocked() maps dma-buf if either importer or
>> exporter can't handle the dynamic mapping [1].
> 
> Ah! You are confusing me over and over again with that :)
> 
> Ok in this case that here is fine, I just need to re-read the patch.

It's indeed not trivial to review this patch, not sure if we can make it
simpler. Maybe it's possible to factor out the changes related to
dynamic mapping, or maybe it's not worthwhile..

Anyways, thank you for helping with reviewing it :)

-- 
Best regards,
Dmitry
