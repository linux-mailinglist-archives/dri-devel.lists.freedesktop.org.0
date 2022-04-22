Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 979C550BDEE
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 19:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C960F10E560;
	Fri, 22 Apr 2022 17:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727CF10E572
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 17:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650647155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6QQiY2IuiN4KN2jf63+soXn8T3SQzl/mtR86RllPdFw=;
 b=dgKExv8nJxE7ruUpYAV/wwIbdVMCjzjfzS/DwQCgExKyE4QztLmE9/g5cqjIetb4oYb5Ka
 djlqj60tfFK9rnprJiO+vZXEVBqCAxd4haNwk9NQzw4ozJ1Fmxu/RMT8AiELS/iRQorOBP
 2oKpkoOj79/c7gEqpisWukzV7DbwzoU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-x3l_HrgtNuOHhDrcemPJIg-1; Fri, 22 Apr 2022 13:04:43 -0400
X-MC-Unique: x3l_HrgtNuOHhDrcemPJIg-1
Received: by mail-qk1-f199.google.com with SMTP id
 bj2-20020a05620a190200b005084968bb24so5778380qkb.23
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 10:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=6QQiY2IuiN4KN2jf63+soXn8T3SQzl/mtR86RllPdFw=;
 b=ImdBrzHoI6BrfEbV2Tkd+qgZfoe8dlVw4bY3x2tTA89+GiAm5KJdLGnuuYWpaw6oGp
 YVw0D+2Of3eriNKeDUu2lV6K9JNMucRGcP6MXJYVk5ePPV6e2msUvSpypUDSIertjOio
 AQpLvgR35UdLJjpAZyb4MdquXJy0hAaCQWPVEVNhS0g34513VU8ctPJDx2l7PEzdVRd1
 VW6ID/DzCRDZulKekXiBsd+hxgLQ5QghfAI0+erdQrj0fkYhJ8duGDeypwTS2CIUn18k
 85v+v9ZcGClGgFdONCQJT5IooDlV4EHC58kpxUO+lx8ISN3AJCqwe7oU7cO8tNsY6F+p
 gEaA==
X-Gm-Message-State: AOAM530tCoE2WJb2A3YpW12Wrm+OgmdCRJutXBnuFQXBVhRPF798ASwR
 dKcNwDyx973sRgaEub81MkEN09TJkev9hMvvNxo3NeJDVzxt17M4aZSSXrbExSao6X/WE8DS/cF
 wbkHMZ45UxkL5HhOAf53N05s/scKZ
X-Received: by 2002:ad4:576b:0:b0:453:cc2c:e6f8 with SMTP id
 r11-20020ad4576b000000b00453cc2ce6f8mr2063751qvx.127.1650647082460; 
 Fri, 22 Apr 2022 10:04:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrAx69KALPbKbVyDjA5XRoT5dp0gFMLLP0r0F4OF9bZ5kqdwOdUE0ru7J+zpV9RKzoq/K22w==
X-Received: by 2002:ad4:576b:0:b0:453:cc2c:e6f8 with SMTP id
 r11-20020ad4576b000000b00453cc2ce6f8mr2063725qvx.127.1650647082234; 
 Fri, 22 Apr 2022 10:04:42 -0700 (PDT)
Received: from [192.168.8.138] (pool-71-126-244-162.bstnma.fios.verizon.net.
 [71.126.244.162]) by smtp.gmail.com with ESMTPSA id
 t67-20020ae9df46000000b006809a144ac1sm1137490qkf.99.2022.04.22.10.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 10:04:41 -0700 (PDT)
Message-ID: <647ec060ec96fd8055344fcc466d890ed3bb147a.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/gsp: change gv100_gsp from global to static
From: Lyude Paul <lyude@redhat.com>
To: Tom Rix <trix@redhat.com>, bskeggs@redhat.com, kherbst@redhat.com, 
 airlied@linux.ie, daniel@ffwll.ch
Date: Fri, 22 Apr 2022 13:04:40 -0400
In-Reply-To: <20220421133028.724954-1-trix@redhat.com>
References: <20220421133028.724954-1-trix@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push upstream in a moment

On Thu, 2022-04-21 at 09:30 -0400, Tom Rix wrote:
> Smatch reports this issue
> gv100.c:46:1: warning: symbol 'gv100_gsp' was not declared. Should it be
> static?
> 
> gv100_gsp is only used in gv100.c so change its
> storage-class specifier to static.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c
> index 2ac7fc934c09..6c4ef62a746a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c
> @@ -42,7 +42,7 @@ gv100_gsp_nofw(struct nvkm_gsp *gsp, int ver, const struct
> nvkm_gsp_fwif *fwif)
>         return 0;
>  }
>  
> -struct nvkm_gsp_fwif
> +static struct nvkm_gsp_fwif
>  gv100_gsp[] = {
>         { -1, gv100_gsp_nofw, &gv100_gsp_flcn },
>         {}

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

