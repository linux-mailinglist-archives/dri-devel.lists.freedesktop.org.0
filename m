Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE01755B869
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 10:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BD810FC7F;
	Mon, 27 Jun 2022 08:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8995110FC7F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 08:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656316938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+BhcPB/fW8lkxE3byWUWF+Hldg5p1S7kgw+9StleA50=;
 b=dHhe/r0+hpFf6vyTI7dsDobfWj6hPFSk3TPGyr8tWP9i7dHQqDWDiZZEOTHZA06UMJHEr/
 K+fWq+dMW3V2AUyg+j6oOljcrNwbV/hU+YuzJhROKscFmOKgfxeoMYlzWNq5y/S/pE1Y6Y
 4C3j15Nk4jHH0WTXt7101ypGvgOLAQc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-L8tpIxsKM6u7DCI9-Wk7Rg-1; Mon, 27 Jun 2022 04:02:17 -0400
X-MC-Unique: L8tpIxsKM6u7DCI9-Wk7Rg-1
Received: by mail-wm1-f70.google.com with SMTP id
 t20-20020a1c7714000000b003a032360873so6325620wmi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 01:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+BhcPB/fW8lkxE3byWUWF+Hldg5p1S7kgw+9StleA50=;
 b=GQQSQs8sblnIZZb2VgNmlXRkaWfqFUhtVvSO6N5qWVSMjjNe9zyg/a9+/GFHrteMkN
 /V3nLxmWJ8UobN7weGJ/lSa6tGpW/PjdkwJ3QDCrOlFwCzpyoEyYxILMs/cyqfvSkMdJ
 OTNBgvEgJTD1cnxLA+XZG+9IRNPB64O4c2HfW8q+QqmU4Bh/s3dH0RWJoNwYRvCIVofb
 ek6ljSs1TWYwnXPkJEbtjvHaKwNbDn2w1PSNMWF6B7CGN6giAqOqIcylgMimzsiqXfuM
 VyEJdpIeoY34oT6hQLJleZAxxzERENq3bDPSVF5qVkqOSEJmzGR4ktq3fz9yUMyqfuwO
 TiKg==
X-Gm-Message-State: AJIora+ezt9hkR9ie1h3BjCq2rlp8vsDTpbpULnSl6+DKZK2sMpgkNRv
 KYtULPpHkIpKrZAUXVx/Hx7zVPhsG285XszSiH2nUrgy/eRL1UN6MyaAJK1CT5A9mn3xa1tP4d7
 NV/NmQ6DWQyMOBeLloMoBl7IJqeuA
X-Received: by 2002:a5d:4601:0:b0:21b:9035:d295 with SMTP id
 t1-20020a5d4601000000b0021b9035d295mr10995355wrq.63.1656316934824; 
 Mon, 27 Jun 2022 01:02:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uHyeQB3afsqr1Szx/j8rTPBkRM7cm7Ke1/JvUC6RPiOEuvpeYA002QEItGaB94DqzGnWdtog==
X-Received: by 2002:a5d:4601:0:b0:21b:9035:d295 with SMTP id
 t1-20020a5d4601000000b0021b9035d295mr10995332wrq.63.1656316934573; 
 Mon, 27 Jun 2022 01:02:14 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y3-20020a05600c17c300b003a0231af43csm11589261wmo.48.2022.06.27.01.02.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 01:02:14 -0700 (PDT)
Message-ID: <3920df43-37f5-618d-70ba-de34a886e8ab@redhat.com>
Date: Mon, 27 Jun 2022 10:02:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Annoying AMDGPU boot-time warning due to simplefb / amdgpu
 resource clash
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zack Rusin <zackr@vmware.com>,
 Hans de Goede <hdegoede@redhat.com>
References: <CAHk-=wh42rU5mKU6=PCK5tdkYjh7r31dGNmYdHwqpFnRFvVudA@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAHk-=wh42rU5mKU6=PCK5tdkYjh7r31dGNmYdHwqpFnRFvVudA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Linus,

On 6/26/22 20:54, Linus Torvalds wrote:
> So this has been going on for a while, and it's quite annoying.
> 
> At bootup, my main desktop (Threadripper 3970X with radeon graphics)
> now complains about
> 
>   resource sanity check: requesting [mem 0xd0000000-0xdfffffff], which
> spans more than BOOTFB [mem 0xd0000000-0xd02fffff]
> 
> and then gives me a nasty callchain that is basically the amdgpu probe
> sequence ending in amdgpu_bo_init() doing the
> arch_io_reserve_memtype_wc() which is then what complains.
> 
> That "BOOTFB" resource is from sysfb_simplefb.c, and I think what
> started triggering this is commit c96898342c38 ("drivers/firmware:
> Don't mark as busy the simple-framebuffer IO resource").
> 
> Because it turns out that that removed the IORESOURCE_BUSY, which in
> turn is what makes the resource conflict code complain about it now,
> because
> 
>                 /*
>                  * if a resource is "BUSY", it's not a hardware resource
>                  * but a driver mapping of such a resource; we don't want
>                  * to warn for those; some drivers legitimately map only
>                  * partial hardware resources. (example: vesafb)
>                  */
> 
> so the issue is that now the resource code - correctly - says "hey,
> you have *two* conflicting driver mappings".
> 
> And that commit claims it did it because "which can lead to drivers
> requesting the same memory resource to fail", but - once again - the
> link in the commit that might actually tell more is just one of those
> useless patch submission links again.
> 
> So who knows why that commit was actually done, but it's causing annoyance.
>

The flag was dropped because it was causing drivers that requested their
memory resource with pci_request_region() to fail with -EBUSY (e.g: the
vmwgfx driver):

https://www.spinics.net/lists/dri-devel/msg329672.html
 
> If simplefb is actually still using that frame buffer, it's a problem.
> If it isn't, then maybe that resource should have been released?
>

It's supposed to be released once amdgpu asks for conflicting framebuffers
to be removed calling drm_aperture_remove_conflicting_pci_framebuffers().

I'm not familiar with the amdgpu driver, but maybe that call has to be done
earlier before the arch_io_reserve_memtype_wc() ?
 
> I really think that commit c96898342c38 is buggy. It talks about "let
> drivers to request it as busy instead", but then it registers a
> resource that isn't actually a proper real resource. It's just a
> random incomplete chunk of the actual real thing, so it will still
> interfere with resource allocation, and in fact now interferes even
> with that "set memtype" because of this valid warning.
> 

That registered resource is what the firmware provides for drivers to use
the system framebuffer for scan-out. It's not the real thing, that's true
since a native driver would kick it out (leading to a resource release)
and register the real aperture.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

