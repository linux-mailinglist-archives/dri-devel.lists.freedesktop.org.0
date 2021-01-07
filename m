Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E51192ECE47
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 11:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F166E28B;
	Thu,  7 Jan 2021 10:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8B66E28B;
 Thu,  7 Jan 2021 10:56:13 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id m5so5174197wrx.9;
 Thu, 07 Jan 2021 02:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=J0PdSkFsE8JsrkbEiYiHhjf/UPpdicMh4ZEU5WTuIJY=;
 b=i3zD6TQvqwaUenSW8Evq0Y3IzcOwlCjjZelWDLY4sR7XnJzPPNkoZx8+7H2sqZqijQ
 DT5my4eeVjiXJazjQp+DmjWp1gHOyUrkmQSGk2bDTsRtZnUyQB5d4dKa1ipQUmv8YMBB
 C2vG15app2HN2MrbKNzjDLxIYFBpQCwhEPkCDxxLdlKQWY2egFLX+uNkjd/h0zUGGbtu
 +UdKbMPJtBBiFcs6732SWYrkdQEK6vTMLZApM1ElESGVM6vCsfCHYrEK1BwqHXNOTwdi
 K/HZTNjtYo1t0wcatXXEO50z/aWFFJ0OekKKMJrfLvlqB8/cznDHyYecYoj0Ocns3Q4Y
 /iWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=J0PdSkFsE8JsrkbEiYiHhjf/UPpdicMh4ZEU5WTuIJY=;
 b=oGfwcPxvQ+Kcw/Luuw+C5EpTa1nPdi2R4IUeB2DTCbgevKtkH/6kKEbLuLknp7kRZe
 6U0RRWzxjbN4CMEn9NOPE/yqWmFe+HUPxvt0xTs15yBD9szim8h/9/VdNU6mQiekJXri
 u8dxT1J/Ek7AA7c+4v/5RjxoWOy4d095rgXKsra50h3eWFptVmQuS7IyDkKCnhM341xS
 sbKQEgXXonL703CrIcehhT8KuOJociQhFRiUzSP4iDnI3JXprEaqrzIOct59s/1v/fqE
 ZoVethABjh0+Txi7eB+Un0Sp7sj7gbT0VrlWfKY0sWeNywGxfEA+2ISZDLLvwWKfBbv1
 T8dw==
X-Gm-Message-State: AOAM533caA4auFbAOL2+eAkvf077AUEtQbnJWVMnmYXpjhsJvFU8+LT2
 qrv7M12J9dTDz7aLcrU75Ck=
X-Google-Smtp-Source: ABdhPJzK4tjYWUj/6qDPNTx9GRuH/GWSr1ORngcGTWUU8AU/aCB7kwXfER3FNB8Gf+3Y1l0vrCrTOg==
X-Received: by 2002:adf:e84f:: with SMTP id d15mr8492742wrn.245.1610016972068; 
 Thu, 07 Jan 2021 02:56:12 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id p9sm6994895wmm.17.2021.01.07.02.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 02:56:11 -0800 (PST)
Subject: Re: [PATCH 29/35] drm/amdgpu: svm bo enable_signal call condition
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <20210107030127.20393-30-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b16fcc27-fe4e-88a2-4f23-dcfa9ba69264@gmail.com>
Date: Thu, 7 Jan 2021 11:56:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210107030127.20393-30-Felix.Kuehling@amd.com>
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
Reply-To: christian.koenig@amd.com
Cc: alex.sierra@amd.com, philip.yang@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.01.21 um 04:01 schrieb Felix Kuehling:
> From: Alex Sierra <alex.sierra@amd.com>
>
> [why]
> To support svm bo eviction mechanism.
>
> [how]
> If the BO crated has AMDGPU_AMDKFD_CREATE_SVM_BO flag set,
> enable_signal callback will be called inside amdgpu_evict_flags.
> This also causes gutting of the BO by removing all placements,
> so that TTM won't actually do an eviction. Instead it will discard
> the memory held by the BO. This is needed for HMM migration to user
> mode system memory pages.

I don't think that this will work. What exactly are you doing here?

As Daniel pointed out HMM and dma_fences are fundamentally incompatible.

Christian.

>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index f423f42cb9b5..62d4da95d22d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -107,6 +107,20 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>   	}
>   
>   	abo = ttm_to_amdgpu_bo(bo);
> +	if (abo->flags & AMDGPU_AMDKFD_CREATE_SVM_BO) {
> +		struct dma_fence *fence;
> +		struct dma_resv *resv = &bo->base._resv;
> +
> +		rcu_read_lock();
> +		fence = rcu_dereference(resv->fence_excl);
> +		if (fence && !fence->ops->signaled)
> +			dma_fence_enable_sw_signaling(fence);
> +
> +		placement->num_placement = 0;
> +		placement->num_busy_placement = 0;
> +		rcu_read_unlock();
> +		return;
> +	}
>   	switch (bo->mem.mem_type) {
>   	case AMDGPU_PL_GDS:
>   	case AMDGPU_PL_GWS:

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
