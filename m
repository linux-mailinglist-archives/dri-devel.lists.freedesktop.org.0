Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EAC5365F5
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 18:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F282A10E0A1;
	Fri, 27 May 2022 16:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D5310F6DD
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 16:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653668841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hCQWiLeW5qUsRPrZU5r1fc6h36nurC5ojFEAsj8ddWE=;
 b=dZe+12grPakHrpmXzOMMj9Ar4/0vv1EJbVm0ZkxiUl9Na4V/ldeQ6KLaYnZVIC04tJf8qQ
 yffBLlVUaYGJPvCyw+CtYQPtJPEWOBXT9x1gjogqOnOiDh68ukT13ZFFV1m0RMXdRs0V+c
 B1UsNoMKoIa6PQ7wUQkKykILnicKc8s=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-KVOpDZxCPTGklYsCw14QBw-1; Fri, 27 May 2022 12:27:20 -0400
X-MC-Unique: KVOpDZxCPTGklYsCw14QBw-1
Received: by mail-qv1-f71.google.com with SMTP id
 j2-20020a0cfd42000000b0045ad9cba5deso3899883qvs.5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 09:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=hCQWiLeW5qUsRPrZU5r1fc6h36nurC5ojFEAsj8ddWE=;
 b=MGZOBUxlhtY7s8Ls9vyZRPm6ZAH5t0+ikrNBcEipy02ZXEiLpPuxPdkFPaGL8ZlyRt
 EFkT+QJjE2pW3plyeRsmn3bT8+toIA+TdbSJ9xql847wmtNpHfMq2f5fAsmqSCWhOohB
 SvAphrguBRvEX28RTNEqcFFuAV3yD92BW4KJtA9KF32yvllEYXdymjZFhAj+a9ZMUk/u
 XDQPwkeOodSHxg3rlfRB1AlJmOyZ9uJXTD92cfFkSxRne5i10un1sAFb/bmPsGRmgXaC
 TnIjkObyrsNHSnUlikBuaA2Dh84Dusp7ccwTFQ4KKbfUEA/1i3DCj0ghDX7FlSzHx2QA
 gA9Q==
X-Gm-Message-State: AOAM530KxarY23qVZJHM8nAT80SMBDI/mE71WwKsXTToUHWc13z2zk9q
 G1QG2bkCBh0QY0VWs9ugFGbBcMrFZ9XrMLpfubEzOkh3qJHM1FAJAYs6lGVdZ2i8qvnRk9YFzO4
 VECtsuJ7Z8xToClfR9XM82Uf133we
X-Received: by 2002:a05:622a:8c:b0:2fb:4df4:3421 with SMTP id
 o12-20020a05622a008c00b002fb4df43421mr10819799qtw.144.1653668839663; 
 Fri, 27 May 2022 09:27:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiVpHPTtun+A+ekQ9OvBfz2OZyj/VWxMpfPUOhnLBH21qzgnM33CVE7ErnqS3tvCVpXeyueA==
X-Received: by 2002:a05:622a:8c:b0:2fb:4df4:3421 with SMTP id
 o12-20020a05622a008c00b002fb4df43421mr10819780qtw.144.1653668839419; 
 Fri, 27 May 2022 09:27:19 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 f13-20020a05622a1a0d00b002f39b99f695sm2899986qtb.47.2022.05.27.09.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:27:18 -0700 (PDT)
Message-ID: <d8a12051e71ec322f489beed252576e16802a172.camel@redhat.com>
Subject: Re: [PATCH 5/5] drm/nouveau: Fix spelling typo in comments
From: Lyude Paul <lyude@redhat.com>
To: 1064094935@qq.com, Ben Skeggs <bskeggs@redhat.com>
Date: Fri, 27 May 2022 12:27:17 -0400
In-Reply-To: <tencent_655C23622640268A069B49A6A5ADDEECB508@qq.com>
References: <tencent_655C23622640268A069B49A6A5ADDEECB508@qq.com>
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
 k2ci <kernel-bot@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Do you need me to push this to drm-misc? Or will this be pushed as one series?

On Fri, 2022-05-27 at 12:22 +0800, 1064094935@qq.com wrote:
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

