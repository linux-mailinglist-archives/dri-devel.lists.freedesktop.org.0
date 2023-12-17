Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF56817A13
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A810C10E3DB;
	Mon, 18 Dec 2023 18:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308F810E1E5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702924921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K/1scTb9pZ8OxgoYLobA+aJoXS1Kz//UW2qp4P8sctU=;
 b=T0w4JK3KpBcFqez5u+PFgehJlIxoFLEha6eTDTmSZuhl8O31Cf9pbtEZ7I+uNs0247/GDF
 cMsrqvu8XGn7MpAOKAtAG8wGAr0bONwUOAny2NnRrgszXY2DYgnxahFu+aA2rIy514dyki
 rYMoRg7KB0kIQUjL+zSCDUfR/TTp4qw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-wM2zPIoIOMGoAOIjSYuUAA-1; Sun, 17 Dec 2023 17:00:10 -0500
X-MC-Unique: wM2zPIoIOMGoAOIjSYuUAA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3365bc111a5so1634942f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Dec 2023 14:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702850409; x=1703455209;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K/1scTb9pZ8OxgoYLobA+aJoXS1Kz//UW2qp4P8sctU=;
 b=lL4qZU/phRbgMrRZZcEBWhKa6RQopxRrcYKDy81O7phII4H+F3CGOxMoebeNwijX+N
 V3Zsnt4Bt/noX03XsUN5y1+Tml4TOPLDKnGweSspCVlz/vfvwvS8sgCfQ93+GREmvx6D
 kamHLRK3rKVsJNBw8mtc+DGZdLTvqV1yOybIbZ4o4tpFGh9lXTHbcoIoWRKfZfg1FNXs
 hpjKzH7DXVmzv0+8KGZINm0FkYFD+PqxqdinfqQzcsym3DGRN8DMIYKC/uhIgPJD80HJ
 EWZrTMi16igmSmWD4MyGyYPxzRV+O+chEVOnyOy0fRpVBkwdtUIReGUe9isdItRFuTp0
 a38w==
X-Gm-Message-State: AOJu0YxI3xjv6aRmy/2pNudjWmWZB9sIsIubKD7gp8ufity5BmNE12Tq
 4bq6Vbn0QLK0KV0EoOUDzcgH5L93UMkoVWX14QA+l418a8333tJLjMWhPysbuprVQDphvenBLJR
 Vgb4MzzAjW6I8JXmnc4AZkUDXGK7r/k7r4vnh
X-Received: by 2002:a5d:540a:0:b0:336:63f8:f22b with SMTP id
 g10-20020a5d540a000000b0033663f8f22bmr771704wrv.0.1702850409153; 
 Sun, 17 Dec 2023 14:00:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoqV0a8ZQJtOtOTjzUvG0IqnhN0462vgUIhA5mW80Zhxv7i1WeESN7oYXQ7je3eicDjTrxGA==
X-Received: by 2002:a5d:540a:0:b0:336:63f8:f22b with SMTP id
 g10-20020a5d540a000000b0033663f8f22bmr771697wrv.0.1702850408843; 
 Sun, 17 Dec 2023 14:00:08 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l1-20020a5d5601000000b00336630c31b5sm2853900wrv.9.2023.12.17.14.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Dec 2023 14:00:08 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: Add SSD133x OLED controllers
In-Reply-To: <20231217-hunk-cross-4bf51740957c@spud>
References: <20231217100741.1943932-1-javierm@redhat.com>
 <20231217100741.1943932-2-javierm@redhat.com>
 <20231217-bacteria-amusable-77efb05770a4@spud>
 <87fs00ms4b.fsf@minerva.mail-host-address-is-not-set>
 <20231217-hunk-cross-4bf51740957c@spud>
Date: Sun, 17 Dec 2023 23:00:07 +0100
Message-ID: <87cyv4mqvs.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Conor Dooley <conor@kernel.org> writes:

Hello Conor,

> On Sun, Dec 17, 2023 at 10:33:24PM +0100, Javier Martinez Canillas wrote:

[...]

>> >> +    then:
>> >> +      properties:
>> >> +        width:
>> >> +          default: 96
>> >> +        height:
>> >> +          default: 64
>> >
>> > Do you envisage a rake of devices that are going to end up in this
>> > binding? Otherwise, why not unconditionally set the constraints?
>> >
>> 
>> Because these are only for the default width and height, there can be
>> panels using the same controller but that have a different resolution.
>> 
>> For example, there are panels using the SSD1306 controller that have
>> 128x32 [0], 64x32 [1] or 128x64 [2] resolutions.
>
> This, as you know, does not matter here.
>

Are you sure? What I tried to say is that the SSD133x are just OLED
controllers and manufacturers use those chips to attach a panel that
has a certain resolution.

While it makes sense to use all the supported width and height, some
manufacturers chose to have a smaller panel instead (I used SSD1306
as an example because I knew about these but the same might be true
for let's say SSD1331).

Or saying another way, are you sure that every manufacturer selling
RGB OLED panels using the SSD1331 chip will use the default resolution
and users won't have to set a custom width and height ?

I have already chosen to make the DT binding as simple as possible to
prevent what happened with the SSD1306 "solomon,page-offset" property
that has a broken default [0] but I think that not allowing to set the
resolution is already too restrictive and would make it unusable for
any panel that doesn't have the default width and height.

[0]: https://lists.freedesktop.org/archives/dri-devel/2023-November/431150.html

>> But answering your question, yes I think that more devices for this
>> SSD133x family are going to be added later. Looking at [3], there is
>> at least SSD1333 that has a different default resolutions (176x176).
>
> That's fair enough though. I'd probably err on the side of introducing
> this complexity when the other users actually show up though.
>

Agree and the reason why I did not include entries for the SSD1332 and
SSD1333. I was planning to add those only if there were users since it
seems that the SSD1331 is the most popular controller from this family.

But as explained, even for the SSD1331 it may be needed to set a width
and height that is different than the default of this panel controller.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

