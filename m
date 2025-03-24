Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC25A6E701
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 00:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A1510E0E6;
	Mon, 24 Mar 2025 23:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="E1xYLjDh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA43310E0E6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 23:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jm6M4iIDcBMZMpoKsnmLVFmY3LbEXA6DGlSK2Gt4gc0=; b=E1xYLjDhiYOeafVQTPkd4ObbO8
 ul5hrvcugn5DtNdIGANOguA/Ava29DrteIx6nxi9LZGgdVJRkPDOToQ0h2KSdShTaGvV7szTWgUxP
 rgmY2gsWs7cWX4ccKNV4qHv2YkE8/JHaqRFhTjhYWqDk9V/EJgbHR5lEfCQeqbay4iRqVm9HbfbwR
 4Ouwt8V88K4sgCfvH8kEsm1Cwcx3L23N+sPav9mao/h4wtdD0p+dDi2EJR1ABOIRqy23nBoZGsQwd
 XJ8kKJ7u0zhdEgBR8Ph2SK0JH/cQ8yUOx0xaBQ4uVuTe48vIT603EYrjESjoHr5DpgTFgU/UZ7l+h
 W5YxR0eA==;
Received: from [189.7.87.178] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1twqmF-005v5p-Se; Tue, 25 Mar 2025 00:00:16 +0100
Message-ID: <da00cb1d-ea1d-4a42-bd07-c769d2283e7a@igalia.com>
Date: Mon, 24 Mar 2025 20:00:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/syncobj: Add a fast path to
 drm_syncobj_array_wait_timeout
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com
References: <20250318155424.78552-1-tvrtko.ursulin@igalia.com>
 <20250318155424.78552-7-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250318155424.78552-7-tvrtko.ursulin@igalia.com>
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
> Running the Cyberpunk 2077 benchmark we can observe that waiting on DRM
> sycobjs is relatively hot, but the 96% of the calls are for a single
> object. (~4% for two points, and never more than three points. While
> a more trivial workload like vkmark under Plasma is even more skewed
> to single point waits.)
> 
> Therefore lets add a fast path to bypass the kcalloc/kfree and use a pre-
> allocated stack array for those cases.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>   drivers/gpu/drm/drm_syncobj.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index b4563c696056..94932b89298f 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1035,6 +1035,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>   						  uint32_t *idx,
>   						  ktime_t *deadline)
>   {
> +	struct syncobj_wait_entry stack_entries[4];

Can't you initialize as

struct syncobj_wait_entry stack_entries[4] = {0};

?

>   	struct syncobj_wait_entry *entries;
>   	uint32_t signaled_count, i;
>   	struct dma_fence *fence;
> @@ -1049,9 +1050,14 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>   	    !access_ok(user_points, count * sizeof(*user_points)))
>   		return -EFAULT;
>   
> -	entries = kcalloc(count, sizeof(*entries), GFP_KERNEL);
> -	if (!entries)
> -		return -ENOMEM;
> +	if (count > ARRAY_SIZE(stack_entries)) {
> +		entries = kcalloc(count, sizeof(*entries), GFP_KERNEL);
> +		if (!entries)
> +			return -ENOMEM;
> +	} else {
> +		memset(stack_entries, 0, sizeof(stack_entries));

Then, you can avoid this step.

> +		entries = stack_entries;
> +	}
>   
>   	/* Walk the list of sync objects and initialize entries.  We do
>   	 * this up-front so that we can properly return -EINVAL if there is
> @@ -1174,7 +1180,9 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>   						  &entries[i].fence_cb);
>   		dma_fence_put(entries[i].fence);
>   	}
> -	kfree(entries);
> +
> +	if (entries != stack_entries)

You can initialize `entries = NULL` and avoid this step.

Anyway,

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> +		kfree(entries);
>   
>   	return timeout;
>   }

