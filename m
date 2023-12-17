Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C95B817B0E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA5D10E278;
	Mon, 18 Dec 2023 19:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD9610E37F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702927741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZuMkSqDphggFe82tZqaGer9Bq8n3w4NhlpIrSLDuh64=;
 b=KvfhJdppr6zjCeibW1qcB33+T07YXvpqzqdN26gOon20xkNIfy9ynWIXVb3nqHuGXVUZYJ
 97rMbFQfGMwEnW7zpt/xgIvvzLG7ffSEm70zra6dpWmR5cpLfGus8bkX62Tx3rgPYxWt1a
 777Qnpbm6ShbXQHtWiIGjVKrB4zeAMk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-Kv_VSmuoOK-SWrVOFXYfzw-1; Sun, 17 Dec 2023 17:46:23 -0500
X-MC-Unique: Kv_VSmuoOK-SWrVOFXYfzw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40c2dd83bc4so20975395e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Dec 2023 14:46:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702853182; x=1703457982;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZuMkSqDphggFe82tZqaGer9Bq8n3w4NhlpIrSLDuh64=;
 b=dz9nUt2CKuWMVDI90u09yEFwXnJh3uxPiF4q7+ENu/WMgBrCtn0vL3RnZ9GQl6IXBF
 e/ocywIT8bnqIR882/RSTNbSO+TPa82RCu0zk/7Op0wqxuS4Bq2lkK6rFvTpB7GscvXU
 WJmGWW0pOgECCz6yWam3dmOIjZvJvTOM/VgUuq6/0btzYbUm2sZkmQSeL6kDAV0JVpu+
 g3YsAjewes31B2mPlhnHMKofdcbsRybYAVqPgLeHiLFyMFdYhto+oZAd/ha8zzab0i1s
 lk4Ttt+pxQco8Mx7aYNx3w1N9WpeLo6ceo7XKtznUVi59Ses+UaVJAZKGQFGx0ZqgqFf
 gOeA==
X-Gm-Message-State: AOJu0Ywp79p3Nd7+rIAe7RYiiD9Gl0OHE8VFS7AwlQ5ELDnHo6kFTIXp
 tdbv82s7u01VeaMphC62GqveJcVPlVZU6ljEogPWjLYjS5NUe5c5riJA+11qCgc3/bnUgNNKuiv
 Hi6DZFcEiQBJvTLxEw523oGmQ8g+K
X-Received: by 2002:a05:600c:4f90:b0:40b:47b5:be4f with SMTP id
 n16-20020a05600c4f9000b0040b47b5be4fmr8011119wmq.26.1702853181860; 
 Sun, 17 Dec 2023 14:46:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkM4LyhnxN4U9ukVqo9ZHjNr9OSCvI4cnpcJ7NkoX7UDtpCVJtXFGPGDKLVfLir4jk0uSzSQ==
X-Received: by 2002:a05:600c:4f90:b0:40b:47b5:be4f with SMTP id
 n16-20020a05600c4f9000b0040b47b5be4fmr8011114wmq.26.1702853181517; 
 Sun, 17 Dec 2023 14:46:21 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d5-20020a5d5385000000b0033662cf5e51sm3013673wrv.93.2023.12.17.14.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Dec 2023 14:46:21 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: Add SSD133x OLED controllers
In-Reply-To: <20231217-catcall-turbulent-0a4072eaba43@spud>
References: <20231217100741.1943932-1-javierm@redhat.com>
 <20231217100741.1943932-2-javierm@redhat.com>
 <20231217-bacteria-amusable-77efb05770a4@spud>
 <87fs00ms4b.fsf@minerva.mail-host-address-is-not-set>
 <20231217-hunk-cross-4bf51740957c@spud>
 <87cyv4mqvs.fsf@minerva.mail-host-address-is-not-set>
 <20231217-catcall-turbulent-0a4072eaba43@spud>
Date: Sun, 17 Dec 2023 23:46:20 +0100
Message-ID: <87a5q8moqr.fsf@minerva.mail-host-address-is-not-set>
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

Hello Connor,

> On Sun, Dec 17, 2023 at 11:00:07PM +0100, Javier Martinez Canillas wrote:
>> Conor Dooley <conor@kernel.org> writes:
>> 
>> Hello Conor,
>> 
>> > On Sun, Dec 17, 2023 at 10:33:24PM +0100, Javier Martinez Canillas wrote:
>> 
>> [...]
>> 
>> >> >> +    then:
>> >> >> +      properties:
>> >> >> +        width:
>> >> >> +          default: 96
>> >> >> +        height:
>> >> >> +          default: 64
>> >> >
>> >> > Do you envisage a rake of devices that are going to end up in this
>> >> > binding? Otherwise, why not unconditionally set the constraints?
>> >> >
>> >> 
>> >> Because these are only for the default width and height, there can be
>> >> panels using the same controller but that have a different resolution.
>> >> 
>> >> For example, there are panels using the SSD1306 controller that have
>> >> 128x32 [0], 64x32 [1] or 128x64 [2] resolutions.
>> >
>> > This, as you know, does not matter here.
>> >
>> 
>> Are you sure? What I tried to say is that the SSD133x are just OLED
>> controllers and manufacturers use those chips to attach a panel that
>> has a certain resolution.
>> 
>> While it makes sense to use all the supported width and height, some
>> manufacturers chose to have a smaller panel instead (I used SSD1306
>> as an example because I knew about these but the same might be true
>> for let's say SSD1331).
>> 
>> Or saying another way, are you sure that every manufacturer selling
>> RGB OLED panels using the SSD1331 chip will use the default resolution
>> and users won't have to set a custom width and height ?
>
> That's not at all what I was saying. I just meant unconditionally set
> the constraints on the property (in this case the default) since you
> only have one compatible. Not unconditionally set the height and width.
>
> Apologies if if that was unclear.
>

Oh, I see that you meant now. Sorry for my confusion!

And yes, I agree with you that doesn't make sense to make it conditional
if there's only a single compatible. I'll drop that if condition on v2.

Thanks a lot for your feedback.

> Thanks,
> Conor.
>
 
-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

