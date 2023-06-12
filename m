Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E2A72CE29
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 20:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FC910E064;
	Mon, 12 Jun 2023 18:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C92E10E064
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 18:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686594625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ytk4CBUD5ymgdb/TV8v27oVrKqeWA1Ac0y1484kVuMA=;
 b=Ns2DTuh91AG7n9kAg7VJ675+fJ3EqI7ZPZhpG8UG1tmhhebeuzRJC4oqTHiGQKizRk6fly
 A1L2Zdyk5Df+V6BBVreZlr9dWUuSchui9W2TRgWSVZ9ec/1wWPpbkDptOZCTI71a4RASsJ
 ABdpwltxmK+D6g7rMXsCCVbCto6mMY8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-Qh12HmReN5SCnnwpNp3Ksg-1; Mon, 12 Jun 2023 14:30:23 -0400
X-MC-Unique: Qh12HmReN5SCnnwpNp3Ksg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f7e6582938so87826065e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 11:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686594622; x=1689186622;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ytk4CBUD5ymgdb/TV8v27oVrKqeWA1Ac0y1484kVuMA=;
 b=EEOC5hfjCaQjjVPWfxl6BYJojys0yG1EgJTD88PtH6LwOQVqKsT46Sx9ufQ4w1SG1w
 U3AM088IyE+VahE4JuDwofe70k7PAUghT7alTjWBy5qKpIXC7j9+3IiPS5r+clAAI1CW
 ///kW8xWtn3x00RqnDfk0O3gP4Dseo/mbpSljc9t5MQrv3Y0Mj04TYg8tSyjm7eY2lrg
 pmXfwndnebtVBexd5M290I5z0xn+LPnZTEZmcxL2amQm/uacH24ks2bD6KM00SLxn+al
 m3mV8ggWtv+6XwEzgKmyeOi7SjUT5dlqDvOKxV78fkrG8dVCIbk+b5RqM0NHLu226ALD
 Rdyw==
X-Gm-Message-State: AC+VfDyYsOFWSfrKwhnRH8zcPIEsKJZoqEzAKijy2a4RiR7xdbUM+1mH
 xt9laEG382Iu6AxKF1yaFXC/3eeqOKOL1PbKxP1m9tVd/ElpO6gbJc76ORJURFIcUfHVDPFJf0U
 RCBGv5XK9fmAEvrCFFdqwUuhhGNxr
X-Received: by 2002:a05:600c:2297:b0:3f7:f544:4993 with SMTP id
 23-20020a05600c229700b003f7f5444993mr8211871wmf.20.1686594622671; 
 Mon, 12 Jun 2023 11:30:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6f87goxu4tLEIjzoynyJtL5A/keJi5mHvAB0RC30rg0lgcZJDIaJ1gEOYrsjRA3uu+QEeiPA==
X-Received: by 2002:a05:600c:2297:b0:3f7:f544:4993 with SMTP id
 23-20020a05600c229700b003f7f5444993mr8211850wmf.20.1686594622317; 
 Mon, 12 Jun 2023 11:30:22 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r15-20020adfda4f000000b002fe96f0b3acsm13271835wrl.63.2023.06.12.11.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 11:30:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Conor Dooley <conor@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/5] dt-bindings: display: ssd1307fb: Remove default
 width and height values
In-Reply-To: <20230612-parade-sauciness-16225ce0a643@spud>
References: <20230609170941.1150941-1-javierm@redhat.com>
 <20230609170941.1150941-3-javierm@redhat.com>
 <20230610-opposite-quality-81d4a1561c88@spud>
 <87r0qj19zs.fsf@minerva.mail-host-address-is-not-set>
 <20230610-unused-engaged-c1f4119cff08@spud>
 <87jzwa29ff.fsf@minerva.mail-host-address-is-not-set>
 <d4828a3d-639a-a207-ff36-45c8c5d4d311@suse.de>
 <20230612-parade-sauciness-16225ce0a643@spud>
Date: Mon, 12 Jun 2023 20:30:21 +0200
Message-ID: <87h6rc354y.fsf@minerva.mail-host-address-is-not-set>
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
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Conor Dooley <conor@kernel.org> writes:

> On Mon, Jun 12, 2023 at 09:47:12AM +0200, Thomas Zimmermann wrote:
>> Am 11.06.23 um 01:18 schrieb Javier Martinez Canillas:
>
>> > But I will be OK to drop the "solomon,ssd130?fb-i2c" compatible strings
>> > from the DRM driver and only match against the new "solomon,ssd130?-i2c"
>> > compatible strings. And add a different DT binding schema for the ssd130x
>> > driver, if that would mean being able to fix things like the one mentioned
>> > in this patch.
>
> If there are different compatibles, then it can always be sorted out
> later iff it turns out to be a problem, since new devicetrees should not
> be using the deprecated compatibles anyway. I didn't realise that those
> deprecated compatibles existed, thanks for your patience.
>

No worries, thanks for raising this question.

>> > In my opinion, trying to always make the drivers backward compatible with
>> > old DTBs only makes the drivers code more complicated for unclear benefit.
>> > 
>> > Usually this just ends being code that is neither used nor tested. Because
>> > in practice most people update the DTBs and kernels, instead of trying to
>> > make the DTB a stable ABI like firmware.
>> > 
>> 
>> From my understanding, fixing the resolution is the correct thing to do
>> here. Userspace needs to be able to handle these differences.
>
> Fixing meaning correcting, or fixing meaning using a fixed resolution?
> Not clear to me what you mean, sorry.
>

Fixing meaning using as a default the correct maximum resolution for each
OLED controller, rather than an arbitrary 96x16 resolution that was added
just to be compatible with the panel that was tested the original driver.

But after talking with Thomas and Maxime about this issue, I realized that
it won't even cause an issue for theoretical users that may be relying on
the previous default.

Changing the default resolution to something smaller could cause an issue
since a user expecting a bigger default would get their display output cut
but changing to something bigger just means user-space being able to write
more pixels than those that will be displayed.

Because there isn't really a "resolution" configured in the chip, but just
how many pixels a particular controller can drive. The new default is the
maximum that each controller supports according to their documentation.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

