Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCA03B655E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 17:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66D56E49D;
	Mon, 28 Jun 2021 15:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB926E49D;
 Mon, 28 Jun 2021 15:24:15 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id m14so26510789edp.9;
 Mon, 28 Jun 2021 08:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0LCVnEUyZC8u6yOvz6qXUXn2QdP+8Q1Q9z+2JP0JGTs=;
 b=dyCRjuzq/VZcMN4nrzOQIFRNg+prWtPH5e38wGOHqSJ6IueKTDIbpHXHH2mIqh3VwI
 gm30J8QP4XBpCaY9IqkaM/t9o0XdMvuY9jOca8ZSHq5FsmukLZeNhFs1c4HFXmT/n1xb
 +VHBXKDrsuO8OfHMjgVisu0DMqYJ+1Dly0CENXGZu030mD7Al9z6z3sbPpj/D4HNhVMM
 ayCluRXw+9A1KKy4DRFcSYOZOHa6vcFw/LarlVD/Tb0oMMeUsncufriV3VDjSxMS+UWg
 Uh11K1aJk6sVH/sE2dTpnj18Qy5fqhgosRbJ4FP3NmiAJ2gdU9stUbNHyGssYp5dE7vG
 eGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0LCVnEUyZC8u6yOvz6qXUXn2QdP+8Q1Q9z+2JP0JGTs=;
 b=Lo3jlT54IcWqjz6fQuvCytXhPd+rPZiEAXitWBBoYbkZCo4x/sOI5+VnUAFPv1mdQ6
 1JDEdk4Uu6XEd01cIddipUh6GLsCDb9ziPgBJrvNSwUFuHpeun9AyPDYiqMQKsNLT1Tq
 yoxFr9KJ8pdUxEGQ2p8P6nM6tw1W1hZEghcIgwwC2nZWyZ/foSIRfW4ATu7CdJN3H63Z
 xpOcMWfv1oV1QCc0aFA0btEx+FY8oCfrMMq8P7n48BA3uFy8BHwPwSwZU49Mpd82slSi
 7I0eh0RnTWSJ2mqDo5gdNQNRlyqIfNfbQqJbzDP8AhVX6wgl5M3c/Oa/8rH9niJmvD5r
 lXsA==
X-Gm-Message-State: AOAM533pLUQP0mOkaoMm0WcLdqrObA4/8N2eA3um/ePUmJXELn8HROWr
 cwJSfffNicdTKh8KQ9feCjs8p8OLdzg=
X-Google-Smtp-Source: ABdhPJxhRGk1DmD/KCMuAj6u6fHMksSa4KlGvbpmDD73g10MeSNBNT71TNGttHRSTiLPWL5ndlXvIw==
X-Received: by 2002:aa7:da02:: with SMTP id r2mr14736444eds.350.1624893853792; 
 Mon, 28 Jun 2021 08:24:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9e19:5c9b:7f42:aee2?
 ([2a02:908:1252:fb60:9e19:5c9b:7f42:aee2])
 by smtp.gmail.com with ESMTPSA id k21sm9587163edo.41.2021.06.28.08.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 08:24:13 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amdgpu: return early for preempt type BOs
To: Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
References: <20210625172804.3193-1-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <fd8b70cd-dca9-ffe8-cfb0-c7a8859b16f0@gmail.com>
Date: Mon, 28 Jun 2021 17:24:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625172804.3193-1-nirmoy.das@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Felix.Kuehling@amd.com, Christian.Koenig@amd.com,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 25.06.21 um 19:28 schrieb Nirmoy Das:
> Return early for AMDGPU_PL_PREEMPT BOs so that we don't pass
> wrong pointer to amdgpu_gtt_mgr_has_gart_addr() which assumes
> ttm_resource argument to be TTM_PL_TT type BO's.
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index b46726e47bce..3df06772a425 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -926,6 +926,11 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>   	    bo_mem->mem_type == AMDGPU_PL_OA)
>   		return -EINVAL;
>   
> +	if (bo_mem->mem_type == AMDGPU_PL_PREEMPT) {

Probably better to merge that into the if below.

E.g. if bo_mem->mem_type != TTM_PL_TT || .....

Christian.

> +		gtt->offset = AMDGPU_BO_INVALID_OFFSET;
> +		return 0;
> +	}
> +
>   	if (!amdgpu_gtt_mgr_has_gart_addr(bo_mem)) {
>   		gtt->offset = AMDGPU_BO_INVALID_OFFSET;
>   		return 0;

