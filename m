Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8423338C22B
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 10:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2676F5DD;
	Fri, 21 May 2021 08:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCF56F5DD;
 Fri, 21 May 2021 08:43:23 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id s22so29087701ejv.12;
 Fri, 21 May 2021 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=7EH/eu2A9F13TZP+cLtxx5mHYbMmjIF3AHkw+YdUTwY=;
 b=gtnfZueMFiF2wc93vVK1PBMtd94tUhuW7uq/PRKILbGWnBs5bZbPHzvtDNnFHtF/Qt
 E+kHnhRyYLFpMeueETgH/oimXip3HrwF+AtnmxoIph82zyj3ze219z+pKQ7hVn9OYMHw
 5Tpx3It2YffP4S2aaTGSqYhKEAFbxCUtzlZkczOuV5x2+qhGkczELJMvMfzAXsttjz8x
 B3W7wp0EX/GeZbmWgHHlta4aiPOK+SSMRRlu0NreTdAuxijEPAY6X7X1I7+gPaLaBnOR
 C5oXRnW6rSR0WD3nPVlzp2wjUsuFuOu84CMkeTIq3U2o7y4AUYT0GDfFqBPqgKo/+u9u
 XbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7EH/eu2A9F13TZP+cLtxx5mHYbMmjIF3AHkw+YdUTwY=;
 b=tJc+LOcP5r5SzPrY/XTPKDOM2S8GeYDqt1gJz7Zy4UZdcYGy6ki/HpbOXhwoi+JCb3
 i2B5XWmFTlMU0JEiFP6LIY3mZaMngrNqKUYBsIUflCMhfO3rNBt8co2Ypip/nJtXXc3c
 dMXH0x7n+Xn5S9lMXtBG1EwwMaTuSsRl5IJghSSUzLGogLCrd9BGO0fq00J0t5RXB4pq
 N/WtswCSJGV0GMp2fE9QHRHwdKBIGSg1oQgUepoBCAoQo2mP7W1aWXDG2RLpH2Y+jX4p
 wLRnfZQK5Sc/Wvq+OTZ8FQRubi1XiHLD3UVXof1HYAdtgvH9iJBUOY+1WxiBwzvMfFdw
 ebHQ==
X-Gm-Message-State: AOAM5303Z/ztcca4IHP9FlZ9012tcelWwp743I63HZriuebrak/iqGNZ
 kG0dP1Gz06XC5iDPor5x2R/DF6I7wj4=
X-Google-Smtp-Source: ABdhPJwKVhRUoa+TF+FIFqbdsI7EwgTCt8GTAPP8WSLGRACidwYWZy8WDgZ7Xr4TSWGfasHZrmim6Q==
X-Received: by 2002:a17:907:9691:: with SMTP id
 hd17mr9109737ejc.67.1621586601825; 
 Fri, 21 May 2021 01:43:21 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d?
 ([2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d])
 by smtp.gmail.com with ESMTPSA id k26sm3031315eje.67.2021.05.21.01.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 01:43:21 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: Skip swapout if ttm object is not populated
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210521083112.33176-1-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3dbc2de5-d741-f3c9-c41d-093ff29c39aa@gmail.com>
Date: Fri, 21 May 2021 10:43:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210521083112.33176-1-xinhui.pan@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.05.21 um 10:31 schrieb xinhui pan:
> Swapping a ttm object which has no backend pages makes no sense.
>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to add a CC: stable and pushing that to drm-misc-fixes in a minute.

> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 510e3e001dab..a1dcf7d55c90 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -145,7 +145,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   			list_for_each_entry(bo, &man->lru[j], lru) {
>   				uint32_t num_pages;
>   
> -				if (!bo->ttm ||
> +				if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
>   				    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
>   				    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
>   					continue;

