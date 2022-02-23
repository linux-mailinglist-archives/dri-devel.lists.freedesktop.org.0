Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E7F4C1AB3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 19:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA5110E399;
	Wed, 23 Feb 2022 18:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5618D10E2C5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 18:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645639992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=95fZFgzFhUpzX6RItnD0JyQ0tqRlNULc6H8xcXm68i8=;
 b=UOnELPQL2ZfKHsGTrItV3CwtBJbrqOCi8DRTgPKg89hfqJ7CF0Nh3OC8OX6oyXt76OQPnR
 HOWJ+zMwb7VCRPxnTMbxf976xJ2LiwGfSqX7n/Fi1jGpxfkjt0pRBh1KRXFBdG1YnVat1+
 0Mxegy8uGQWZba45yLQntqJt9T0ZqP0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-UDGTOkQRP2COPUDunfno9Q-1; Wed, 23 Feb 2022 13:13:10 -0500
X-MC-Unique: UDGTOkQRP2COPUDunfno9Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 h206-20020a1c21d7000000b003552c13626cso1469079wmh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 10:13:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=95fZFgzFhUpzX6RItnD0JyQ0tqRlNULc6H8xcXm68i8=;
 b=Zv0PIEdv5DutUmM0w/sHGHM4y33w28U9xshLlHCYCDhSRjPRZNN/p0/UrO/HXcRxWw
 +7i17kPW+2e8KYeKeea+ugCOdD1nXOmkTBhwQQYZ1am4FEUuBZ6gmv+32jWEuS+Kkdu6
 8vN1R7/TSKaUbp1gGLBaX5oXzcIqFUlJgdxGIWKtvN2sjeTdfH94mk5hI+WOx3W+zO7P
 HpYNBuuFlxCv1FUuJWHBR3EtKLoYOYr8egk5dW9CSHR65JB0KgzdullSw59makXb5fTg
 BL7HXJwF5XscgnkwHsSyAnkKkzo8eGBkItJuh5kQp2qGbQrNGBvx/pkdwdoxGKSfUmGZ
 nzSA==
X-Gm-Message-State: AOAM5313hxkqwk+oaYp2eF/USKHwumbJxdY3mGGbD803WLmEti7YmfqQ
 0KNtNXXP7UVQaqptoYQu+0oAsM7oUkJoA/4JRFBjjm/JCC9T47bVg29PSn2xxDa3yi4xNdAoqpK
 XNWDKARi56/GfblfdgaS3jgegkjgW
X-Received: by 2002:a05:600c:4b92:b0:380:e46c:c35 with SMTP id
 e18-20020a05600c4b9200b00380e46c0c35mr723220wmp.15.1645639989588; 
 Wed, 23 Feb 2022 10:13:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+OMBA5FBflXxH1bgqITdjSzJn7yz73jIBRhiyyfuoGwM/4IaCFSE4PIcSUMEwpEBhJd4yHg==
X-Received: by 2002:a05:600c:4b92:b0:380:e46c:c35 with SMTP id
 e18-20020a05600c4b9200b00380e46c0c35mr723183wmp.15.1645639989344; 
 Wed, 23 Feb 2022 10:13:09 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id e7sm250125wrg.44.2022.02.23.10.13.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 10:13:08 -0800 (PST)
Message-ID: <a9df1753-8e3b-55bb-2dab-9e7aeaa52a8d@redhat.com>
Date: Wed, 23 Feb 2022 19:13:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] simplefb: Enable boot time VESA graphic mode selection.
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <a789e375-a23e-6988-33bc-1410eb5d974f@suse.de>
 <20220218160436.23211-1-msuchanek@suse.de>
 <33b80f9c-d54a-5471-a58b-7a783a7a9e5b@redhat.com>
 <20220223164528.GE3113@kunlun.suse.cz>
 <f832a836-b6ee-ffc5-6f83-86c9ba475400@redhat.com>
 <20220223171235.GF3113@kunlun.suse.cz>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220223171235.GF3113@kunlun.suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, David Herrmann <dh.herrmann@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Simon Trimmer <simont@opensource.cirrus.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Martin Mares <mj@ucw.cz>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-video@atrey.karlin.mff.cuni.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/23/22 18:12, Michal Suchánek wrote:
> On Wed, Feb 23, 2022 at 05:54:54PM +0100, Javier Martinez Canillas wrote:

[snip]

>>
>> Yes, that's what I tried to say. But your commit message says "To enable
>> use of VESA modes with simplefb in legacy BIOS boot mode" and that isn't
>> accurate AFAIU (unless you meant sysfb instead).
> 
>  config SYSFB_SIMPLEFB
>         bool "Mark VGA/VBE/EFI FB as generic system framebuffer"
>         depends on SYSFB
> +       select BOOT_VESA_SUPPORT if X86
> 
> This to me means that it's simplefb specifically that requires it, not sysfb.
> More precisely SYSFB_SIMPLEFB which is the simplefb implementation on top of
> legacy BIOS.
> 

Ok, I see what you meant. The fact that simplefb is what's named to the part
of the sysfb driver that register the "simple-framebuffer" platform device
and also the name of the fbdev driver that matches the "simple-framebuffer"
is too confusing.

My point about the subject line remains thought, I would use something like:

firmware: sysfb: Enable boot time VESA graphic mode selection for simplefb

But I'll stop bike-shedding this. I don't mind if you keep the current line
and feel free to keep my r-b tag.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

