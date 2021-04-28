Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5334736D2C3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 09:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0EA66EAAC;
	Wed, 28 Apr 2021 07:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F025E6EAAA;
 Wed, 28 Apr 2021 07:04:04 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id h10so72861294edt.13;
 Wed, 28 Apr 2021 00:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=4EKX77f5Cr+5Grb9sFvLUkWoU3uOS3MZARayAe8p1pg=;
 b=jQfHROCGL4aF3oLpOeX01VZMnmbVQJamiO15PhNcj5YClKpnwkforSbmpv2IRVak9J
 rlDfGQFGMzweDlThBcIqvC1UPG0F2d/m7rbVd2nVntudQ0Ut9iiPTskFaZspaULoS1Od
 7uPHONrq0iWYZulZCF4947fIukJKFr1cXcmqQmab9eX5NNJOrYL3yWamphUC3oFYyfHy
 tOXfDLtWp3F+I+KRsZ7Je+Lp9kSkyczOVVZEteynLEMANbXrWAu1LReZ9DZe0Wi6s854
 lQFMW94UeMt4X1mzLjnP/O4SH3Pjqd/FH+j1949GtgTlSsJ8CVwE/kY9FqgPEE8rh00r
 E1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4EKX77f5Cr+5Grb9sFvLUkWoU3uOS3MZARayAe8p1pg=;
 b=lt2AnT4wI18U2K9gi7IA8l5Ksxw/P5Nn7CKP1F+7hsGOB6gbP7y66DZ/xhXD48PW6G
 cGAfaFuABU+BZm1sg1YNnx8fWdHfyl54Tygf0c8srptzcwvRb0Oy+IhbiI/Iy6xN6U3c
 Uh0ND2KunDnQjY2b455nRXtZe3LzqDTb7yR1qPkyPZPrEu965YLfohSNc1wg2edvUORg
 XryfpUkHGy4/y5Nhw+a+bmVl8xoOvExC4pM+YqvOXvPK7oSaltJH6pROofhlm/cyhWgf
 HScZ4lRpTh/rwSjBWzQ2/RF/jfV2XwRAFslQ4GZy8mm/vR36x2U3BfH8xUzJjdC1O0S3
 R41w==
X-Gm-Message-State: AOAM532PEMIZyXrEpkp9O7UtrzNxYJ7fHjVlIMXSxUb3y0fgtD30ba85
 nMX4XlEn79XBVGHeX3+o2VbbZPay2U4=
X-Google-Smtp-Source: ABdhPJxs5Uy5+x8fuH4pjyKMybuhRS2/WgHalFdncl6qqPVvzZqCmT3W6zwfinWVRnrJxksSnLzC8A==
X-Received: by 2002:aa7:c2d2:: with SMTP id m18mr8924784edp.96.1619593443719; 
 Wed, 28 Apr 2021 00:04:03 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:5565:6656:893b:2618?
 ([2a02:908:1252:fb60:5565:6656:893b:2618])
 by smtp.gmail.com with ESMTPSA id g20sm4010334edb.7.2021.04.28.00.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 00:04:03 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/ttm: Don't evict SG BOs
To: Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
References: <20210428053338.11560-1-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <af825fa4-abb3-69a6-48cd-0a6252f72503@gmail.com>
Date: Wed, 28 Apr 2021 09:04:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210428053338.11560-1-Felix.Kuehling@amd.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.04.21 um 07:33 schrieb Felix Kuehling:
> SG BOs do not occupy space that is managed by TTM. So do not evict them.
>
> This fixes unexpected evictions of KFD's userptr BOs. KFD only expects
> userptr "evictions" in the form of MMU notifiers.

NAK, SG BOs also account for the memory the GPU can currently access.

We can ignore them for the allocated memory, but not for the GTT domain.

Christian.

>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index de1ec838cf8b..0b953654fdbf 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -655,6 +655,10 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>   		list_for_each_entry(bo, &man->lru[i], lru) {
>   			bool busy;
>   
> +			/* Don't evict SG BOs */
> +			if (bo->ttm && bo->ttm->sg)
> +				continue;
> +
>   			if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked,
>   							    &busy)) {
>   				if (busy && !busy_bo && ticket !=

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
