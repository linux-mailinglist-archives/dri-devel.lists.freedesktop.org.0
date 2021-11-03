Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A9B443DDE
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 08:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AC873372;
	Wed,  3 Nov 2021 07:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7B573370;
 Wed,  3 Nov 2021 07:55:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d24so2248607wra.0;
 Wed, 03 Nov 2021 00:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:references:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ZWrI+yzyQheNNAyamcSJumrm+hk+wSs89ujE90XR8wA=;
 b=RJ0IlTMAz7WYVbgMsXLroI04Jq4hwn7P4XYUQm9l4BjQGAD+2aKABah1BiYLN/yLZ3
 aHermGkAstxp4A2zjYLvjefvY8iIqgC+VSY6ajAXuS0KZRWPiz9cfMA8GcRSabXDHvLR
 fr+hXJeD+kyp8+yHk4SfH43vLeb0CmG3+x4MiTXTvlhYMvFwKa+9MSt96NVKtX4um21d
 VrBF6DbLTGowhKWHGGiCtWGPg1zE9JehkbMWFMkzUpA4X+EoeJ2OpiLbv5QeT/1RXoyX
 1a9zE0rRrMAf5czlb5tNZaWtgEMZnlNfwSembVyd4DwuasyL7fKD4NqTyGyMdLFcgsxz
 lpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ZWrI+yzyQheNNAyamcSJumrm+hk+wSs89ujE90XR8wA=;
 b=kvXdY29/adQnGGG4rPHtBVK+SJlj/4mF/pSWF0WaDtFOqxqyef6XnwGYouVV2lhS83
 ekGTle6fs20XOuis1JHcT93sZmeQfdB9KRqvhtivQsZCBEhIIkt/KPA6epCrKucB02Kx
 A3f2rmq5IZvDm24oP8ymO4knHh10bMOqn+eLqjvPrQ32UCXmGSeBgfVTZtXkvYuobtZC
 b1xVfsmU40E+JoA9Xe3fPwuxZW+KGukoY0qmZ8F9HG1IjnPiqQnihVfB+vWMeUqZncko
 p1h4cxkV2Cs3UkxB75hiI2zmdDA+m2piF3yClElHcGW47OA2ullzsV83i96nXYrs9g3K
 m5Tw==
X-Gm-Message-State: AOAM530nrXOBTbRidZ7C4OUPh+SEaP9aFotyRKqGqsmgPCE4V9VeHJv0
 x+feIeZsaRFWexJ+990BBClFsc4jj08=
X-Google-Smtp-Source: ABdhPJx7hWTDgh92nYC6qMRv8Dr6nlaG+tMzTzafLRSTRpJKKLVDv0RielMU6m74QuZt2unlSRGYew==
X-Received: by 2002:adf:eac8:: with SMTP id o8mr24554425wrn.337.1635926114457; 
 Wed, 03 Nov 2021 00:55:14 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id u16sm4455389wmc.21.2021.11.03.00.55.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 00:55:14 -0700 (PDT)
Subject: Re: [PATCH 6/6] drm/radeon: use dma_resv_wait_timeout() instead of
 manually waiting
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: Alex Deucher <Alexander.Deucher@amd.com>
References: <20211028132630.2330-1-christian.koenig@amd.com>
 <20211028132630.2330-6-christian.koenig@amd.com>
Message-ID: <ca60f37a-c478-59ed-e5a2-28fc87e03168@gmail.com>
Date: Wed, 3 Nov 2021 08:55:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028132630.2330-6-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping, Alex do you have a moment for that one here?

Am 28.10.21 um 15:26 schrieb Christian König:
> Don't touch the exclusive fence manually here, but rather use the
> general dma_resv function. We did that for better hw reset handling but
> this doesn't necessary work correctly.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/radeon/radeon_uvd.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
> index 2ea86919d953..377f9cdb5b53 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -469,7 +469,6 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
>   {
>   	int32_t *msg, msg_type, handle;
>   	unsigned img_size = 0;
> -	struct dma_fence *f;
>   	void *ptr;
>   
>   	int i, r;
> @@ -479,13 +478,11 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
>   		return -EINVAL;
>   	}
>   
> -	f = dma_resv_excl_fence(bo->tbo.base.resv);
> -	if (f) {
> -		r = radeon_fence_wait((struct radeon_fence *)f, false);
> -		if (r) {
> -			DRM_ERROR("Failed waiting for UVD message (%d)!\n", r);
> -			return r;
> -		}
> +	r = dma_resv_wait_timeout(bo->tbo.base.resv, false, false,
> +				  MAX_SCHEDULE_TIMEOUT);
> +	if (r <= 0) {
> +		DRM_ERROR("Failed waiting for UVD message (%d)!\n", r);
> +		return r ? r : -ETIME;
>   	}
>   
>   	r = radeon_bo_kmap(bo, &ptr);

