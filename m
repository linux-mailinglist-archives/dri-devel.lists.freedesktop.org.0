Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E62578206
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 14:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B91B0C73;
	Mon, 18 Jul 2022 12:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7F3B0C72
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 12:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658146696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nRTHRqopVyx8p+7I6IrcFl7f6nqQiYBQc4b7QjYHovE=;
 b=hG7HWIN9MULClwfFr6EBxqzru+oPJg8OCLMyY/QRRsuJfqWTRLCatMRcmO2J2jNAYY5HU4
 FmAG1lB/FgRBb0lmdLeDiTAz38I4XjkLbBfmOlj6zjv1QWJoUcnOOgO9i0N5qx0AOGHrVM
 HZIWM8Me1vunmKebtkX5nA1Kgngt/7E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-pwHoS937OzuBFrzmt6ohhw-1; Mon, 18 Jul 2022 08:18:15 -0400
X-MC-Unique: pwHoS937OzuBFrzmt6ohhw-1
Received: by mail-wr1-f70.google.com with SMTP id
 t28-20020adfa2dc000000b0021df4601013so631442wra.14
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 05:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nRTHRqopVyx8p+7I6IrcFl7f6nqQiYBQc4b7QjYHovE=;
 b=5Bg3sxU5joiSI2FxVP240TQRs4UDxLRa2I2rKPOO3TN8Pxz3arqHn4iRjysIBlVz0G
 FkwYuthByrCqGYsbDxOf725VtjKmL/nYnlgUmnSsfutm4j4ec+MvrLimC0aOyGy7iD06
 iKA1OYhcsNINi7gTZEA/bV2Chb1/AT0Vubb44jtl5NrYqPxkXyh36WaKtltWmZZ93WbD
 qPWsbxNPHL5mdj5+fJAIS2UBmd8rxB3fKKcscKYvpGVAZ2td+Vctz35YCgIYffuLBPxE
 CmxzzLYrFqG2cGZ5Q4rM0fXiRf6sEzK4Hxh/+Q4OlwQDW2dRmYxDiG7Hg85vfod0qp6O
 EpPw==
X-Gm-Message-State: AJIora/28c93+A2vkV6qpLaRfpUl0RZned98PSt1edKgTQdIJ6WgxKtB
 dHNjcaJO9rSr/vJu1XDfCGVs/RH3nqRUkl/AxE3W/293vGHW5pSTAeC30b6nScHaVC7ofwZvs0I
 uvdRNgFytdVShbwVUn6oP2kRPGdre
X-Received: by 2002:a05:6000:1a41:b0:20e:687f:1c3 with SMTP id
 t1-20020a0560001a4100b0020e687f01c3mr22094825wry.415.1658146694513; 
 Mon, 18 Jul 2022 05:18:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sYQtqbGzdUht4cnoLNHCkK9YNUHJiuuL5GKRgn4a8YOfs627Tm0nCqotu56L2Zkl3FogrDvQ==
X-Received: by 2002:a05:6000:1a41:b0:20e:687f:1c3 with SMTP id
 t1-20020a0560001a4100b0020e687f01c3mr22094808wry.415.1658146694296; 
 Mon, 18 Jul 2022 05:18:14 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003a033177655sm21463858wmp.29.2022.07.18.05.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 05:18:13 -0700 (PDT)
Message-ID: <b7bd3635-56c7-a1af-4d9e-70ad2c91f388@redhat.com>
Date: Mon, 18 Jul 2022 14:18:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 0/11] drm: move dri1 drivers to drm/dri1/
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>, 
 dri-devel@lists.freedesktop.org
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <9ded7088-cb15-fe5d-5a4d-001d3d9bb195@suse.de>
 <88df6527-7ff0-c69a-69ca-dbd1e4322bea@redhat.com>
 <0cb7b85a-d629-b5e9-4ab7-fcf7ce0e018f@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <0cb7b85a-d629-b5e9-4ab7-fcf7ce0e018f@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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

On 7/18/22 12:50, Thomas Zimmermann wrote:

[...]

>>> To be honest, I still don't like this rename. Especially in the case of
>>> via, which has a KMS driver coming up. It will now have an include
>>> statement that crosses several levels in the directory hierarchy. And
>>
>> That could be avoided by moving drivers/gpu/drm/via/via_3d_reg.h and other
>> header files to include/drm/via_3d_reg.h for example. Other drivers (i.e:
>> i915) do the same for headers that are shared across different subsystems.
>>   
>>> what about the other DRI1 drivers? If we ever get KMS drivers for those,
>>> do we want to move some header files back into their original locations?
>>
>> I believe for these we could also move them to include/drm/ if needed.
> 
> That pollutes these shared directories at the expense of everyone else. 
> If anything, we want to move files out of the shared include paths.
>

Yes, every option has a different set of trade offs.
 
> It would make sense to me if we'd have two distinct drivers. But here, 
> the new and the old driver is really just one DRM driver with badly 
> organized source code.
>

I see. I haven't looked at the via drivers in detail.

>>   
>>> Patches 1 and 2 look reasonable to me. The other driver patches have
>>> basically zero upside IMHO.
>>>
>>
>> I disagree with the zero upside. It may be that the trade offs are not
>> worth it but there are upsides of having all DRI1 drivers and core DRI1
>> bits in the same place. It makes grep-ing and reading files easier if
>> one doesn't care about legacy DRI1 drivers.
> 
> The grep-ability is a minor point. It does come up, but is usually 
> sorted out easily.
> 
> If we want to improve grep output, we should consider applying Sam's 
> via_dri1 changes to all DRI1 drivers. So we'd end up with a single 
> mga_dri1.c, tdfx_dri1.c, savage_dri1.c and so on. If the core/helper 
> code is also in a _dri1-named source file, grep runs can filter out 
> those filenames.
>

Having everything with a _dri1 suffix would be an improvement I agree
and if that's the consensus then I'm OK with that approach as well.

[...]

>>   
>>> In the case of moving the core files into dri1/, the resulting Makefile
>>> rule looks really ugly. I'd suggest to move all code into a separate
>>
>> Maybe this could be sorted by splitting the DRI1 core bits in a separate
>> drm_dri1.ko module?
> 
> The dri1 core files cannot be in a separate module as they are linked 
> with other core stuff. It would result in dependency cycles IIRC.
>

Got it.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

