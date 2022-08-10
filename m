Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E007658F304
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 21:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BF4913C3;
	Wed, 10 Aug 2022 19:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CB88BFA1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 19:26:15 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-13.nat.spd-mgts.ru
 [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F1FD86601C73;
 Wed, 10 Aug 2022 20:26:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1660159574;
 bh=lKDS+8XGWYTEUMy9n4JVlMo+97ehb8hPjoaSdgmoHsI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ca0mCEqTwate7hBwX9o+nUz8JpwDmjo7nQv6ySUjKW4CuE+Dqzg/nDRpy81WSU6M5
 Qw2/brgHxEM0B+o02EXi9Oc+za8LOWC/FRPkNpwDs/kuw4cSemcG9/JeKb5qwDQ5+U
 Fu3nRb90Vr2zl75fQ20Q9xbpueW701PD5qYzncovk4c469mTYTKp8FWnTf9hSRboIR
 LXmoYbtLP3KEO6vY1cWhbl48eVmbdI1srieFfshO9SzFs2votZ8WJUk8/s1abNXikv
 7jsTeKWR5qg9FcQh+h6fbIo5yFFZQpBrMlCPdHGZMKsx0QYtuikd2lOguvkgz6rkO0
 uY+tlcbpmfQmw==
Message-ID: <9674d00e-c0d6-ceba-feab-5dc475bda694@collabora.com>
Date: Wed, 10 Aug 2022 22:26:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v8 2/2] drm/gem: Don't map imported GEMs
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com
References: <20220701090240.1896131-1-dmitry.osipenko@collabora.com>
 <20220701090240.1896131-3-dmitry.osipenko@collabora.com>
 <2bb95e80-b60a-36c0-76c8-a06833032c77@amd.com>
 <CAF6AEGtqPeF1DjmBKgzWK39Yi81YiNjTjDNn85TKx7uwicFTSA@mail.gmail.com>
 <2a646ce4-c2ec-3b11-77a0-cc720afd6fe1@collabora.com>
 <YvOav/vF2awVWIu0@phenom.ffwll.local>
 <CAF6AEGvfAJgwBe4+sK0gAkZ++MwH9x4=698C8XSnmfYNMFZqfA@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAF6AEGvfAJgwBe4+sK0gAkZ++MwH9x4=698C8XSnmfYNMFZqfA@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/10/22 18:08, Rob Clark wrote:
> On Wed, Aug 10, 2022 at 4:47 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Wed, Jul 06, 2022 at 10:02:07AM +0300, Dmitry Osipenko wrote:
>>> On 7/6/22 00:48, Rob Clark wrote:
>>>> On Tue, Jul 5, 2022 at 4:51 AM Christian König <christian.koenig@amd.com> wrote:
>>>>>
>>>>> Am 01.07.22 um 11:02 schrieb Dmitry Osipenko:
>>>>>> Drivers that use drm_gem_mmap() and drm_gem_mmap_obj() helpers don't
>>>>>> handle imported dma-bufs properly, which results in mapping of something
>>>>>> else than the imported dma-buf. On NVIDIA Tegra we get a hard lockup when
>>>>>> userspace writes to the memory mapping of a dma-buf that was imported into
>>>>>> Tegra's DRM GEM.
>>>>>>
>>>>>> Majority of DRM drivers prohibit mapping of the imported GEM objects.
>>>>>> Mapping of imported GEMs require special care from userspace since it
>>>>>> should sync dma-buf because mapping coherency of the exporter device may
>>>>>> not match the DRM device. Let's prohibit the mapping for all DRM drivers
>>>>>> for consistency.
>>>>>>
>>>>>> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>>>
>>>>> I'm pretty sure that this is the right approach, but it's certainly more
>>>>> than possible that somebody abused this already.
>>>>
>>>> I suspect that this is abused if you run deqp cts on android.. ie. all
>>>> winsys buffers are dma-buf imports from gralloc.  And then when you
>>>> hit readpix...
>>>>
>>>> You might only hit this in scenarios with separate gpu and display (or
>>>> dGPU+iGPU) because self-imports are handled differently in
>>>> drm_gem_prime_import_dev().. and maybe not in cases where you end up
>>>> with a blit from tiled/compressed to linear.. maybe that narrows the
>>>> scope enough to just fix it in userspace?
>>>
>>> Given that that only drivers which use DRM-SHMEM potentially could've
>>> map imported dma-bufs (Panfrost, Lima) and they already don't allow to
>>> do that, I think we're good.
>>
>> So can I have an ack from Rob here or are there still questions that this
>> might go boom?
>>
>> Dmitry, since you have a bunch of patches merged now I think would also be
>> good to get commit rights so you can drive this more yourself. I've asked
>> Daniel Stone to help you out with getting that.
> 
> I *think* we'd be ok with this on msm, mostly just by dumb luck.
> Because the dma-buf's we import will be self-import.  I'm less sure
> about panfrost (src/panfrost/lib/pan_bo.c doesn't seem to have a
> special path for imported dma-bufs either, and in that case they won't
> be self-imports.. but I guess no one has tried to run android cts on
> panfrost).

The last time I tried to mmap dma-buf imported to Panfrost didn't work
because Panfrost didn't implement something needed for that. I'll need
to take a look again because can't recall what it was.

> What about something less drastic to start, like (apologies for
> hand-edited patch):
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 86d670c71286..fc9ec42fa0ab 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1034,6 +1034,10 @@ int drm_gem_mmap_obj(struct drm_gem_object
> *obj, unsigned long obj_size,
>  {
>         int ret;
> 
> +       WARN_ON_ONCE(obj->import_attach);

This will hang NVIDIA Tegra, which is what this patch fixed initially.
If neither of upstream DRM drivers need to map imported dma-bufs and
never needed, then why do we need this?

-- 
Best regards,
Dmitry
