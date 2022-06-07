Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D3F5402AB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 17:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C659E10E05A;
	Tue,  7 Jun 2022 15:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 579 seconds by postgrey-1.36 at gabe;
 Tue, 07 Jun 2022 15:43:46 UTC
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3920110E05A;
 Tue,  7 Jun 2022 15:43:46 +0000 (UTC)
Received: from [192.168.2.145] (109-252-138-163.dynamic.spd-mgts.ru
 [109.252.138.163])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D1DF06601A26;
 Tue,  7 Jun 2022 16:33:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654616040;
 bh=1OHF6wl6ehs/wRC7M/8ORoOFTl8MMQfJ9asXXd+gmRE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aEIUXUrg6wlcmhJWW9Dpq0CD51JiB4Gk+im588kYV1D7mO9ub6yKFVwNOXpZVJ2wM
 opGS/8b5tqT6A+Qs0IOWZkFwx79fas7g7J+6UFuPd62KDBH4Udp9hStEJ+Rda/cqwS
 /URMw8PUaP1oUBVHs2Yv4T39A3FIsYQBzAsp8bo0QFJ3mZ0J+ykNSYh0VcCXFnvq3G
 IOXQEb+tEfv6oiz2y9m8bvih3N0zkAqVp0jlIZFmtAilcr0aTfPA8jEpZx7IeH9ey7
 VUWWcHduvM3mB3xQmqfjKAk9sBAsGQj/TYmOnhe4+/BKszV79pAEu3Vi5r8hO/X1HA
 L4he4Zd+PxFGA==
Message-ID: <382d50a2-8e47-5e0f-726b-f077be5b8bc6@collabora.com>
Date: Tue, 7 Jun 2022 18:33:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 17/22] drm/shmem-helper: Add generic memory shrinker
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <20220526235040.678984-18-dmitry.osipenko@collabora.com>
 <CAKMK7uHQ+iMkXtrsCWiJL9X1AM9Xkq-wNmj=hhfnenf0r9717g@mail.gmail.com>
 <2aedbd68-cb4b-157c-1ddb-dbdb9348d2fe@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <2aedbd68-cb4b-157c-1ddb-dbdb9348d2fe@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, amd-gfx@lists.freedesktop.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, Qiang Yu <yuq825@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/6/22 13:57, Christian König wrote:
> Am 05.06.22 um 18:47 schrieb Daniel Vetter:
>> On Fri, 27 May 2022 at 01:55, Dmitry Osipenko
>> <dmitry.osipenko@collabora.com> wrote:
>>> Introduce a common DRM SHMEM shrinker framework that allows to reduce
>>> code duplication among DRM drivers by replacing theirs custom shrinker
>>> implementations with the generic shrinker.
>>>
>>> In order to start using DRM SHMEM shrinker drivers should:
>>>
>>> 1. Implement new evict() shmem object callback.
>>> 2. Register shrinker using drm_gem_shmem_shrinker_register(drm_device).
>>> 3. Use drm_gem_shmem_set_purgeable(shmem) and alike API functions to
>>>     activate shrinking of shmem GEMs.
>>>
>>> This patch is based on a ideas borrowed from Rob's Clark MSM shrinker,
>>> Thomas' Zimmermann variant of SHMEM shrinker and Intel's i915 shrinker.
>>>
>>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> So I guess I get a price for being blind since forever, because this
>> thing existed since at least 2013. I just stumbled over
>> llist_lru.[hc], a purpose built list helper for shrinkers. I think we
>> should try to adopt that so that our gpu shrinkers look more like
>> shrinkers for everything else.
> 
> What the heck are you talking about?
> 
> I can't find any llist_lru.[hc] in the linux kernel sources.

I think Daniel meant this:

https://elixir.bootlin.com/linux/v5.19-rc1/source/include/linux/list_lru.h

https://elixir.bootlin.com/linux/v5.19-rc1/source/mm/list_lru.c


-- 
Best regards,
Dmitry
