Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D96570896
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 18:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7428FEE0;
	Mon, 11 Jul 2022 16:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F768FEE0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 16:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657558601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=adXNKimZqOqTZafXK0kK9fx2kRZLSBE0wAzA1vGBEIY=;
 b=R/8VCKNM9A1pN/AzZJovfPKVIa+RZXGByEuPLo7h5sEA1C73xN1iBiKkAlN9QuODJTDI6X
 T7I87xIPm0RaaS+ViHtzEsadLzJa6ZTZ5QnL2qQlmF57C0h5pbLk9KLDakESSCMXf1bThe
 fowoNC2q6O8Hn58yCXSsuLpefm3AMhg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-2FXsWLhOO_mtqt_xZuRV7A-1; Mon, 11 Jul 2022 12:56:40 -0400
X-MC-Unique: 2FXsWLhOO_mtqt_xZuRV7A-1
Received: by mail-wr1-f69.google.com with SMTP id
 e7-20020adfa447000000b0021d669c6a76so796291wra.19
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 09:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=adXNKimZqOqTZafXK0kK9fx2kRZLSBE0wAzA1vGBEIY=;
 b=GhNkJEpyeLeDuv71GaWB2ofA84VanQxuvJ8aLDLzmL9eHD+eOWOBTRbJhV8eANVELM
 pNP8l8SauAAKt31PycUm/8KeebhVZVWBS/CkRSHmE86pE09nLnUGyz7SpYl6a4g8w77m
 CFLMliM00HWeeooWyr6EHiu7p+S+TQsao9QlhUTSF4WqPG6ngeb2RLYk+V8XL0M8S8Ip
 bjdQXZA1qW65SgZnVSRjWZhQKShorJhTifiLp7sQLs4VNDTmItlh5u1t9BwoaJOLqqEV
 IuaCeVDMRaymPMTm0Roith9Y5kVD/fL7SUodssU5h9lobZpnbEqJggBB44hDv9uoqMVY
 RC+Q==
X-Gm-Message-State: AJIora/PwQMWa+z4Z7nQ1M7nQaKrfEzXlIvuUn7Ovd+7ZoD2HI30HUQT
 K8LIZPa/Ou6ghtUijnbfotTYn3z5Z/A7mm0Fpi2GXGzjAvmtvuTwyUn+JyZX7xgxXX0mY6yrmzW
 OO03JqYG0xNxnxzhEVYfswhHxfVAE
X-Received: by 2002:a05:600c:154c:b0:3a1:884e:72ac with SMTP id
 f12-20020a05600c154c00b003a1884e72acmr17702765wmg.23.1657558599116; 
 Mon, 11 Jul 2022 09:56:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u4/0yhpTv1pIJ7WGyqp3/Z7Pg+YEcmGi6GZFGQcW7Ca5cmu4BMZCEZ2evn2eYQWjVSeZ5D2A==
X-Received: by 2002:a05:600c:154c:b0:3a1:884e:72ac with SMTP id
 f12-20020a05600c154c00b003a1884e72acmr17702736wmg.23.1657558598929; 
 Mon, 11 Jul 2022 09:56:38 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d20-20020a05600c4c1400b003a1980d55c4sm10143057wmp.47.2022.07.11.09.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 09:56:38 -0700 (PDT)
Message-ID: <7b13d811-08bd-1370-dbaf-b37f2cc728dd@redhat.com>
Date: Mon, 11 Jul 2022 18:56:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 0/9] drm: selftest: Convert to KUnit
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
References: <20220708203052.236290-1-maira.canal@usp.br>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220708203052.236290-1-maira.canal@usp.br>
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

On 7/8/22 22:30, Maíra Canal wrote:
> Hi everyone,
> 
> Here is the v5 of the conversion of selftests to KUnit. Since the v4, the only
> fix was checking the checkpatch warnings and checks (Thank you Javier).
> 
> Thanks for your attention and any feedback is welcomed!
> 
> Best Regards,
> - Maíra Canal
> 

Thanks for the quick respin. I've pushed this to drm-misc (drm-misc-next).

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

