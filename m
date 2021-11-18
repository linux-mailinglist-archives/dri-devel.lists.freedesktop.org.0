Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BAA455B05
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 12:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08166E90F;
	Thu, 18 Nov 2021 11:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26AD6E90F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 11:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637236536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YHV71NZdHjF0dSjNAnyjqyFmHT9V0KwMbQdAU2F5t/k=;
 b=A2hbcU8ecTUnJuogSdiDyX8dpiub5bVxi3O2XVCitEnQCHXilAN9VtfD0D07diM41kHQa6
 dkEEMTyLmq7d6jterc66rOO2ArgqjA6Ky2qQ9n0pUjH4gAvpR3MPJH5G3gZBTp0TUcuyoB
 VYg4SAT9EaSVDXubSfHeUVRv7UrmaxI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-a7xaS2r3OSKigROwnKn4bQ-1; Thu, 18 Nov 2021 06:55:34 -0500
X-MC-Unique: a7xaS2r3OSKigROwnKn4bQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 m17-20020aa7d351000000b003e7c0bc8523so5082214edr.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 03:55:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YHV71NZdHjF0dSjNAnyjqyFmHT9V0KwMbQdAU2F5t/k=;
 b=MxEAePgyFcGpmyVPmJbOXz3w94lGXdCtWesSh5QUuv1E//5+iREr6oFLtndci/EO6S
 koDysYdVm5iC4rQibkKjWS/EVc+46q7ea4WFMSeiYf4A2zNoKvl94m4GOYymohuiSge1
 VqC9Rqpiav3VXJ5AzaiHrT96dIPaMrADJKDjuEeSKP0CWT03s5ZiKM+Q4/5URo6LGGgS
 BTdxj3OxpYMLTyoTtMzjkcoHAVh1gXkxIkzQjSqFs4KAeD1aIUSwIh1felI4YPg11WPy
 PqiYrB8JsnbTlVdDvEEZ1G+shh2MGjfpKOorwBy0q18QCJFp7FeiULNlyoj6NpH5Tlr9
 fCyw==
X-Gm-Message-State: AOAM530Apig2lt5RXgLxY9o8kohjMYfI0URJuFBZbqXpDSPuadhhZ4QT
 7mnV42qNrFpmbPMKRSyXQttwz4s9E9aRoaLWxgdJ5ECDPBrsj1Pn+nmSfNOt3l2ZiREVQ57IrpO
 /iDj0EFAXWvF6JmuoduP19y3X4sk0
X-Received: by 2002:a50:d883:: with SMTP id p3mr10364221edj.94.1637236533543; 
 Thu, 18 Nov 2021 03:55:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFkn01t7jllZ62lY4O81hHpkBVn331b/td42UUcdBJskqbFnBOSxTrBAdCPP+NFHAOIkmTew==
X-Received: by 2002:a50:d883:: with SMTP id p3mr10364198edj.94.1637236533433; 
 Thu, 18 Nov 2021 03:55:33 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214?
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id cs15sm1192253ejc.31.2021.11.18.03.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 03:55:33 -0800 (PST)
Message-ID: <ee7c277d-f556-e3c5-8853-255cc982c767@redhat.com>
Date: Thu, 18 Nov 2021 12:55:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for the Lenovo
 Yoga Book X91F/L
To: Yauhen Kharuzhy <jekhor@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20211106130227.11927-1-hdegoede@redhat.com>
 <YYb6r8+aw1bR9R4z@jeknote.loshitsa1.net> <YYemqI7MP/rdKuq9@ravnborg.org>
 <YYe4LKExKYvLiy/Y@jeknote.loshitsa1.net>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YYe4LKExKYvLiy/Y@jeknote.loshitsa1.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/7/21 12:27, Yauhen Kharuzhy wrote:
> On Sun, Nov 07, 2021 at 11:12:56AM +0100, Sam Ravnborg wrote:
>> Hi Yauhen,
>> On Sun, Nov 07, 2021 at 12:59:11AM +0300, Yauhen Kharuzhy wrote:
>>> On Sat, Nov 06, 2021 at 02:02:27PM +0100, Hans de Goede wrote:
>>>> The Lenovo Yoga Book X91F/L uses a panel which has been mounted
>>>> 90 degrees rotated. Add a quirk for this.
>>>
>>> Tested on my Yoga Book, works.
>> Great - and then it would be prudent that you acknowledge this with:
>> Tested-by: Yauhen Kharuzhy <jekhor@gmail.com>
>>
>> A "Tested-by:" is in many cases better than an Acked-by: because you
>> actually applied the patch, build it and verified that it works.
>> Where an Acked-by: is just to say that you have looked at the patch and
>> agrees with the patch.
>>
>> So a Tested-by: gives you the credit you deserve here.
> 
> Yes, of course. I forgot about such option.
> 
> Tested-by: Yauhen Kharuzhy <jekhor@gmail.com>

Thank you, I've pushed this to drm-misc-next now.

Regards,

Hans

