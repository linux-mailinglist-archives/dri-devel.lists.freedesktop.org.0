Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9387E4621
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 17:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C20E10E61D;
	Tue,  7 Nov 2023 16:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DDD10E61D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 16:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699374939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tiblu4ip97uUBovXyyp2LXTdUMhVr/Onp/Dhl6Jr+ik=;
 b=M/a1Z4nDRFy9hf0qUNSJYU8gXqCUGYMZEREvCGzTO2QSnXDrGNoAEZdj2dVVpOsR3qtbRG
 SGP6dEbD8uBriyy8tI9Xxf1RulA4iXULRgdM+ENBPviIrP9yKxcJM8SnWXt2XIxcwZYOku
 yHF7FTRpYC84zzfsFd1QaqMrH0DOT7A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-sa51dTJkPLiYqXMF10XXXw-1; Tue, 07 Nov 2023 11:35:28 -0500
X-MC-Unique: sa51dTJkPLiYqXMF10XXXw-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-53e3bfec5bdso4421276a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 08:35:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699374927; x=1699979727;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tiblu4ip97uUBovXyyp2LXTdUMhVr/Onp/Dhl6Jr+ik=;
 b=BZ2ns7c2dSOewkblvIF4yABhl4s579nCpogifeclJNTTSUb0x3BtaiyW41tICNsI7g
 ZSs19ERUPooREVRvv3tGB0JYOLhxVgLuuCBE9IbV+3KgOlrzbLcgAGh3fVDzN0MBTW1Y
 Vvy/6qjqhomhik8RemOv2gGMWNFhErEOAiXn93P4vbOOYv6NrJL2U7ZHWcbWahgQZ9RI
 jgzsRyHS7uI3tfHlnqS+pS0FOlvgbMD4ax09RCFM1uTliWZ1Wwwg744Bp1Wxjg8mmcAk
 wynCmO3YrN5HoqszQN9bx3peJm1j5GjkGTTDcPPcYPWsGN89V1zqYeY5E/Kg3pfadADe
 BF8Q==
X-Gm-Message-State: AOJu0YxS0XdFKjp5hxmVXSuqerYLCEyW3JOCDdYpFX3x6UUtA08D9XX4
 oT7F38us/uyWZlBoSbVQrMDoeGfucWGZEsKE1JyebLdc6iJLTtof0lHumJtPnL4sFz5WrYkbMsP
 5sGe7ciLwvYSx3VVlLclEEofkQ2Rp
X-Received: by 2002:a17:907:7291:b0:9b2:cf77:a105 with SMTP id
 dt17-20020a170907729100b009b2cf77a105mr15589053ejc.15.1699374926951; 
 Tue, 07 Nov 2023 08:35:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8JsrYEEW27MiEbhdjSSOwrNJh24aPmwE/kn5KJu4CIuZCg740CWk0jYDGQcM1hSN32EW/rQ==
X-Received: by 2002:a17:907:7291:b0:9b2:cf77:a105 with SMTP id
 dt17-20020a170907729100b009b2cf77a105mr15589046ejc.15.1699374926647; 
 Tue, 07 Nov 2023 08:35:26 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a1709066a8900b009d23e00a90esm1216102ejr.24.2023.11.07.08.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 08:35:26 -0800 (PST)
Message-ID: <a7ea2ea5-3014-4de1-a93c-5b667fd0246b@redhat.com>
Date: Tue, 7 Nov 2023 17:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau/gsp/r535: uninitialized variable in
 r535_gsp_acpi_mux_id()
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <1d864f6e-43e9-43d8-9d90-30e76c9c843b@moroto.mountain>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <1d864f6e-43e9-43d8-9d90-30e76c9c843b@moroto.mountain>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/7/23 16:18, Dan Carpenter wrote:
> The if we hit the "continue" statement on the first iteration through
> the loop then "handle_mux" needs to be set to NULL so we continue
> looping.
> 
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Good catch!

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

@Dave: Can't pick this patch up myself, since this should probably go into
drm/topic/nvidia-gsp.

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index e31f9641114b..afa8e7377a76 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -1159,7 +1159,7 @@ static void
>   r535_gsp_acpi_mux_id(acpi_handle handle, u32 id, MUX_METHOD_DATA_ELEMENT *mode,
>   						 MUX_METHOD_DATA_ELEMENT *part)
>   {
> -	acpi_handle iter = NULL, handle_mux;
> +	acpi_handle iter = NULL, handle_mux = NULL;
>   	acpi_status status;
>   	unsigned long long value;
>   

