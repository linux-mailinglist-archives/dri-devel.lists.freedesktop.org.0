Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C69254ED57
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 00:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6487010F6D3;
	Thu, 16 Jun 2022 22:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3960610FB04
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 22:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655418686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bU0VsK2JDaFAXshvmhSgHStyrksxJWmjq/aibJfxfwc=;
 b=gWMwXkPYAvZ705Vn16m8dp3JcXROwMy4MKJZYr/KKhL1lGWxuXQJJoMqBzfkqaSF9clgwM
 pgzcbVGTSaMCq57KoBAXROe/ym4DJ6i1ZjFFFNosfFlH8g2SBbcCXjtXNML/5IPruqeBya
 f4lCFpDRQAXb8u6wpTNlV6FHZAagPus=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-_QrB-BLYOZilO6nbNvFlZQ-1; Thu, 16 Jun 2022 18:31:25 -0400
X-MC-Unique: _QrB-BLYOZilO6nbNvFlZQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 bk10-20020a05620a1a0a00b006a6b1d676ebso3160593qkb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 15:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=bU0VsK2JDaFAXshvmhSgHStyrksxJWmjq/aibJfxfwc=;
 b=E0+SZ+xdG2qr7Fmw2vTS00tivBmreZ38QIdUOPTNHLTXXgtM/hGgzeIpdE9pqK9bRL
 tMMRIYeWjUtYjOC5kRTYbdSL75JJVxeMLR8eDC3AWumTScK5QmxqMt4EpmRlwKqPpx7P
 quNplET50WZOwVbVUqf0quLUnDmgFQfsTcCOmnkxMTMvEh9KvaSMK++Ek9MPyOiAj8y8
 NejvApZUeBSuAPd74NsV/PpB023/po4HlW5tVXBKJ5oUuODxLs5GkrAh/YPOmhoAwEib
 zcZQRWstYuWSfyx/7NLUGxUY2wvNeCmlkrltaxREjGSwjl8bsS6IpbZGy7MpcMKJWAFN
 bgYw==
X-Gm-Message-State: AJIora8yBmPcfI1uLoPn/f0M8f6RrCvKO9xOoXkAAxHnC4A8t4dLIqMR
 Xl6vFoHUc0rr8GY9FHtQ2FPAATuzWD6zNFQBAHSlhbWVi0+2q7fEvKkulTrIenM7JsRZKJ0QidM
 N0Jwo0/uEX6XM2cfILymCMv+QMQvy
X-Received: by 2002:a05:6214:5197:b0:469:dbf0:899b with SMTP id
 kl23-20020a056214519700b00469dbf0899bmr6016643qvb.59.1655418684724; 
 Thu, 16 Jun 2022 15:31:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uQ2+VNUkNyYDOT0uSnFzlvw62r4UWrTVGLjfnocSOM/wpgLfLveTzqDllaP17TXrkYMGFUDA==
X-Received: by 2002:a05:6214:5197:b0:469:dbf0:899b with SMTP id
 kl23-20020a056214519700b00469dbf0899bmr6016637qvb.59.1655418684489; 
 Thu, 16 Jun 2022 15:31:24 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac85d88000000b00304edcfa109sm2965995qtx.33.2022.06.16.15.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 15:31:22 -0700 (PDT)
Message-ID: <8f78441d81e4f867cbf4c16751f9a307f225ce9d.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Fix spelling typo in comments
From: Lyude Paul <lyude@redhat.com>
To: 1064094935@qq.com
Date: Thu, 16 Jun 2022 18:31:20 -0400
In-Reply-To: <tencent_C15AFFD9BBB862C56280A415C336F94C3909@qq.com>
References: <tencent_C15AFFD9BBB862C56280A415C336F94C3909@qq.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, pengfuyuan <pengfuyuan@kylinos.cn>,
 Ben Skeggs <bskeggs@redhat.com>, k2ci <kernel-bot@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2022-06-16 at 15:01 +0800, 1064094935@qq.com wrote:
> From: pengfuyuan <pengfuyuan@kylinos.cn>
> 
> Fix spelling typo in comments.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
> ---
>  drivers/gpu/drm/nouveau/include/nvhw/drf.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvhw/drf.h
> b/drivers/gpu/drm/nouveau/include/nvhw/drf.h
> index bd0fc41446e2..d6969c0e2f29 100644
> --- a/drivers/gpu/drm/nouveau/include/nvhw/drf.h
> +++ b/drivers/gpu/drm/nouveau/include/nvhw/drf.h
> @@ -190,7 +190,7 @@
>  #define DRF_MD_(X,_1,_2,_3,_4,_5,_6,_7,_8,_9,_10,IMPL,...) IMPL
>  #define DRF_MD(A...) DRF_MD_(X, ##A, DRF_MD_I, DRF_MD_N)(X, ##A)
>  
> -/* Helper for testing against field value in aribtrary object */
> +/* Helper for testing against field value in arbitrary object */
>  #define DRF_TV_N(X,e,p,o,d,r, 
> f,cmp,v)                                          \
>         NVVAL_TEST_X(DRF_RD_X(e, (p), (o), d##_##r   ), d##_##r##_##f, cmp,
> (v))
>  #define
> DRF_TV_I(X,e,p,o,d,r,i,f,cmp,v)                                          \
> @@ -198,7 +198,7 @@
>  #define DRF_TV_(X,_1,_2,_3,_4,_5,_6,_7,_8,_9,IMPL,...) IMPL
>  #define DRF_TV(A...) DRF_TV_(X, ##A, DRF_TV_I, DRF_TV_N)(X, ##A)
>  
> -/* Helper for testing against field definition in aribtrary object */
> +/* Helper for testing against field definition in arbitrary object */
>  #define DRF_TD_N(X,e,p,o,d,r, 
> f,cmp,v)                                                          \
>         NVVAL_TEST_X(DRF_RD_X(e, (p), (o), d##_##r   ), d##_##r##_##f, cmp,
> d##_##r##_##f##_##v)
>  #define
> DRF_TD_I(X,e,p,o,d,r,i,f,cmp,v)                                             
>              \

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

