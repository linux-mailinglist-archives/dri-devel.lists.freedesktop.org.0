Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFD06E43E2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 11:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F1A10E00E;
	Mon, 17 Apr 2023 09:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36B310E00E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 09:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681723795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZozA7MZ/y/4iKOl2TeZkQx7oEXefDUw2m6z73qNdQrc=;
 b=CjF1xPXk8aHirXMGAzR2ldcPwM5NMFStwfpIS3hKYaM6T1oPF6alhZrvrD75HSDPILXGkg
 Pj6oUh3ENVEfzl3t3axSZ1lqATQ95PXznznGE4cZ4xWppF0LZAcn/8GCt4HGgQx/9c4ozS
 wQbIIR4xUh68pb0ZFplKOkB/8b2zRuA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-oepbz9y6O5ylXwE5iDgUXQ-1; Mon, 17 Apr 2023 05:29:54 -0400
X-MC-Unique: oepbz9y6O5ylXwE5iDgUXQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m4-20020a05600c3b0400b003f0968719a7so9069151wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 02:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681723793; x=1684315793;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZozA7MZ/y/4iKOl2TeZkQx7oEXefDUw2m6z73qNdQrc=;
 b=RhcNzYP9gAgFivTL7l3ji7oi5AQK74O1a8bjbU8nFL5mWvOuN6le7uy8JeYnBFiaD8
 9j161OBZ/NKCLqpr+S4RtegXeiLZvQvUX+cqNzCZ/ze//7YTLdWNJKHvgNgKFWzpcr02
 QHHR+wXCszRw1dPSWnr+L39sQlTeWcVnn8XvBnE5YUszYrV4CnjqWdkhBy4vNC1Wj0C+
 clOdOumG4CymM5UP+bcfCEH2MbKM9NK3VeaY6/4WObH5SjoqnTUnlZJdpyOQHvQW6X6S
 LqWyr+bpKfflAShWtRJeRYc426zrKZX5PxeCgXpX0d4YIjpWroB5pMWXJ1e/Da5xxP2n
 9Uqg==
X-Gm-Message-State: AAQBX9fkxAiip5BJ1se4or2BXfdSMPBKOKThoi5xgf2uCYeoBsDG44TU
 tIFzM5bviYuxTh8kOWDVhLg7d8xrlvQz/n/JFj5N9K6F2HLQF0g6DeDcgxSKI+uXcZlhx9LDCyX
 6qZHlSYtYx1O2muKcoPJNbk5yIOME
X-Received: by 2002:a05:600c:231a:b0:3f0:4e04:b8f8 with SMTP id
 26-20020a05600c231a00b003f04e04b8f8mr9631427wmo.39.1681723793327; 
 Mon, 17 Apr 2023 02:29:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350bVKcINv0hsCXLJ7U0w23pttcQc+XPNvtnV3lcTUDmYDPJpXAoK+AjoxGOAt72/4TZrxWDdvg==
X-Received: by 2002:a05:600c:231a:b0:3f0:4e04:b8f8 with SMTP id
 26-20020a05600c231a00b003f04e04b8f8mr9631412wmo.39.1681723792968; 
 Mon, 17 Apr 2023 02:29:52 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m10-20020a05600c3b0a00b003ef5e5f93f5sm15041116wms.19.2023.04.17.02.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 02:29:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Pierre Asselin <pa@panix.com>
Subject: Re: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
In-Reply-To: <60b7cad3-8923-98b1-2c0f-71bfabd0b2e9@suse.de>
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
 <f3004fccf706fb3cbb7ef6877dcd9168.squirrel@mail.panix.com>
 <23d45518-3565-e915-c6d4-45dabe82ea4c@suse.de>
 <87zg76evh3.fsf@minerva.mail-host-address-is-not-set>
 <60b7cad3-8923-98b1-2c0f-71bfabd0b2e9@suse.de>
Date: Mon, 17 Apr 2023 11:29:51 +0200
Message-ID: <87v8hueu0g.fsf@minerva.mail-host-address-is-not-set>
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
Cc: jfalempe@redhat.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hdegoede@redhat.com, ardb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

[...]

>> 
>>     stride = DIV_ROUND_UP(si->lfb_width * bits_per_pixel, 8)
>
> I'd rather keep the code as-is until we get an actual bug report.
>

Ok. After all if the pixel format is chosen correctly, the reported line
length should match anyways. So is really a corner case what Pierre had.

> For example, DRM framebuffer sizes are often multiples of 64. Creating a 
> framebuffer of 800x600 will create a framebuffer with 
> stride/pitch/linelength of 832.  I can imagine that some BIOSes out 
> there do something similar with the system framebuffer. Messing with the 
> stride would break them.
>

I see, is not that simple then. Thanks a lot for the clarification.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

