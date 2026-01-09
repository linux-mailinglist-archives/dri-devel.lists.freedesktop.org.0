Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEC5D08467
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 10:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369E710E866;
	Fri,  9 Jan 2026 09:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fi5ilkle";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6388110E857
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 09:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767951742;
 bh=Zy2l3oKQw3t2x6kNs39q49t+sb8f2Uupj1dlfI0mZWA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fi5ilkleD3w/Qsrxg074xpFZ1MfXzrWmp223b1xe5ze5XD5V4N9dkIqXJc85Jz5Um
 sN9wIRQZ6RqT/iBCcBP41BizaE0VM11dYpLl7M6Xq6ox2w/0WffPyGydkYgsAQJSCA
 tFPdvn19KLpSjFu57o8BFnKvSPdu9UdAdIJ8Lx6+CVld6Ll+HzRlHXKG3HUd+rYJfg
 YUyiMirewzLyGuFhY5+N+xpimWTQNIF0vhqOdfWvj3SkYEBahqHgqcULhgwvLpObYG
 vGw3mJcDEj2WjP4KKCF1ylqA0TsCgWUv33LWRB1VK1gJInUXs+NJBmgFOtV8gcP2d/
 Z9vrPcct7YZUw==
Received: from [IPV6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa] (unknown
 [IPv6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8113F17E0CB0;
 Fri,  9 Jan 2026 10:42:22 +0100 (CET)
Message-ID: <e1b735a7-318a-49e1-904c-1db737f4788a@collabora.com>
Date: Fri, 9 Jan 2026 10:42:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem: Fix a GEM leak in drm_gem_get_unmapped_area()
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 kernel@collabora.com
References: <20260106164935.409765-1-boris.brezillon@collabora.com>
 <20260107121232.6e1efae5@fedora>
 <43836c92-d19e-43c9-8480-cb26c37bdfea@collabora.com>
 <20260108144344.33952ddf@fedora>
 <1423e153-3b4b-4b8e-9614-955af95c6b08@collabora.com>
 <20260108154554.66d22550@fedora>
Content-Language: fr
From: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>
Organization: Collabora Ltd
In-Reply-To: <20260108154554.66d22550@fedora>
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

On 08/01/2026 15:45, Boris Brezillon wrote:
> On Thu, 8 Jan 2026 15:04:33 +0100
> Loïc Molinari <loic.molinari@collabora.com> wrote:
> 
>> On 08/01/2026 14:43, Boris Brezillon wrote:
>>> On Thu, 8 Jan 2026 14:25:01 +0100
>>> Loïc Molinari <loic.molinari@collabora.com> wrote:
>>>    
>>>> On 07/01/2026 12:12, Boris Brezillon wrote:
>>>>> On Tue,  6 Jan 2026 17:49:35 +0100
>>>>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>>>>>       
>>>>>> drm_gem_object_lookup_at_offset() can return a valid object with
>>>>>> filp or filp->f_op->get_unmapped_area set to NULL. Make sure we still
>>>>>> release the ref we acquired on such objects.
>>>>>>
>>>>>> Cc: Loïc Molinari <loic.molinari@collabora.com>
>>>>>> Fixes: 99bda20d6d4c ("drm/gem: Introduce drm_gem_get_unmapped_area() fop")
>>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/drm_gem.c | 10 ++++++----
>>>>>>     1 file changed, 6 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>>>> index 36c8af123877..f7cbf6e8d1e0 100644
>>>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>>>> @@ -1298,11 +1298,13 @@ unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
>>>>>>     	unsigned long ret;
>>>>>>     
>>>>>>     	obj = drm_gem_object_lookup_at_offset(filp, pgoff, len >> PAGE_SHIFT);
>>>>>> -	if (IS_ERR(obj) || !obj->filp || !obj->filp->f_op->get_unmapped_area)
>>>>>> -		return mm_get_unmapped_area(filp, uaddr, len, 0, flags);
>>>>>> +	if (IS_ERR(obj))
>>>>>> +		obj = NULL;
>>>>>>     
>>>>>> -	ret = obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0,
>>>>>> -						 flags);
>>>>>> +	if (!obj || !obj->filp || !obj->filp->f_op->get_unmapped_area)
>>>>>> +		ret = mm_get_unmapped_area(filp, uaddr, len, 0, flags);
>>>>>
>>>>> Also, I'm wondering if we shouldn't pass pgoff instead of zero here to
>>>>> have the exact same behavior that existed before
>>>>> drm_gem_get_unmapped_area() was introduced.
>>>>>       
>>>>
>>>> For mappings with a file (the DRM file in our case), if
>>>> filp->f_op->get_unmapped_area isn't set then generic_get_unmapped_area()
>>>> is used and it ignores the pgoff argument.
>>>
>>> That's true for architectures that rely on the default implementation
>>> (Arm64 for instance), but other architectures might have their own
>>> implementation.
>>>
>>>    
>>>> So it wasn't 0 before but was
>>>> ignored anyway.
>>>
>>> Didn't check all of them but the Arm implementation does take this
>>> pgoff into account if I read the code correctly [1]. The fact this
>>> argument is passed around makes me think other architectures might take
>>> this into account too. I know this pgoff is just a fake offset into the
>>> /dev/dri pseudo-file, but if we want to err on the safe side, we'd
>>> rather do exactly what was done before drm_gem_get_unmapped_area() was
>>> introduced for the ->filp==NULL case. That's just my 2 cts, of course.
>>
>> You're right, I focused on arm64 here and there's obviously other archs
>> so we'd better pass pgoff for the fallback case.
> 
> Do you want me to send a patch doing that, or should I take care of it?

I'll take care of it. I'd better wait for that GEM leak fix to be pulled 
first to avoid a conflict, right?

Regards,
Loïc
