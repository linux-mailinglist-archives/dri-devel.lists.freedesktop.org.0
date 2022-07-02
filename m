Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E249B563FE4
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 13:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A100E2ACEC;
	Sat,  2 Jul 2022 11:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A302ACEC
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 11:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656762722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aBlcdffUKRXsc9PEk6nABXGbXc001CdXE7OJZsMlP8k=;
 b=Yo/2BY3/ZtYu3zdzlWUpHFe/TKyj2MGLnMuZP0sISm00vfWPYjMyRzOzmA6DX+ZZcL7Y9c
 Kbuzz2wb9JnoPi9YooqzaP9CeM88BS/eqHwQ2ZLPHfshyvElRQHzLeAvyEj1ygso46WyTg
 UonlpJbuumwOFy5x3ACKxC5HgTXZPM8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-HfutwecoPs6D_R3w0fxKoQ-1; Sat, 02 Jul 2022 07:52:00 -0400
X-MC-Unique: HfutwecoPs6D_R3w0fxKoQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 az40-20020a05600c602800b003a048edf007so2064215wmb.5
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jul 2022 04:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aBlcdffUKRXsc9PEk6nABXGbXc001CdXE7OJZsMlP8k=;
 b=X9TB2V51jlnaVI1LwBaX74VTu1baQBuR7Cfxf7C1oVhZEpAjY98Vjo28rPPn3O7Z9j
 0F9Cwr5WCr6NLbGuN0v6ZRZ0Sa2b9ljcctCDTnJdqKHZEOTbrzQWNjbutkm+ubZdiGcn
 9XqMFIaOtHs7dia9uwy+jglpl6Lhd08o2qJTgXcbVsC7UBNFOQlpDDW5pX0eNOVysYma
 3Sq71n2i2czklh4LjvD9eith6BZkasX0jmkhqLV5qpdewWN+UPNUP5bAZ3qoIf4z3FxQ
 kVh7JzSZ5d/VW4NKVCbEc1YgNeMkp8KVl0/RWTlXCxy0Tt86vm9S2Kj9HIipp1F3Y5mv
 jdiQ==
X-Gm-Message-State: AJIora9E0CU9UdJM/0naehhhhA62nK5BlEBdo/ZgCYZfWmOXpGD69rXJ
 6PYvvWPz9kdU3EgK9tYYRU0NCHFfUeyMhoMgiIU2sS28utTQZMzXILdLOVDClMNi1tgentG2xRI
 0n8MPSlEQwTvAN6865yo9Wavnl7zE
X-Received: by 2002:a5d:64cc:0:b0:21b:ba06:4d4d with SMTP id
 f12-20020a5d64cc000000b0021bba064d4dmr18344065wri.157.1656762719672; 
 Sat, 02 Jul 2022 04:51:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sMLyiRwowUy7DUksqJ/vVSe40CQaqIn/NcAmSSiFjb9qPtH8jDU3mm/OgbP9QtaipFYcRWBw==
X-Received: by 2002:a5d:64cc:0:b0:21b:ba06:4d4d with SMTP id
 f12-20020a5d64cc000000b0021bba064d4dmr18344033wri.157.1656762719467; 
 Sat, 02 Jul 2022 04:51:59 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i30-20020a1c541e000000b003a032c88877sm9399422wmb.15.2022.07.02.04.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 04:51:59 -0700 (PDT)
Message-ID: <cd7137ea-16b6-dd0a-2a09-93185d874c73@redhat.com>
Date: Sat, 2 Jul 2022 13:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 9/9] drm: selftest: convert drm_mm selftest to KUnit
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>,
 Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, mwen@igalia.com, andrealmeid@riseup.net,
 siqueirajordao@riseup.net, Trevor Woerner <twoerner@gmail.com>,
 leandro.ribeiro@collabora.com, n@nfraprado.net,
 Daniel Vetter <daniel@ffwll.ch>, Shuah Khan <skhan@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, michal.winiarski@intel.com,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 David Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com
References: <20220630004611.114441-1-maira.canal@usp.br>
 <20220630004611.114441-10-maira.canal@usp.br>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220630004611.114441-10-maira.canal@usp.br>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: Arthur Grillo <arthur.grillo@usp.br>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/30/22 02:46, Maíra Canal wrote:
> From: Arthur Grillo <arthur.grillo@usp.br>
> 
> Considering the current adoption of the KUnit framework, convert the
> DRM mm selftest to the KUnit API.
> 
> Acked-by: Daniel Latypov <dlatypov@google.com>
> Tested-by: David Gow <davidgow@google.com>
> Signed-off-by: Arthur Grillo <arthur.grillo@usp.br>
> Signed-off-by: Maíra Canal <maira.canal@usp.br>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

