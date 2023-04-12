Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A6A6E01B1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 00:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C7110E9B1;
	Wed, 12 Apr 2023 22:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F8910E9B1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 22:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681337371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yRj54bgaB8gZZi4XXPwLVXURq2Cocc/7c3rY+uFVd7I=;
 b=Bgc3vv3AK+Ov7yLC1TmiFPqTmRAY6Oxe/9pppLvSa6FJGOpBUNG7jPVtBLxuSXNDQa514b
 KFQH8YG2cncneQJ9hzVptP2z9usumcLkI9q5x1RZwvQMwPrEZJUwsX6/NrfcN8I5MY8HVw
 CROQEb/tj7P2aXWcXGCKq15O1eber5w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-k1dZGEp-M8yNGmLwEzlbCg-1; Wed, 12 Apr 2023 18:09:29 -0400
X-MC-Unique: k1dZGEp-M8yNGmLwEzlbCg-1
Received: by mail-wm1-f69.google.com with SMTP id
 l26-20020a05600c1d1a00b003edf85f6bb1so7656318wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 15:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681337369; x=1683929369;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yRj54bgaB8gZZi4XXPwLVXURq2Cocc/7c3rY+uFVd7I=;
 b=mGSPi8KpS7unV8rlug+WgFP/hJWpMPWT8AA50w8i8LyiRTDseXgZCwuProMeUg22Fm
 9VdZHFJUYGx95532MN8KMDz/4m/mwx1jvIil/wrIfoNLdfZopBJ5/or/zpF729UDp9qb
 UKb4R2UevAx882TdWXmToCjzFUir9SdGjhXinG/d/A2XEpTLBfN2H51UNvt/acDgQhsW
 ua/qNZ3tJ9dQqfTiwSKBLN7P70qHVL4/a4safnYHD15ddjkaBbB5cnZ8JzRRBbr+pltS
 dDID3cU/9PnvWaW130fQxFgny2Fat9s5BUAgeug9EKZgvakZe3Klq/gjtsSyFF63NS2z
 KvzQ==
X-Gm-Message-State: AAQBX9e3rVrOhtnXI68UMscXJXbXGRFi9ooDIEMRZ1el0s7b47uo3Yx3
 RwZ9mh6uW4GmvDTWU47CByDvO6KCuA/kZ5Pydetl9Y594QPyIe4O9pH2dyQVkkdUz+swvdT0/ap
 QukmC8j5lYmTJVEoxA5qMxpVy8KX0
X-Received: by 2002:a5d:690d:0:b0:2ef:6371:1b0e with SMTP id
 t13-20020a5d690d000000b002ef63711b0emr5168207wru.59.1681337368826; 
 Wed, 12 Apr 2023 15:09:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350bAsuc0qAu1f2vhFNzUPfOLWRskc1H352Gxo6cbSyy8PAO5iro+nR9z1hsSp3O4jwehRSnFLQ==
X-Received: by 2002:a5d:690d:0:b0:2ef:6371:1b0e with SMTP id
 t13-20020a5d690d000000b002ef63711b0emr5168196wru.59.1681337368566; 
 Wed, 12 Apr 2023 15:09:28 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y12-20020a5d470c000000b002f598008d50sm283235wrq.34.2023.04.12.15.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 15:09:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Pierre Asselin <pa@panix.com>
Subject: Re: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
In-Reply-To: <40edb0fdb0eaff434f4872dd677923a6.squirrel@mail.panix.com>
References: <20230412150225.3757223-1-javierm@redhat.com>
 <2e07f818ccdff7023a060e732d7c4ef6.squirrel@mail.panix.com>
 <87jzyhror0.fsf@minerva.mail-host-address-is-not-set>
 <beeff0335ab4cc244d214a7baadba371.squirrel@mail.panix.com>
 <CAFOAJEdKBUg91pDmNYYw5xigUxjifBgOLz2YgD+xQ+WyEy=V2w@mail.gmail.com>
 <1afd3044c2aca9322ecf304941c7df66.squirrel@mail.panix.com>
 <87fs94stgw.fsf@minerva.mail-host-address-is-not-set>
 <87cz48srs4.fsf@minerva.mail-host-address-is-not-set>
 <40edb0fdb0eaff434f4872dd677923a6.squirrel@mail.panix.com>
Date: Thu, 13 Apr 2023 00:09:27 +0200
Message-ID: <87a5zcsqg8.fsf@minerva.mail-host-address-is-not-set>
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

>> Javier Martinez Canillas <javierm@redhat.com> writes:
>>
>> I still don't understand why this particular configuration didn't work...
>>
>> The framebuffer starts at 0xd8000000 and has a size of 0x240000 bytes, so
>
> Says who ?  It's the same grub, same video mode as before the regression,
> so the size is probably 0x300000 like it always was.
>
>> a r8g8b8 pixel format with resolution 1024x768 should be correct. Since is
>> 1024 * 768 * (24 / 8) = 2359296 = 0x240000.
>
> That is internally consistent, but at variance with the video mode
> set up by grub.
>
> It is better to sqeeze bits by 4:3 on each line (regression) than to
> scatter 4 logical lines across 3 physical lines (regression, patched) !
>

Indeed. I noticed now that the IORESOURCE_MEM is set-up in the function
sysfb_create_simplefb() so is likely that is internally consistent as you
said but wrong :)

>> Could you please apply the following diff that will print all the relevant
>> fields from the screen_info that are used to calculate the bpp and stride.
>
> YES !  I can't peer into that struct screen_info and I don't know to
> write the printk's.  (Hm, doesn't look too hard, but trust me, I would
> fumble it.)
>
> I'll back out the original patch first.
> Stand by.
>
> --PA
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

