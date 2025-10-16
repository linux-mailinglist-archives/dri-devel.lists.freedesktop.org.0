Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675F6BE1E06
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 09:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF6410E971;
	Thu, 16 Oct 2025 07:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fpKLHuCK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8D810E96E;
 Thu, 16 Oct 2025 07:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760598567;
 bh=wn0XYjgDUo7meinqB6BVytuKFbpuX7M+TXDWRXqZTFE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fpKLHuCK3bPwex9k7zImSkr4e9sRbUoIKgvaRTS2zY2K5gDqgUytx6A8FGQlm710A
 9SpZ6cjecVW/vuaLXncA26yveOEUYMMEx94CVPrNL9QZ2iyJAW/xdt3WmUwFfmukZd
 PxqXaM882ixQmb2SWB/X3gRHgJE3IpHedCsrjNy6/QR9J5t6xeBTsDfMhwFrJMsowQ
 MAmFsdt9SduJLiwvOmE3UQCTec7G9XeStuEZjBMz9gXqGQICDjDswvdPAsVn/A9Eg6
 E/iqNFK3EgTBX1vFeEpzqEt6KXi6WSwsq2EA4/wfRdmHN+wG+1JcRxqYGSJNS5C465
 CaYbz1cB1MdNg==
Received: from [IPV6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa] (unknown
 [IPv6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DD4AA17E12BA;
 Thu, 16 Oct 2025 09:09:26 +0200 (CEST)
Message-ID: <02c8447d-25fc-4503-873f-0b2932e218ec@collabora.com>
Date: Thu, 16 Oct 2025 09:09:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] drm/v3d: Fix builds with
 CONFIG_TRANSPARENT_HUGEPAGE=n
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>, Al Viro
 <viro@zeniv.linux.org.uk>, =?UTF-8?Q?Miko=C5=82aj_Wasiak?=
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Christopher Healy <healych@amazon.com>, Matthew Wilcox
 <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
References: <20251015153018.43735-1-loic.molinari@collabora.com>
 <20251015153018.43735-9-loic.molinari@collabora.com>
 <20251015201737.3956f801@fedora>
 <efc1d805-1613-45a9-aa15-fcc009adf27c@collabora.com>
 <20251016075637.3aec3465@fedora>
Content-Language: fr
From: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>
Organization: Collabora Ltd
In-Reply-To: <20251016075637.3aec3465@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Boris,

On 16/10/2025 07:56, Boris Brezillon wrote:
> On Wed, 15 Oct 2025 22:41:59 +0200
> Loïc Molinari <loic.molinari@collabora.com> wrote:
> 
>> On 15/10/2025 20:17, Boris Brezillon wrote:
>>> On Wed, 15 Oct 2025 17:30:12 +0200
>>> Loïc Molinari <loic.molinari@collabora.com> wrote:
>>>    
>>>> Don't declare "super_pages" on builds with CONFIG_TRANSPARENT_HUGEPAGE
>>>> disabled to prevent build error:
>>>>
>>>> ERROR: modpost: "super_pages" [drivers/gpu/drm/v3d/v3d.ko] undefined!
>>>
>>> I believe this is a bug introduced by the previous commit: the
>>> compiler probably drops any code between the
>>> IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) check and the err label
>>> because IS_ENABLED() evaluates to false at compile time. So I'd squash
>>> those changes in the previous commit.
>>
>> Right, it's been introduced in previous commit.
>>
>>>   
>>>>
>>>> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
>>>> ---
>>>>    drivers/gpu/drm/v3d/v3d_drv.h | 2 ++
>>>>    drivers/gpu/drm/v3d/v3d_gem.c | 2 ++
>>>>    2 files changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
>>>> index 99a39329bb85..481502104391 100644
>>>> --- a/drivers/gpu/drm/v3d/v3d_drv.h
>>>> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
>>>> @@ -564,7 +564,9 @@ extern const struct dma_fence_ops v3d_fence_ops;
>>>>    struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_queue q);
>>>>    
>>>>    /* v3d_gem.c */
>>>> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>>>    extern bool super_pages;
>>>> +#endif
>>>>    int v3d_gem_init(struct drm_device *dev);
>>>>    void v3d_gem_destroy(struct drm_device *dev);
>>>>    void v3d_reset_sms(struct v3d_dev *v3d);
>>>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
>>>> index 635ff0fabe7e..0039063eb8b2 100644
>>>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
>>>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>>>> @@ -269,7 +269,9 @@ v3d_huge_mnt_init(struct v3d_dev *v3d)
>>>>    	 * match our usecase.
>>>>    	 */
>>>>    
>>>> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>>>    	if (super_pages)
>>>> +#endif
>>>>    		err = drm_gem_huge_mnt_create(&v3d->drm, "within_size");
>>>
>>> Why not
>>>
>>> #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>>     	if (super_pages)
>>>     		err = drm_gem_huge_mnt_create(&v3d->drm, "within_size");
>>> #endif
>>>
>>> I guess
>>>
>>> 	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && super_pages)
>>> 		err = drm_gem_huge_mnt_create(&v3d->drm, "within_size");
>>>
>>> would also do, since it's likely to rely on the same optimization the
>>> previous v3d_gemfs_init() implementation was relying on, but it's
>>> fragile (not sure what happens when compiled with -O0).
>>
>> I'll remove the #ifdef/#endif around the super_pages declaration in
>> v3d_drv.h because it isn't necessary if super_pages is compiled out in
>> v3d_huge_mnt_init().
>>
>> In v3d_huge_mnt_init(), I'd add the #ifdef before the ret variable
>> declaration and the #endif right after the last else so that it's clear
>> drm_notice("THP is recommended...") is called unconditionally when
>> CONFIG_TRANSPARENT_HUGEPAGE=n, whatever the optim level. What do you think?
> 
> First off, I'm not a huge fan of the following pattern
> 
> #if foo
> 	if (xxxx)
> #endif
> 		do_something
> 
> which also applies to
> 
> #if foo
> 	if (xxxx)
> 		do_xxx
> 	else if (yyy)
> 		do_yyy
> 	else
> #endif
> 		do_something
> 
> I'd rather have do_something duplicated in an #else section
> like that:
> 
> #if foo
> 	if (xxxx)
> 		do_xxx
> 	else if (yyy)
> 		do_yyy
> 	else
> 		do_something
> #else
> 	do_something
> #endif
> 
> But I'm not even seeing what the problem is here. If you do:
> 
> 	int err = 0;
> 
> #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>      	if (super_pages)
>      		err = drm_gem_huge_mnt_create(&v3d->drm, "within_size");
> #endif
> 
> 	if (v3d->drm.huge_mnt)
> 		drm_info(&v3d->drm, "Using Transparent Hugepages\n");
> 	else if (err)
> 		drm_warn(&v3d->drm, "Can't use Transparent Hugepages (%d)\n", err);
> 	else
> 		drm_notice(&v3d->drm,
> 			   "Transparent Hugepage support is recommended for optimal performance on this platform!\n");
> 
> You're guaranteed that err=0 and v3d->drm.huge_mnt=NULL when
> CONFIG_TRANSPARENT_HUGEPAGE=n, so the "THP recommended"
> message should be displayed unconditionally. Am I missing
> something?

It doesn't really matter here but I just thought it would be cleaner to 
explicitly let just the drm_notice() because the compiler doesn't know 
v3d->drm.huge_mnt is always NULL here and would emit a branch in 
CONFIG_TRANSPARENT_HUGEPAGE=n builds. I know your dislike for this 
pattern now, so I will stick to the suggestion :)

Loïc
