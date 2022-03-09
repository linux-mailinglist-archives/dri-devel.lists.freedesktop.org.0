Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A364D3CE1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 23:25:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E001B10E507;
	Wed,  9 Mar 2022 22:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A344710E507
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 22:25:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 53FAF1F44EA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646864747;
 bh=AkGj7nTWMoomWRkdJCvTLzW+5BnCOQ1RLk59S45H2G8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bYtq1SvtGMZR3ZztKfmLLKr3S6w7A/3ieWCdJW6Hvi4gb7anwVpCJV+P2kKdLrSPP
 DtilhNyxqMiS43VK8FyDxExEbZb3GVpxppM8+ghaWBRlhywOvc+Bmtnzd+SSqCdPID
 HvJBrhazTBG12TNiMP4+qwwC8jvK/neSj6hl9+gbC+EQMKP5fVXKVfEXLZ/p69TksO
 6j6bgZ5CxWVGr+IKaYRnpXWTCymJeMzVPM2RES9Yp9dwFuPTVTAsW8oSQA4AIpA4AN
 wRc733Fi0sIBKLseZ5T9clbuDF7K2wYaQiyTFT/mDAo6eCtaz6V2OAc2XnomeoJwEv
 5Z6e+h1b42hZA==
Message-ID: <c9b344ab-b674-d600-da13-94b329a9d46b@collabora.com>
Date: Thu, 10 Mar 2022 01:25:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 0/5] Add memory shrinker to VirtIO-GPU DRM driver
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>
References: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
 <4ce1e172-799c-cba3-0a72-4a6fdf2c6d2f@suse.de>
 <caa9a2ea-d1b4-fa96-0e90-37a89aa0c000@collabora.com>
 <d1169f34-ccd8-299d-af1f-f45da37556db@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <d1169f34-ccd8-299d-af1f-f45da37556db@suse.de>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/9/22 22:28, Thomas Zimmermann wrote:
> Hi
> 
> Am 09.03.22 um 12:55 schrieb Dmitry Osipenko:
>> Hello,
>>
>> On 3/9/22 11:59, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 08.03.22 um 14:17 schrieb Dmitry Osipenko:
>>>> Hello,
>>>>
>>>> This patchset introduces memory shrinker for the VirtIO-GPU DRM driver.
>>>> During OOM, the shrinker will release BOs that are marked as "not
>>>> needed"
>>>> by userspace using the new madvise IOCTL. The userspace in this case is
>>>> the Mesa VirGL driver, it will mark the cached BOs as "not needed",
>>>> allowing kernel driver to release memory of the cached shmem BOs on
>>>> lowmem
>>>> situations, preventing OOM kills.
>>>
>>> Virtio-gpu is build on top of GEM shmem helpers. I have a prototype
>>> patchset that adds a shrinker to these helpers. If you want to go
>>> further, you could implement something like that instead. Panfrost and
>>> lima also have their own shrinker and could certainly be converted to
>>> the gem-shmem shrinker.
>>
>> I had a thought that it could be possible to unify shrinkers into a
>> common DRM framework. Could you please give me a link to yours prototype
>> patchset?
> 
> I uploaded the patches to
> 
> 
> https://gitlab.freedesktop.org/tzimmermann/linux/-/commits/gem-shmem-cached-mappings
> 
> 
> it's incomplete and un-debugged, but it shows what needs to be done. It
> has the infrastructure, but lacks the changes to the GEM shmem code.
> 
> The reason for this work is to keep GEM shmem pages mapped and allocated
> even while the BO is neither mapped nor pinned.  As it is now, GEM SHMEM
> creates and releases pages on each pin and unpin, and maps and unmaps
> memory ranges on each vmap and vunmap.  It's all wasteful. Only the
> first pin and vmap calls should establish pages and mappings and only
> the purge and free functions should release them.

Hm, aren't maps and pins already refcounted?

> The patchset adds new helpers for BO purging to struct
> drm_gem_object_funcs. With this, I think it might be possible to have
> one global DRM shrinker and let it handle all BOs; independent of each
> BO's memory manager.

Thank you, I'll give it a try.
