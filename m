Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8DCC80367
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 12:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E1C10E21E;
	Mon, 24 Nov 2025 11:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="U/2jeoth";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7198910E21E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 11:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jVSW1l7rR6ZZyuDjNB/uwNX3aB2NuRt/7cJU6kS9DT0=; b=U/2jeothEtZlki8mpKqKRy9GRW
 cKkHQbyMfu62y6Fmu2fzkeNzhzRNdbi0zmRUwOakMy8ULpug9OSq8o2YQjeCKEz8TV0rZJS9lIRi8
 UTJaRlOesy60LAHNwYMSfVPb5v4De1IJsXqtvSwDmZs1EJ+IGZ5Ss0LfRFKZRklFVkCCodKd0gBkJ
 BcoCC5K+vhnoIzh6S+bRFeWmEwnRUl/9OYlJI57498I3TctE3GCDucAcg9pskcLN2sjsaIqqvs+GZ
 OLz2HCM40mKTyjcbDxnIbJ9TRt5Uz9FT189hyocVWOUCP4dvhVrJgB7SFQrVa6QrkoPXd5UaYJak1
 2L2+glyQ==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vNUn7-004jUW-8D; Mon, 24 Nov 2025 12:31:33 +0100
Message-ID: <5c0faabe-fc07-43b3-8d68-b300cb58d8bb@igalia.com>
Date: Mon, 24 Nov 2025 11:31:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem: Correct error condition in drm_gem_objects_lookup
To: Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
References: <20251124112039.117748-1-steven.price@arm.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20251124112039.117748-1-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Ah sorry about that. Must have mentally confused the two allocations.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

> Fixes: cb77b79abf5f ("drm/gem: Use vmemdup_array_user in drm_gem_objects_lookup")
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   drivers/gpu/drm/drm_gem.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 68168d58a7c8..efc79bbf3c73 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -798,13 +798,10 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
>   	*objs_out = objs;
>   
>   	handles = vmemdup_array_user(bo_handles, count, sizeof(u32));
> -	if (IS_ERR(handles)) {
> -		ret = PTR_ERR(handles);
> -		goto out;
> -	}
> +	if (IS_ERR(handles))
> +		return PTR_ERR(handles);
>   
>   	ret = objects_lookup(filp, handles, count, objs);
> -out:
>   	kvfree(handles);
>   	return ret;
>   

