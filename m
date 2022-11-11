Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 755B76264AE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 23:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A64110E8E7;
	Fri, 11 Nov 2022 22:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A7510E8E6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 22:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668206158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FhguikNfjP3jJj2Xsd2EMwn1nCtYD4FWU8eudH5AFMc=;
 b=Cj6HGxMT1pX+WDgMzeQ144ZRWdYmmGDMWbIy86Dwkgoc3pnu5mLjLCyOy/ZDDQ8wrqmov3
 hxS1yKwW5kdjNzgnAaRlor+2UbMUdsxM+tRHQkhIY7/CxEPeMEJBvf1YYN6sT7H8Zbd5S6
 i7IUirBTG0tQ+VMWPDvWbeVuvrDJzZQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-84-HSmUAszANDG5RA05TaJ1QQ-1; Fri, 11 Nov 2022 17:35:55 -0500
X-MC-Unique: HSmUAszANDG5RA05TaJ1QQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 fb5-20020a05622a480500b003a525d52abcso4513302qtb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 14:35:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FhguikNfjP3jJj2Xsd2EMwn1nCtYD4FWU8eudH5AFMc=;
 b=2PrqG11+9OIVqpWgkmZZTQ5e0InFU8Bow0frx7jbGtLxvtmneFQItZTs8Ix/CmRH/e
 ksN6+u6Sob3sZoB8DZf563St7KvdM2hdj8Y1COG8gooWDDo5BAAUVeUUeAfUYMf1Fh4l
 WThRSyf0/oHeZ28uo29zrJQqoIy6pXT3m4jKeVlXgsOLIdBsnOEmOE1/XqfSjk6Nfp27
 kcHicSsQ8u/ZqKQM0GYhyUWQAjfuORcMSHpGY2EKnnnicJAO3SvIcIdSMC6oQUScA4hA
 3qIVU7vuDbM4NlRaotwTFvZKcyiaJhnFZbOl5rUS8vKl0j4y+pZbwwQgqIJ9I43mMyKH
 LDTw==
X-Gm-Message-State: ANoB5plDR4lx3zePqRqKaQ95Qs+NvQSEDkYvVCDuS8xaK7aUxO18ncdF
 4MSMW5ZLkkukYsoOJUeJt9+dCQqS8VPrNOlwV7UCnXuec/cZLuzEz1j79UNAn4jToZgQP2V8oSk
 rJUcR58N+DGNTh6yZcPufHu+YHZFZ
X-Received: by 2002:a05:620a:6c6:b0:6fa:3aa2:3269 with SMTP id
 6-20020a05620a06c600b006fa3aa23269mr3031011qky.580.1668206154909; 
 Fri, 11 Nov 2022 14:35:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6W/KXwux5rPH6dWDWepLU+USDtFNI5v0KJ6gDMc3Hi176iuyM26xOcvo8FvrRu0zkBEIu9xg==
X-Received: by 2002:a05:620a:6c6:b0:6fa:3aa2:3269 with SMTP id
 6-20020a05620a06c600b006fa3aa23269mr3031002qky.580.1668206154708; 
 Fri, 11 Nov 2022 14:35:54 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:9200::feb? ([2600:4040:5c6c:9200::feb])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a05620a0d8700b006fafaac72a6sm2203033qkl.84.2022.11.11.14.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 14:35:53 -0800 (PST)
Message-ID: <b4f731226c27150cc776d87a1175859d22acd666.camel@redhat.com>
Subject: Re: [PATCH 1/5] drm/nouveau/nvfw/acr: make
 wpr_generic_header_dump() static
From: Lyude Paul <lyude@redhat.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, bskeggs@redhat.com
Date: Fri, 11 Nov 2022 17:35:52 -0500
In-Reply-To: <20221111091130.57178-1-jiapeng.chong@linux.alibaba.com>
References: <20221111091130.57178-1-jiapeng.chong@linux.alibaba.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the whole series:

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next in a bit

On Fri, 2022-11-11 at 17:11 +0800, Jiapeng Chong wrote:
> This symbol is not used outside of acr.c, so marks it static.
> 
> drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for ‘wpr_generic_header_dump’.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3023
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c b/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
> index 83a9c48bc58c..7ac90c495737 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
> @@ -45,7 +45,7 @@ wpr_header_v1_dump(struct nvkm_subdev *subdev, const struct wpr_header_v1 *hdr)
>  	nvkm_debug(subdev, "\tstatus        : %d\n", hdr->status);
>  }
>  
> -void
> +static void
>  wpr_generic_header_dump(struct nvkm_subdev *subdev, const struct wpr_generic_header *hdr)
>  {
>  	nvkm_debug(subdev, "wprGenericHeader\n");

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

