Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13591AD6BB4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 11:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703E510E7BF;
	Thu, 12 Jun 2025 09:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HZ9bL8jC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F5510E7BF
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 09:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749719317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LpG3MW4qTy0ylo792gOjW9hrHjsXhjR7SwrnfuuBuMA=;
 b=HZ9bL8jCS9XPlhemszd5tqR3w2G+cL90x2Sm1jIMdIASF1ROvuEnt0PyR4T6tJ4pfD3J9n
 By17byEjAS5iikK8fiIIntp2pVEDmM38QNK7+/Zg+0fnfEBngNvcbdCJtf/IGTM5+eGGOK
 J6dvuvvbhl+CnbkSLnB0bZ0DMq/Xum8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695--pa4uIa-PUGUckiw53zpFQ-1; Thu, 12 Jun 2025 05:08:36 -0400
X-MC-Unique: -pa4uIa-PUGUckiw53zpFQ-1
X-Mimecast-MFC-AGG-ID: -pa4uIa-PUGUckiw53zpFQ_1749719315
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43eea5a5d80so3283995e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 02:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749719315; x=1750324115;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LpG3MW4qTy0ylo792gOjW9hrHjsXhjR7SwrnfuuBuMA=;
 b=wcPpQnGzBy27fUKMVZC/hjLu1Y7sBAVIL5o3tXol5ca26NXviylkYgSdxJN0U9rxrj
 zGPyI2iwfALJVJJlIuyapQdxL+RMJaYUz+If8jslWlhNjE2xjqBiaruJ+Ly2nijnpLfS
 /9B2TqeftuW6LUbvEXg4LZnO20LVoTsMNtU9I7nSmr8m/hBNprbhoztFO/3/A0w+TbEr
 qsfhP+UPTBlTiA22Vvqc15GjOH5kcOAycH3MPBbJlhACJjcutWxZ3XDYqgptXPhiA2Yh
 2hTS8qzUo7CvcnZYqIHICMT+J4SzcOLWT9npitFftXhmESkyPrQ228MITDk4stg28LFc
 NzHw==
X-Gm-Message-State: AOJu0Yxo6Eqwh1qdR0lgnLJyYSMGI6iX4fOdkE0ZcLCFIh4I1sEPzBmz
 rbVMAuVrnL06SsysyAFiiXLH27Cq5BABtZRn8LoHkzaOeNt5j0zIq++Mi5hNNsUya6C/8e56jfF
 iPpxhEqy8oCq3IHgEkgsvB53CLM3zarZrVn7hTELGzAcaEO6IkaGuV9coNPxOYZzWYia5ww==
X-Gm-Gg: ASbGncuMVSQIC5yIKlzzZyI4UyM52+APfdSRwXruhmgdyN1naXbE9l0IIHeB8RbLdvK
 6FG1LILARxEf9aSIawWYOuZQoEVqCUsKnSuTUtZj5xiahsdnprkFPq4ljpnbGNhTDRkbr0wetry
 7/OSUnqOfsLkcUVhTakKN6zmLitVl5DOXuvSzaaJx9Vi56tazbm2NGF/w42xbLhJK7770lxgTbf
 JsOIIQMAZfyPnmBSB8nDd0zKtcJT7LRvXqIY5YmSzIClO94kDtC0aq+pRFTp3uVPcDUtgIzu0JN
 zaEIyXOUrk2FqFhf5JTrIbU7GdPAqe4yGeKpB/aPA4TMu8fz+EiU1TNTteH/SQ==
X-Received: by 2002:a05:600c:8b02:b0:450:b9c0:c7d2 with SMTP id
 5b1f17b1804b1-4532d25a1edmr19698515e9.11.1749719315317; 
 Thu, 12 Jun 2025 02:08:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQgksg4q4ZOX8jIzGCR5VPPqFTQ8tXbEdqMo7eSmb/uRrbkuC7l+7M7AW+CxJUKQI38WUa0w==
X-Received: by 2002:a05:600c:8b02:b0:450:b9c0:c7d2 with SMTP id
 5b1f17b1804b1-4532d25a1edmr19698285e9.11.1749719314866; 
 Thu, 12 Jun 2025 02:08:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e232219sm13901285e9.9.2025.06.12.02.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 02:08:34 -0700 (PDT)
Message-ID: <55479b68-5bbf-4d25-a99a-13fd11b542ea@redhat.com>
Date: Thu, 12 Jun 2025 11:08:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Do not include <linux/export.h>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250612085308.203861-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250612085308.203861-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fUMjHNn6f8IoJuflJEzbZOiojfU2WDurtob0mw-pz90_1749719315
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/06/2025 10:53, Thomas Zimmermann wrote:
> Fix the compile-time warning
> 
>    drivers/gpu/drm/mgag200/mgag200_ddc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
> 
Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_ddc.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_ddc.c b/drivers/gpu/drm/mgag200/mgag200_ddc.c
> index 6d81ea8931e8..c31673eaa554 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_ddc.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_ddc.c
> @@ -26,7 +26,6 @@
>    * Authors: Dave Airlie <airlied@redhat.com>
>    */
>   
> -#include <linux/export.h>
>   #include <linux/i2c-algo-bit.h>
>   #include <linux/i2c.h>
>   #include <linux/pci.h>

