Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E0D65B6BB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 19:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5F510E372;
	Mon,  2 Jan 2023 18:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A475810E375
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 18:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672685472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IEBrukFBGp6hybe2G68udkPzWSggmxuhkhbF0JC3TdM=;
 b=encyUlNiZqrQilqvPHDcxFexwDNUeiHv9f8QEw6Qp/jE8rGuEHNONLUKSTMvlIXls1CNFL
 p7KYgkenuIFl4owP2woovJAOt5q14cqHK4qst1bZSMGjyA1ql2SqABvbnMfhN1GPNtM9Zd
 Kqb2okVaBNyAllqoNF3SH7E+uy9DOkE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-630-u4-jex_aNCq8NNf09R9xdQ-1; Mon, 02 Jan 2023 13:51:11 -0500
X-MC-Unique: u4-jex_aNCq8NNf09R9xdQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 k11-20020adfb34b000000b0027811695ca6so2149101wrd.16
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 10:51:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IEBrukFBGp6hybe2G68udkPzWSggmxuhkhbF0JC3TdM=;
 b=qnSL4QyZEwe92R89/BuR4O5PwfAwUB7Dc47P37KrmEsUW2fFG87IFSEn2SGxzLYdAX
 GbboXm3IJAPN6aL2d7zlLVXJdjhzRBfd3mSptpCqBD9pWS4Y+zMdfPCp6cLUZuh+N/LV
 p9dSKzvsCzEeezaCsL2FLAEsY5y08kY2HuB7072+5b+QELGRJjSu566CJ/aqtMgkX80v
 l/tPIgDAXKKfTwbRy1/rK2vt9mRaOWOhUr0PyHGeO9l8m6cvWODE3El/jN2k50qnICmb
 2sItuNSB6GhjvghdqKp+F0sVVBPMsKXlWoPdb+/hZVvCCsTmvv38bmSEF1E+bbCJJG11
 Bh+Q==
X-Gm-Message-State: AFqh2kp+UwrwlsiSpoKN0DMeMBgd+6Q1SlOE4tq2vA3ygeVo0EZcuDLV
 LyMUwpMetIidJlF9fKTj2O+FC47FJJZ7AvK3P8fXMeIu/bUUsUOdHpgZ6KSfO7h5ji0xSdBNUGU
 HiLXHDCuh6Nf+eS7k5SSg+QgayQP3
X-Received: by 2002:a05:600c:c0d:b0:3d9:7667:c0e4 with SMTP id
 fm13-20020a05600c0c0d00b003d97667c0e4mr21144505wmb.31.1672685470456; 
 Mon, 02 Jan 2023 10:51:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvp2sP5F4qJR+gLqHpo+Zpkru9OLDJeTxpx+iJMU4nUmeUljLJQnIVw0WwpC9JObG0zQnguIg==
X-Received: by 2002:a05:600c:c0d:b0:3d9:7667:c0e4 with SMTP id
 fm13-20020a05600c0c0d00b003d97667c0e4mr21144497wmb.31.1672685470243; 
 Mon, 02 Jan 2023 10:51:10 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q14-20020a05600c46ce00b003d9bd56e9c1sm2356977wmo.11.2023.01.02.10.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 10:51:09 -0800 (PST)
Message-ID: <da5c9ec8-da44-3dff-11c7-2160e335227f@redhat.com>
Date: Mon, 2 Jan 2023 19:51:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 2/4] drm: panel: Add Himax HX8394 panel controller
 driver
To: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megi@xff.cz>,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Kamil_Trzci=c5=84ski?=
 <ayufan@ayufan.eu>, Martijn Braam <martijn@brixit.nl>,
 Sam Ravnborg <sam@ravnborg.org>, Robert Mader <robert.mader@posteo.de>,
 Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Peter Robinson <pbrobinson@gmail.com>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 dri-devel@lists.freedesktop.org, Maya Matuszczyk <maccraft123mc@gmail.com>,
 Neal Gompa <ngompa13@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Thierry Reding <thierry.reding@gmail.com>
References: <20221230113155.3430142-1-javierm@redhat.com>
 <20221230113155.3430142-3-javierm@redhat.com>
 <20221230154043.7v3zmzqdrnouqzd2@core>
 <7120dfd4-305f-69ac-fee8-123196ed06a9@redhat.com>
 <20230102105915.gbfhletcm4dunrlf@core>
 <eead4707-e73f-f648-edc6-8415bbb25b8b@redhat.com>
 <20230102152041.7rc2uts7o37fnsen@core>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230102152041.7rc2uts7o37fnsen@core>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/2/23 16:20, Ondřej Jirman wrote:
> On Mon, Jan 02, 2023 at 02:51:42PM +0100, Javier Martinez Canillas wrote:
>> Hello Ondřej,
>>
>> [...]
>>
>> My goal was to have some initial support in mainline even if there could be some
>> issues. IMO it is better to use upstream as a baseline and attempt to support the
>> PPP incrementally.
>>
>> But since you are aware of the issues and know what are the available fixes, I'll
>> let you continue with the effort and take care of the patches. Hopefully there may
>> be things that will be helpful, such as the binding schema patch and the collected
>> tags. I can also take care of pushing the DRM bits to the drm-misc-next tree once
>> you feel that those are ready to get merged.
> 
> Ok. The panel driver itself works fine with some changes in other DRM drivers.
> In fact, it will not need any changes, assuming the to be proposed fixes to
> dw-mipi-dsi will pass, too. So I don't have many objections against this driver
> itself.
>

Exactly, that is what I was trying to say. Awesome that you agree with that.

> I'm not sure I should be giving reviewed-by to driver I co-wrote. :) Anyway,

Indeed :)

> I checked it again, and only issue I found was that shutdown callback tries
> to disable the panel even if it may already be disabled, which will lead to
> unbalanced calls to regulator_disable functions, which may produce some needless
> warnings on shutdown/reboot.
> 
> So if you want to commit this driver now, go ahead. DT will need one more round.
> 
> As you say, the overall usable support for Pinephone Pro in mainline is still
> way off into the future, so I agree it's not necessary to get hung up on these
> issues. I can do a DT revision + add in the other suggested DRM patches, so that
> there's at least a searchable public record of the remaining issues.
> 

Perfect, sounds like a plan. I'll re-spin a v5 that only includes the panel
patches then and drop the DTS. Thanks again for your feedback and comments!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

