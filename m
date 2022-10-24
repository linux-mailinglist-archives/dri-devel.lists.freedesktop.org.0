Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15FE60AE65
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 16:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3734B89E47;
	Mon, 24 Oct 2022 14:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF6389E47
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 14:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666623568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iFzj8nzx4mTmz0Y3cxobVCxkf6lqhopWzXipdhBzytA=;
 b=dYhsH/l/l8+cgL2gvn44dalWRv3QC1hPkk0/cNHZidmOMBeI+9xguNOpYM0GtHRVniF9vj
 ila2HjGO0+WqFP1IWZC121WTBC8jp2hb6xHSWK1sssqmMZ0D21IImZjBNdXGm+/X6PeO+B
 d+iv6EvjPpJARpQLJ686ca3WIZ861vs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-547-SFjSbGWyOlqWINSI5SjECg-1; Mon, 24 Oct 2022 10:59:26 -0400
X-MC-Unique: SFjSbGWyOlqWINSI5SjECg-1
Received: by mail-ej1-f71.google.com with SMTP id
 sc11-20020a1709078a0b00b0078d95df8a2eso1142882ejc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 07:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iFzj8nzx4mTmz0Y3cxobVCxkf6lqhopWzXipdhBzytA=;
 b=hwqzgf5Kn1H9Gf1zKIzzDOKppyQjgErlW9mqPlws4sIXkivcD6jo5k1VzoLd59U/Cc
 35BtkrdI0qqtkOaSOJihaKeOf4LvdVQiKjMoLgtha1+/nyOqSpGhEGAOTx6fP6ViXiMQ
 c9gBPP3jBGHRrHMluOlP04NYb3hgRrhIZpQA1mNRGCWgHPtGq2fBSsx86AWIT7SQvYUD
 /aO6V00FwaiNFvHpsmpcUW7eGIMRpfX9KMYL3extI4QJPySTSwRAO0Am7iWgMIL1Lc3I
 9hG5TX1v50av1ZbTcnHJcU5pIA07MeYRvme5zhEs+0B5xcLMkzODj+IlxobSVsSzifWK
 JZvg==
X-Gm-Message-State: ACrzQf18sHCAA2Z7fATRTtR9W+CkXqEiZU6Ld2S9dcBEgv03lHXFhL/D
 ZRR+5bellA3cyiLCGDzYK6H6tGELylaXACqzemeObU9bwihUSJw/xi9ahcZzX1lMXntEIvt3al3
 DirFFQYIQVWuav2gJYnYycZ09R8vu
X-Received: by 2002:a17:907:7f0b:b0:78d:c16e:e5fc with SMTP id
 qf11-20020a1709077f0b00b0078dc16ee5fcmr28530517ejc.713.1666623565728; 
 Mon, 24 Oct 2022 07:59:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM69bJEQQwKngd5TdTH6bub92gbhuYs2zsoHIkPxYVrqbL3E1umD+fdI6rLXDyn6eS9NZQ41YA==
X-Received: by 2002:a17:907:7f0b:b0:78d:c16e:e5fc with SMTP id
 qf11-20020a1709077f0b00b0078dc16ee5fcmr28530490ejc.713.1666623565451; 
 Mon, 24 Oct 2022 07:59:25 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a170906379000b007a6c25819f1sm2043335ejc.145.2022.10.24.07.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:59:24 -0700 (PDT)
Message-ID: <a75c2439-415c-a132-754c-7676029f792b@redhat.com>
Date: Mon, 24 Oct 2022 16:59:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] ACPI: video: Fix missing native backlight on
 Chromebooks
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sean Paul <seanpaul@chromium.org>
References: <20221024141210.67784-1-dmitry.osipenko@collabora.com>
 <37ec64ac-9e08-dd41-4b20-8701bf9413fb@daynix.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <37ec64ac-9e08-dd41-4b20-8701bf9413fb@daynix.com>
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
Cc: linux-acpi@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/24/22 16:52, Akihiko Odaki wrote:
> On 2022/10/24 23:12, Dmitry Osipenko wrote:
>> Chromebooks don't have backlight in ACPI table, they suppose to use
>> native backlight in this case. Check presence of the CrOS embedded
>> controller ACPI device and prefer the native backlight if EC found.
>>
>> Suggested-by: Hans de Goede <hdegoede@redhat.com>
>> Fixes: 2600bfa3df99 ("ACPI: video: Add acpi_video_backlight_use_native() helper")
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>
>> Changelog:
>>
>> v2: - Added explanatory comment to the code and added check for the
>>        native backlight presence, like was requested by Hans de Goede.
>>
>>   drivers/acpi/video_detect.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
>> index 0d9064a9804c..9cd8797d12bb 100644
>> --- a/drivers/acpi/video_detect.c
>> +++ b/drivers/acpi/video_detect.c
>> @@ -668,6 +668,11 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
>>       { },
>>   };
>>   +static bool google_cros_ec_present(void)
>> +{
>> +    return acpi_dev_found("GOOG0004");
>> +}
>> +
>>   /*
>>    * Determine which type of backlight interface to use on this system,
>>    * First check cmdline, then dmi quirks, then do autodetect.
>> @@ -730,6 +735,13 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>>               return acpi_backlight_video;
>>       }
>>   +    /*
>> +     * Chromebooks that don't have backlight handle in ACPI table
>> +     * are supposed to use native backlight if it's available.
>> +     */
>> +    if (google_cros_ec_present() && native_available)
>> +        return acpi_backlight_native;
>> +
>>       /* No ACPI video (old hw), use vendor specific fw methods. */
>>       return acpi_backlight_vendor;
>>   }
> 
> Hi,
> 
> The native_available check does not prevent duplicate registration if vendor backlight registers first. It was enough for the combination of ACPI video and native because ACPI video delays its registration, but it is not the case for vendor/native combination.

There are no drivers providing acpi_backlight_vendor functionality on chromebooks.

All the drivers providing acpi_backlight_vendor functionality use vendor (Dell, Acer, Asus, etc.)
specific firmware (smbios, EC bitbanging or ACPI) backlight control method which are not available
on CoreBoot based ChromeBooks.

Also notice that the theoretical problem of a vendor driver loading first was already present
before the backlight refactor which landed in 6.1 and this has never been an issue.

Regards,

Hans

