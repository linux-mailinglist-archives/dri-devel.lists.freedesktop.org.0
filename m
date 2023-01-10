Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CBC663F17
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 12:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8402310E59E;
	Tue, 10 Jan 2023 11:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F00710E59E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 11:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673349240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugC7WAF0DHDfutcMaaEmipMBM+mPlDdmbX+J68WIRNc=;
 b=aHiJvw/ObQukOmYD0DY8Q6HwnOses49DHV/SgNb/8TUSyfXIbymiv9aZX2s9cbV8v7lCKH
 dS7PR7VEPducFFRUpeQ3wJCYlOg4Vn03DMnOH5hEwmwd+Tsh/5PW/CbjiZHyryt8WmDx/C
 PeyeZa8YtHp+mvXrO4e5LxVMAv5btBM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-ESgW19KgNYukL5eUlfNEHA-1; Tue, 10 Jan 2023 06:13:59 -0500
X-MC-Unique: ESgW19KgNYukL5eUlfNEHA-1
Received: by mail-wm1-f69.google.com with SMTP id
 fl12-20020a05600c0b8c00b003d96f0a7f36so6179341wmb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 03:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ugC7WAF0DHDfutcMaaEmipMBM+mPlDdmbX+J68WIRNc=;
 b=LoYkgQGgKRtG36plQddfQW9d4HValcpBsRjQOYZehRdLtWA/cL2WJfffeHYvghM6jH
 yW0E7mfCqKl7Y/55U/2P+LIudNyu1pF3lblSlDbFH2B7HcpqY3KcS1o+nX07SrZ9j2DI
 J7NaSQfkBFIpJ0HQLkgyW6xcq+5W9EFw3ZOqJtNr4/lZgikjci4ddB1b3TmNarsBgFf9
 BhFVlRtTwOxmct6Lcl/3buhWumFvOKPcMkRf5jC+bebHLafW02n53QSlKVn2K2+2ilRc
 asKoj4rF0fFwXiA3HjEJ8GEzTGyameC9Jq/JUMCLJrABk5m4UmmfIDmVZurhuIXvf2+Z
 T87A==
X-Gm-Message-State: AFqh2kq9m6BuVhelG5DEaOsBluOnzai6K1zG18XFIM9uoMY/g5pWd0Kl
 V69glIGo4QTkwhCF2Q3ym60YNh3SpKpcXc7P9alpg3fDFBUyjBolZ5E4cY+Koo7luta23vxJeXR
 RVEzgMp0ika7uaDfEswTYcVFsfqyr
X-Received: by 2002:a05:600c:1c20:b0:3d2:2f48:9443 with SMTP id
 j32-20020a05600c1c2000b003d22f489443mr48299072wms.15.1673349237952; 
 Tue, 10 Jan 2023 03:13:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvE8MjGxt3IYnUjHxCmRqc/TCnjRmfA3JnF2y+1a+YELBQyeVwMdaBwRGoyiC/4g/W//rcT1w==
X-Received: by 2002:a05:600c:1c20:b0:3d2:2f48:9443 with SMTP id
 j32-20020a05600c1c2000b003d22f489443mr48299059wms.15.1673349237792; 
 Tue, 10 Jan 2023 03:13:57 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q20-20020a7bce94000000b003c6c3fb3cf6sm14289703wmj.18.2023.01.10.03.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 03:13:57 -0800 (PST)
Message-ID: <b44a69d7-3bd6-1372-e14e-2c7f9aeb7894@redhat.com>
Date: Tue, 10 Jan 2023 12:13:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/vc4: dsi: Drop unused i2c include
From: Javier Martinez Canillas <javierm@redhat.com>
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>
References: <20221219084023.1402282-1-u.kleine-koenig@pengutronix.de>
 <2e7b9b94-0ae8-d596-354f-3bf9a6c37e5a@redhat.com>
In-Reply-To: <2e7b9b94-0ae8-d596-354f-3bf9a6c37e5a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/19/22 09:49, Javier Martinez Canillas wrote:
> On 12/19/22 09:40, Uwe Kleine-König wrote:
>> The driver doesn't make use of any symbol provided by <linux/i2c.h>. So
>> drop the include.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> ---
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 

I've pushed this to drm-misc (dri-misc-next) now. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

