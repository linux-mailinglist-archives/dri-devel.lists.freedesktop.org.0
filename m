Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E0981C75F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 10:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121D410E032;
	Fri, 22 Dec 2023 09:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F7810E032
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703237821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0rE+6SqYmdQ/CRPQV0bbXUUkHoWDG8BiCqsyya24uec=;
 b=NRktAxtPB8N//xeecBQM7XbQ3Gsms/S4ixweqUQgW6OC/PFBkL89DSM90cbbHybbYmV+vS
 a1HWpmvA0n9EhbpJJ55F3+TWtxfRIOYMYl0ByF3YJxVIqMRdxftrsxuSvor8TbcRIP+rKD
 fO09gqBvyWwbdLxhUcpb0788d40fRlc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-qHbNKjMEPmqhou2ZGBYeTg-1; Fri, 22 Dec 2023 04:36:59 -0500
X-MC-Unique: qHbNKjMEPmqhou2ZGBYeTg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40d17446f11so14724345e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 01:36:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703237818; x=1703842618;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0rE+6SqYmdQ/CRPQV0bbXUUkHoWDG8BiCqsyya24uec=;
 b=RaFtryl+wZWbD5TaTnGnDsj2iNOqVK4okB8qWPcwMLmO6lGthw/L25BKPvdZNNV9xf
 vZ3yb4qYJixsWuHPemyaGgZ0P3siuPTrdyum7Nqhxwsv4B5ad3Y0tFVvhYg+1x7o+s28
 hoUEFA6Gv/IVnvMP/Z0Dyd0k0mlwv0qNjZ8YQyxYjtj+B75k5tvJ0g5vBn839WeIAuDa
 IsbWa94Lv/oK20oQIF1HdDTiZp6Js2luCUPYqGen6iLJiFyuM2xYoL0GdPkNBMHPrNCy
 SDpY+70s/E/nXcTq8nSfjH+oo0KYTNra5z6R9iQyIGhwqXK+fAqlCA/imR78b80aidQ/
 c7uQ==
X-Gm-Message-State: AOJu0Yymt9I1LvzyvP75OhNIEwokMEGfKxp+MDfBIdSuH05gdws7uyxt
 K/ppHjf9IBp96apd7ZkioMmDSym9VuaDoOMlOgAQpV0ZD3//JTNwZTtDqqpb41smhLIdhWqSglb
 v1uLc7jn3KVMotYhQtgb2nIWaRl2KbwN1ZmAf
X-Received: by 2002:a05:600c:3583:b0:40d:2dd8:9308 with SMTP id
 p3-20020a05600c358300b0040d2dd89308mr552519wmq.142.1703237818263; 
 Fri, 22 Dec 2023 01:36:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECzHuOIWaFBlkppPB6Nj0W46ZDmLz/rglzaycn8jOElInECwnxTZnHavxqH0t2LiMt4tvbyw==
X-Received: by 2002:a05:600c:3583:b0:40d:2dd8:9308 with SMTP id
 p3-20020a05600c358300b0040d2dd89308mr552512wmq.142.1703237817912; 
 Fri, 22 Dec 2023 01:36:57 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b0040b48690c49sm6267412wms.6.2023.12.22.01.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 01:36:57 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] drm/ssd130x: Add support for the SSD133x OLED
 controller family
In-Reply-To: <01cc7bd1-25d8-43ad-a305-05fcc81bfd22@redhat.com>
References: <20231219203416.2299702-1-javierm@redhat.com>
 <20231219203416.2299702-5-javierm@redhat.com>
 <01cc7bd1-25d8-43ad-a305-05fcc81bfd22@redhat.com>
Date: Fri, 22 Dec 2023 10:36:56 +0100
Message-ID: <87y1dm4lzb.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Conor Dooley <conor@kernel.org>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jocelyn Falempe <jfalempe@redhat.com> writes:

Hello Jocelyn,

Thanks a lot for your review!

> On 19/12/2023 21:34, Javier Martinez Canillas wrote:
>> The Solomon SSD133x controllers (such as the SSD1331) are used by RGB dot
>> matrix OLED panels, add a modesetting pipeline to support the chip family.
>> 
>> The SSD133x controllers support 256 (8-bit) and 65k (16-bit) color depths
>> but only the former is implemented for now. This is because the 256 color
>> depth format matches a fourcc code already present in DRM (RGB8), but the
>> 65k pixel format does not match the existing RG16 fourcc code format.
>> 
>> Instead of a R:G:B 5:6:5, the controller expects the 16-bit pixels to be
>> R:G:B 6:5:6, and so a new fourcc needs to be added to support this format.
>
> small typo here, R:G:B 6:5:6 => that's 17 bits
>

Oh, tanks for pointing that out.

It seems to be a typo in the SSD1331 controller datasheet itself:

https://cdn-shop.adafruit.com/datasheets/SSD1331_1.2.pdf

"Each pixel has 16-bit data. Three sub-pixels for color A, B and C have 6
bits, 5 bits and 6 bits respectively."

I blindly copied what the datasheet said without relizing that it was 17
bits indeed!

So looking again at "Table 9 - Data bus usage under different bus width
and color depth mode" in the datasheet shared above, it seems the format
has the same sub-pixel layout than DRM_FORMAT_RGB565. But I tested with
that format and the colors were off, and the same for DRM_FORMAT_BGR565.

Now, even when only using 256 colors the images are pretty decent as you
can see in https://fosstodon.org/@javierm/111591985174504541

I'll reword the commit message and drop the comment about that RGB format
and explain that only DRM_FORMAT_RGB332 is supported for now.

> other than that, it looks good to me, feel free to add:
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

