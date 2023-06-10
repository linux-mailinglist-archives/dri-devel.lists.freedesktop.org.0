Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D06E672AFAE
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jun 2023 01:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53D010E031;
	Sat, 10 Jun 2023 23:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287B810E031
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 23:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686439123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D8heU8KT8N66egWqP5syvdzwEBmAm1JS5VTvHxIRqqk=;
 b=iQCCocEhYabrd7gfbEv2RLCAt3+sqPQdo+pPGm0GzaZWZynlsS2w44byVLsp/23NE0piTU
 v9z4LTZimw7d9NsiewOuty7KiGCdTwFuopMKffBjazVV73/+TAJ3UOX8YYFp84netsfsji
 BFmMmem7Txitp2+ntoUb5cWyVc5swco=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-H6XG1Jj6M9yGVJMvU2o5Bw-1; Sat, 10 Jun 2023 19:18:31 -0400
X-MC-Unique: H6XG1Jj6M9yGVJMvU2o5Bw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30fbaeec4c1so111604f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 16:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686439110; x=1689031110;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D8heU8KT8N66egWqP5syvdzwEBmAm1JS5VTvHxIRqqk=;
 b=Alpd0RcBNZWvgCXovonfF1tHstOEGQwV8ElnQfY6XAo5AH/PFLzcA2EpsSGje7IBb1
 tmUfl974qPQNYHdb6UkGpC9iVNmSaeALyPccpda5HIi/CPRGm5VoBl0ADECvm4n5Rusp
 EsmbB8mVFjkpSprdZUnvCWew2MDGAG6I9RytZWKRSpYD6omAGhZwlQrjYbryU9DIKwsF
 yGZX3Oh2ibk7h6ptMjw0tXBanSsuIyLPx3c4FjVYdlBBABYjDNG7780oY0wURMZ2L71n
 fB0C4RqQfqU+c2jPLGs7dCgdAvDPB06JpuDXn2rEcUiSs/hsUMDnHVpYbhtbtbMYxdUl
 1zxQ==
X-Gm-Message-State: AC+VfDwL4GDeFBSp5f64RRuYH9DDiIO8WTQxxVbwupoOPIzIJklJlHhJ
 ZS7D8APYKPHER+uD1p004rtejtFdFU0bDjfk8kKtfUcPw7u8qP/0c0ErboSpLPGbWhTGu6374ha
 PFk6gsq6eX2sJyNbM+PYFVdmyirYJ
X-Received: by 2002:a5d:4983:0:b0:30a:dfb4:e300 with SMTP id
 r3-20020a5d4983000000b0030adfb4e300mr1844976wrq.28.1686439110017; 
 Sat, 10 Jun 2023 16:18:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7jG5fprO8u5UBAEpGm2MDfpLiBPONYgvdFhUff4goghNW/o4Wo5d0iU8B2i0qViPYwH7b8Ow==
X-Received: by 2002:a5d:4983:0:b0:30a:dfb4:e300 with SMTP id
 r3-20020a5d4983000000b0030adfb4e300mr1844970wrq.28.1686439109700; 
 Sat, 10 Jun 2023 16:18:29 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n6-20020a7bcbc6000000b003f6f6a6e769sm6807965wmi.17.2023.06.10.16.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jun 2023 16:18:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: display: ssd1307fb: Remove default
 width and height values
In-Reply-To: <20230610-unused-engaged-c1f4119cff08@spud>
References: <20230609170941.1150941-1-javierm@redhat.com>
 <20230609170941.1150941-3-javierm@redhat.com>
 <20230610-opposite-quality-81d4a1561c88@spud>
 <87r0qj19zs.fsf@minerva.mail-host-address-is-not-set>
 <20230610-unused-engaged-c1f4119cff08@spud>
Date: Sun, 11 Jun 2023 01:18:28 +0200
Message-ID: <87jzwa29ff.fsf@minerva.mail-host-address-is-not-set>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Conor Dooley <conor@kernel.org> writes:

> On Sat, Jun 10, 2023 at 07:51:35PM +0200, Javier Martinez Canillas wrote:
>> Conor Dooley <conor@kernel.org> writes:
>> 
>> > On Fri, Jun 09, 2023 at 07:09:37PM +0200, Javier Martinez Canillas wrote:
>> >> A default resolution in the ssd130x driver isn't set to an arbitrary 96x16
>> >> anymore. Instead is set to a width and height that's controller dependent.
>> >
>> > Did that change to the driver not break backwards compatibility with
>> > existing devicetrees that relied on the default values to get 96x16?
>> >
>> 
>> It would but I don't think it is an issue in pratice. Most users of these
>> panels use one of the multiple libraries on top of the spidev interface.
>> 
>> For the small userbase that don't, I believe that they will use the rpif
>> kernel and ssd1306-overlay.dtbo DTB overlay, which defaults to width=128
>> and height=64 [1]. So those users will have to explicitly set a width and
>> height for a 96x16 panel anyways.
>> 
>> The intersection of users that have a 96x16 panel, assumed that default
>> and consider the DTB a stable ABI, and only update their kernel but not
>> the  DTB should be very small IMO.
>
> It's the adding of new defaults that makes it a bit messier, since you
> can't even revert without potentially breaking a newer user. I'd be more
> inclined to require the properties, rather change their defaults in the
> binding, lest there are people relying on them.

I think that's OK, the old drivers/video/fbdev/ssd1307fb.c fbdev driver
still has the old behaviour so it will only be a problem for users that
want to move to the new ssd130x driver as well.

By looking at the git log history, the 96x16 resolution was chosen when
the driver was merged because Maxime tested it on a CFA10036 board [1]
that has a 96x16 panel that uses an SSD1307 controller.

But as mentioned, that chip can drive up to 128x39 pixels so the maximum
makes more sense as default to me.

[1]: https://www.crystalfontz.com/product/cfa10036

> If you and the other knowledgeable folk in the area really do know such
> users do not exist then I suppose it is fine to do.

I believe is fine, since as explained above that change was only done in
the ssd130x DRM driver, not the ssd1307fb fbdev driver whose default is
still 96x16. Both drivers share the same DT binding scheme, I was asked
to do that to make it as much backward compatible as possible with the
old fbdev driver.

But I will be OK to drop the "solomon,ssd130?fb-i2c" compatible strings
from the DRM driver and only match against the new "solomon,ssd130?-i2c"
compatible strings. And add a different DT binding schema for the ssd130x
driver, if that would mean being able to fix things like the one mentioned
in this patch.

In my opinion, trying to always make the drivers backward compatible with
old DTBs only makes the drivers code more complicated for unclear benefit.

Usually this just ends being code that is neither used nor tested. Because
in practice most people update the DTBs and kernels, instead of trying to
make the DTB a stable ABI like firmware.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

