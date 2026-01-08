Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D84D03521
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 15:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B69410E73D;
	Thu,  8 Jan 2026 14:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Y2rczzRS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1365F10E73D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 14:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767881342;
 bh=Q//qrD1Z3duteDuEaAOewFN2FF/qUxxR+YXzz3dE5cg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Y2rczzRSbTKSOFImVkxpUj/hFuFD3PXsHTIW2RtiSkcR687Moj3jY7pcuGhUGTAvn
 ByCCSyf9ZntUXZenIbBm0+digtibN6PbCAvZxDTDwHCw76knn//rXnKtNPZey34nXr
 8UDTX8N7NrNOT/Jdb4K3EgYsWlMbBD8EQOGmIFl3DQLsbDfYDbx/dj3KYdmlP4vpBU
 qM8reNicN8NAKyz0vfafrlOtpNjDQDPXxoqYprVFDVCSSM8Zg/Jfywi8iHtbCXJhu4
 ppzBBc04CJFk2n6mhCUOpwsoWKvjrKh2odLBGS/5H8w7EBKTNdn+DVFhvOXShq17wr
 D9El9E9CkrrBw==
Received: from [IPV6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa] (unknown
 [IPv6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 21AEE17E0699;
 Thu,  8 Jan 2026 15:09:02 +0100 (CET)
Message-ID: <1a8fe2f2-001c-4c37-8bbc-f80c2c1c10d5@collabora.com>
Date: Thu, 8 Jan 2026 15:09:01 +0100
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
 <5e012ec2-ed8a-4195-8486-f5038c430f82@collabora.com>
 <20260108143122.41af011b@fedora>
Content-Language: fr
From: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>
Organization: Collabora Ltd
In-Reply-To: <20260108143122.41af011b@fedora>
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

On 08/01/2026 14:31, Boris Brezillon wrote:
> On Thu, 8 Jan 2026 14:18:26 +0100
> Loïc Molinari <loic.molinari@collabora.com> wrote:
> 
>> Hi Boris,
>>
>> On 06/01/2026 17:49, Boris Brezillon wrote:
>>> drm_gem_object_lookup_at_offset() can return a valid object with
>>> filp or filp->f_op->get_unmapped_area set to NULL. Make sure we still
>>> release the ref we acquired on such objects.
>>>
>>> Cc: Loïc Molinari <loic.molinari@collabora.com>
>>> Fixes: 99bda20d6d4c ("drm/gem: Introduce drm_gem_get_unmapped_area() fop")
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> ---
>>>    drivers/gpu/drm/drm_gem.c | 10 ++++++----
>>>    1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>> index 36c8af123877..f7cbf6e8d1e0 100644
>>> --- a/drivers/gpu/drm/drm_gem.c
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -1298,11 +1298,13 @@ unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
>>>    	unsigned long ret;
>>>    
>>>    	obj = drm_gem_object_lookup_at_offset(filp, pgoff, len >> PAGE_SHIFT);
>>> -	if (IS_ERR(obj) || !obj->filp || !obj->filp->f_op->get_unmapped_area)
>>> -		return mm_get_unmapped_area(filp, uaddr, len, 0, flags);
>>> +	if (IS_ERR(obj))
>>> +		obj = NULL;
>>>    
>>> -	ret = obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0,
>>> -						 flags);
>>> +	if (!obj || !obj->filp || !obj->filp->f_op->get_unmapped_area)
>>> +		ret = mm_get_unmapped_area(filp, uaddr, len, 0, flags);
>>> +	else
>>> +		ret = obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0, flags);
>>
>> Apart maybe for this line exceeding 80 chars:
> 
> The limit has been bumped to 100 chars a while ago (checkpatch --strict
> didn't complain), and for these single statements inside conditional
> blocks, I prefer to have them on a single line when I can because
> otherwise I tend to add curly braces to clearly flag the end of each
> conditional block.

Yeah, just mentioned it for consistency within the file.

Regards,
Loïc

> 
>>
>> Reviewed-by: Loïc Molinari <loic.molinari@collabora.com>
> 
> Thanks!

