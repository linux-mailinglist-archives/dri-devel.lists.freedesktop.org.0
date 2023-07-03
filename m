Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DEA7458B8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 11:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A449010E1EE;
	Mon,  3 Jul 2023 09:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33CE10E1EE
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 09:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688377631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jQYvI6ljDyvAPteF7vHttZ7BlwUysjnknTWk4YxwxHU=;
 b=OXGnk2OFv2M4zfq5ULC+GXQrG7SFR98Ph0d1dv7Y0ivFYktJLl0TCcmAZU/+kiupPg7A8L
 uDe1Ddybkw/Mw4pVNr5U1tjIT0VqiFbsSXBbi6mXKFkT/yb/0uKNwC9OOv1rMPKzrkVRfT
 6UFgd8q4f/yzD4fntY7vIXGdh23QusQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-KXflmuCONZ2yhkSZPifGoQ-1; Mon, 03 Jul 2023 05:47:10 -0400
X-MC-Unique: KXflmuCONZ2yhkSZPifGoQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-31421c900b7so1839317f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 02:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688377629; x=1690969629;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jQYvI6ljDyvAPteF7vHttZ7BlwUysjnknTWk4YxwxHU=;
 b=iWnLSL9Q9LETPXuAmH98cmiysp+0srLwV88Hb2aSVMB9waciNgr80/Jv5nEpulKW4i
 Y2lDQW5prf1aUCBWlA/WKi0yhNr1DpoLqfC5nhvSWp8s7gNBs5p7LMmkX+3VLByvAH5e
 ceAr40P0oOo3XgCzf/cgE2Vx3A4FtGuoTCoaizim5Wf0ca2veW6YUSQsvq2DqTrOSpKz
 Q5AHbKKLgaJnvvAm3DapBohcGW1ONwCpSWfQNjfQRc+DqLS+jrnBGqwe2XyrXm1fvPCv
 ossX2M4ZFew9C+7oPRFs48DuidJb+0jlRvVDFc4cUa29hoIu1fRB+KhbjAkPkvmhmfQx
 ciRg==
X-Gm-Message-State: ABy/qLbAVC+gDT85rjADypCgjiF5xfo8FOumA41SPd4ASPUyDtpLLtKm
 JCqbnSMon6BVSG+1Wpw3l5eEDqhifCJND7VQjXx//p4JcxDRGs0rdXtS9rLqIKT61M+IoBnCWbe
 7/3qmUvalx42U41/r8wJXWDC5c/j0UuVbVTjH
X-Received: by 2002:a5d:4534:0:b0:314:2c7a:d100 with SMTP id
 j20-20020a5d4534000000b003142c7ad100mr5055548wra.42.1688377629044; 
 Mon, 03 Jul 2023 02:47:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGG0GHYwylwnn0jpLdeMbAvNq2FJCyP9ZUsj6QJxVdOBpddConGhzUf2Sdb3/sXjz+tUMYmuA==
X-Received: by 2002:a5d:4534:0:b0:314:2c7a:d100 with SMTP id
 j20-20020a5d4534000000b003142c7ad100mr5055530wra.42.1688377628771; 
 Mon, 03 Jul 2023 02:47:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m1-20020adffe41000000b003143853590csm1617613wrs.104.2023.07.03.02.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 02:47:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] drm: Improve Kconfig symbol prompt and help texts
In-Reply-To: <96d91373-f955-2209-5cd7-7e1ecacf73f9@suse.de>
References: <20230702191529.768248-1-javierm@redhat.com>
 <20230702191529.768248-2-javierm@redhat.com>
 <96d91373-f955-2209-5cd7-7e1ecacf73f9@suse.de>
Date: Mon, 03 Jul 2023 11:47:07 +0200
Message-ID: <87lefxz5r8.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi Javier
>
> Am 02.07.23 um 21:15 schrieb Javier Martinez Canillas:

[...]

>> -	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
>> -	  introduced in XFree86 4.0. If you say Y here, you need to select
>> -	  the module that's right for your graphics card from the list below.
>> -	  These modules provide support for synchronization, security, and
>> -	  DMA transfers. Please see <http://dri.sourceforge.net/> for more
>> -	  details.  You should also select and configure AGP
>> -	  (/dev/agpgart) support if it is available for your platform.
>> +	  Kernel-level support for the Direct Rendering Infrastructure (DRI),
>> +	  that is composed of the Direct Rendering Manager (DRM) and Kernel
>> +	  Mode Settings (KMS) subsystems.
>
> It's slightly off, as KMS is part of DRM. I'd just drop any mention of KMS.
>
> But TBH instead of these small fixes, we should first discuss how we

Right, I'll just drop this patch and we can cleanup the text later.

> organize the menu structures. For example, the DRM drivers are all 
> listed in the graphics menu. They might as well go into a DRM menu.
>
> The framebuffer will be split into drivers and 'core'. The core options 
> (FB_DEVICE, FIRMWARE_EDID, FB_*_ENDIAN) probably deserve a separate menu.
>

Yes, that is what we agreed with Arnd and Geert. To add a new Kconfig in
drivers/video/fbdev/core/Kconfig and drivers/video/fbdev/Kconfig source it.

> And there's the framebuffer console, which has its own menu. We need to 
> show it even if only DRM is supported. Plus the other consoles.
>
> I'm not sure what drivers/auxdisplay is, it might fit here as well.
>

That seems to be for simple character-based displays. And agree that could
be in framebuffer console as well. So we should improve the menu structure
before attempting to complicate with more options like adding the FB_CORE.

> It would be nice to rethink the overall menu.
>
> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

