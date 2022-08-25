Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 797685A0BF2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 10:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADA111B54A;
	Thu, 25 Aug 2022 08:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13ACB11B54D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 08:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661417684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7OWfNCpLdSo1viH5XGsi5IJxCkX8SeFaK11y2Vq0C60=;
 b=JjG106Rd4syvV61SMdTaGFUnpvDBnlWKn4u/qPh/3QxN0/4s+Gc3BuRyt0GTPncMmjvFUi
 6vHKXTNgeBNv8EZzT7OwHXh6I2mnzre4ZeURK2rOPXsw0fEuDTUGOiPY1wH8HBB8Gz/EN/
 NWmhPe1W6daQTok8Wvc/gUIh+SJnxeE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-150-HmJi1B7WNTmSzZXFf23tjA-1; Thu, 25 Aug 2022 04:54:41 -0400
X-MC-Unique: HmJi1B7WNTmSzZXFf23tjA-1
Received: by mail-ej1-f72.google.com with SMTP id
 qw34-20020a1709066a2200b00730ca5a94bfso5974012ejc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 01:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=7OWfNCpLdSo1viH5XGsi5IJxCkX8SeFaK11y2Vq0C60=;
 b=uFZxXlSNIOJxEwZFTu89Hij4Q2T0NILXC/X2qwic66rHFnOwC7vpoYOxtkVVc3tEId
 s2HdYHehrepzuwXtplfTtFJ932UZqmRwe/Drhm3cS6TunGGy6EYF+Bk7q5rvJMf0CsrV
 IIo6doFSDG+Kud5rd8MulTAHZ+5eWuM0orTRfR59dCWnGIwLZYrtD4h+bmuCEmtkOTqg
 2aWm/6B32KJsVCkL8IC3sA2AeZ9RMiu35b5jZv+ZCeOH1GYAr8PEkY5KlwXsLU/DS4fS
 7L080+Gaj5si/5VO5VOR3GrnfeEzGmOO0m9pSWcqZ2jOBOAAXCvoD0yvRGKbuescpaH9
 0M0w==
X-Gm-Message-State: ACgBeo38JfoOYaTEYT6UtuSXLAjafqyABWdUJYAmUPQ/oSwvEJkX9Wee
 68k8GAN5/ha6QRMd6ImIHL4dUe7qj89a6iDJ0P5ALH9PwAei0NWL+Cym5VsjYEw59TEgrMtUAnj
 ApVTTHFIbxwgUDmlB5utkEGjowPZO
X-Received: by 2002:a17:907:728d:b0:731:8396:ea86 with SMTP id
 dt13-20020a170907728d00b007318396ea86mr1742631ejc.361.1661417679933; 
 Thu, 25 Aug 2022 01:54:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4iRqqUbLSIQozsEoevWSbUBOoNa7wZuPHEqVSEVtqoqW7Rc5PQi4B3ygUaYiDI2xHU+dtygQ==
X-Received: by 2002:a17:907:728d:b0:731:8396:ea86 with SMTP id
 dt13-20020a170907728d00b007318396ea86mr1742616ejc.361.1661417679691; 
 Thu, 25 Aug 2022 01:54:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 q23-20020a17090676d700b0073d74e1a467sm997841ejn.167.2022.08.25.01.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 01:54:39 -0700 (PDT)
Message-ID: <914dec00-65f4-f49c-9ace-39321b88e8b6@redhat.com>
Date: Thu, 25 Aug 2022 10:54:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 02/31] drm/i915: Don't register backlight when another
 backlight should be used
To: Jani Nikula <jani.nikula@linux.intel.com>, Ben Skeggs
 <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude <lyude@redhat.com>, Daniel Dadap <ddadap@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@kernel.org>
References: <20220824121523.1291269-1-hdegoede@redhat.com>
 <20220824121523.1291269-3-hdegoede@redhat.com> <87v8qhiz4f.fsf@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87v8qhiz4f.fsf@intel.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

On 8/24/22 14:50, Jani Nikula wrote:
> On Wed, 24 Aug 2022, Hans de Goede <hdegoede@redhat.com> wrote:
>> Before this commit when we want userspace to use the acpi_video backlight
>> device we register both the GPU's native backlight device and acpi_video's
>> firmware acpi_video# backlight device. This relies on userspace preferring
>> firmware type backlight devices over native ones.
>>
>> Registering 2 backlight devices for a single display really is
>> undesirable, don't register the GPU's native backlight device when
>> another backlight device should be used.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_backlight.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
>> index 681ebcda97ad..a4dd7924e0c1 100644
>> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
>> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
>> @@ -8,6 +8,8 @@
>>  #include <linux/pwm.h>
>>  #include <linux/string_helpers.h>
>>  
>> +#include <acpi/video.h>
>> +
>>  #include "intel_backlight.h"
>>  #include "intel_backlight_regs.h"
>>  #include "intel_connector.h"
>> @@ -952,6 +954,11 @@ int intel_backlight_device_register(struct intel_connector *connector)
>>  
>>  	WARN_ON(panel->backlight.max == 0);
>>  
>> +	if (!acpi_video_backlight_use_native()) {
>> +		DRM_INFO("Skipping intel_backlight registration\n");
> 
> Could use drm_info with drm_device.

Ack, fixed for v5.

> Either way,
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Thank you.

> and ack for merging via whichever tree suits you best.

My plan is to create a branch with the series on top
of 6.0-rc1 and then send a pull-req to all involved trees.

So far there are no conflicts between this branch and drm-tip...

Regards,

Hans



>> +		return 0;
>> +	}
>> +
>>  	memset(&props, 0, sizeof(props));
>>  	props.type = BACKLIGHT_RAW;
> 

