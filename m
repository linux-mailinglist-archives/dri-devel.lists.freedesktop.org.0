Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A96397EB8B4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 22:39:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A1910E4D7;
	Tue, 14 Nov 2023 21:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8099B10E4D7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 21:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699997935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fxB7ExxiHdS0NZmPKiG+1iSonlk/ZPL9t612T7W2Wvs=;
 b=U1vwk2vik+J7Y9uZzndKTHji2ZcnBM3BFJKdzkhRXfJLGGWJMkOSr43OTH7AgRsCF68Gr0
 dUD/Zko0HqXvJj86u/z/4xs5WKyr9GcmHPSZ6Ibe5Zswib2XZOEn0II1GCZHVeCMmwE2cv
 v5R66/y5jz+rwvZrPnNzG9ZHZJERrJ4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-sm8irDL4Psm5XVZscia7EA-1; Tue, 14 Nov 2023 16:38:54 -0500
X-MC-Unique: sm8irDL4Psm5XVZscia7EA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9cf3fad5baeso413168466b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 13:38:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699997933; x=1700602733;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fxB7ExxiHdS0NZmPKiG+1iSonlk/ZPL9t612T7W2Wvs=;
 b=Opf38eNw6EiQpnEv6gl1mPyB7Dnmt54NRq8caAVKiPcHJaCI0/bXn/Yx7anI8PIugd
 0zbQ+raRZAfbSK+e2fcN/dfHU84cYbCl3l4l3I3IjbY0xodz0M7R7svPw/MUjMuYDvgN
 w4RTt+urvry3h2yj7mRB6yr83IAiW9vNHuQXNsCgHCon1Mq1KkyQXF2yQjOLF/XJZ0BK
 CGfxJqH/tezNj6bN9ctP+ZaDZpZRozxnwOG2BsX3zGaHyG0h3ep5vHDDpsFi5wE4Aakq
 K+uyWS0KREUnfCnnLD4GxNO0OAm3huSCcGS/4olMsr5/YK/X5ii73cdhyZdWEVAnorar
 fCdg==
X-Gm-Message-State: AOJu0YyvVatm1o/hyvyC9Lleoxq66qy2Zv6nMgvWvAce01RkIIAnaTis
 PZkeIL79JOhbbHD+ZaCCQ5+vPbNr0pg1znOXpuN4pxtT9hoP3T8L2LAfwyINAffX/MevK5JbbxP
 dU1tbCn04d6KX46zKaK/isKT3LUil
X-Received: by 2002:a17:906:1cd7:b0:9bf:60f9:9b7c with SMTP id
 i23-20020a1709061cd700b009bf60f99b7cmr7074758ejh.62.1699997932937; 
 Tue, 14 Nov 2023 13:38:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/9iRKgXF6DJ3fn43Xtb+gxWEoFWTgaYWdvlj3Io7rcxIF4OMTWAGkrBbxvkMRlsAxzGi7Qw==
X-Received: by 2002:a17:906:1cd7:b0:9bf:60f9:9b7c with SMTP id
 i23-20020a1709061cd700b009bf60f99b7cmr7074754ejh.62.1699997932665; 
 Tue, 14 Nov 2023 13:38:52 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a170906085100b009b654751c14sm5992443ejd.47.2023.11.14.13.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 13:38:52 -0800 (PST)
Message-ID: <a5b76425-1fe7-4031-8b88-d163e6e78dc2@redhat.com>
Date: Tue, 14 Nov 2023 22:38:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau/gsp/r535: Fix a NULL vs error pointer bug
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <me@dakr.org>
References: <f71996d9-d1cb-45ea-a4b2-2dfc21312d8c@kili.mountain>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <f71996d9-d1cb-45ea-a4b2-2dfc21312d8c@kili.mountain>
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/8/23 08:40, Dan Carpenter wrote:
> The r535_gsp_cmdq_get() function returns error pointers but this code
> checks for NULL.  Also we need to propagate the error pointer back to
> the callers in r535_gsp_rpc_get().  Returning NULL will lead to a NULL
> pointer dereference.
> 
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index e31f9641114b..f8409e2f9fef 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -689,8 +689,8 @@ r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 argc)
>   	struct nvfw_gsp_rpc *rpc;
>   
>   	rpc = r535_gsp_cmdq_get(gsp, ALIGN(sizeof(*rpc) + argc, sizeof(u64)));
> -	if (!rpc)
> -		return NULL;
> +	if (IS_ERR(rpc))
> +		return ERR_CAST(rpc);
>   
>   	rpc->header_version = 0x03000000;
>   	rpc->signature = ('C' << 24) | ('P' << 16) | ('R' << 8) | 'V';

