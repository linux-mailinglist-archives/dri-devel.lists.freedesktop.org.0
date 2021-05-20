Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 677FA38A93C
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 13:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1546F3EB;
	Thu, 20 May 2021 11:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5A76F3E9;
 Thu, 20 May 2021 11:00:57 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id w12so11120774edx.1;
 Thu, 20 May 2021 04:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ZlQ2g95NtuA7c4iSJMmLtv0RgNT/q4PzICP3Pam55mU=;
 b=TRGn8AsH+xGWe3OJheU9HYKdR/BIuGcynzxTqVxN3BNJOZmgBkth3NvkX9auWfpk6j
 MgBROnRCYzvFqsjRxP7MA8ljdeGuy6voOVtzMAnxZBoWyxhCOpJAhmN+ZBf5/0YpLgKT
 H0kvnQsYdgteDGD3+uDu0+0sgMxiAYR1kccece0GNwEtFquBR5UufKFv6uSOrGeYAqvl
 /gHuoulA31Loml6ROn4tOB4BpoR6qsiYwvzIWixHhcTSXU/VHMyIWf+pijfs/JIsIWfr
 m965JcON7ZIw2uJNEOTv4d2SDZuo+lPff41vUnxYavxzXbk39xNWUfvimqWt0pW/8MyI
 zv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ZlQ2g95NtuA7c4iSJMmLtv0RgNT/q4PzICP3Pam55mU=;
 b=YlUEenX1KhtM7Vf7RE7rSwuZGa0kn8u00ILNDXjamkv+gWYlEh7KtU5XJkwJWMSmIu
 d96ZecS6AEEI3z4SG/sYs3ckw8DexjevCGZE9xskzU02IsVq2nOn4ZloR9oGHjWxqG/x
 0vtYZoJ7nb5OMIuh1CFeouUVYbRl8EHLxJDsv4Y6P8r7sgR7VI2pLtYD1/vJWWmuOEAb
 cbVMqgI1AL+1HdA+j3K67Eo0Ee7rfsJwC8WnfXsNEM8Z6H1QfbRlTwtfngBl/EPIFAs+
 B/OVBz1DceRukW0DxjKjCFaILjBREpbgr758vmzX6mx6q9oXo/K4N9oZiLcuBMT58J6W
 L5Zw==
X-Gm-Message-State: AOAM533EhoDqzIF8q6D1qAzobzMeKQev1/jvqQ44ohevEbbWnDLLrE8Z
 43T6K/XLK3fr7BZCyKI7frk=
X-Google-Smtp-Source: ABdhPJyhh+0beLsW5sNhii9oqZjg1a4sm7fKtpYzAvF3/A2wp4oqZ4qk7wH6pF2qfr+W5CDvttJLSA==
X-Received: by 2002:aa7:cd6b:: with SMTP id ca11mr4354224edb.115.1621508455903; 
 Thu, 20 May 2021 04:00:55 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:4635:589e:67a4:e02a?
 ([2a02:908:1252:fb60:4635:589e:67a4:e02a])
 by smtp.gmail.com with ESMTPSA id g19sm1193315ejw.79.2021.05.20.04.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 04:00:55 -0700 (PDT)
Subject: Re: [RFC PATCH 2/2] drm/ttm: skip swapout when ttm has no backend
 page.
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210519022852.16766-1-xinhui.pan@amd.com>
 <20210519022852.16766-2-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5f3993ae-5896-b04e-374e-efbf6652487a@gmail.com>
Date: Thu, 20 May 2021 13:00:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519022852.16766-2-xinhui.pan@amd.com>
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
Cc: alexander.deucher@amd.com, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.05.21 um 04:28 schrieb xinhui pan:
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 510e3e001dab..a9772fcc8f9c 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -146,6 +146,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   				uint32_t num_pages;
>   
>   				if (!bo->ttm ||
> +				    !bo->ttm->pages || !bo->ttm->pages[0] ||

This should call ttm_tt_is_populated() instead.

But apart from that it sounds like the right approach to fix this.

Thanks,
Christian.

>   				    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
>   				    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
>   					continue;

