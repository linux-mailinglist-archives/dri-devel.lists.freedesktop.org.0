Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FAF53E4EA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 15:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F5610E306;
	Mon,  6 Jun 2022 13:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8948C10E306
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 13:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654523869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/0VC7WDZcQaB0QeUnzxfKz7gfxnXoY+3H1Ie1KFzEnk=;
 b=X8JcDhwqvvdbf4kmkTyuEFFa8XFdJvy8cgDgEe/fpGKe1xVIsA87jlpOGqYpb8bwwjX8dH
 L9TsccRX49jo0a4W/Rj7m8vmb3gAzV+YsyxS/hM7CV/arRxZYa4JpoDiYd3nH0lk/dXOIV
 n2Y956x70zqhmInDjtQ8tDHnk9BK1RY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-G-1bmsGGMcqct1cDTBi9iQ-1; Mon, 06 Jun 2022 09:57:48 -0400
X-MC-Unique: G-1bmsGGMcqct1cDTBi9iQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 r13-20020adff10d000000b002160e9d64f8so1370662wro.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 06:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/0VC7WDZcQaB0QeUnzxfKz7gfxnXoY+3H1Ie1KFzEnk=;
 b=cT7Rtzq5YAer8wPQpbk2w5YSJHERacUluCflpIW4uA7RynRl/r6cMnjYj5yi8uhyNN
 Mkm5DjgwKyv6CNewSZCiRwfHUw8hebMgnti/8F155GTxXSzrWgg+Cbmz+O6jkCkpMdhk
 yecAR2diR3rtMwp7eLPXlk35tSo7GhoZ75AOdmBjXY7LB+qlM3Y8fBz2DzFGy7pG9GtJ
 obwte/HjumOSx9Iatbsx/aDWI5hiDgXgoMXkvfea9184iKnRh3+LORjIFANDYYSQsAfM
 PRguZCwStkuKmyKYBlRLBv2X9UbleU4gzh1RXaeo3bwvZHaozAzswOOaR7ezye9DSPgI
 cUlg==
X-Gm-Message-State: AOAM5324aaHucm1vg+toRjbY91EbeU+n5kYMz/iT2+ZUyD/QF8kWkdmO
 L9JbbWOSeGWBl6EaB6tD3IAVQ+vgt9zFMOBJFP+3Skv+I65agMbPldHfnvdWtqTSHRygCgO8Cfz
 b/g5xe9edyJffc+rQmX42y0X2EqWI
X-Received: by 2002:a05:6000:156c:b0:210:4a6a:16bb with SMTP id
 12-20020a056000156c00b002104a6a16bbmr22136543wrz.245.1654523867417; 
 Mon, 06 Jun 2022 06:57:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9YW7NYiKilW7zDGyVtf/GWRLG+UOJzXr7htfeXNK9ImAjKSBTXLgU1FFEZIpGTV7JYmZjbg==
X-Received: by 2002:a05:6000:156c:b0:210:4a6a:16bb with SMTP id
 12-20020a056000156c00b002104a6a16bbmr22136508wrz.245.1654523867196; 
 Mon, 06 Jun 2022 06:57:47 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w25-20020a1cf619000000b003976fbfbf00sm17882402wmc.30.2022.06.06.06.57.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 06:57:46 -0700 (PDT)
Message-ID: <78c1eb65-ea78-8744-5382-ea86a56a66f4@redhat.com>
Date: Mon, 6 Jun 2022 15:57:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/1] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
To: Maxime Ripard <maxime@cerno.tech>
References: <20220606095516.938934-1-jose.exposito89@gmail.com>
 <20220606095516.938934-2-jose.exposito89@gmail.com>
 <20220606134242.h6kuqn4zbpmc2rql@houat>
 <576ed6ef-b961-9214-2c9b-56cb5b493b4e@redhat.com>
 <20220606135219.nwhp4fdawg2qjeam@houat>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220606135219.nwhp4fdawg2qjeam@houat>
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
Cc: davidgow@google.com, airlied@linux.ie, dlatypov@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maxime,

On 6/6/22 15:52, Maxime Ripard wrote:
> hi,
> 
> On Mon, Jun 06, 2022 at 03:49:57PM +0200, Javier Martinez Canillas wrote:
>> Hello Maxime,
>>
>> On 6/6/22 15:42, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Mon, Jun 06, 2022 at 11:55:16AM +0200, José Expósito wrote:
>>>> Test the conversion from XRGB8888 to RGB332.
>>>>
>>>> What is tested?
>>>>
>>>>  - Different values for the X in XRGB8888 to make sure it is ignored
>>>>  - Different clip values: Single pixel and full and partial buffer
>>>>  - Well known colors: White, black, red, green, blue, magenta, yellow
>>>>    and cyan
>>>>  - Other colors: Randomly picked
>>>>  - Destination pitch
>>>>
>>>> How to run the tests?
>>>>
>>>>  $ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm \
>>>>          --kconfig_add CONFIG_VIRTIO_UML=y \
>>>>          --kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=y
>>>
>>> It's not clear to me why you would need VIRTIO here? The Kunit config
>>> file should be enough to run the tests properly
>>>
>>
>> It's needed or otherwise KUnit will complain with:
>>
>> ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/.kunitconfig
>> [15:47:31] Configuring KUnit Kernel ...
>> Regenerating .config ...
>> Populating config with:
>> $ make ARCH=um O=.kunit olddefconfig
>> ERROR:root:Not all Kconfig options selected in kunitconfig were in the generated .config.
>> This is probably due to unsatisfied dependencies.
>> Missing: CONFIG_DRM=y, CONFIG_DRM_KUNIT_TEST=y
>> Note: many Kconfig options aren't available on UML. You can try running on a different architecture with something like "--arch=x86_64".
>>
>> The following works correctly but it won't use User Mode Linux:
>>
>> ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/.kunitconfig --arch=x86_64
> 
> But then, can't we add them to .kunitconfig?
>

That's what I asked in the previous RFC too. Daniel mentioned that it shouldn't
go there because is platform specific (AFAIU, one might want to test it on x86,
aarch64, etc) but then I asked why we couldn't have a arch/um/.kunitconfig.

The answer was that's not that simple and some agreement on how to do it is needed:

https://lists.freedesktop.org/archives/dri-devel/2022-June/357617.html

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

