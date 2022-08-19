Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4DC599966
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 12:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F57310E0A5;
	Fri, 19 Aug 2022 10:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A5D10E41A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 10:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660903534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ClrqC6xI3y34Msl2MghOyY6wxIWtFZ3bYpyy58JPY0M=;
 b=ewMUXRkHFBhfedn4ytU/x0XKNenTNUOPk2ou2/Jqs1n4dRh9xBRkC//rmKfFv03ZJyG8ZX
 2EjSfVgAFo71mew2DTPksFKq7/nF0guIEZCpCM1IcVhkiRYQSvEE5IOpm3IX1vpVcPEWMA
 pEdxzzWUSnasPx8D00eddLc4xsThr4k=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-493-aiVOYlSyPpCWl4m4sVtPJA-1; Fri, 19 Aug 2022 06:05:33 -0400
X-MC-Unique: aiVOYlSyPpCWl4m4sVtPJA-1
Received: by mail-ej1-f70.google.com with SMTP id
 nb10-20020a1709071c8a00b006e8f89863ceso1327430ejc.18
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 03:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ClrqC6xI3y34Msl2MghOyY6wxIWtFZ3bYpyy58JPY0M=;
 b=z8rLlpAaPw+/tGk37zrTJ96KwuB3pOhjY7NepOCOTeNsoRlCPY086iT7jYMheXEbrt
 iquAHd/TjwULSDh3IY9Y01wlHOx3n8yM7FoOarOf5Sn5el3Xdow26SFsvdrCagMQmgP8
 JcZzyKrixPArsNLIbhYgAF6dpjWYl6futYAITjsxhtM4qoSVZ6tpNOkEDQz93YUUIdqB
 SWrdEVQnzcJWwPExvCW7rZzDlZ3Mxfv2EEGEyoOUKMMSQ80atfRftcVF589CpotQ3ouE
 6xd2opyOI/bbmYLMAk/78Jvxq5XQBHJJUhkq56znYdkCAY1f1zuhAeecBjyjFIBOZu65
 KOLg==
X-Gm-Message-State: ACgBeo3iJtnqfKO0J7uglhKzVyoF1ElyH1VQl9QC14BOT/9l7EY0Xhn4
 w19sFq+Vj6L/FqFJzHgqdmPnykb+j6ctwnIeAy640yVVx5bmIme2gPmBELQusaJH8AEU8sCYMVq
 vs+bjP/h3a1y4yhh6P1TkANaAYFV4
X-Received: by 2002:a05:6402:84e:b0:440:4bac:be5a with SMTP id
 b14-20020a056402084e00b004404bacbe5amr5564249edz.103.1660903532665; 
 Fri, 19 Aug 2022 03:05:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7fU47agb0EFZDnJX43gsuZ1SU7OR4Ob90bb0C5SXvvscJYiU83fnrABD1bw+CGIeNcDMsT+g==
X-Received: by 2002:a05:6402:84e:b0:440:4bac:be5a with SMTP id
 b14-20020a056402084e00b004404bacbe5amr5564218edz.103.1660903532345; 
 Fri, 19 Aug 2022 03:05:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 q29-20020a056402249d00b0043ca6fb7e7dsm2780438eda.68.2022.08.19.03.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 03:05:31 -0700 (PDT)
Message-ID: <d5767b2e-a20f-43ca-61d7-6ea577b31188@redhat.com>
Date: Fri, 19 Aug 2022 12:05:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 15/31] platform/x86: nvidia-wmi-ec-backlight: Move fw
 interface definitions to a header
To: Daniel Dadap <ddadap@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui <Xinhui.Pan@amd.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@kernel.org>
References: <20220818184302.10051-1-hdegoede@redhat.com>
 <20220818184302.10051-16-hdegoede@redhat.com>
 <12cc48c5-b54f-1eb7-c268-beb98bce2a5d@nvidia.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <12cc48c5-b54f-1eb7-c268-beb98bce2a5d@nvidia.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 8/18/22 21:38, Daniel Dadap wrote:
> 
> On 8/18/22 1:42 PM, Hans de Goede wrote:
>> Move the WMI interface definitions to a header, so that the definitions
>> can be shared with drivers/acpi/video_detect.c .
>>
>> Suggested-by: Daniel Dadap <ddadap@nvidia.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   MAINTAINERS                                   |  1 +
>>   .../platform/x86/nvidia-wmi-ec-backlight.c    | 66 +----------------
>>   .../x86/nvidia-wmi-ec-backlight.h             | 70 +++++++++++++++++++
>>   3 files changed, 72 insertions(+), 65 deletions(-)
>>   create mode 100644 include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 8a5012ba6ff9..8d59c6e9b4db 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -14526,6 +14526,7 @@ M:    Daniel Dadap <ddadap@nvidia.com>
>>   L:    platform-driver-x86@vger.kernel.org
>>   S:    Supported
>>   F:    drivers/platform/x86/nvidia-wmi-ec-backlight.c
>> +F:    include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h
>>     NVM EXPRESS DRIVER
>>   M:    Keith Busch <kbusch@kernel.org>
>> diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
>> index 61e37194df70..e84e1d629b14 100644
>> --- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
>> +++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
>> @@ -7,74 +7,10 @@
>>   #include <linux/backlight.h>
>>   #include <linux/mod_devicetable.h>
>>   #include <linux/module.h>
>> +#include <linux/platform_data/x86/nvidia-wmi-ec-backlight.h>
>>   #include <linux/types.h>
>>   #include <linux/wmi.h>
>>   -/**
>> - * enum wmi_brightness_method - WMI method IDs
>> - * @WMI_BRIGHTNESS_METHOD_LEVEL:  Get/Set EC brightness level status
>> - * @WMI_BRIGHTNESS_METHOD_SOURCE: Get/Set EC Brightness Source
>> - */
>> -enum wmi_brightness_method {
>> -    WMI_BRIGHTNESS_METHOD_LEVEL = 1,
>> -    WMI_BRIGHTNESS_METHOD_SOURCE = 2,
>> -    WMI_BRIGHTNESS_METHOD_MAX
>> -};
>> -
>> -/**
>> - * enum wmi_brightness_mode - Operation mode for WMI-wrapped method
>> - * @WMI_BRIGHTNESS_MODE_GET:            Get the current brightness level/source.
>> - * @WMI_BRIGHTNESS_MODE_SET:            Set the brightness level.
>> - * @WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL:  Get the maximum brightness level. This
>> - *                                      is only valid when the WMI method is
>> - *                                      %WMI_BRIGHTNESS_METHOD_LEVEL.
>> - */
>> -enum wmi_brightness_mode {
>> -    WMI_BRIGHTNESS_MODE_GET = 0,
>> -    WMI_BRIGHTNESS_MODE_SET = 1,
>> -    WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL = 2,
>> -    WMI_BRIGHTNESS_MODE_MAX
>> -};
>> -
>> -/**
>> - * enum wmi_brightness_source - Backlight brightness control source selection
>> - * @WMI_BRIGHTNESS_SOURCE_GPU: Backlight brightness is controlled by the GPU.
>> - * @WMI_BRIGHTNESS_SOURCE_EC:  Backlight brightness is controlled by the
>> - *                             system's Embedded Controller (EC).
>> - * @WMI_BRIGHTNESS_SOURCE_AUX: Backlight brightness is controlled over the
>> - *                             DisplayPort AUX channel.
>> - */
>> -enum wmi_brightness_source {
>> -    WMI_BRIGHTNESS_SOURCE_GPU = 1,
>> -    WMI_BRIGHTNESS_SOURCE_EC = 2,
>> -    WMI_BRIGHTNESS_SOURCE_AUX = 3,
>> -    WMI_BRIGHTNESS_SOURCE_MAX
>> -};
>> -
>> -/**
>> - * struct wmi_brightness_args - arguments for the WMI-wrapped ACPI method
>> - * @mode:    Pass in an &enum wmi_brightness_mode value to select between
>> - *           getting or setting a value.
>> - * @val:     In parameter for value to set when using %WMI_BRIGHTNESS_MODE_SET
>> - *           mode. Not used in conjunction with %WMI_BRIGHTNESS_MODE_GET or
>> - *           %WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL mode.
>> - * @ret:     Out parameter returning retrieved value when operating in
>> - *           %WMI_BRIGHTNESS_MODE_GET or %WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL
>> - *           mode. Not used in %WMI_BRIGHTNESS_MODE_SET mode.
>> - * @ignored: Padding; not used. The ACPI method expects a 24 byte params struct.
>> - *
>> - * This is the parameters structure for the WmiBrightnessNotify ACPI method as
>> - * wrapped by WMI. The value passed in to @val or returned by @ret will be a
>> - * brightness value when the WMI method ID is %WMI_BRIGHTNESS_METHOD_LEVEL, or
>> - * an &enum wmi_brightness_source value with %WMI_BRIGHTNESS_METHOD_SOURCE.
>> - */
>> -struct wmi_brightness_args {
>> -    u32 mode;
>> -    u32 val;
>> -    u32 ret;
>> -    u32 ignored[3];
>> -};
>> -
>>   /**
>>    * wmi_brightness_notify() - helper function for calling WMI-wrapped ACPI method
>>    * @w:    Pointer to the struct wmi_device identified by %WMI_BRIGHTNESS_GUID
>> diff --git a/include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h b/include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h
>> new file mode 100644
>> index 000000000000..d83104c6c6cb
>> --- /dev/null
>> +++ b/include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h
>> @@ -0,0 +1,70 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
> 
> 
> Should the copyright notice from nvidia-wmi-ec-backlight be copied here as well?

Ah right, I forgot that. I'll fix that for version 4 of the series.

I'll also make the GUID a #define for version 4 of the series as
you mentioned in one of your other remarks.

>> +#ifndef __PLATFORM_DATA_X86_NVIDIA_WMI_EC_BACKLIGHT_H
>> +#define __PLATFORM_DATA_X86_NVIDIA_WMI_EC_BACKLIGHT_H
>> +
>> +/**
>> + * enum wmi_brightness_method - WMI method IDs
>> + * @WMI_BRIGHTNESS_METHOD_LEVEL:  Get/Set EC brightness level status
>> + * @WMI_BRIGHTNESS_METHOD_SOURCE: Get/Set EC Brightness Source
>> + */
>> +enum wmi_brightness_method {
>> +    WMI_BRIGHTNESS_METHOD_LEVEL = 1,
>> +    WMI_BRIGHTNESS_METHOD_SOURCE = 2,
>> +    WMI_BRIGHTNESS_METHOD_MAX
>> +};
> 
> 
> It might be nice, but certainly not essential, to namespace these better, now that they're no longer internal to the EC backlight driver. I did that in the version of this change that I had started working up, but got kind of annoyed that it made a lot of lines go over 80 columns, and then got distracted by other work and never ended up finishing the change up. I guess it's probably fine to leave them as is, since there won't be many files that include this header.

This header is only used in 2 .c files, as such I'm not worried about
namespacing the defines, so my plan for version 4 is to just keep
this as is.

Regards,

Hans


> 
> 
>> +
>> +/**
>> + * enum wmi_brightness_mode - Operation mode for WMI-wrapped method
>> + * @WMI_BRIGHTNESS_MODE_GET:            Get the current brightness level/source.
>> + * @WMI_BRIGHTNESS_MODE_SET:            Set the brightness level.
>> + * @WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL:  Get the maximum brightness level. This
>> + *                                      is only valid when the WMI method is
>> + *                                      %WMI_BRIGHTNESS_METHOD_LEVEL.
>> + */
>> +enum wmi_brightness_mode {
>> +    WMI_BRIGHTNESS_MODE_GET = 0,
>> +    WMI_BRIGHTNESS_MODE_SET = 1,
>> +    WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL = 2,
>> +    WMI_BRIGHTNESS_MODE_MAX
>> +};
>> +
>> +/**
>> + * enum wmi_brightness_source - Backlight brightness control source selection
>> + * @WMI_BRIGHTNESS_SOURCE_GPU: Backlight brightness is controlled by the GPU.
>> + * @WMI_BRIGHTNESS_SOURCE_EC:  Backlight brightness is controlled by the
>> + *                             system's Embedded Controller (EC).
>> + * @WMI_BRIGHTNESS_SOURCE_AUX: Backlight brightness is controlled over the
>> + *                             DisplayPort AUX channel.
>> + */
>> +enum wmi_brightness_source {
>> +    WMI_BRIGHTNESS_SOURCE_GPU = 1,
>> +    WMI_BRIGHTNESS_SOURCE_EC = 2,
>> +    WMI_BRIGHTNESS_SOURCE_AUX = 3,
>> +    WMI_BRIGHTNESS_SOURCE_MAX
>> +};
>> +
>> +/**
>> + * struct wmi_brightness_args - arguments for the WMI-wrapped ACPI method
>> + * @mode:    Pass in an &enum wmi_brightness_mode value to select between
>> + *           getting or setting a value.
>> + * @val:     In parameter for value to set when using %WMI_BRIGHTNESS_MODE_SET
>> + *           mode. Not used in conjunction with %WMI_BRIGHTNESS_MODE_GET or
>> + *           %WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL mode.
>> + * @ret:     Out parameter returning retrieved value when operating in
>> + *           %WMI_BRIGHTNESS_MODE_GET or %WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL
>> + *           mode. Not used in %WMI_BRIGHTNESS_MODE_SET mode.
>> + * @ignored: Padding; not used. The ACPI method expects a 24 byte params struct.
>> + *
>> + * This is the parameters structure for the WmiBrightnessNotify ACPI method as
>> + * wrapped by WMI. The value passed in to @val or returned by @ret will be a
>> + * brightness value when the WMI method ID is %WMI_BRIGHTNESS_METHOD_LEVEL, or
>> + * an &enum wmi_brightness_source value with %WMI_BRIGHTNESS_METHOD_SOURCE.
>> + */
>> +struct wmi_brightness_args {
>> +    u32 mode;
>> +    u32 val;
>> +    u32 ret;
>> +    u32 ignored[3];
>> +};
>> +
>> +#endif
> 

