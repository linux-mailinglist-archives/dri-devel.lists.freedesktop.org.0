Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3711A505DFF
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 20:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3618410E121;
	Mon, 18 Apr 2022 18:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B54F10E121
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 18:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650307268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VuGc/WdeVJI1eBiXvGHukz2whIa4wWjXqnrLuB6HMKY=;
 b=U9uR7Kza2JFL2DWOti/2ZUcSc6uwtKgzucySpDOUbIwrpzkm1xASGwi6tNqcJP09SjnDBG
 oipqg8xxkNv2A3qwAebg2H4WHzwbBT3jI7jVy4hTPLt2+LditRldr1ykVLjKVBJ31T1YTj
 y5Uf2h40b7eov9JEBGYDarwcD7qklTQ=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-eX7dYumFNtm636B-1cNGVg-1; Mon, 18 Apr 2022 14:41:05 -0400
X-MC-Unique: eX7dYumFNtm636B-1cNGVg-1
Received: by mail-ua1-f72.google.com with SMTP id
 p4-20020ab01544000000b003595f320dfeso6607484uae.21
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 11:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=VuGc/WdeVJI1eBiXvGHukz2whIa4wWjXqnrLuB6HMKY=;
 b=zmHGLK4UStCjuWAl7byDf8+b7/HyX+0VErep68aLhez2U0XrEk/R/RVXu0tEaDbe5Z
 KI4SMqNwG4w3/mj0Ib/TVKe92Plkt01E24QyeTw28berdKxRCbe0yS5rq0xfqZ4fgLWY
 y+tJZ0U79XTe9ZmeLjjFgLdagzCSqfEw4MOT6FwfgjLzZDNI9Ghwsb5vswE8sdUvibn5
 D25VcWzPoIbKnU34BwOJ0HPktgFfwZ9T4ncSOWBvGSCfJyZN7G2W39FSWNXmV3L+30Mv
 Jiw08VKBQNNEH9JYHOMrfUYRZQqv0zsguycjjsxDfiknMWaSrJfUnhmdzeTfZwbWiiQE
 xK3Q==
X-Gm-Message-State: AOAM530VN78A9AhhFN9xoDl4++vcjJBGx64ObxgClNXtu4RDIcOjSTjb
 5F6LrH9zdA+G7YPe4yaorELZnE1W5wAH8lG9zxZLt5Eh0kINltQG0H40Jkwcub3xEzLnjqeZQsM
 rpNxxIT8Ujlvxs55vm4lSHzO9FQ5m
X-Received: by 2002:a1f:14c2:0:b0:345:3e0f:81b1 with SMTP id
 185-20020a1f14c2000000b003453e0f81b1mr3190544vku.2.1650307264770; 
 Mon, 18 Apr 2022 11:41:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEjhYF2Aoq1MDzFFiHfewXPAu8UoNo+RuC8SC8/8YCVnNVsfULVrP7+ysF7haG+Vsfh9D7ig==
X-Received: by 2002:a1f:14c2:0:b0:345:3e0f:81b1 with SMTP id
 185-20020a1f14c2000000b003453e0f81b1mr3190533vku.2.1650307264525; 
 Mon, 18 Apr 2022 11:41:04 -0700 (PDT)
Received: from [192.168.8.138] (pool-71-126-244-162.bstnma.fios.verizon.net.
 [71.126.244.162]) by smtp.gmail.com with ESMTPSA id
 t66-20020a1f2d45000000b00348da3c51bbsm1605500vkt.13.2022.04.18.11.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 11:41:03 -0700 (PDT)
Message-ID: <bc995a702bfa0c0efa83792a0d5c46bfe1ff0a4b.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: change base917c_format from global to static
From: Lyude Paul <lyude@redhat.com>
To: Tom Rix <trix@redhat.com>, bskeggs@redhat.com, kherbst@redhat.com, 
 airlied@linux.ie, daniel@ffwll.ch
Date: Mon, 18 Apr 2022 14:41:02 -0400
In-Reply-To: <20220418141842.296386-1-trix@redhat.com>
References: <20220418141842.296386-1-trix@redhat.com>
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

Will push this to the appropriate branch in a little bit

On Mon, 2022-04-18 at 10:18 -0400, Tom Rix wrote:
> Smatch reports this issue
> base917c.c:26:1: warning: symbol 'base917c_format'
>   was not declared. Should it be static?
> 
> base917c_format is only used in base917.c.  Single
> file variables should not be global so change
> base917c_format's storage-class specifier to static.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/base917c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/base917c.c
> b/drivers/gpu/drm/nouveau/dispnv50/base917c.c
> index a1baed4fe0e9..ca260509a4f1 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/base917c.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/base917c.c
> @@ -22,7 +22,7 @@
>  #include "base.h"
>  #include "atom.h"
>  
> -const u32
> +static const u32
>  base917c_format[] = {
>         DRM_FORMAT_C8,
>         DRM_FORMAT_XRGB8888,

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

