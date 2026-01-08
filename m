Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B18D02FEC
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 14:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F49210E711;
	Thu,  8 Jan 2026 13:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jl8dFMU2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1831F10E711
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 13:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767878702;
 bh=nuiZnCuAiBcTMsswvUhdIZxNYSBzFaGj51FDWSvGZNw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jl8dFMU2WmItfzfQYEdxZBFYlAHNADAhzGyJdj7TX6+IgDLpKCeFALJWSxgublJHP
 AJNjwfBd8ULln2iq5bALiB9WZ/K18t0/ioxmC+JZoGHpgG5LJEMb5MOsrInP+D1LnP
 SP1rMw7xMNb3a0HdsPGRrhFYbAla23V931LXHM1Mdt2bUq4ncaMO5MiBc3FmEtBuhM
 rrNlcLtyaYSsOK+UuNoGPyaYFz3EqDZkjdd2jWljwiXy4kd6nTgU2jcB2bNEQufSdJ
 buQtcN6fXG6Gnwvk4+eNhgYSA+RRYXNOO5/s+SD08Zaf2kt6DiOhGIE3e6QIlzkkCH
 AMA7U14JFj/LA==
Received: from [IPV6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa] (unknown
 [IPv6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 46C7817E1214;
 Thu,  8 Jan 2026 14:25:02 +0100 (CET)
Message-ID: <43836c92-d19e-43c9-8480-cb26c37bdfea@collabora.com>
Date: Thu, 8 Jan 2026 14:25:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem: Fix a GEM leak in drm_gem_get_unmapped_area()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: kernel@collabora.com
References: <20260106164935.409765-1-boris.brezillon@collabora.com>
 <20260107121232.6e1efae5@fedora>
Content-Language: fr
From: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>
Organization: Collabora Ltd
In-Reply-To: <20260107121232.6e1efae5@fedora>
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

On 07/01/2026 12:12, Boris Brezillon wrote:
> On Tue,  6 Jan 2026 17:49:35 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
>> drm_gem_object_lookup_at_offset() can return a valid object with
>> filp or filp->f_op->get_unmapped_area set to NULL. Make sure we still
>> release the ref we acquired on such objects.
>>
>> Cc: Loïc Molinari <loic.molinari@collabora.com>
>> Fixes: 99bda20d6d4c ("drm/gem: Introduce drm_gem_get_unmapped_area() fop")
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> ---
>>   drivers/gpu/drm/drm_gem.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 36c8af123877..f7cbf6e8d1e0 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -1298,11 +1298,13 @@ unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
>>   	unsigned long ret;
>>   
>>   	obj = drm_gem_object_lookup_at_offset(filp, pgoff, len >> PAGE_SHIFT);
>> -	if (IS_ERR(obj) || !obj->filp || !obj->filp->f_op->get_unmapped_area)
>> -		return mm_get_unmapped_area(filp, uaddr, len, 0, flags);
>> +	if (IS_ERR(obj))
>> +		obj = NULL;
>>   
>> -	ret = obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0,
>> -						 flags);
>> +	if (!obj || !obj->filp || !obj->filp->f_op->get_unmapped_area)
>> +		ret = mm_get_unmapped_area(filp, uaddr, len, 0, flags);
> 
> Also, I'm wondering if we shouldn't pass pgoff instead of zero here to
> have the exact same behavior that existed before
> drm_gem_get_unmapped_area() was introduced.
> 

For mappings with a file (the DRM file in our case), if 
filp->f_op->get_unmapped_area isn't set then generic_get_unmapped_area() 
is used and it ignores the pgoff argument. So it wasn't 0 before but was 
ignored anyway. I don't mind passing pgoff but I find it simpler like that.

Regards,
Loïc

>> +	else
>> +		ret = obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0, flags);
>>   
>>   	drm_gem_object_put(obj);
>>   
> 

