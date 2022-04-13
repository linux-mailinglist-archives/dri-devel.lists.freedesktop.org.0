Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B624FF123
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 09:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE3110E11D;
	Wed, 13 Apr 2022 07:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB1510F062
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 07:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SsucQ7nmn7o3XX8IffWSB3JEjgB0jcdkwzAiY6kF2ec=; b=unmLUqce1/2h2GtG3P5xPxfgMb
 29bBzJeutu7zmgnSMoVqlQWV6kgI5O884c8KbUyvzK0Ph6dmKwpmdFfkGlUwcEmZ5MlnenC0SYa2z
 W/P3w9Mv5e9u0AMjsEa626MkRji6gmSWNyfuZGfoseqpd6YQ1NHJZRLNFxSb1avF8C+A45OePxGKZ
 Uw+YgiemDJFU5bfT/tYMFtyA8hjf+db5udHAn1H+hR/Aco5HIaV4jYYQbeJxMEDDGnQKeekoFCXe4
 jaqWy77xXJYfodv7AuLSlfPO60dKorZnEy7X/CC5iUed8vNwQXIFWBJRNmAQtJny0ORZdkq5DfADH
 CBlg7Frg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1neXIv-0007di-Gw; Wed, 13 Apr 2022 10:20:41 +0300
Message-ID: <6afbd04c-9847-a62c-12bf-f49314ae2664@kapsi.fi>
Date: Wed, 13 Apr 2022 10:20:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] gpu/host1x: remove useless if(ptr) check to kfree
Content-Language: en-US
To: Bernard Zhao <zhaojunkui2008@126.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220413063934.23571-1-zhaojunkui2008@126.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20220413063934.23571-1-zhaojunkui2008@126.com>
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
Cc: bernard@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/13/22 09:39, Bernard Zhao wrote:
> This patch remove useless if(ptr) check to kfree.
> 
> Signed-off-by: Bernard Zhao <zhaojunkui2008@126.com>
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

I personally dislike leaving the NULL checks off with calls to kfree. 
With the NULL check there, while reading the code it is obvious that the 
intention is that the value can be either a valid pointer or NULL. IMHO 
with C's type system/conventions we need this kind of contextual 
information to understand the code easily and avoid bugs.

Mikko
