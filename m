Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6626E72CAF0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 18:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C4010E048;
	Mon, 12 Jun 2023 16:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD10F10E048
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 16:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686585863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uuCdplsPmJlzp+kH6QUrWWOm1LK9xg7d6ONJhnkdacI=;
 b=C1UALYevi/miKpkMhPBj1ZoOWb9nCiktJediaWvDRX8/FYbScXkwECkvovGMxX9TcaxIez
 y9V89dCtn88j/0IryUG1PV7b4UzOZxKq/qkeMf03wrc7WnHtMjiwsXo2y7a2IeSoVynFqo
 w1QoAfRU2EEbP0oFL0oI0VLQfMy6kVI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-hQrp9-RDOhul_IZGLvo6Ow-1; Mon, 12 Jun 2023 12:04:20 -0400
X-MC-Unique: hQrp9-RDOhul_IZGLvo6Ow-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30fc3469c9bso592185f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 09:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686585859; x=1689177859;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uuCdplsPmJlzp+kH6QUrWWOm1LK9xg7d6ONJhnkdacI=;
 b=NT+Q3jA2ACrbriOxzLZPcE1ayZEN6zdrvae60fTfHyAmwWhNCtE78F+R2CfmlwwCnb
 80GdVhVCxD94EpCtk0pLR0xzRy43HJwuJTGV4cwkYmpqPaFGNr3eu2iIuInNC0wYc5Ky
 ED0c0rKoGE2QqaUT51E3j8ppslyKa08/IrV43zp33HmE8UhsNfs3G9SVbaLhqik5x5la
 UlSvqZYNBWZi5OFfM3TJBv94+5hRYKOCZ3Rucav/SGStHoNrxf4bpRrmE0zA6ulBi2rm
 42+xmZ6w9+geeVaOhcKhnkROIC1TB4RabYRxuCJ0YpSgN9aRxP5X2jmKN1d/DqlIKRXF
 VJYA==
X-Gm-Message-State: AC+VfDznFLzNQczQGF1c+oewAc0ka5hkG5DlUn6/kA6xcQIFCfF1IT2D
 h/x+less1PtX3QQoCNtPdCafP/FTJbyQiQ1bFdqJCEI7Vk8YP0JhNWHu7k4nG9iWxhMwliZwLFx
 YX5DdXoMFSR50h9w3i6rAnpLMh81K
X-Received: by 2002:adf:e984:0:b0:30a:bf2b:e020 with SMTP id
 h4-20020adfe984000000b0030abf2be020mr5819473wrm.45.1686585859687; 
 Mon, 12 Jun 2023 09:04:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4owFNKmEWmuPb++u0T0aPDLLPsp/xgXSi0mOTbIfVKTyTKs1oJaK7lKDIf+8APpdspTz1ouQ==
X-Received: by 2002:adf:e984:0:b0:30a:bf2b:e020 with SMTP id
 h4-20020adfe984000000b0030abf2be020mr5819445wrm.45.1686585859272; 
 Mon, 12 Jun 2023 09:04:19 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c1-20020a5d5281000000b0030aded83385sm12896655wrv.27.2023.06.12.09.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 09:04:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 00/38] fbdev: Make userspace interfaces optional
In-Reply-To: <20230612155601.GC1243864@ravnborg.org>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612155601.GC1243864@ravnborg.org>
Date: Mon, 12 Jun 2023 18:04:17 +0200
Message-ID: <87jzw83bwe.fsf@minerva.mail-host-address-is-not-set>
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
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 geert+renesas@glider.be, linux-sh@vger.kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, lee@kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 michael.j.ruhl@intel.com, linux-omap@vger.kernel.org, dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sam Ravnborg <sam@ravnborg.org> writes:

Hello Sam,

> Hi Thomas,
>
> Nice series, quite some preparations.
>
> On Mon, Jun 12, 2023 at 04:07:38PM +0200, Thomas Zimmermann wrote:

[...]

>>   fbdev/smscufx: Detect registered fb_info from refcount
> I did not try to understand the code, so others must review.
>

No worries, I already reviewed that one.

>>   fbdev/ep93xx-fb: Alloc DMA memory from hardware device
>>   fbdev/sh7760fb: Alloc DMA memory from hardware device
> This smells like bug-fixes, and I do not see what impact the change has.
> So again, someone else needs to provide review here.
>

And same for these.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

