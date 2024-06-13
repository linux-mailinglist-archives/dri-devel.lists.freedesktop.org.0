Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E4A907E52
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 23:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D5810EBBE;
	Thu, 13 Jun 2024 21:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Io5ty+rE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6507410EBBE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 21:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718315434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WYhVBB92WRba06kdvoVhXYWDr7tfly6ynhI5KCT2iy4=;
 b=Io5ty+rEGEvnrSGgPzwJtJLDZqByOraqWonKuO4pqfrrjGjS8s1GRiDaLsN3UctwEWAOig
 TZ62/9LYZGlzY+ko++X1thJvVmxgzJC8NDmvdSEJOC3J6j4ZKI3ifNACSOku32TugsMcI6
 jz5Xunzh+wh5stSg41nA3/jGQW8qoos=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-LT61dpcsOJ6XAagUzFSlsg-1; Thu, 13 Jun 2024 17:50:32 -0400
X-MC-Unique: LT61dpcsOJ6XAagUzFSlsg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42153125d3eso12785095e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 14:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718315431; x=1718920231;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WYhVBB92WRba06kdvoVhXYWDr7tfly6ynhI5KCT2iy4=;
 b=WAxoXXz5aXyAopA3QeRbesbtH6qjLIGzwYE23ohT9JMYgTK3o1yt46wLUXstLGSDDd
 xZTyi3fSw/qS1+LWKPKyP+7RsegmgxcwLQdQHYp5mGhWRCY21jh4Z9C61yAWVLNO5uhc
 G8LfvGey8Kh7UyTdfstsaovfGdWmd2rr22XQXw6Axa5RIo66LPKY+fDrQFkOMnBhSium
 B45Ou7pS8bVX7fexPw/mb3/pONaFXiA/JI2qNRly4hQUiPjQT/8WWjD5WN0100Shcfgb
 14LbmvQE+Fth40ZFIK28b2UX7ecrs8PYkrByJSpBUdAki69D9oe/ZJ4AgIelVVuD2RVL
 mHTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgwS3vmJ1m4fIXyvhDH2vjxzoh4R/jwMXqgsp1wX5hzbeVcJvQE9NP0nTD+34+3XGtes3S+iBhgvoGW4aeZHCY/ALIHh/nw/TwSb8BMSWX
X-Gm-Message-State: AOJu0YyyVZ0/2RQhwedxf3f+E5ic53ZfbrFFLYmTkO35G2WRBQMm+I1x
 yYvkDMKahf7Eim9BY5YK6SD5yiawh8AAfxVDjBcPAC+Q2ELzM/tjJ/Be7G+kvn9drb6osSY7kTw
 uRMMdHg0xCaIzomwjMSeXyOZlR5goKoTaTumSmtlYR/lp0x3OL+fk3Bo39B3+B30U1A==
X-Received: by 2002:a05:600c:314f:b0:421:7f30:7ce3 with SMTP id
 5b1f17b1804b1-4230482158amr7552165e9.1.1718315431173; 
 Thu, 13 Jun 2024 14:50:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFclJBD4+gENweiNq3Sn4ls37mHaaCLzO4VspJZacVbRM1WmTh+gqlxMlVWnpECmhgW+xecNA==
X-Received: by 2002:a05:600c:314f:b0:421:7f30:7ce3 with SMTP id
 5b1f17b1804b1-4230482158amr7551995e9.1.1718315430593; 
 Thu, 13 Jun 2024 14:50:30 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4229c60f758sm60963905e9.20.2024.06.13.14.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 14:50:30 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 sam@ravnborg.org, hpa@zytor.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] fbdev: vesafb: Detect VGA compatibility from screen
 info's VESA attributes
In-Reply-To: <5d8d2efe-45dd-4033-aaae-e7f923ef9e76@gmx.de>
References: <20240613090240.7107-1-tzimmermann@suse.de>
 <5d8d2efe-45dd-4033-aaae-e7f923ef9e76@gmx.de>
Date: Thu, 13 Jun 2024 23:50:29 +0200
Message-ID: <87tthwqzq2.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Helge Deller <deller@gmx.de> writes:

> On 6/13/24 11:02, Thomas Zimmermann wrote:
>> Test the vesa_attributes field in struct screen_info for compatibility
>> with VGA hardware. Vesafb currently tests bit 1 in screen_info's
>> capabilities field, It sets the framebuffer address size and is
>> unrelated to VGA.
>>
>> Section 4.4 of the Vesa VBE 2.0 specifications defines that bit 5 in
>> the mode's attributes field signals VGA compatibility. The mode is
>> compatible with VGA hardware if the bit is clear. In that case, the
>> driver can access VGA state of the VBE's underlying hardware. The
>> vesafb driver uses this feature to program the color LUT in palette
>> modes. Without, colors might be incorrect.
>>
>> The problem got introduced in commit 89ec4c238e7a ("[PATCH] vesafb: Fix
>> incorrect logo colors in x86_64"). It incorrectly stores the mode
>> attributes in the screen_info's capabilities field and updates vesafb
>> accordingly. Later, commit 5e8ddcbe8692 ("Video mode probing support for
>> the new x86 setup code") fixed the screen_info, but did not update vesafb.
>> Color output still tends to work, because bit 1 in capabilities is
>> usually 0.
>>
>> Besides fixing the bug in vesafb, this commit introduces a helper that
>> reads the correct bit from screen_info.
>
> Nice catch, Thomas!
>
> But do we really need this additional helper?
>
>
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: 5e8ddcbe8692 ("Video mode probing support for the new x86 setup code")
>> Cc: <stable@vger.kernel.org> # v2.6.23+
>
>> ---
>>   drivers/video/fbdev/vesafb.c | 2 +-
>>   include/linux/screen_info.h  | 5 +++++
>>   2 files changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
>> index 8ab64ae4cad3e..5a161750a3aee 100644
>> --- a/drivers/video/fbdev/vesafb.c
>> +++ b/drivers/video/fbdev/vesafb.c
>> @@ -271,7 +271,7 @@ static int vesafb_probe(struct platform_device *dev)
>>   	if (si->orig_video_isVGA != VIDEO_TYPE_VLFB)
>>   		return -ENODEV;
>>
>> -	vga_compat = (si->capabilities & 2) ? 0 : 1;
>> +	vga_compat = !__screen_info_vbe_mode_nonvga(si);
>
> Instead maybe just this: ?
>   +	/* mode is VGA-compatible if BIT 5 is _NOT_ set */
>   +	vga_compat = (si->vesa_attributes & BIT(5)) == 0;
>
> I suggest to make patch small, esp. if you ask for backport to v2.6.23+.
>

I prefer the helper. It's a static inline anyways and having it as a
function makes it much easier to read / understand.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

