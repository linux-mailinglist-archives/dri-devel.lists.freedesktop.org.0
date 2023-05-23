Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D1670D432
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 08:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43C610E3DB;
	Tue, 23 May 2023 06:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0226810E3DB
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 06:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684824251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LxBwvzkEHqqOVroWlGAw/iNlssiibA+1amVBXCL+nsY=;
 b=NETjl10fiaxkBCzrnKcU2L29HIXeKmgTIxbuLDU/ocmub2AQzNnG+4uK+bfroswc/jE9dl
 xfZUkph/3YrntAbt99EmYL2JPNiqdE4bGdZAr556n6RSlyLe5HthmhmN+6vBMugQgGF6M/
 fkJI1HwJW2bwh7i+BzlVlzttDbU+IZA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-s4SYkvKtM7iF4-6StjlddQ-1; Tue, 23 May 2023 02:44:09 -0400
X-MC-Unique: s4SYkvKtM7iF4-6StjlddQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30793c16c78so4456315f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 23:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684824248; x=1687416248;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LxBwvzkEHqqOVroWlGAw/iNlssiibA+1amVBXCL+nsY=;
 b=B2zQwHVd32Z4pFptCEHW0OYyf736mabeg5HUJ6xm67tAdz0dVMbrt1EWLRPcwhr83E
 tg8wJHJDLsPYdIobVnX3JOXiW9N9Cq8oRRVpSGusI51csUtFwNr4Nk8ZWDWfT7LYecGY
 xwRHSEetPYD8Jqh/AG2mVFbgBx1taLE1Bz6PErXzsvqnC8wn8wS3vQZ+gRtCyAo92Rl4
 5WXuiRPoUpuX0c4Dc9qDUuzV5XvRI2pRGkq7V88Ca+q4HFSjOBu52NCP8zPJkBq/Rqdx
 SVKy2N3dFd9PW4V+NtSyiMy5EJx+2J4/4s0Cvz30gWfTh/ER+Crx0PKfeiLRCncpGyZT
 bOSQ==
X-Gm-Message-State: AC+VfDyRcXygRlZykLNDwI5sFSWzYYXD+yM3T5F6sXi4qehafAxQ6rn9
 ybWL9ko2F2hdjIDzEDVfDY81KgPsiwyWp8vAdbdIHithwJmHYNYubwVsbHyDEu1gRiHMub1fRbI
 oLIiYIl5n24zVfQM20GieUtG6rkTf
X-Received: by 2002:a5d:62c4:0:b0:306:4031:63c5 with SMTP id
 o4-20020a5d62c4000000b00306403163c5mr9649845wrv.51.1684824248828; 
 Mon, 22 May 2023 23:44:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ57Dh7X7JU5EbJCqCwb8NWSsLs6JgePUHyfAxzIV6/bdnDkvcpqSuUq00iz0pdWTp4TRsT6TQ==
X-Received: by 2002:a5d:62c4:0:b0:306:4031:63c5 with SMTP id
 o4-20020a5d62c4000000b00306403163c5mr9649838wrv.51.1684824248585; 
 Mon, 22 May 2023 23:44:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a1c7503000000b003f09d7b6e20sm10650421wmc.2.2023.05.22.23.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 23:44:08 -0700 (PDT)
Message-ID: <6fbab263-1f49-126b-a108-6a94664334ee@redhat.com>
Date: Tue, 23 May 2023 08:44:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/mgag200: set variable mgag200_modeset
 storage-class-specifier to static
To: Tom Rix <trix@redhat.com>, airlied@redhat.com, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230517134140.874179-1-trix@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20230517134140.874179-1-trix@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2023 15:41, Tom Rix wrote:
> smatch reports
> drivers/gpu/drm/mgag200/mgag200_drv.c:23:5: warning: symbol
>    'mgag200_modeset' was not declared. Should it be static?
> 
> This variable is only used in its defining file, so it should be static
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   drivers/gpu/drm/mgag200/mgag200_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index 976f0ab2006b..abddf37f0ea1 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -20,7 +20,7 @@
>   
>   #include "mgag200_drv.h"
>   
> -int mgag200_modeset = -1;
> +static int mgag200_modeset = -1;
>   MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
>   module_param_named(modeset, mgag200_modeset, int, 0400);
>   

It looks good to me,

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn

