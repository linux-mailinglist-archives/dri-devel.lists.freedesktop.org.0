Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C211463EB16
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65E510E54D;
	Thu,  1 Dec 2022 08:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2428 seconds by postgrey-1.36 at gabe;
 Thu, 01 Dec 2022 08:28:56 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6597A10E54D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 08:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=INyxVWTl5V40Q4m8iuk6nyPL6/SVXAaVTfMABtgODPU=; b=rtDaLkzT4z+MKduPKz0zQkPZRM
 HOkXBiv54Lmek4TrfuSnFPduUbrMCNuJNwDJ8/7X7LU+wOJPdb7E0HO7aZLxVidAol4uUyRmShkdP
 SwkR6K6VlwZ5ycDUR/4GyXuTFoE5tV6wICR67XkwHzvIhziWbmFxavkSE0NwGl/cXmPAeDGIHqtSY
 JcinySJ3nzMlxkD1Z2GY/S5bTNxIfF47mPMFivIdDn2VCPtfbHd8faQb8hGO1uozAvPYaYd1FgFnk
 R+m5se88hCaAEWpt5S2JalLCq7gkPom9hti4YVk27Mt99bpGk3ceHxXUk9jb6EF3BTdJeOZ9JP25q
 iEKRznkQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10]) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1p0eIv-0044k7-K5; Thu, 01 Dec 2022 09:48:21 +0200
Message-ID: <e46598e5-d680-5ae3-3e4a-ec6e5be5090b@kapsi.fi>
Date: Thu, 1 Dec 2022 09:48:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] gpu: host1x: Remove redundant null checks before kfree
Content-Language: en-US
To: zys.zljxml@gmail.com, thierry.reding@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, sumit.semwal@linaro.org, christian.koenig@amd.com
References: <20221201015522.38163-1-zys.zljxml@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20221201015522.38163-1-zys.zljxml@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: Yushan Zhou <katrinzhou@tencent.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/1/22 03:55, zys.zljxml@gmail.com wrote:
> From: Yushan Zhou <katrinzhou@tencent.com>
> 
> Fix the following coccicheck warning:
> ./drivers/gpu/host1x/fence.c:97:2-7: WARNING:
> NULL check before some freeing functions is not needed.
> 
> Signed-off-by: Yushan Zhou <katrinzhou@tencent.com>
> ---
>   drivers/gpu/host1x/fence.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
> index ecab72882192..05b36bfc8b74 100644
> --- a/drivers/gpu/host1x/fence.c
> +++ b/drivers/gpu/host1x/fence.c
> @@ -93,8 +93,7 @@ static void host1x_syncpt_fence_release(struct dma_fence *f)
>   {
>   	struct host1x_syncpt_fence *sf = to_host1x_fence(f);
>   
> -	if (sf->waiter)
> -		kfree(sf->waiter);
> +	kfree(sf->waiter);
>   
>   	dma_fence_free(f);
>   }

I disagree with this coccinelle rule; I think it obfuscates from the 
reader the fact that the pointer could be NULL.

Mikko
