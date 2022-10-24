Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99F860AEB0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 17:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FE310E828;
	Mon, 24 Oct 2022 15:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5667310E832
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 15:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666624373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LLng6C1VOPaKmGfnDAR23yy9IW4xWqG/nhRblDLerDI=;
 b=F8k1yULwl2Vm3D8G75ZBZKmz3A03w2I4dWsRWJ6iAzdV2dr6KDn+hZuFvL9AAK6Ia+oHNy
 Nv45Gb9e/sWysc1fiZR1NXu6vcBcaUZB6jdjSHUm2Wiz8Wvmi+PtuoN0WkY5VAO/UwhAZ+
 x4CqEVeuCUOWzgpE9vuMIXWYkbVSEWQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-88-D8XVTrEjORqZbyNkrNoy3g-1; Mon, 24 Oct 2022 11:12:51 -0400
X-MC-Unique: D8XVTrEjORqZbyNkrNoy3g-1
Received: by mail-ed1-f70.google.com with SMTP id
 z15-20020a05640240cf00b00461b253c220so3845273edb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 08:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LLng6C1VOPaKmGfnDAR23yy9IW4xWqG/nhRblDLerDI=;
 b=D2hlh4+7RODPCbejZhBUDqcdADf74/Sj7FWAyq1r7tyyr0VDeTN3xfwFyGAi1T6fv8
 cC9cJspSsgFiQbWh0G7RkVlB9pxAK61Fr3ksJ9jTo3uvVzfMUL5V4ILATc8aEsQg2zr/
 np/l99H1aahyr5vCXAeDVZBj2Y7CSGNLvuPx4c+niI1XuR4Nfm0IqcxBKf3rWbuGlUzg
 TmG6EONniUehYpT3njWN5JQLLMC3YCs1J4JgaK8Yhgi+yH+CRHI7vuzWK8v3tqzERaDH
 1D4wKpemp0vbz9elAMD584V75IK3eTZe+56I6cvy98i4+dr7mzc6igC3Vi938KC43A02
 T7UQ==
X-Gm-Message-State: ACrzQf3emL3K6nKaiDgR8+/Ad7RCVwnvn/SepNSEEaKWmzc0KBIoyi5l
 emx50aWdDCFrA3s9CQIp3aXTL7iT5dddxxzVJ/Nqf/cGk5L4CyZG7WbhnODY9tk29QNyNTtKNRi
 +njgZhpaCsDLfZeFcf4APWuYy2uRg
X-Received: by 2002:a17:907:7f05:b0:78d:e869:f2fe with SMTP id
 qf5-20020a1709077f0500b0078de869f2femr26654469ejc.684.1666624370484; 
 Mon, 24 Oct 2022 08:12:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7NiY3mR8h0t9Fxj1mnG4UwQWad5Y2Z3MQDaJ6ei5w9igvvCLQDaVpdTc6JMLVHtE1y5iJqvQ==
X-Received: by 2002:a17:907:7f05:b0:78d:e869:f2fe with SMTP id
 qf5-20020a1709077f0500b0078de869f2femr26654446ejc.684.1666624370217; 
 Mon, 24 Oct 2022 08:12:50 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170906318c00b00770812e2394sm15742436ejy.160.2022.10.24.08.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 08:12:49 -0700 (PDT)
Message-ID: <db61f939-a4a2-05ec-e09c-03a95c81e922@redhat.com>
Date: Mon, 24 Oct 2022 17:12:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] ACPI: video: Fix missing native backlight on
 Chromebooks
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20221024141210.67784-1-dmitry.osipenko@collabora.com>
 <dda4b024-69d2-1d1d-da23-e922e5b6128a@redhat.com>
 <CAJZ5v0irmk3aAK9t3UYcus+SXDL+AaT88LPXfyJU2PrXbkgfMg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0irmk3aAK9t3UYcus+SXDL+AaT88LPXfyJU2PrXbkgfMg@mail.gmail.com>
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
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/24/22 16:45, Rafael J. Wysocki wrote:
> On Mon, Oct 24, 2022 at 4:32 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 10/24/22 16:12, Dmitry Osipenko wrote:
>>> Chromebooks don't have backlight in ACPI table, they suppose to use
>>> native backlight in this case. Check presence of the CrOS embedded
>>> controller ACPI device and prefer the native backlight if EC found.
>>>
>>> Suggested-by: Hans de Goede <hdegoede@redhat.com>
>>> Fixes: 2600bfa3df99 ("ACPI: video: Add acpi_video_backlight_use_native() helper")
>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>> ---
>>>
>>> Changelog:
>>>
>>> v2: - Added explanatory comment to the code and added check for the
>>>       native backlight presence, like was requested by Hans de Goede.
>>
>> Thanks this version looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Rafael, can you pick this up and send it in a fixes pull-req
>> for 6.1 to Linus? Or shall I pick this one up and include it
>> in my next pull-req?
> 
> It would be better if you could pick this up IMV, so please free to add
> 
> Acled-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Ok, I've merged this now and I'll send out fixes pull-req with this
to Linus before coming Friday.

Dmitry, Thank you for your patch, I've applied this patch to my
fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Regards,

Hans




> 
> to it.
> 
> Thanks!
> 
>>>
>>>  drivers/acpi/video_detect.c | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
>>> index 0d9064a9804c..9cd8797d12bb 100644
>>> --- a/drivers/acpi/video_detect.c
>>> +++ b/drivers/acpi/video_detect.c
>>> @@ -668,6 +668,11 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
>>>       { },
>>>  };
>>>
>>> +static bool google_cros_ec_present(void)
>>> +{
>>> +     return acpi_dev_found("GOOG0004");
>>> +}
>>> +
>>>  /*
>>>   * Determine which type of backlight interface to use on this system,
>>>   * First check cmdline, then dmi quirks, then do autodetect.
>>> @@ -730,6 +735,13 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>>>                       return acpi_backlight_video;
>>>       }
>>>
>>> +     /*
>>> +      * Chromebooks that don't have backlight handle in ACPI table
>>> +      * are supposed to use native backlight if it's available.
>>> +      */
>>> +     if (google_cros_ec_present() && native_available)
>>> +             return acpi_backlight_native;
>>> +
>>>       /* No ACPI video (old hw), use vendor specific fw methods. */
>>>       return acpi_backlight_vendor;
>>>  }
>>
> 

