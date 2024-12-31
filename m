Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7619FF0CC
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 18:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9069110E692;
	Tue, 31 Dec 2024 17:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MZjGwX7a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC7110E692
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 17:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735664618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OMQDKUUk1foYPBKNxPEyaAlDK3T3xpWOx3kaLhclbuU=;
 b=MZjGwX7aLChm42VpevLLh9TJ65Gb65Jd8RjmX2Q9QlcIfz1Q+0+Ze5f+hhisayE0rOPJCB
 Y2VLJkP/nSuuK5OTZImvGjN32oVJ+jQ8Tq73HEs6Fk/+5j9XP2zb1ETqrlRkIr2qFhngGS
 pabYsJnx8eCCLBVZwOuxVPZL3vrcNwk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-nNPBJqm0OoKUiCTwwP_aAQ-1; Tue, 31 Dec 2024 12:03:37 -0500
X-MC-Unique: nNPBJqm0OoKUiCTwwP_aAQ-1
X-Mimecast-MFC-AGG-ID: nNPBJqm0OoKUiCTwwP_aAQ
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4361a8fc3bdso54868065e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 09:03:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735664616; x=1736269416;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OMQDKUUk1foYPBKNxPEyaAlDK3T3xpWOx3kaLhclbuU=;
 b=KaVjR1VaTR11mA+sOacMDjc/hvFAfd7PMd9ADF920/fylDeuQ9OIc5ep37wlKgIIJn
 sdyDP1WOIwcuSMYuUyq6vmpmfbcQ1ZNWFpC/rkjYl/p9kkR1cJQhgEgPuImC9pgWtGiV
 EGSWam/xVJZEjXSKUdLKprrclC9jGr5QOEl9TisRYIWDCOnbonijXTKiuTjiwIjvj2nu
 Hifg0o+GvpzlvGp/0WLqbGR2B1pg5B7VkLjikn6jM5L/tlKOrco8Z6tdWdH3BdbHi8H8
 lRIihRpAyJqSnd7x8iy0FfmuMilsBCbq4MfoNsGht+coYRf9UKO6JGX8eINTHl/m2NPm
 GJYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxkkFbbxWPdOSbmE22CIGSy/q7ESl8I2NTjSrm2ykddAhO134MbhGMz8HAk6dzPgUClZS1Jdb5MzI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyB2WDyHxCF6fgqaKSrujaGu5wAtiqKBVQJ/CqZD/mrJU8pOrox
 /kMcIk4UtcvuqEC/54/TjAQwydZHwMz4vQvOuQJCGifQdX0l0h97tdla2L/INJS0NW9FLlXGiSX
 lDeKSzDXJwOORHMLFWGJVez2COyZUzmY+RvYDQvm/Nf18r1pGm4rOu6y1Dsj4iNLRAA==
X-Gm-Gg: ASbGncul+OXQU40pSgvYxKTWnYaUGiNr39BiqBj2HdS4VMCcL7GjkeS46PF2Zjg8qHP
 uqlUm1Flhn9cAo0SgF4zKa8StVW3g7t46YItH+iZxPzDY+9VGeDnxUAGDnZbVC68eKqAho12CQO
 5cR0Fj2/3WkUBFotlrr39YL6F90AutRcVjsv9EIGLPaEHLPyG2WfZABdmo7emAcSw+Qbke84lIe
 NLzbVtCKjUt74bP8J9Dcg9EcW0U5lEL+A3EkgnC0IPkGpFQwSy6IITY53ey9BKFhbr5LMTaoBUk
 PBmyBRGK8poYajiGsAo9cZNV3OjyyfvP32soAng=
X-Received: by 2002:a05:600c:3b23:b0:434:9499:9e87 with SMTP id
 5b1f17b1804b1-43668b5e194mr292785885e9.25.1735664616304; 
 Tue, 31 Dec 2024 09:03:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEo4cjoNHNIV6MdPiesoFX2rukT4UJRgCNEULiJwNuJ5T53/oG30mZuQu0l6CZLCxyFn7x9rA==
X-Received: by 2002:a05:600c:3b23:b0:434:9499:9e87 with SMTP id
 5b1f17b1804b1-43668b5e194mr292785515e9.25.1735664615924; 
 Tue, 31 Dec 2024 09:03:35 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8474c2sm32808596f8f.55.2024.12.31.09.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2024 09:03:35 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, David
 Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ssd130x: Set SPI .id_table to prevent an SPI core
 warning
In-Reply-To: <vrk6nb6umj6754ttm6hugpgiczzuxm2qwpzwptskwdbzozmnjz@tbasj7yk4ksf>
References: <20241231114516.2063201-1-javierm@redhat.com>
 <p2hzb3ysmthgfi4j6ehwulzk44zf4s5d6bm3nqs2rww47boshl@jr6aqmas4l5p>
 <877c7fkgs5.fsf@minerva.mail-host-address-is-not-set>
 <vrk6nb6umj6754ttm6hugpgiczzuxm2qwpzwptskwdbzozmnjz@tbasj7yk4ksf>
Date: Tue, 31 Dec 2024 18:03:34 +0100
Message-ID: <874j2jkcnt.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1FruOoyM2VF5wj9-UDpRdRGsKlUEiUX7tY-EkKxsonE_1735664616
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Tue, Dec 31, 2024 at 04:34:34PM +0100, Javier Martinez Canillas wrote:
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>> 
>> Hello Dmitry,
>> 
>> > On Tue, Dec 31, 2024 at 12:44:58PM +0100, Javier Martinez Canillas wrote:
>
> [...]
>
>> >> Since the check is done even for built-in drivers, drop the condition to
>> >> only define the ID table when the driver is built as a module. Finally,
>> >> rename the variable to use the "_spi_id" convention used for ID tables.
>> >> 
>> >> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> >
>> > Fixes: 74373977d2ca ("drm/solomon: Add SSD130x OLED displays SPI support")
>> >
>> 
>> I was on the fence about adding a Fixes: tag due a) the issue being there
>> from the beginning as you pointed out and b) the warning being harmless.
>> 
>> But I'll add it to v2 or just before pushing it to drm-misc-next.
>
> Just before pushing is enough. dim b4-shazam can do that for you.
>

Yeah, I meant in case that I post a v2. I'll wait a few days before
pushing in case someone else chimes in. Thanks again!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

