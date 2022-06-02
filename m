Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B1753BD59
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 19:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0573E112ED0;
	Thu,  2 Jun 2022 17:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F90112ED0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 17:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654190988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dBTeWiiYW/rW3MZsHyTxu/jl9RRbd9h3yH+yLfy453k=;
 b=FDJwOtEuouwephBXnUZRVS9dQ6eem8AKvcrZbCNJ87HsjqdqciypVKimtRIxnFzi9umx8q
 AUwvSSo+/OYQnKOsqcPSJjjSau+jdp8bGgv6V4IyLUUHlxDKZel8mAlGtYI+i+mr++oZx8
 Gr5RIttOrRr0LE058Ka/s1s58lqAVRs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-ronQJ6bmPeGH3smiBMYxfA-1; Thu, 02 Jun 2022 13:29:47 -0400
X-MC-Unique: ronQJ6bmPeGH3smiBMYxfA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m19-20020a05600c4f5300b003974eba88c0so3126173wmq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 10:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dBTeWiiYW/rW3MZsHyTxu/jl9RRbd9h3yH+yLfy453k=;
 b=kAU3FlaCH8mPMgPu/Obb6mGKLJaeu6M+MMn8Iel6SqdInUVhAeu8C1gHmYHeqFoUXh
 SFLv4gRq3Ykrs149Dlnbi31VnC4wcAjhViF4WuSXtoNtt86JPB2bX32bnu35ksftrs1t
 DXG4w0uG5+vIaeGZAx8WpA4D78cvkQ7E2Jx6ic0GrJp6G6N3gvgZoQ/rlL0VQ+HbJvZN
 a6pPcsel6Ru/2+WgZGEq51Zb02nsM1Del47Q/bzX3e5wlHPASJyNWxv61e44HuT/jY2T
 HWDrw/wypt4mx/jHI8pNx7K40bJnsKhh9HG4zOm/L6joqXS5cwyatsHdJ0jMrkxnPKSQ
 yKoA==
X-Gm-Message-State: AOAM533FawQofHsqMLfE3byHNJxTXQMUIJUpCi/wt5QoVWM1Ov+n/3w9
 v6/bzvDB+7ROKUeaYQhrPZq8Mm3RuZTm9QfdHIGHi4bJ48z5Cv4eL6seN9X4qAg2I1HW798VIqo
 SLJQ5ikDF5m4foAJolkG6k1+4ggzu
X-Received: by 2002:a05:6000:1d9e:b0:20f:fb42:4b38 with SMTP id
 bk30-20020a0560001d9e00b0020ffb424b38mr4547016wrb.268.1654190986236; 
 Thu, 02 Jun 2022 10:29:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3RaBnbtgePjQfMXYRB7quw1mFYOf0GfERhyY4/DG9GKach7FhKYe8GN4LYEptHWxBQRhgmQ==
X-Received: by 2002:a05:6000:1d9e:b0:20f:fb42:4b38 with SMTP id
 bk30-20020a0560001d9e00b0020ffb424b38mr4546999wrb.268.1654190986044; 
 Thu, 02 Jun 2022 10:29:46 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0a4700b003973c54bd69sm10976449wmq.1.2022.06.02.10.29.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 10:29:45 -0700 (PDT)
Message-ID: <fea8f80a-939b-2c73-d94b-5179d1e65be9@redhat.com>
Date: Thu, 2 Jun 2022 19:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH 1/1] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
To: David Gow <davidgow@google.com>, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>
References: <20220530102017.471865-1-jose.exposito89@gmail.com>
 <20220530102017.471865-2-jose.exposito89@gmail.com>
 <20220530131158.kqq2mohxoh52xpeg@penduick> <20220530162903.GA6546@elementary>
 <CABVgOSn8i=LO5p7830h2XU1Jgg0KrN0qTnxkOMhf1oTgxjaKKw@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CABVgOSn8i=LO5p7830h2XU1Jgg0KrN0qTnxkOMhf1oTgxjaKKw@mail.gmail.com>
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
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/2/22 19:12, David Gow wrote:
> On Mon, May 30, 2022 at 9:29 AM José Expósito <jose.exposito89@gmail.com> wrote:

[snip]

>>
>> A .kuniconfig example is present in the cover letter. (...)
>
> FYI: it's also possible to run these tests under UML with the extra options:
> CONFIG_VIRTIO_UML=y
> CONFIG_UML_PCI_OVER_VIRTIO=y
>

Oh, very interesting. I didn't notice before that his example had --arch=x86_64

> I suspect it's probably better not to add those to your .kunitconfig,
> as they're UML-specific and will therefore break other architectures,
> but it does mean the tests can be run with, for example:
> 
> ./tools/testing/kunit/kunit.py run --kunitconfig
> drivers/gpu/drm/.kunitconfig --kconfig_add CONFIG_VIRTIO_UML=y
> --kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=y
> 
> Or, without the .kunitconfig:
> ./tools/testing/kunit/kunit.py run --kconfig_add CONFIG_DRM=y
> --kconfig_add CONFIG_DRM_FORMAR_HELPER_TEST=y --kconfig_add
> CONFIG_VIRTIO_UML=y  --kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=y
> 'drm-*'
>

I wonder if would make sense to have for example an arch/um/.kunitconfig
with those symbols and maybe others and then the tests could also be run
with something like:

./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/.kunitconfig \
--kunitconfig=arch/um/.kunitconfig

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

