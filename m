Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 006593957D0
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 11:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B390D89498;
	Mon, 31 May 2021 09:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F34989498;
 Mon, 31 May 2021 09:04:59 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ss26so15631342ejb.5;
 Mon, 31 May 2021 02:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=gNpYEtyu4VY5J+SQtrUbUo+3olYh4CGNEaRyYnI3OfQ=;
 b=q4WwpExc4ZSiVfPrhPE3diiqBNCK9mKV4U4kxTfMp2EUiuhE/sTHUoHVceD2a6oMrU
 GQtmZ/eJRc8EOU4EKgXLknTl5val3+//XEDtfG3sFMb/tHe9SSFOBySCRJ6nOCDqSpbl
 1eIjFoNLALAkmxyNaV4TksryNzw0Q9GqU6VvOrlJ5WwPDf6wCPoU3LCOXlqjm5Mq89y2
 taVVoTTIhm61Q59J6XsOd6u6gmwB/LXbU4wtnajG8fiNM0NYAhdLbO2egJLL2N3X7kps
 0/7bsaqLcES3dcQ9bfYA7AiTQVgB6tls5ztpJ6TCOStFy1v2Ofb/8MGgtsO1+fv0Z9hE
 FZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gNpYEtyu4VY5J+SQtrUbUo+3olYh4CGNEaRyYnI3OfQ=;
 b=LJ47L2nqlpd9xw4VF4a0mVJkxk71G/aD/jD59B2WO/miwpeUjWsybs3MlEP5OUdKH2
 c7cTgxK8RQJWyK/ITrCYfni4rjS154vYbJlQZ0O2IlKqwrlc1LoAqmfLxHrMQ3GpbrPT
 u4VtLzmClGXfBbPwh8Z6CQc8QKLGv3ESo8MgQWY6eaF98TcCc2qC3HavHaIPG3wafeSP
 kjw0+j6dFxM7h27rbDE84c/Jbx+M0YVG4DohV0GvTWfDgYDZbfgneHdbtQThJEzdyOMG
 oK93drKjDsk3BzFA3gah8ybu/q/9X9D/NLYC2dsfX5Gv1XYWziQLVzJ5mtWYBKWvg4pb
 k9Hw==
X-Gm-Message-State: AOAM532+eIEXddN9G+KsCSzhvLXLam4y/ea2jUboHBoiwmlmNAhWy9Zo
 VvlUqiOm7v8B6B/EOqQKyCo1iZ/e2VQ=
X-Google-Smtp-Source: ABdhPJx+mvA9u4je0nEr1rFW64jM2Feec05QeQ79LaPXeOLwf7r22ceXnf7bAABf7inerbLd2lO22g==
X-Received: by 2002:a17:907:9047:: with SMTP id
 az7mr9669630ejc.4.1622451898152; 
 Mon, 31 May 2021 02:04:58 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:b94:4956:bad4:7c81?
 ([2a02:908:1252:fb60:b94:4956:bad4:7c81])
 by smtp.gmail.com with ESMTPSA id p7sm6652819edw.43.2021.05.31.02.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 02:04:57 -0700 (PDT)
Subject: Re: [PATCH 2/3] drm/ttm: check with temporary GTT memory in BO
 validation
To: Lang Yu <Lang.Yu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210531082241.4254-1-Lang.Yu@amd.com>
 <20210531082241.4254-2-Lang.Yu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2e88d7ee-7729-f08e-0a82-63d059aa895d@gmail.com>
Date: Mon, 31 May 2021 11:04:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210531082241.4254-2-Lang.Yu@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Marek Olsak <Marek.Olsak@amd.com>,
 Huang Rui <ray.huang@amd.com>, Christian Koenig <Christian.Koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6?= <thomas_os@shipmail.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 31.05.21 um 10:22 schrieb Lang Yu:
> If a BO's backing store is temporary GTT memory, we should
> move it in BO validation.
>
> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index c32a37d0a460..80c8cb2c3f31 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -944,6 +944,8 @@ static bool ttm_bo_places_compat(const struct ttm_place *places,
>   		if ((mem->start < heap->fpfn ||
>   		     (heap->lpfn != 0 && (mem->start + mem->num_pages) > heap->lpfn)))
>   			continue;
> +		if (mem->placement & TTM_PL_FLAG_TEMPORARY)
> +			continue;

Oh, good idea. But please move the check outside of the loop since mem 
never changes here we can return false right away.

Thanks,
Christian.

>   
>   		*new_flags = heap->flags;
>   		if ((mem->mem_type == heap->mem_type) &&

