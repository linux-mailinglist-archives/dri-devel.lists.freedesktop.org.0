Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 602BD53E4DF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 15:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C4410E633;
	Mon,  6 Jun 2022 13:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DE510E632
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 13:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654523401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b4qn3cjI7HqyUIxd4oKh+0A1P3k2mR1E2+5cIHyDYGM=;
 b=gqsC99MAWKD07Rr7TD2h+UJlWeWZzZ4SfasIC9kA26YSGS4mRg4I0MGjxhcwv5ReN5ZD+j
 JIWkl7AYc5fNsOCHnD4xHAccoUNVTVO7Wey72CjwheoURbFAeJ/NczjhvfJ74QJN+VhenM
 MqhQFxpeUL5IEt+3Oeunb1UEbk5lj2Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-UyY1fqeCPV-AX46GGMhF3w-1; Mon, 06 Jun 2022 09:50:00 -0400
X-MC-Unique: UyY1fqeCPV-AX46GGMhF3w-1
Received: by mail-wm1-f71.google.com with SMTP id
 be12-20020a05600c1e8c00b0039c506b52a4so831542wmb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 06:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b4qn3cjI7HqyUIxd4oKh+0A1P3k2mR1E2+5cIHyDYGM=;
 b=Jw/Ht9Xzso1GS+OVxpll9UGpFZbfIAtL73MsOEy3srv1tmAnoqd4fvIpQP6L+ObemX
 X7p3L7CDhkKRcgyPQ7I8wxljaMdliosnUymKVKivtOJkXjt5UvkqyLwL6inmFtUHhdtM
 0aztmbi51MY5d1wZ7evOMz4T5u8WVraK/izzRqkVNFFKERAupq/IsmDXwS/i4CevGUmA
 zsxjNXAnQyiDmT1L8Yo9N/O/p2gfIJ3tu4G/QzmOZfQ4kyIQErFrniOeYBCXrLwVPDpR
 lsSE93ECBfHePRzxpFZmuVXhyKtK+4hgtCIXwgOIRtVgk++vXL0omdhe0XMkIrFgfv1B
 pa8A==
X-Gm-Message-State: AOAM5331S485ErhWodagW7/rhQjG3EzVPlNykSKTT/44WpMTM5WANNpJ
 aevWkAHTmlB8J13qClDHGo/9fi17RAXjKGXo+r5i41rdsHGjbDkxMSUn1cG3Wo3+ozpbo7xNdq3
 64ygzn5/OvgQUfYO42ivVobRJAviH
X-Received: by 2002:a05:600c:19c8:b0:398:c5db:aeba with SMTP id
 u8-20020a05600c19c800b00398c5dbaebamr44023364wmq.199.1654523399296; 
 Mon, 06 Jun 2022 06:49:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyWCdhmvcE0h6rwg+BogKrl/NSZO6bwH4Cl9p4VVAO3rw2D+6bzdBeNXYk7CexdL++HidvEA==
X-Received: by 2002:a05:600c:19c8:b0:398:c5db:aeba with SMTP id
 u8-20020a05600c19c800b00398c5dbaebamr44023339wmq.199.1654523399055; 
 Mon, 06 Jun 2022 06:49:59 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s8-20020a5d69c8000000b002102b16b9a4sm15245571wrw.110.2022.06.06.06.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 06:49:58 -0700 (PDT)
Message-ID: <576ed6ef-b961-9214-2c9b-56cb5b493b4e@redhat.com>
Date: Mon, 6 Jun 2022 15:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/1] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
To: Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
References: <20220606095516.938934-1-jose.exposito89@gmail.com>
 <20220606095516.938934-2-jose.exposito89@gmail.com>
 <20220606134242.h6kuqn4zbpmc2rql@houat>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220606134242.h6kuqn4zbpmc2rql@houat>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, dlatypov@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 davidgow@google.com, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maxime,

On 6/6/22 15:42, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Jun 06, 2022 at 11:55:16AM +0200, José Expósito wrote:
>> Test the conversion from XRGB8888 to RGB332.
>>
>> What is tested?
>>
>>  - Different values for the X in XRGB8888 to make sure it is ignored
>>  - Different clip values: Single pixel and full and partial buffer
>>  - Well known colors: White, black, red, green, blue, magenta, yellow
>>    and cyan
>>  - Other colors: Randomly picked
>>  - Destination pitch
>>
>> How to run the tests?
>>
>>  $ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm \
>>          --kconfig_add CONFIG_VIRTIO_UML=y \
>>          --kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=y
> 
> It's not clear to me why you would need VIRTIO here? The Kunit config
> file should be enough to run the tests properly
>

It's needed or otherwise KUnit will complain with:

./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/.kunitconfig
[15:47:31] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
ERROR:root:Not all Kconfig options selected in kunitconfig were in the generated .config.
This is probably due to unsatisfied dependencies.
Missing: CONFIG_DRM=y, CONFIG_DRM_KUNIT_TEST=y
Note: many Kconfig options aren't available on UML. You can try running on a different architecture with something like "--arch=x86_64".

The following works correctly but it won't use User Mode Linux:

./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/.kunitconfig --arch=x86_64

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

