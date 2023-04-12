Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 071EE6DFCC0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 19:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937A810E8D1;
	Wed, 12 Apr 2023 17:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6E410E8D1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 17:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681320697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TfEBVoMuh9JyHTvdb8tDKkvHKW1yHCS+PCAl2pLfY2E=;
 b=EwD2VqHtiqHXUxkKSjrxAjkmrp0yg/f4Ha6FsgL8myH5ZrCMJmlWHkUrqcG/IrFctGJj7I
 wXClU/rsLe6F6THXczPS88wg34hjtP3RyS036ltTML8fyBhuaeHaWxcV8W3DfPr/2jRlia
 qXkgcBFKVlSxMxct1YXCqXEewTr4z60=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-VeibI1J9Pcmqb0DLFlW50A-1; Wed, 12 Apr 2023 13:31:34 -0400
X-MC-Unique: VeibI1J9Pcmqb0DLFlW50A-1
Received: by mail-wr1-f71.google.com with SMTP id
 r2-20020adfb1c2000000b002d92bb99383so2089984wra.23
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 10:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681320692; x=1683912692;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TfEBVoMuh9JyHTvdb8tDKkvHKW1yHCS+PCAl2pLfY2E=;
 b=hMjNCSzCAC6LtHERVi6rVxk5m2165oXGenoKpXskBndAlYqmLLWhrA6goYCMXWh5Gt
 TpdeCsDtb6HtVRS+IKOgl7Fvwc6R8kush/Azbj4dVcmqH3iSVt6i6C5ZgHi+b57oYq4z
 ejvvPS64LyrV5AZc0KvliGrGHJ8LMDHDB39JXStCrWhBGUmh9E9XKlzF3yR4CsOCaKOu
 IcFlpnLwLJIFzpgz9k8fFSR9ye1dlAWEycMiVHq0snFhs9zE2Wz3ACYDgkUdZbUEBQan
 aQQ3gSajltNlOpw+IR2VN2XzDTnWiBkC1hns6ZLK6N7sEDhhbQcZTPK3yqSq2mRzKIiJ
 kOaA==
X-Gm-Message-State: AAQBX9ewYrJCrXCq+YppJSMjQbZxZCM5/bU/RGF/pG8wa1KGIxUsnbDu
 gdDgu1iPrWVlBeH8Rts0SSOo1kFNO80wbZBD0DB3EyeW6/PaBXOk4T4Ydza1CKHJKEqgLLRGFNn
 PT8Bk2go8dCOnAgU2mNIRaf3/RI/d
X-Received: by 2002:a5d:4f06:0:b0:2ce:a7b3:1c71 with SMTP id
 c6-20020a5d4f06000000b002cea7b31c71mr13271014wru.35.1681320692687; 
 Wed, 12 Apr 2023 10:31:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350YN2PMFM71kRQyiEnrfpzjiNeoWjbiPuuEil1NnO/uUFOG80zKe4TLyarVa7omcBU11lNnprQ==
X-Received: by 2002:a5d:4f06:0:b0:2ce:a7b3:1c71 with SMTP id
 c6-20020a5d4f06000000b002cea7b31c71mr13270998wru.35.1681320692404; 
 Wed, 12 Apr 2023 10:31:32 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i3-20020adfdec3000000b002f24db41f50sm7591393wrn.69.2023.04.12.10.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 10:31:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Pierre Asselin <pa@panix.com>
Subject: Re: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
In-Reply-To: <2e07f818ccdff7023a060e732d7c4ef6.squirrel@mail.panix.com>
References: <20230412150225.3757223-1-javierm@redhat.com>
 <2e07f818ccdff7023a060e732d7c4ef6.squirrel@mail.panix.com>
Date: Wed, 12 Apr 2023 19:31:31 +0200
Message-ID: <87jzyhror0.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Pierre Asselin <pa@panix.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Pierre Asselin" <pa@panix.com> writes:

>> The commit f35cd3fa7729 ("firmware/sysfb: Fix EFI/VESA format selection")
>> fixed format selection, by calculating the bits-per-pixel instead of just
>> using the reported color depth.
>>
>> But unfortunately this broke some modes because the stride is always set
>> to the reported line length (in bytes), which could not match the actual
>> stride if the calculated bits-per-pixel doesn't match the reported depth.
>>
>> Fixes: f35cd3fa7729 ("firmware/sysfb: Fix EFI/VESA format selection")
>> Reported-by: Pierre Asselin <pa@panix.com>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
>>  drivers/firmware/sysfb_simplefb.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/firmware/sysfb_simplefb.c
>> b/drivers/firmware/sysfb_simplefb.c
>> index 82c64cb9f531..5dc23e57089f 100644
>> --- a/drivers/firmware/sysfb_simplefb.c
>> +++ b/drivers/firmware/sysfb_simplefb.c
>>
>> [patch elided]
>
> NOOOOOO !  The 1024x768x32 screen is all garbled.
> (gfxpayload=keep, gfxpayload=1024x768x32 or vga=0x318).
>

That's suprising... I tested the patch with vga=ask and picked
1024x768x15, 1024x768x16, 1024x768x24 and 1024x768x32. For all
cases the bits-per-pixel and line length values were correct.

But I don't have a machine with legacy BIOS so I testee using QEMU and
SeaBIOS.

> The other modes work as before (but the dmesg has less information;
> I'll investigate.)
>

Interesting. So you don't have the simplefb output that you had before ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

