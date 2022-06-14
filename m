Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C93154B85D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 20:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28175112A3F;
	Tue, 14 Jun 2022 18:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6269C112A39
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 18:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655230480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z38eWk0EdKiLopacPGDLeh8O//PFeccl+Ys1Xs8mu/E=;
 b=OWd6h4G3Kdrh9aTl/naJbXJL3q1McBwKs7EN5btXt52UX8JLrW9ANM1lKjIccnudFTpM2S
 K/o1pC/jLFSgbsKOhErul6Z9PV00AC+eHgGTdHQ62q2jl8ETZ2Iib+LflDki7Tjw6wP9bz
 9jzR5tMY5sDRW5gvy6Tz+FAW6lV87cM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-BJJ4R1OzM7CJ0_rFe2tkRw-1; Tue, 14 Jun 2022 14:14:37 -0400
X-MC-Unique: BJJ4R1OzM7CJ0_rFe2tkRw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k34-20020a05600c1ca200b0039c7db490c8so5167563wms.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 11:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z38eWk0EdKiLopacPGDLeh8O//PFeccl+Ys1Xs8mu/E=;
 b=Gqe/A4YXtPLPfIibRM+TGcmzz3Z3lsTYOTnBeB72r9OJwDMn94TkX3glTM194jO6pr
 pz09G7JEyl7AcYjK+QTRlISf513rEBTaIHIbd6AV54sclPpEBuARvDzfKLQAXATt1Vsf
 V72FLkqTChLzxB9vzww8D9IKCjrts2G9YDPb1w/1FBc/zXX3fZjw33V++7mvnQ2TbJ9G
 yoQXO4T4VSZiqMesK/eax0LeA49Gh3jP8PbEWMCrqWO5sjwKcvQSc4/J1xMPw9xP9baa
 G07tGtotzg03ECqaNIJyrttHcstFCdcvEQEBEaiwpV9rwqAQiL0HTfkKkkZULj0je0kW
 nidA==
X-Gm-Message-State: AOAM5305B9HKRbaVLt7S6aOLKVQmjDdsCRfIZfQ2MdtEvx9T/FFX7CPY
 uDH6cX9oYL0qWM3VhARxR8NGOlZ/9cc2jiHMiuRWnsyQJulg7oLWvFtsvS5BkW2emMUTUPklXvF
 TXRDkF7AVHut28Wg5908sffEVTwrP
X-Received: by 2002:a05:600c:acf:b0:39c:56ea:2121 with SMTP id
 c15-20020a05600c0acf00b0039c56ea2121mr5491667wmr.39.1655230476031; 
 Tue, 14 Jun 2022 11:14:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUSNelTlYVsxZl9ZbhRG+3geBek6mUVRzhGcy32mjelmqTYqVLjGacyunS9NvosRL5TS9Xvg==
X-Received: by 2002:a05:600c:acf:b0:39c:56ea:2121 with SMTP id
 c15-20020a05600c0acf00b0039c56ea2121mr5491643wmr.39.1655230475793; 
 Tue, 14 Jun 2022 11:14:35 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 63-20020a1c1942000000b0039c84c05d88sm13454562wmz.23.2022.06.14.11.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 11:14:35 -0700 (PDT)
Message-ID: <9159c90b-d772-9f13-474f-e9d50c104f25@redhat.com>
Date: Tue, 14 Jun 2022 20:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 3/3] drm/doc: Add KUnit documentation
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
References: <20220613171738.111013-1-jose.exposito89@gmail.com>
 <20220613171738.111013-4-jose.exposito89@gmail.com>
 <c50e5c87-3198-08b7-1e32-d0959af1f296@redhat.com>
 <20220614180952.GA7067@elementary>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220614180952.GA7067@elementary>
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
Cc: dri-devel@lists.freedesktop.org, davidgow@google.com,
 Maxime Ripard <maxime@cerno.tech>, airlied@linux.ie, dlatypov@google.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/14/22 20:09, José Expósito wrote:
> Hi Javier,
> 
> On Tue, Jun 14, 2022 at 02:58:29PM +0200, Javier Martinez Canillas wrote:
>> Hello José,
>>
>> On 6/13/22 19:17, José Expósito wrote:
>>
>> [snip]
>>
>>> +KUnit (Kernel unit testing framework) provides a common framework for unit tests
>>> +within the Linux kernel.
>>> +
>>
>> I think that it will be useful to have a reference to the KUnit kernel doc here,
>> something like the following:
>>
>> `KUnit <https://docs.kernel.org/dev-tools/kunit/index.html>`_ (Kernel Unit...
> 
> There is a link in the next paragraph. Once the documentation is
> generated the path "Documentation/dev-tools/kunit/start.rst" is
> transformed into a link.
>  
Ah, I wasn't aware of that. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

