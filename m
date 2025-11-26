Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0F9C897B4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 12:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A604810E12C;
	Wed, 26 Nov 2025 11:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 461BF10E0A0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 11:21:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30D39168F;
 Wed, 26 Nov 2025 03:21:11 -0800 (PST)
Received: from [10.1.30.35] (e122027.cambridge.arm.com [10.1.30.35])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54C003F66E;
 Wed, 26 Nov 2025 03:21:17 -0800 (PST)
Message-ID: <f2d0fa55-05d3-4d1e-9f1d-a8c326fbcc40@arm.com>
Date: Wed, 26 Nov 2025 11:21:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem: Correct error condition in drm_gem_objects_lookup
To: David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20251124112039.117748-1-steven.price@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251124112039.117748-1-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 24/11/2025 11:20, Steven Price wrote:
> When vmemdup_array_user() fails, 'handles' is set to a negative error
> code and no memory is allocated. So the call to kvfree() should not
> happen. Instead just return early with the error code.
> 
> Fixes: cb77b79abf5f ("drm/gem: Use vmemdup_array_user in drm_gem_objects_lookup")
> Signed-off-by: Steven Price <steven.price@arm.com>

Applied to drm-misc-next.

> ---
>  drivers/gpu/drm/drm_gem.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 68168d58a7c8..efc79bbf3c73 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -798,13 +798,10 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
>  	*objs_out = objs;
>  
>  	handles = vmemdup_array_user(bo_handles, count, sizeof(u32));
> -	if (IS_ERR(handles)) {
> -		ret = PTR_ERR(handles);
> -		goto out;
> -	}
> +	if (IS_ERR(handles))
> +		return PTR_ERR(handles);
>  
>  	ret = objects_lookup(filp, handles, count, objs);
> -out:
>  	kvfree(handles);
>  	return ret;
>  

