Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AE239B7A6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 13:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9C16E138;
	Fri,  4 Jun 2021 11:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8A96E138;
 Fri,  4 Jun 2021 11:11:39 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id og14so8594865ejc.5;
 Fri, 04 Jun 2021 04:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=BQUG9rLBagDE3J7LSSE86X2TmT7SF5szEvUlFFOgXJw=;
 b=AKZLZ9RcuNFtFpU2HlORqN+F0aDDdPOWEF0LmofzDUBzJVQxFuF03Iopw5UfbJo6wj
 dCrODKC6J9QggYjr4fn+5Awk3p7KTQYHQBkcLM1VihBqGR1yRXvQVP6e7d/xU54vcYkB
 Kf1up2JPH+87j0n8Tibjo70vosVzALe5dWICqux0nf6Aezw7orz+x73+DWy4ZrWUyOCY
 2vqQRKvQrlthlG6farlgGqrDkOtJxzsyNp/+xeB8Q8yPAIHC0ZxoJzB//UvhLDZvn3ed
 lVZTcZaSQsWE9rpJ6UmFkZlzCo+di9rjRRMIkkDoIPzI7iQevgYFl5uiNOHowCKBgpQg
 Ng7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=BQUG9rLBagDE3J7LSSE86X2TmT7SF5szEvUlFFOgXJw=;
 b=YX6bBoIie2SXnHs/tjKrh2S6yZurMXBxzwiUS/9f+L8NIj5ZnJSFvTrUr7SfDvdA0H
 3pfDJYYxHEetxbnJLLUgMICQPmZine/N0NbnlRnzNI+ASFMXgErQKTIdZY1EWKlH8Xwa
 ABTEKHYoKeH5A9goAAHxt0TX0ligxhGaZ1dbVKaqXm1Fk4juwGeo4ty274YdbjjEmRaZ
 q7b0oRYeNl7xPzymbg9W1h/jnl2h9YLBc9+43E+9aNVVnahXykc2roasFUIwjOEz8Xlm
 Rq/UpTgS7hSiMXg9pdzP2XHDCNvo16lBPokhVLNeHPEBtmGu2YMPVQzL43acZRrGo9gL
 POwg==
X-Gm-Message-State: AOAM531GlxMNNs9C0wRgXoisimhHlNNWhTO9W8qfA9bY/i/P/TNGCiSd
 qIkrTHQmWqdUxx/yuXF2izk=
X-Google-Smtp-Source: ABdhPJxwOi2L/qa3p1KrMVaJKXxi1zF8E7uZF06kEzz3kjvluKA7vA7S+LWJ1SpnGlbw7LFo89zKHg==
X-Received: by 2002:a17:906:5f93:: with SMTP id
 a19mr3677884eju.18.1622805098334; 
 Fri, 04 Jun 2021 04:11:38 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7b4b:873a:17b5:b581?
 ([2a02:908:1252:fb60:7b4b:873a:17b5:b581])
 by smtp.gmail.com with ESMTPSA id dy19sm3062992edb.68.2021.06.04.04.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 04:11:37 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Use vma_lookup() in
 amdgpu_ttm_tt_get_user_pages()
To: Liam Howlett <liam.howlett@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210603160928.3854180-1-Liam.Howlett@Oracle.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4d2e62c7-af4c-b977-a05c-97b664b532b3@gmail.com>
Date: Fri, 4 Jun 2021 13:11:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603160928.3854180-1-Liam.Howlett@Oracle.com>
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
Cc: David Airlie <airlied@linux.ie>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.06.21 um 18:09 schrieb Liam Howlett:
> Use vma_lookup() to find the VMA at a specific address.  As vma_lookup()
> will return NULL if the address is not within any VMA, the start address
> no longer needs to be validated.
>
> Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 7cb7ffdd1900..dfb5ca3f8da8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -680,9 +680,9 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
>   		return -ESRCH;
>   
>   	mmap_read_lock(mm);
> -	vma = find_vma(mm, start);
> +	vma = vma_lookup(mm, start);
>   	mmap_read_unlock(mm);
> -	if (unlikely(!vma || start < vma->vm_start)) {
> +	if (unlikely(!vma)) {
>   		r = -EFAULT;
>   		goto out_putmm;
>   	}

