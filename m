Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2597C6B774A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 13:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4658D10E097;
	Mon, 13 Mar 2023 12:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60B310E097
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 12:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678709754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lXPYbBYCTYiMKrYNBmUMEnReGM9kweVlcHiDWAi6CGI=;
 b=XTnkFtOlVbv5wGmjOma+GCtCl7yB/S/Xv6GxleHrUxqacd5gORTflmfmYan4+sccszZV0G
 89kPc+07jvZ8RqxCwPrAz9MIADAfCZQGFZP7SmfZqLZ05kT2ROdJMZdEmssNxJFuD6f3ya
 YVtjhDqS0Ba83E1KBiVpBhMpWdpvgqU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-fC0-SaTuM5aJnf6LTsPy-w-1; Mon, 13 Mar 2023 08:15:51 -0400
X-MC-Unique: fC0-SaTuM5aJnf6LTsPy-w-1
Received: by mail-ed1-f70.google.com with SMTP id
 r9-20020a05640251c900b004d4257341c2so16653271edd.19
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 05:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678709750;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lXPYbBYCTYiMKrYNBmUMEnReGM9kweVlcHiDWAi6CGI=;
 b=4bmOg7BV1iqiVeCjDUBI8lwzUriLVeQUM3UmbN+CXXIv9npWu2aJywKOk8D2EEMSsc
 vQKAiS3nROTGitn/xFd6jV8navWqyv9mTfORtRzQNJsheIbIqp8TS0bK6UjLJZIWY0Ey
 aE50fdwm+6HTswP1TBeQbnQ7BgUVTmrzF0BOcwAlE+XdXfAPCBM3otd1UStUHDQoxnp4
 xTZm5mUTZ7MWaV0GorYx32xpDmyjdy+/zZq5EM9EVEzhCcBxvHUG78IlM7AXMvI7ZykA
 opcypu8Oa0rnAA8fHPJUYFLUjTQdQjpgXSLE4Lmx6RHX/m/mGjaYV9Q7PsmY0z9uqU0V
 s5Qg==
X-Gm-Message-State: AO0yUKUQT810iJjd6HjgobLd4vS2PYhXjI+wVNRlEZ+W5wPxwlURtp4x
 jckqM7pogI0sgVk6ninlqbhhd72Akn7O2b8HQZo9V7djw1LZzl7ipc9+NtP1YnifAr3VabrWfld
 3t7CD7sCYIpyxE7jv70cosAmtfqJw
X-Received: by 2002:a17:906:5857:b0:878:81d7:9f77 with SMTP id
 h23-20020a170906585700b0087881d79f77mr30905950ejs.34.1678709750509; 
 Mon, 13 Mar 2023 05:15:50 -0700 (PDT)
X-Google-Smtp-Source: AK7set9Z5b6MLUkGKVg3T2p+PspkIBkQYBJ2aBl5xrk9I6UV7xAL0Qnjp/YptrZXGlySHUMvNN+nNA==
X-Received: by 2002:a17:906:5857:b0:878:81d7:9f77 with SMTP id
 h23-20020a170906585700b0087881d79f77mr30905930ejs.34.1678709750285; 
 Mon, 13 Mar 2023 05:15:50 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 ho20-20020a1709070e9400b00927e0fb3e50sm1506984ejc.100.2023.03.13.05.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 05:15:49 -0700 (PDT)
Message-ID: <a3a87570-5885-6954-4b20-b7a5201c0a07@redhat.com>
Date: Mon, 13 Mar 2023 13:15:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] backlight: apple_bl: Use acpi_video_get_backlight_type()
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <20230307120540.389920-1-hdegoede@redhat.com>
 <20230309170911.GC96419@aspen.lan>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230309170911.GC96419@aspen.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Andy Shevchenko <andy@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Mark Gross <markgross@kernel.org>,
 Aditya Garg <gargaditya08@live.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/9/23 18:09, Daniel Thompson wrote:
> On Tue, Mar 07, 2023 at 01:05:40PM +0100, Hans de Goede wrote:
>> On some MacBooks both the apple_bl and the apple-gmux backlight drivers
>> may be able to export a /sys/class/backlight device.
>>
>> To avoid having 2 backlight devices for one LCD panel until now
>> the apple-gmux driver has been calling apple_bl_unregister() to move
>> the apple_bl backlight device out of the way when it loads.
>>
>> Similar problems exist on other x86 laptops and all backlight drivers
>> which may be used on x86 laptops have moved to using
>> acpi_video_get_backlight_type() to determine whether they should load
>> or not.
>>
>> Switch apple_bl to this model too, so that it is consistent with all
>> the other x86 backlight drivers.
>> [snip]
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> but...

Thank you.

>> ---
>> A note to the backlight class / subsystem maintainers, this change
>> applies on top of a similar patch for drivers/platform/x86/apple-gmux.c
>> which makes that driver use acpi_video_get_backlight_type(). See:
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>
>> I believe it is easiest to also merge this patch through
>> the platform-drivers-x86 tree, may I please have your Ack for this ?
>> ---
> 
> ... please don't treat above as an ack. Lee Jones will hopefully be
> along shortly to discuss that!

Understood.

Regards,

Hans

