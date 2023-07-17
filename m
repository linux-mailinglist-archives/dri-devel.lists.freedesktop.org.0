Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116C6755F4B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 11:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2706610E13B;
	Mon, 17 Jul 2023 09:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D875D10E13B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 09:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689586390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4GSk6WKN5IHnbhndU+RbN845PKQyEPVxzi9rw1bYqlc=;
 b=cazpVXz6CwSQyiC2Y3aZ/nGYSsNWG15e5uDekscNfVdjVDtI/5sldVy5oqTMaq+mic6Jmq
 NkWqvbLfPiERFPg6UHvSGtVx+gQIzygLx+j7Fpfl3cOudXDmiZC8gSpYY5lQg0wZ5heBKW
 +anNfdKXNM+TQCvIB1zp6haiR2k4P3Y=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-QriwCSvdMlKA5IL_jDStMA-1; Mon, 17 Jul 2023 05:33:09 -0400
X-MC-Unique: QriwCSvdMlKA5IL_jDStMA-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b6f51e170fso35682381fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 02:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689586388; x=1692178388;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4GSk6WKN5IHnbhndU+RbN845PKQyEPVxzi9rw1bYqlc=;
 b=CvMpQ0kwCZmEUfcPcLlydHzHIk7iyni66W/UmwCGuDtPQREzPCUz78eD4Sa6rkn0iF
 xUy/Plo6ZCmu9C8paikONXScDdNf+aBnlsm2j5aYRzcmLhuKaEB2D+/A+DL6VKQIO0vY
 m0MVmeGXL+XWCdjO5rJRV/uBGQT3wPyRveAm4a5Ur/2PhERVEVQwGa9Jahc86jz74/SM
 mnMcm/x6MbSyJR0SkgK+jJhiRsgDyuOjzHoFS//vLVPaLUZlq0z+F87OMUJ+9jpnbyEp
 Hx91aD531r8vij1kNvRyA0YOplYQVUZSpMrqXZYmFfE+HMDNEMcdNVIYP11VCQLU/YL0
 WQzQ==
X-Gm-Message-State: ABy/qLY1UfwIRj4q/D6wlYCrd2W6r1omuEWieUDHwydyrXb82LkvpHkS
 opBCkvTyi3KgYdzw1bQw124gP/XgtpKqlO3tjBTnReR5D3TAt9hhGlXRWEDqqWryX1aXnqU5JjL
 xqu7ck9nHyN9PITR0e+0zWyIpnjdq
X-Received: by 2002:a2e:86d4:0:b0:2b6:e958:5700 with SMTP id
 n20-20020a2e86d4000000b002b6e9585700mr7669262ljj.4.1689586388080; 
 Mon, 17 Jul 2023 02:33:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE0OLByQN5N+LQ57Inm6jnh+Bx3SZZ6vASzWXxO8whZtwkQRvwOLwzKHyX9P3IFIbL18i2Aqg==
X-Received: by 2002:a2e:86d4:0:b0:2b6:e958:5700 with SMTP id
 n20-20020a2e86d4000000b002b6e9585700mr7669243ljj.4.1689586387736; 
 Mon, 17 Jul 2023 02:33:07 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n21-20020a1c7215000000b003fbd0c50ba2sm7627771wmc.32.2023.07.17.02.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 02:33:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/8] drm: fb-helper/ssd130x: Add support for DRM_FORMAT_R1
In-Reply-To: <CAMuHMdURa8E9cmphbDkTgS2o3ORWd7JAj68PV9bxd3aygKZRJg@mail.gmail.com>
References: <cover.1689252746.git.geert@linux-m68k.org>
 <87zg3w7zlz.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdV_qNfytroBEfqDMe04POt27s9o=FevXht7N4YXRmBz8Q@mail.gmail.com>
 <87o7kakijn.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdURa8E9cmphbDkTgS2o3ORWd7JAj68PV9bxd3aygKZRJg@mail.gmail.com>
Date: Mon, 17 Jul 2023 11:33:06 +0200
Message-ID: <87jzuykhm5.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Javier,

[...]

>> >> penguin in test004 is not displayed correctly. I was expecting that to be
>> >> working correctly since you mentioned to be using the Linux logo on boot.
>> >
>> > Linux has logos for displays using 2, 16, and 256 colors. Note that the
>> > default logos are 80x80, which is larger than your display, so no logo
>> > is drawn.
>> > Fbtest has only the full color logo, so it will look bad on a monochrome
>> > display.
>>
>> I see. Should the test check for minimum num_colors and skip that test then?
>
> The test still works (you did see an ugly black-and-white penguin), doesn't it?
>

Fair enough. But when it defaulted to XRGB8888, it looked better. So I
thought that it was a regression. No strong opinion though if the test
should be skipped or not.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

