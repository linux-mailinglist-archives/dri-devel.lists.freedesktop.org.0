Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D82B14D2ED3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 13:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B1110E711;
	Wed,  9 Mar 2022 12:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC7B10E6D4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 12:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646828070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Kl3CbAiIPf88g8wafhD6r4bIq/M8sPBvoSh/EABNic=;
 b=C8SePWijUbYQFGp/T5LLZSchq6TnWtPK245mPvSljcnYbs6JyAY7xZr5mzBKnk4WxpmPa3
 /azp1hiZ3cjN86gYMdIA0L9sgUhEk7ysqtUwSLlp6jhix9HnFcAL8lyfyfiF2ZECfhYhGL
 JVlKhGRkvZD3tuoXEn9NDpgv76jJReM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-dKY32mRHMrqwkfRZYPOcaQ-1; Wed, 09 Mar 2022 07:14:28 -0500
X-MC-Unique: dKY32mRHMrqwkfRZYPOcaQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l2-20020a1ced02000000b0038482a47e7eso2511943wmh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 04:14:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8Kl3CbAiIPf88g8wafhD6r4bIq/M8sPBvoSh/EABNic=;
 b=5CVeLWLauQRo2Pl4W7rMxAjsY3Cs/c3AZpCl+JhmSP/H5K+xBai+9oGFtwv+Er2FWu
 +MnZj7B3tZleUm8Nmub+ww/DINpauNIZuch0MkRRYcJHIrqCwEUMFBzgs2iOP6axEhlT
 i8MWgbhL8N1RYmP6T3WBjqwlwjE4nN4YDS6GE5/wMuc+vjbOH9uIheHaHa1wtIecvP9J
 oaNc2hgCTFkMdMZo0dom2GtTq4+H2Ufx3cPcf7bmRMHxJVD7MEkVCqswOdkoiRovKEnb
 20j3Bz7y6VyX1snrpqFy/VnfO57RjlGsIcJdbJ1x0JXTXRFy+R3gkxNyoQhRlyzM2rFv
 Sxkw==
X-Gm-Message-State: AOAM5324MUApzpSgpeBUL/w1Odo5hoACdkdoS2AbleeiRkMNhScAb7vp
 M8FqfSTtIp4bh5FaswMlLq1nKvqVrgclQE4jHFbsEzSLZtHzZ4k/w4nqXBwzy6My9Tsyfq/EN9c
 J8ASUWI3Z4xrkjlFPh0hKhqLGZDrY
X-Received: by 2002:a5d:648c:0:b0:1ed:b04d:300 with SMTP id
 o12-20020a5d648c000000b001edb04d0300mr13166110wri.347.1646828066933; 
 Wed, 09 Mar 2022 04:14:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3UMGGyzhv+uJG0YcGPT0R4FgUq8Duwca8TEkpNAynB28fPmXTqBLd6qfLu7hu31ClWemckA==
X-Received: by 2002:a5d:648c:0:b0:1ed:b04d:300 with SMTP id
 o12-20020a5d648c000000b001edb04d0300mr13166094wri.347.1646828066722; 
 Wed, 09 Mar 2022 04:14:26 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 m185-20020a1c26c2000000b003899ed333ffsm4684434wmm.47.2022.03.09.04.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 04:14:17 -0800 (PST)
Message-ID: <fd6ec463-f46d-0813-5d87-a00c07739e01@redhat.com>
Date: Wed, 9 Mar 2022 13:14:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 3/6] drm: Add driver for Solomon SSD130x OLED displays
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220214133710.3278506-1-javierm@redhat.com>
 <20220214133710.3278506-4-javierm@redhat.com>
 <CAMuHMdU+29x4ZHLAiPiReyLKw_VYBCCLw0bCoQmw9s6sQ4Bxcw@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdU+29x4ZHLAiPiReyLKw_VYBCCLw0bCoQmw9s6sQ4Bxcw@mail.gmail.com>
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/8/22 17:30, Geert Uytterhoeven wrote:
> Hi Javier,
> 
> On Mon, Feb 14, 2022 at 2:37 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> This adds a DRM driver for SSD1305, SSD1306, SSD1307 and SSD1309 Solomon
>> OLED display controllers.
>>
>> It's only the core part of the driver and a bus specific driver is needed
>> for each transport interface supported by the display controllers.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Thanks for your patch, which is now commit a61732e808672cfa ("drm:
> Add driver for Solomon SSD130x OLED displays") in drm/drm-next
> 
> Sorry for the delay, but finally I gave it a try on my Adafruit
> FeatherWing 128x32 OLED.
> Some of the weird issues (cursor disappears after printing some text,
> more text also doesn't appear until I clear the display) are still there.

I see. Thought that I tested using it as a console and it did work
correctly for me. I'll do more tests again.

> Unfortunately a regression was introduced since your v3: printed
> text is mirrored upside-down. I.e. "E" is rendered correctly, but "L"
> turns into "Γ" (Greek Gamma).
> I suspect something went wrong with the display initialization
> sequence.
>

Could you please try Chen-Yu's fix for the COM scan direction mask ?

https://lists.freedesktop.org/archives/dri-devel/2022-March/345915.html

I made a mistake when converting to use the GENMASK() and FIELD_PREP()
macros in v4 as suggested by Andy. The SSD130X_SET_COM_SCAN_DIR_MASK
wasn't correct which would explain the output to be vertically flipped.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

