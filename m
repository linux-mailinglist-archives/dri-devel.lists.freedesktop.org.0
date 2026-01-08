Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A576D02F26
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 14:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8B810E34E;
	Thu,  8 Jan 2026 13:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WyNevsyG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74EFE10E34E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 13:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767878307;
 bh=WU0hFGseHfLV/zJQlRsyz1x7Nsh0EGAHCDe+oyEpopc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WyNevsyGsDt1rfBpb8PMY9WMWtXVjd4hZRDoHI4ovzTdsbE2GG+Z63rdFxSRJNIvc
 1E4HONPvvc249Ip5Zssablc5f6U2IHK4Uxr7pMZhoc1W0fNhG52Ah/EFgBX7Lc7blv
 nn2VddxiaZE9up0eCIMKdgu0nnliMu+Wx51eUxDM2tbupiHE5kCCmjBg7Y3bkx86a4
 Ueiq3rSlsowQZ+IuW4f2ZSJg3gJjJqWhLGiE4ykpKkGKsgQZzzLp5CQDde8LnI+Weh
 Q/IZGnqZOcww0EIidvbvLnbti827SW5VAxDTjE6oNLoXp9jZIXE27m9e+4yzs8ub1w
 cyBdg3IG3dvzQ==
Received: from [IPV6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa] (unknown
 [IPv6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B341E17E0181;
 Thu,  8 Jan 2026 14:18:26 +0100 (CET)
Message-ID: <5e012ec2-ed8a-4195-8486-f5038c430f82@collabora.com>
Date: Thu, 8 Jan 2026 14:18:26 +0100
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
Content-Language: fr
From: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>
Organization: Collabora Ltd
In-Reply-To: <20260106164935.409765-1-boris.brezillon@collabora.com>
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

On 06/01/2026 17:49, Boris Brezillon wrote:
> drm_gem_object_lookup_at_offset() can return a valid object with
> filp or filp->f_op->get_unmapped_area set to NULL. Make sure we still
> release the ref we acquired on such objects.
> 
> Cc: Loïc Molinari <loic.molinari@collabora.com>
> Fixes: 99bda20d6d4c ("drm/gem: Introduce drm_gem_get_unmapped_area() fop")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>   drivers/gpu/drm/drm_gem.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 36c8af123877..f7cbf6e8d1e0 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1298,11 +1298,13 @@ unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
>   	unsigned long ret;
>   
>   	obj = drm_gem_object_lookup_at_offset(filp, pgoff, len >> PAGE_SHIFT);
> -	if (IS_ERR(obj) || !obj->filp || !obj->filp->f_op->get_unmapped_area)
> -		return mm_get_unmapped_area(filp, uaddr, len, 0, flags);
> +	if (IS_ERR(obj))
> +		obj = NULL;
>   
> -	ret = obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0,
> -						 flags);
> +	if (!obj || !obj->filp || !obj->filp->f_op->get_unmapped_area)
> +		ret = mm_get_unmapped_area(filp, uaddr, len, 0, flags);
> +	else
> +		ret = obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0, flags);

Apart maybe for this line exceeding 80 chars:

Reviewed-by: Loïc Molinari <loic.molinari@collabora.com>

Regards,
Loïc

>   
>   	drm_gem_object_put(obj);
>   

