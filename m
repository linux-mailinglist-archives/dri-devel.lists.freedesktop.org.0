Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D25AC564052
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 15:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E398A2B7;
	Sat,  2 Jul 2022 13:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014888A2A7
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 13:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656767877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7wQWnDeTi8uNY3ltPnFoch0K9/rDLf1kzMqZRJMA7Nw=;
 b=JILMMAD0/XuzWQfCGpIb2ck+Ndnudg7LbEwC/9w3nZls6CgUfH1hqwbdaLZ/3U9yjTzMWu
 yCMfE+UMW4cEByfd+s0EVStOQuDorpGJORiF+GAAiKoQxn/Y67UqyldW4OV/CAld+8YSd2
 GpGNGxcwEmppfoY6+7UuryPRS+rj2jM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-gNK3UH77NiugeZVoEFJ3kA-1; Sat, 02 Jul 2022 09:17:54 -0400
X-MC-Unique: gNK3UH77NiugeZVoEFJ3kA-1
Received: by mail-wm1-f72.google.com with SMTP id
 j19-20020a05600c191300b003a048196712so2722845wmq.4
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jul 2022 06:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7wQWnDeTi8uNY3ltPnFoch0K9/rDLf1kzMqZRJMA7Nw=;
 b=2sgwaItDmHVVpPqaAbiSdk1RnoMQFnUs1iZv5kwz+MuBlXO1xE+qgAKPou1/sUsMv3
 ECLQIRcIggW2Q/11sBYzy06aTTd2Kw2lYPdPsKwIHqBLT7qdzBhEPddEovFOGo5IGezT
 BbHyb6imVdKo9gm27YtNc3fnvucmxiF6UzwfHfEFAmdR2uOSq7TnzfHhiVXfrOZ+3qWv
 bVzUoh0umvdyRQ9e72J+SYGqzngPbAMEsnkC4bxcQQvVKrQ7iC89cTo75cK9ODWmPHVl
 eoQJZ6IHphpoeGlv205UE2z1jh/nU1ZOv6RKOKiB0Uil6bk2QqYz0XprsF4XqvlKVfjE
 n8TQ==
X-Gm-Message-State: AJIora9gwNAkEkhCtVwFiKH/c9nvy2NNHZrM6PEaLK7bgMzcaEeUK7lk
 nlY1kwjV1D/wHoICdqw0QENIfswoy4wSnKN41Koqzk7f4MpHnWenvQfk9egVxR4wCQ3cRuujd38
 ejPzRY5fu/MEAwYB7CS570Tf2ZuVq
X-Received: by 2002:a05:600c:3caa:b0:3a0:18e4:781b with SMTP id
 bg42-20020a05600c3caa00b003a018e4781bmr21754910wmb.199.1656767873500; 
 Sat, 02 Jul 2022 06:17:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vu2EJ+eqiyEMxGUkvKkZOQdhu9zVQtQLZAzTQirdJVvvl4MeRJd20akcdE/RUh+2SrmUL0sA==
X-Received: by 2002:a05:600c:3caa:b0:3a0:18e4:781b with SMTP id
 bg42-20020a05600c3caa00b003a018e4781bmr21754878wmb.199.1656767873173; 
 Sat, 02 Jul 2022 06:17:53 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d10-20020adff2ca000000b0021a38089e99sm24999260wrp.57.2022.07.02.06.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 06:17:52 -0700 (PDT)
Message-ID: <4c2dc8cd-56c4-6e15-d76e-429dba87407c@redhat.com>
Date: Sat, 2 Jul 2022 15:17:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 0/9] drm: selftest: Convert to KUnit
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
References: <20220702131116.457444-1-maira.canal@usp.br>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220702131116.457444-1-maira.canal@usp.br>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maíra,

On 7/2/22 15:11, Maíra Canal wrote:
> Hi everyone,
> 
> Here is the v4 of the conversion of selftests to KUnit. Since the v3, there
> have been minor fixes, asked by Javier. Basically, fixes on the SoB chain and
> addition of Copywrites.
> 
> Thanks for your attention and any feedback is welcomed!
>

Thanks a lot for the quick re-spin of the series! I'll wait a few days in case
someone else has additional feedback and then push to drm-misc (drm-misc-next).
 
> Best Regards,
> - Maíra Canal
> 

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

