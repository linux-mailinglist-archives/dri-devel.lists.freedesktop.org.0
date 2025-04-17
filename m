Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01601A91AF3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 13:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C261810EACF;
	Thu, 17 Apr 2025 11:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CQFMEmKN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389BA10EAC8;
 Thu, 17 Apr 2025 11:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sf8qyFrE9a2v6zsDPeRPeCF7ykO7mhZ7QhDJa1W8NmU=; b=CQFMEmKN+D1wn4s14YuxDiUFZM
 xOmifCQmVWyltb9pb5wlQWW2/dzTFRl1FjxU0R4HGKc3EQWRV4ady7b+cv9wRQimgXkQredTLA+7t
 8C75v2iYGUAky8auvDRXsJuqLfq/CQmoQC3cP3pcJyHZdc6D6m1u85RoU5Qx86voD1hHMr+txMOgy
 4ZOMfLGU44Mf/0xNsHPYX3h3cNoVN1yoNLaRPrJLmwc1rTWGPpYHBxAoWwNqQr3P6f7eOdOsOlgZv
 MNow2rxU3Cwi4rZtOtj048o4QlcqHL0VzsdgjHpVvXxZ/cutZnfjLWJl8EiOZ5wzxDk4LdoKMnQZZ
 L0oPn5VA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u5NSi-000mlv-EW; Thu, 17 Apr 2025 13:31:20 +0200
Message-ID: <dd96e4fb-ba21-40d3-9c53-3e8d4f7bbc86@igalia.com>
Date: Thu, 17 Apr 2025 12:31:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/ttm: fix the warning for hit_low and evict_low
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250417093409.2242506-1-sunil.khatri@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250417093409.2242506-1-sunil.khatri@amd.com>
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


On 17/04/2025 10:34, Sunil Khatri wrote:
> fix the below warning messages:
> ttm/ttm_bo.c:1098: warning: Function parameter or struct member 'hit_low' not described in 'ttm_bo_swapout_walk'
> ttm/ttm_bo.c:1098: warning: Function parameter or struct member 'evict_low' not described in 'ttm_bo_swapout_walk'
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 95b86003c50d..33fefdcc6323 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1093,7 +1093,8 @@ struct ttm_bo_swapout_walk {
>   	struct ttm_lru_walk walk;
>   	/** @gfp_flags: The gfp flags to use for ttm_tt_swapout() */
>   	gfp_t gfp_flags;
> -
> +	/** @hit_low: flag to mark low */
> +	/** @evict_low:  flag for low eviction */
>   	bool hit_low, evict_low;
>   };
>   

Hm, could you check if you could copy and adapt more detailed comments 
from struct ttm_bo_evict_walk?

	/** @try_low: Whether we should attempt to evict BO's with low 
watermark threshold */
	bool try_low;
	/** @hit_low: If we cannot evict a bo when @try_low is false (first 
pass) */
	bool hit_low;
};

Regards,

Tvrtko

