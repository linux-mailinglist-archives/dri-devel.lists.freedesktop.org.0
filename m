Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 521E0575BEF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 09:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDC911A6D5;
	Fri, 15 Jul 2022 07:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96DA11A70D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 07:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657868400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBVMsqeudLUDrKPrFs7ovavMecKqXiLCpPEb6YK8LdQ=;
 b=KRcS37JJThPoF3hQqtw87s1fXSDlQrKDj9qZpUIrNTo8GTgDjAIbVmdspSSYcC/k0lBYHw
 HPQIvy+NXvQ7Jd3re/Js6TUoLuOOImmNcoyusV6Q0Tn/omNFNuwl+jzDaxgzXtZeK5yFou
 jhzpZoGtCDKkR7hjzd7Wrtt3laxoUw8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-ShpD59rrOUq5X9e6zvIgMg-1; Fri, 15 Jul 2022 02:59:57 -0400
X-MC-Unique: ShpD59rrOUq5X9e6zvIgMg-1
Received: by mail-wm1-f71.google.com with SMTP id
 t25-20020a7bc3d9000000b003a2ea772bd2so1531633wmj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 23:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FBVMsqeudLUDrKPrFs7ovavMecKqXiLCpPEb6YK8LdQ=;
 b=Eflyxmz72d5jx00gwsd7CsyBjTwjjuInUkjxI/FCPjUriP3+/gg8pjDrNxPUnlb+h0
 4B9AkmBn2txVGTekPyOSTabJZOWK04MUoEFa7RJS+VQmgQ0+3Kd3Hb1SVdTJ+ZhExNL3
 PS6AwqmGHtMv/v7CELTuBB2YZ5HjtmrFb/JI01MJ32eD6ZKLCmakodH235KjGAXcTpYs
 t0zZ75LU2H7LjlVFZrkYlu/kbm9qQsKo5o1OdtbgY7QY8/0cdU2DXq+hDb050aeEUWG7
 ZP2jVnmGQHfNBC7BgMBmh7TWMChJOv7anJ0M4LY4errAMj5qYKdlzB1L0wVLdsdnIdGl
 BWAQ==
X-Gm-Message-State: AJIora8BTt+mmLSTHTkUPAq5RRwzuhvqFxgkhKQ5ckTg7s7npC6EYW93
 y9pn5zX6qHlADuHVLdTs4vfiVSWDejCwnIZRgADKrHS6+qTDbqx8iar9zbiCjDeQQIVp/+VlMmv
 4cwTpQe0LS5DscbjFAPiK4n3sVwly
X-Received: by 2002:a5d:4d46:0:b0:21d:8196:6181 with SMTP id
 a6-20020a5d4d46000000b0021d81966181mr11294036wru.459.1657868396087; 
 Thu, 14 Jul 2022 23:59:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uAYCTgRNGQGhKCVMDYlzGS8cDv/34uFpAiy8Z6B2ARTEizEox1Diyk4fPX2N1E5/NRTO5Psw==
X-Received: by 2002:a5d:4d46:0:b0:21d:8196:6181 with SMTP id
 a6-20020a5d4d46000000b0021d81966181mr11294020wru.459.1657868395855; 
 Thu, 14 Jul 2022 23:59:55 -0700 (PDT)
Received: from [192.168.1.165] (22.red-79-153-172.dynamicip.rima-tde.net.
 [79.153.172.22]) by smtp.gmail.com with ESMTPSA id
 p19-20020a05600c359300b003a300452f7fsm5389311wmq.32.2022.07.14.23.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 23:59:55 -0700 (PDT)
Message-ID: <5f9b35b4-09fa-a8a9-3181-cd8cd7898d03@redhat.com>
Date: Fri, 15 Jul 2022 08:59:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 4/9] drm: selftest: convert drm_format selftest to KUnit
To: Daniel Latypov <dlatypov@google.com>, Guenter Roeck <linux@roeck-us.net>
References: <20220708203052.236290-1-maira.canal@usp.br>
 <20220708203052.236290-5-maira.canal@usp.br>
 <20220714235137.GA485839@roeck-us.net>
 <CAGS_qxrhy3=pST9f85fvxubKQShOq1XF6ZHALzMhXDOf5gnaUg@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAGS_qxrhy3=pST9f85fvxubKQShOq1XF6ZHALzMhXDOf5gnaUg@mail.gmail.com>
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
Cc: siqueirajordao@riseup.net, David Airlie <airlied@linux.ie>,
 brendanhiggins@google.com, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, n@nfraprado.net,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 magalilemes00@gmail.com, mwen@igalia.com, David Gow <davidgow@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, kunit-dev@googlegroups.com,
 michal.winiarski@intel.com, =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>,
 linux-kernel@vger.kernel.org, leandro.ribeiro@collabora.com,
 Thomas Zimmermann <tzimmermann@suse.de>, tales.aparecida@gmail.com,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/15/22 02:03, Daniel Latypov wrote:
> On Thu, Jul 14, 2022 at 4:51 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Fri, Jul 08, 2022 at 05:30:47PM -0300, Maíra Canal wrote:
>>> Considering the current adoption of the KUnit framework, convert the
>>> DRM format selftest to the KUnit API.
>>>
>>> Tested-by: David Gow <davidgow@google.com>
>>> Acked-by: Daniel Latypov <dlatypov@google.com>
>>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>>> Signed-off-by: Maíra Canal <maira.canal@usp.br>
>>
>> This patch results in:
>>
>> Building powerpc:allmodconfig ... failed
>> --------------
>> Error log:
>> drivers/gpu/drm/tests/drm_format_test.c: In function 'igt_check_drm_format_min_pitch':
>> drivers/gpu/drm/tests/drm_format_test.c:271:1: error: the frame size of 3712 bytes is larger than 2048 bytes
>>
>> presumably due to function nesting.
> 
> This can happen when there's a lot of KUNIT_EXPECT_* calls in a single function.
> See [1] for some related context.
> There were a number of patches that went into 5.18 ([2] and others) to
> try and mitigate this, but it's not always enough.
> 
> Ideally the compiler would see that the stack-local variables used in
> these macros don't need to stick around, but it doesn't always
> happen...

Thanks Daniel for the explanation.

> One workaround would be to split up the test case functions into smaller chunks.
>

Maíra,

Could you please look at splitting in smaller chunks to mitigate this issue ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

