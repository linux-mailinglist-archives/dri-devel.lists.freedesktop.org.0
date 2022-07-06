Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D20567F39
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 09:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15148112036;
	Wed,  6 Jul 2022 07:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7ECA112036
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 07:02:14 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-232.nat.spd-mgts.ru
 [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 032266601824;
 Wed,  6 Jul 2022 08:02:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657090933;
 bh=3kFIlo73JPC7k/gbRqw+WxdlGeaZ8IxSG90hClRzzNw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PqIJtSXmD51oSDnhPr7cbQ3HgaDU2VJvXoQA9lI06vBnDG8++5DkjbQ0zfgstkebX
 Bhz9kmfxSmZXElA9X1M30fK8vd3DB8gIiZs+2JrdniTHTN9R73jQPhkfMI73jLXYt6
 1IpiM0aMkRVDA+7yEeuOIl/hTXWIl3qocO2GDA/46JXb5nXoyjMPLHj4zvCeFeKh0L
 SfPQkBm0s2JCZzAwk4r+dN5gGF7ORUKOuq0L5TN/b5Kaw2bAbroGhwAnmzrNm3YPJR
 Zxa5hBOoIUCmZg9mRAoEnLZzU9gfOXVsL5O6ZLz+UonU4Yh+EW/pnx+SYBhucehaS+
 JpYgWgnItX2Pw==
Message-ID: <2a646ce4-c2ec-3b11-77a0-cc720afd6fe1@collabora.com>
Date: Wed, 6 Jul 2022 10:02:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v8 2/2] drm/gem: Don't map imported GEMs
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220701090240.1896131-1-dmitry.osipenko@collabora.com>
 <20220701090240.1896131-3-dmitry.osipenko@collabora.com>
 <2bb95e80-b60a-36c0-76c8-a06833032c77@amd.com>
 <CAF6AEGtqPeF1DjmBKgzWK39Yi81YiNjTjDNn85TKx7uwicFTSA@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAF6AEGtqPeF1DjmBKgzWK39Yi81YiNjTjDNn85TKx7uwicFTSA@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, kernel@collabora.com,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/6/22 00:48, Rob Clark wrote:
> On Tue, Jul 5, 2022 at 4:51 AM Christian König <christian.koenig@amd.com> wrote:
>>
>> Am 01.07.22 um 11:02 schrieb Dmitry Osipenko:
>>> Drivers that use drm_gem_mmap() and drm_gem_mmap_obj() helpers don't
>>> handle imported dma-bufs properly, which results in mapping of something
>>> else than the imported dma-buf. On NVIDIA Tegra we get a hard lockup when
>>> userspace writes to the memory mapping of a dma-buf that was imported into
>>> Tegra's DRM GEM.
>>>
>>> Majority of DRM drivers prohibit mapping of the imported GEM objects.
>>> Mapping of imported GEMs require special care from userspace since it
>>> should sync dma-buf because mapping coherency of the exporter device may
>>> not match the DRM device. Let's prohibit the mapping for all DRM drivers
>>> for consistency.
>>>
>>> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>
>> I'm pretty sure that this is the right approach, but it's certainly more
>> than possible that somebody abused this already.
> 
> I suspect that this is abused if you run deqp cts on android.. ie. all
> winsys buffers are dma-buf imports from gralloc.  And then when you
> hit readpix...
> 
> You might only hit this in scenarios with separate gpu and display (or
> dGPU+iGPU) because self-imports are handled differently in
> drm_gem_prime_import_dev().. and maybe not in cases where you end up
> with a blit from tiled/compressed to linear.. maybe that narrows the
> scope enough to just fix it in userspace?

Given that that only drivers which use DRM-SHMEM potentially could've
map imported dma-bufs (Panfrost, Lima) and they already don't allow to
do that, I think we're good.

-- 
Best regards,
Dmitry
