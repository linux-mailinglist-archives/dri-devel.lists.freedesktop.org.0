Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447156E1261
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 18:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A7C10E0EF;
	Thu, 13 Apr 2023 16:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDB010E0EF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 16:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681403686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ekA2VCpAp9UKw6KLbdSwuXdGQWeqh5YSiPTkG8jESh0=;
 b=JcN4MUCWgpeulqyaDNoFgycAJgG4CINXdv+7sHe4g8WkhqfaMtwlMnbie6vFpSKwn4SCCy
 NymSs8gqlb0XHKfDh8XzyWgxxTYu2LRQaOP8ZFxQcCg8WpldOdvxx5IG6q4GIZLzcaxN80
 r0HAdKm6W9dwwGEWpf1a6ulUUTN0A0Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-qHbBZj2QNluQmJxeuzH_Fw-1; Thu, 13 Apr 2023 12:34:43 -0400
X-MC-Unique: qHbBZj2QNluQmJxeuzH_Fw-1
Received: by mail-wm1-f71.google.com with SMTP id
 l3-20020a05600c1d0300b003f0af5c7b4cso15853wms.7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 09:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681403682; x=1683995682;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ekA2VCpAp9UKw6KLbdSwuXdGQWeqh5YSiPTkG8jESh0=;
 b=lX4Kfexa/slaanb/Csc9ySy+ktZ1cOd+IOU2eU4AczxppzHF9ZvoyfcS3sN58wOD0G
 3LbPHHTDiXgCwFXS161H7CymBwUQD3udDXMBJsCrNgC47c8qzGSW41ftiz3bVjroBvcM
 rY7Yzc5knCbuejBfRdAMnC5/Sa+sxPFgYioeqkpwXi7HkvkQkLg7xZntEogCjUmakvU0
 whKTFBkMRikmbsOMqxtu8tg5pNZnvKdSrP4ixSRLbhPAtJNc/c9MUTP/hCGK/0u9AxLW
 T3QENN++EdfSKrn1Lej9kQzHjv+3gfG5+QeIRUg3r5wY70pUUWVYbl2Gkt9s7CaVDC10
 Ie2g==
X-Gm-Message-State: AAQBX9er2N4OBlCcjrvGwYr/9VCQeCK0TBtl07vNo/lJB2y7FDFyagCH
 bMYP+/GFmXRP9b9Bq5cqwmq4zpNuFr7GJw4kkzGn8CQEghE5itM5oiiyHauYvfPas47Oqc89FaV
 vlsZJOcJKUyHCD1vRr+UR93Vw1fRf
X-Received: by 2002:a7b:cd93:0:b0:3ed:320a:3721 with SMTP id
 y19-20020a7bcd93000000b003ed320a3721mr2450641wmj.22.1681403682717; 
 Thu, 13 Apr 2023 09:34:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZRh9fa4sewh00qfbeBg0LvlQLLgGJvfMgChhNLKe98mfIgoWkSSF5jrm9Rl1/yQtbMURZNqQ==
X-Received: by 2002:a7b:cd93:0:b0:3ed:320a:3721 with SMTP id
 y19-20020a7bcd93000000b003ed320a3721mr2450625wmj.22.1681403682436; 
 Thu, 13 Apr 2023 09:34:42 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f16-20020a05600c155000b003f0a1c18128sm3194059wmg.29.2023.04.13.09.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 09:34:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Pierre Asselin <pa@panix.com>
Subject: Re: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
In-Reply-To: <ae5f6784c72e1b31cdf7766d3c6dbe0c.squirrel@mail.panix.com>
References: <20230412150225.3757223-1-javierm@redhat.com>
 <2e07f818ccdff7023a060e732d7c4ef6.squirrel@mail.panix.com>
 <87jzyhror0.fsf@minerva.mail-host-address-is-not-set>
 <beeff0335ab4cc244d214a7baadba371.squirrel@mail.panix.com>
 <CAFOAJEdKBUg91pDmNYYw5xigUxjifBgOLz2YgD+xQ+WyEy=V2w@mail.gmail.com>
 <1afd3044c2aca9322ecf304941c7df66.squirrel@mail.panix.com>
 <87fs94stgw.fsf@minerva.mail-host-address-is-not-set>
 <87cz48srs4.fsf@minerva.mail-host-address-is-not-set>
 <40edb0fdb0eaff434f4872dd677923a6.squirrel@mail.panix.com>
 <87a5zcsqg8.fsf@minerva.mail-host-address-is-not-set>
 <9e6fff69b09b36cbdd96499cd0015154.squirrel@mail.panix.com>
 <4PxhQn3zK1zcbc@panix1.panix.com>
 <87o7nsuumt.fsf@minerva.mail-host-address-is-not-set>
 <ae5f6784c72e1b31cdf7766d3c6dbe0c.squirrel@mail.panix.com>
Date: Thu, 13 Apr 2023 18:34:40 +0200
Message-ID: <87jzyfrba7.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: jfalempe@redhat.com, Pierre Asselin <pa@panix.com>, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com, tzimmermann@suse.de, ardb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Pierre Asselin" <pa@panix.com> writes:

>> pa@panix.com (Pierre Asselin) writes:

[...]

>>> -		bits_per_pixel = max(max3(si->red_size + si->red_pos,
>>> +		bits_per_pixel = max3(max3(si->red_size + si->red_pos,
>>>  					  si->green_size + si->green_pos,
>>>  					  si->blue_size + si->blue_pos),
>>> -				     si->rsvd_size + si->rsvd_pos);
>>> +				     si->rsvd_size + si->rsvd_pos,
>>> +				     si->lfb_depth);
>
>
>> I would defer to Thomas but personally I don't like it. Seems to me that
>> this is getting too complicated just to workaround buggy BIOS that are not
>> reporting consistent information about their firmware-provided
>> framebuffer.
>
> Okay, but remember, this is a regression.  The buggy BIOSes were there

Yes, I agree that is a regression and has to be fixed. I'm just arguing
against this particular fix.

> the whole time and the old code that matched f->bits_per_pixel against
> si->lfb_depth used to work against these buggy BIOSes.
>
> And is it a bug, or is it an underspecified standard ?  "These bits aren't
> reserved, we just ignore them" or some such.
>
> My reading of Thomas' comments in the code was that sometimes lfb_depth
> was reported too small but never too large ?  But I'm not sure.  It's
> true in my two cases.
>

I (mis?)understood that it could be too small as well. But that's why I
prefer Thomas to chime in before agreeing on any path forward. But he is
in vacation this week I believe.

>> I would either trust the pixel channel information (what Thomas patch did)
>> + my patch to calculate the stride (since we can't trust the line lenght
>> which is based on the reported depth) + a DMI table for broken machines.
>
>> But that will only work if your systems are the exception and not a common
>> issue, otherwise then Thomas' approach won't work if there are too many
>> buggy BIOS out there.
>
> The laptop is ancient but the Dell tower is maybe 4 years old.  The
> BIOS is 09/11/2019 according to dmidecode, and the most recent for
> this box.
>

I see.

>> Another option is to do the opposite, not calculate a BPP using the pixel
>> and then use that value to calculate a new stride, but instead assume that
>> the lfb_linelength is correct and use that to calculate the BPP.
>
> Or reject (some) inconsistencies in the struct screen_info and return
> false, so the kernel falls back to e.g. vesa ?
>

That a reasonable approach too. But better if we can make simpledrm work
too since many distros have dropped all the fbdev drivers in favor of it.

>> Something like the following patch, which should also fix your regression
>> and may be enough to address Thomas' concerns of inconsistent depths too?
>
> I'll try that patch.
>

Thanks for all your information and testing with this bug!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

