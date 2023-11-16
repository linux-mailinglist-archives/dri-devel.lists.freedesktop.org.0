Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8687EE314
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 15:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BDF10E5F5;
	Thu, 16 Nov 2023 14:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6527A10E5F5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 14:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700145620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k7D0AcpsS9Uv2SNG5VR/PuBu6Vv17rtl3JFWSaBIyyw=;
 b=CxWmUrLqqmEXJnNXfi5LkrkZrH3QLpa5cdZHJAi7pKHNHneGcX6+eQFh2lPMrtkYYCTnPQ
 pldr2RtiwCkqycTMkYLMf46nacFU7dTQ5mC9esucoY2L8FeYQQiLPIO/gAHHYpdcBTtHFR
 jk6oYxWnKnTmNd6eB/65OqE+Njd1AXE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-Mql4nlenNQ--W_bj9DkDGA-1; Thu, 16 Nov 2023 09:40:19 -0500
X-MC-Unique: Mql4nlenNQ--W_bj9DkDGA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40a5290de84so5065675e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 06:40:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700145618; x=1700750418;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k7D0AcpsS9Uv2SNG5VR/PuBu6Vv17rtl3JFWSaBIyyw=;
 b=oN1F/EX1RRKEelwCDQULlhvlf4kLGUJBMojoEqo7qdXRnYZy3TYXkUkmOhWdTaGXpG
 CIbvEvQ5r9ZA68bcb3kPpPBL5EDyv3WN/9K3wUvx04LJ9nfzmPA30fsDBsA1v0YDtWdY
 jp0HfgcexxfyRN/TgqgfS15VHBY/HTDMf4vtCD7h0W3KukUm44t+cnyBU2SKmd/Eq3m8
 pJmj+fts1jaK/x2sRQ6H78LafeVTFtjmVv9I9Lsp9PmC2a6d8dgV9lr1BM0C2COkTtPQ
 +WPX0z9vzu5dWlDtEtneFgcypoyhfrCJAmxTxzH9Aaozl4Jwo/0cKrCiRet58CSGG03u
 g0iA==
X-Gm-Message-State: AOJu0YzjvtKMDwq4hVsD39dcYdudbwDlLTF/awYlz1jLIJBoGP/54Lh7
 7SX+JkZ2tdXJ74DfxqOnRpQAkzQm7yS+7lAq25PqfdH1E7Y4DwkH4NQLlW83xCqPH4zTEdPvnYh
 jJLdxLigXC0wRKREyvL4bqKU0iMdg
X-Received: by 2002:a05:600c:45cb:b0:407:4944:76d1 with SMTP id
 s11-20020a05600c45cb00b00407494476d1mr14152429wmo.17.1700145617751; 
 Thu, 16 Nov 2023 06:40:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1Rh8dw2fcZL0K82vhYxadq8V4csNqH6IfNjG3OoldQslRz9TvV/kE57Gz/UgC84cOs3jVNg==
X-Received: by 2002:a05:600c:45cb:b0:407:4944:76d1 with SMTP id
 s11-20020a05600c45cb00b00407494476d1mr14152411wmo.17.1700145617390; 
 Thu, 16 Nov 2023 06:40:17 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c4f8700b0040588d85b3asm3908881wmq.15.2023.11.16.06.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 06:40:17 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH] of/platform: Disable sysfb if a simple-framebuffer
 node is found
In-Reply-To: <CAL_JsqJM9+cbNviwuKGB5+3YbyAP3UH+TxCxsU5nUtX-iRGP2w@mail.gmail.com>
References: <20231113085305.1823455-1-javierm@redhat.com>
 <CAL_JsqKHTN5hfd4qpg5RXbmQLKZNVywDkSj9mxvfGmjrcChQQg@mail.gmail.com>
 <87jzqi59bt.fsf@minerva.mail-host-address-is-not-set>
 <CAL_JsqJM9+cbNviwuKGB5+3YbyAP3UH+TxCxsU5nUtX-iRGP2w@mail.gmail.com>
Date: Thu, 16 Nov 2023 15:40:16 +0100
Message-ID: <87pm09223z.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Sergio Lopez <slp@redhat.com>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Hector Martin <marcan@marcan.st>,
 Andrew Worsley <amworsley@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Frank Rowand <frowand.list@gmail.com>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rob Herring <robh@kernel.org> writes:

> On Thu, Nov 16, 2023 at 3:36=E2=80=AFAM Javier Martinez Canillas
> <javierm@redhat.com> wrote:

[...]

>> >
>> > This is the opposite of what we do for memory and memory reservations.
>> > EFI is the source of truth for those.
>> >
>> > This could also lead to an interesting scenario. As simple-framebuffer
>> > can define its memory in a /reserved-memory node, but that is ignored
>> > in EFI boot. Probably would work, but only because EFI probably
>> > generates its memory map table from the /reserved-memory nodes.
>> >
>>
>> I see. So what would be the solution then? Ignoring creating a platform
>> device for "simple-framebuffer" if booted using EFI and have an EFI-GOP?
>
> Shrug. I don't really know anything more about EFI FB, but I would
> guess it can't support handling resources like clocks, power domains,
> regulators, etc. that simple-fb can. So if a platform needs those, do

That's correct, and the reason why I thought that the DTB would be the
single source of truth for the firmware provided framebuffer.

For example, in some arm platforms that u-boot does provide an EFI-GOP,
you need to boot with clk_ignore_unused or the system framebuffer just
goes away once the unused clocks are gated. Same for PD, regulators, etc.

> we say they should not setup EFI-GOP? Or is there a use case for
> having both? Clients that don't muck with resources can use EFI-GOP
> and those that do use simple-fb. For example, does/can grub use
> EFI-GOP, but not simple-fb?
>

I don't think grub can use the simple-fb, it can use the EFI-GOP if is
available though. And things work because of course grub won't try to
disable unused resources like Linux does.

> Rob
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

