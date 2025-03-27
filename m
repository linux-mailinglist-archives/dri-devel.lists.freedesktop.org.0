Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A09A733A7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 14:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF9E10E0FB;
	Thu, 27 Mar 2025 13:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pWJL8lH4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F12C10E0FB
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 13:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p2i2VUYsQLuK/jmT6lcjufmS8gzYAhRuKrroKzVjEvg=; b=pWJL8lH4fz2tEdkDz90rH1J2xM
 EoMtE9RH1wEuLmeJ5qksc1d58UoHsZhV411CE6tc72g3DdCY7FtYt8JEU6uUUiYzBUuL1my+HCwQ7
 sIHoVaKF9wa0l5looxP2EfPgjwEP/c91x7ZjdPx6BC8jraaPz7M/jzng23WA5dyrDWCDZZPu8KUGn
 3wMpXVPbhWCNsUXkx4cxEGKNlTBwGpItMd6ZmZYdxLaTJzaR0HSuzxsnPUtlp8OqndL69QNbFl8wL
 cTQHL82d2yeFYB9aaQ3NvE2D09nNlJC4x0qEvqUPtwdzGoXPx5mGJfEEbzaDSvvNmuSnGsl/JaJXL
 eSY5xCsA==;
Received: from [189.7.87.178] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1txnj6-007FXx-Gv; Thu, 27 Mar 2025 14:56:56 +0100
Message-ID: <81bc1927-bca9-41e4-b597-273397aad161@igalia.com>
Date: Thu, 27 Mar 2025 10:56:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] drm/syncobj: Avoid one temporary allocation in
 drm_syncobj_array_find
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com
References: <20250327084215.26662-1-tvrtko.ursulin@igalia.com>
 <20250327084215.26662-4-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250327084215.26662-4-tvrtko.ursulin@igalia.com>
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

Hi Tvrtko,

On 27/03/25 05:42, Tvrtko Ursulin wrote:
> Drm_syncobj_array_find() helper is used from many userspace ioctl entry
> points with the task of looking up userspace handles to internal objects.
> 
> We can easily avoid one temporary allocation by making it read the handles
> as it is looking them up.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
> v2:
>   * Fix handle type.
>   * Undo pointless unwind change.
> ---
>   drivers/gpu/drm/drm_syncobj.c | 36 +++++++++++++++--------------------
>   1 file changed, 15 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 28081cf74052..cd36c888f112 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1213,39 +1213,35 @@ signed long drm_timeout_abs_to_jiffies(int64_t timeout_nsec)
>   EXPORT_SYMBOL(drm_timeout_abs_to_jiffies);
>   
>   static int drm_syncobj_array_find(struct drm_file *file_private,
> -				  void __user *user_handles,
> -				  uint32_t count_handles,
> +				  u32 __user *handles,
> +				  uint32_t count,
>   				  struct drm_syncobj ***syncobjs_out)
>   {
> -	uint32_t i, *handles;
>   	struct drm_syncobj **syncobjs;
> +	uint32_t i;
>   	int ret;
>   
> -	handles = kmalloc_array(count_handles, sizeof(*handles), GFP_KERNEL);
> -	if (handles == NULL)
> +	if (!access_ok(handles, count * sizeof(*handles)))
> +		return -EFAULT;
> +
> +	syncobjs = kmalloc_array(count, sizeof(*syncobjs), GFP_KERNEL);
> +	if (!syncobjs)
>   		return -ENOMEM;
>   
> -	if (copy_from_user(handles, user_handles,
> -			   sizeof(uint32_t) * count_handles)) {
> -		ret = -EFAULT;
> -		goto err_free_handles;
> -	}
> +	for (i = 0; i < count; i++) {
> +		u32 handle;
>   
> -	syncobjs = kmalloc_array(count_handles, sizeof(*syncobjs), GFP_KERNEL);
> -	if (syncobjs == NULL) {
> -		ret = -ENOMEM;
> -		goto err_free_handles;
> -	}
> -
> -	for (i = 0; i < count_handles; i++) {
> -		syncobjs[i] = drm_syncobj_find(file_private, handles[i]);
> +		if (__get_user(handle, handles++)) {
> +			ret = -EFAULT;
> +			goto err_put_syncobjs;
> +		}
> +		syncobjs[i] = drm_syncobj_find(file_private, handle);
>   		if (!syncobjs[i]) {
>   			ret = -ENOENT;
>   			goto err_put_syncobjs;
>   		}
>   	}
>   
> -	kfree(handles);
>   	*syncobjs_out = syncobjs;
>   	return 0;
>   
> @@ -1253,8 +1249,6 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
>   	while (i-- > 0)
>   		drm_syncobj_put(syncobjs[i]);
>   	kfree(syncobjs);
> -err_free_handles:
> -	kfree(handles);
>   
>   	return ret;
>   }

