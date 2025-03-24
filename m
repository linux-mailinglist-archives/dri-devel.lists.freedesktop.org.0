Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F1AA6E691
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 23:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396D210E040;
	Mon, 24 Mar 2025 22:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="oK/GFT2G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AA710E040
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 22:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k0hqzDysvhg2wKefxdiTQ0GlYvpST0oGRN3VvQS9Fpo=; b=oK/GFT2GvvOo1maxFukrCxKEdj
 vZE9zV+UdpKP72xKKM360TXxwVp06t6WsJinozViNw7MMqedSWcGS1rRszX3u8cJUPGIbkSr7N9s1
 N3OLN0JhSqSo96BlSJiPsMk9pDv4mXqAAkbQvTdtQCQV+IvEpF+Ec6uZeYtqSzJFs2jTl4IyUcG14
 CRZjlno8WFbcObralCsJf2JaGWLaN4sQUPHry0ShoYjynJAQfszXHEvNefHcwAt8N4HFHC6x4U9xw
 06BTELejkbIqzhbefTU5TSy+54h0fkFRISLisIpIhJp1P7Vre0927NHka3pl+FWcuqa9FhRsiQWul
 Cy1fZncg==;
Received: from [189.7.87.178] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1twqIR-005uQs-DP; Mon, 24 Mar 2025 23:29:27 +0100
Message-ID: <191425c4-e408-4cd7-8ca1-ad9fa9ee0d0e@igalia.com>
Date: Mon, 24 Mar 2025 19:29:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/syncobj: Avoid one temporary allocation in
 drm_syncobj_array_find
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com
References: <20250318155424.78552-1-tvrtko.ursulin@igalia.com>
 <20250318155424.78552-4-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250318155424.78552-4-tvrtko.ursulin@igalia.com>
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

On 18/03/25 12:54, Tvrtko Ursulin wrote:
> Drm_syncobj_array_find() helper is used from many userspace ioctl entry
> points with the task of looking up userspace handles to internal objects.
> 
> We can easily avoid one temporary allocation by making it read the handles
> as it is looking them up.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>   drivers/gpu/drm/drm_syncobj.c | 44 +++++++++++++++++------------------
>   1 file changed, 21 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index fd5ba6c89666..cdda2df06bec 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1213,48 +1213,46 @@ signed long drm_timeout_abs_to_jiffies(int64_t timeout_nsec)
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
> +		u64 handle;

I believe this is a u32.

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
> +			syncobjs[i] = NULL;

Do we need to assign syncobjs[i] to NULL? Can we just go to
err_put_syncobjs?

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
>   err_put_syncobjs:
> -	while (i-- > 0)
> -		drm_syncobj_put(syncobjs[i]);
> +	while (i > 0) {
> +		if (syncobjs[i])

I'm not sure if I understand which scenario this would be needed. For
the first syncobj that we don't find, we go to err_free_handles and
AFAIU all previous syncobjs exist, so there wouldn't be a need to check
if the syncobj != NULL.

Best Regards,
- Maíra

> +			drm_syncobj_put(syncobjs[i]);
> +		i--;
> +	}
>   	kfree(syncobjs);
> -err_free_handles:
> -	kfree(handles);
>   
>   	return ret;
>   }

