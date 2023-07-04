Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1997746B69
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 10:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9960A10E2C4;
	Tue,  4 Jul 2023 08:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DBF10E2AF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 08:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688457910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CTuEnIm0LwkFV691/tfimgfAx52uWY02fSVIZdeEfLg=;
 b=e0/99SWMz8vlzvN8iI79e7tlIaI6GeuJNvz4CHDWpjab+EOZElbmOFMie684qmI6LMg1+E
 ydTE022MeONuvo9J0lVUJcqGyXK6H0EVKvmYGWvhhYQqUWFWI5p4H/hBJQyYkB8CU6mNxZ
 pvkskbv4FhdhmaBInS8ksm6UHNZJ6kk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-Q1YAkUkTP0C3l2KLZIu_wA-1; Tue, 04 Jul 2023 04:05:06 -0400
X-MC-Unique: Q1YAkUkTP0C3l2KLZIu_wA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fb8284465aso37261445e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 01:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688457905; x=1691049905;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CTuEnIm0LwkFV691/tfimgfAx52uWY02fSVIZdeEfLg=;
 b=POUn3Boqu96uoOv3UUELSa27hhcbD8cvMoICOmaxxm+RMGuFmFP6RSYsRbOHS3PQyd
 K/Q6maDo6EEKzBfCSV70phKNwplaXt6xYb+rXiqRv0Fp7xgBHovyzZvAXFD0tkOCZ3sD
 Q/y7VAeSS4//1Is4vgIwjtagZFuweB27bSuHqRjIjSxbplb3EMtSG1VJz/L/k7N3CrH8
 u0FbIynH1qLSjK/WceATeAykHVTziwy0/zGGz8HKnNVyp9ftnepc5G4X0VjB+tOMAEi/
 +XWp33SdFEIzz+GTYzdfJVX5vq22Zopr9FyowHZzbwPPcqGqqvZk7Svwq1g9hoWw3hHQ
 Nidw==
X-Gm-Message-State: ABy/qLalJlnOg3AOL0BSduz61lgXlzBQM4+Jed631MSj2h3qYJ/vNOz7
 r70ldRkOvLaeDbD10ok1pUWMda1Uadywe1t+bP/KsJnGULW4jvlLpUnllX5fDEYtRWAdC8njwK/
 5zM+IDDbiHCvcogFUAP6395JDpkqL
X-Received: by 2002:a7b:cb94:0:b0:3fb:dbd0:a7e7 with SMTP id
 m20-20020a7bcb94000000b003fbdbd0a7e7mr3685536wmi.39.1688457905615; 
 Tue, 04 Jul 2023 01:05:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHI1PUQgJKT44QoZAhMaiwf05ugYH5PcKVDgVeHbws97u9pvTMta/zCZ7DBU3JO67JzvQLBvw==
X-Received: by 2002:a7b:cb94:0:b0:3fb:dbd0:a7e7 with SMTP id
 m20-20020a7bcb94000000b003fbdbd0a7e7mr3685519wmi.39.1688457905334; 
 Tue, 04 Jul 2023 01:05:05 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n10-20020a1c720a000000b003fa96620b23sm24406458wmc.12.2023.07.04.01.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 01:05:05 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 1/5] video: Add auxiliary display drivers to Graphics
 support menu
In-Reply-To: <CAMuHMdVBkV30X32UWdV5k_PSJfeOF-a5=eCBo_3N2265w+n1hA@mail.gmail.com>
References: <20230703230534.997525-1-javierm@redhat.com>
 <20230703230534.997525-2-javierm@redhat.com>
 <CAMuHMdXRg1OUy6UHuH4H+qkK-qO+jTKdVoG_SRM3q_PkyD+Bbw@mail.gmail.com>
 <87h6qkyuv4.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdVBkV30X32UWdV5k_PSJfeOF-a5=eCBo_3N2265w+n1hA@mail.gmail.com>
Date: Tue, 04 Jul 2023 10:05:04 +0200
Message-ID: <878rbwyudr.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Nipun Gupta <nipun.gupta@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Javier,

[...]

>> > This is inside the "if HAS_IOMEM" section, while there was no
>> > such limitation before.
>> >
>>
>> Gah, I missed that. Thanks a lot for pointing it out.
>>
>> If I move the source outside of the if block, are you OK with this patch?
>>
>> I think Thomas is correct and would make sense to put the character-based
>> drivers next to the DRM and fbdev drivers since all these are for display.
>
> Yes, makes sense to me.
>

Good to know. Thanks!

> Gr{oetje,eeting}s,

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

