Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C831355B99A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 14:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31DD11A40C;
	Mon, 27 Jun 2022 12:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D066711A398
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656334415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JSJUUnvpeAQHv0wrzmpKB9ikE0jhSvsZydeKYwwWYok=;
 b=JcXhV4Ouab5yuQ3Ax0KUMIpZaID4pwvBpDwor8VuvYcYx1zkPQtGqh7SqR3/9pb0TS/Zet
 tn16z2Q31OR3zBZjH0nYk1cfy5D7uSVgJ7zZ1F+znrgTIJi8/D+DdSUuHH3EYCROjwTUQh
 wVz27UJBWP0CxXink7nXsa+k1X90ga4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-C3wxL2eYOxSEncx2uaHzBA-1; Mon, 27 Jun 2022 08:53:34 -0400
X-MC-Unique: C3wxL2eYOxSEncx2uaHzBA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k32-20020a05600c1ca000b0039c4cf75023so7266514wms.9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 05:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JSJUUnvpeAQHv0wrzmpKB9ikE0jhSvsZydeKYwwWYok=;
 b=JhAgNskUV696Y1hnr5NYF+XGt68LvwwYLs1NzKKptoXU97tUmrabe60k2Nyuf+SsiA
 NqRZ9Dx+C+QcQJ2uij97s9D+zVRxSdALtHTxvxdujTXetAb8GneSM0Zr6t90+D00XXx8
 JGNFQHFsZTd1RsbbYOoInuXfX1/0WqaPOosmD+FmNNDliL8Idkg2HPbfW9pP74Qs3QTX
 kBb9mhYmnfPssOZS0ObIQRBCM9DtLG3GkX6U7yKzSst7/RJiqOI61Bi2ItdGl2OrBfOR
 wQwGF/sk1i8YbauzUzCWQpLRXRt4vaTgJRCR+7y7Wz2d3QlLjIJqJ069ycE49GrlWm3e
 hsLg==
X-Gm-Message-State: AJIora+SEGbYVfKMTolmJChxH243vpZ3eelGx4WffbLdgV9N06us8Ujx
 m6IqBMaPv1IakvPFFw0GLWmKia5Vhd50T06L66qxND13imFgZuc7FESxHujK1E1jKNYp/EzxcCS
 ZVDm+uuS+eAxWHyEoM99t7j3GhPyp
X-Received: by 2002:a7b:ce06:0:b0:3a0:39e0:b322 with SMTP id
 m6-20020a7bce06000000b003a039e0b322mr20738174wmc.55.1656334413373; 
 Mon, 27 Jun 2022 05:53:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tO72PSD1UGhCfAT59/v6LlTy0Gsa1vZu6c7xdytzrAzaVb4oRzcHRztGwZHXpsEitKn6eqQA==
X-Received: by 2002:a7b:ce06:0:b0:3a0:39e0:b322 with SMTP id
 m6-20020a7bce06000000b003a039e0b322mr20738144wmc.55.1656334413148; 
 Mon, 27 Jun 2022 05:53:33 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r13-20020adfe68d000000b0021018642ff8sm11002992wrm.76.2022.06.27.05.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 05:53:32 -0700 (PDT)
Message-ID: <98a43ed9-567a-6357-2b03-c9899133ed26@redhat.com>
Date: Mon, 27 Jun 2022 14:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 3/3] drm/doc: Add KUnit documentation
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
References: <20220613171738.111013-1-jose.exposito89@gmail.com>
 <20220613171738.111013-4-jose.exposito89@gmail.com>
 <c50e5c87-3198-08b7-1e32-d0959af1f296@redhat.com>
 <YrYmR+aCdO3ldORB@phenom.ffwll.local>
 <b16eba9c-30cc-c71f-ad95-eb5398f84af8@redhat.com>
 <20220627123636.GA1772666@elementary>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220627123636.GA1772666@elementary>
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

Hello José,

On 6/27/22 14:36, José Expósito wrote:
> Hi Javier, Daniel,
> 
> On Fri, Jun 24, 2022 at 11:18:40PM +0200, Javier Martinez Canillas wrote:
>> Hello Daniel,
>>
>> On 6/24/22 23:01, Daniel Vetter wrote:
>>>
>>> [...]
>>>
>>> Hey so since you have a bunch of patches merged into drm already but seem
>>> to lack drm-misc commit rights to push these yourself I think it's time to
>>> get those:
>>>
>>> https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html#drm-misc
>>>
>>> And I guess Javier can help you with any questions you might have and make
>>> sure the request gets through by poking folks on #dri-devel irc?
>>>
>>
>> Yes, he already requested commit access and got the acks, so I think is
>> just a matter of time until he has this sorted out.
>>
>> José, please don't hesitate to ask if you need any help or clarification
>> once you have a setup to push your patches. The dim documentation [0] is
>> superb but I know that it can be somewhat stressful the first time :)
> 
> Thanks for creating my ssh account :D
> 
> The tool is really well documented, setting it up was a piece of cake.
> I pushed the patches to drm-misc-next. The output didn't show any
> errors or warnings, hopefully meaning that I didn't mess up.
>

Awesome! Yes, everything looks correct. Thanks a lot.
 -- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

