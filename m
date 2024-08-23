Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAC595D45F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 19:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B4510EC96;
	Fri, 23 Aug 2024 17:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DfCtqtzR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8821310EC95
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 17:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724434484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAye8c/hxPTIJkyOWzzpXt1RWp9dYR/f5SpldqZ0M7Y=;
 b=DfCtqtzRO2+hxlhEPKF+CMQYBEFzfDzMGHu1xu7gqHUfgVPzp/X4moZrcM8KcAMQaWOi8p
 ay7YOEqmxGV9TgrjBXWhiL6XFGlcjW9DmQOA5Y+A6YL9awCKBMdEf+yUpLBt73bDoGI2RO
 KmvbYhsWHzMSO1N0cE32PeeEfJWjhIM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-sjt8Qd8dOP2BhLtyNlljKQ-1; Fri, 23 Aug 2024 13:34:42 -0400
X-MC-Unique: sjt8Qd8dOP2BhLtyNlljKQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a86a784b1easo83493166b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 10:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724434481; x=1725039281;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lAye8c/hxPTIJkyOWzzpXt1RWp9dYR/f5SpldqZ0M7Y=;
 b=qNxiRe6LGaLJ09sMtt8gDj7jYNdj0wu61HYSE21trEmGsjGpe8Je8+9MuPY8qtAuRS
 ILMbgElGVNusgsI5K1I3pzFr/xCxaFAQUUogrucbrjU4v2a2R6hEj+o8GrG4QI9uLCoA
 fSUUNSdWUPOgpJkmglixEpFtsuKdOkQv3EZlyfyTm2zEH3NuoXVu+B3J2u7Yilo9suvL
 t+xU+c3OXZyMf5x/d3QwIiGmicL/92qeK7N9Mxne+rLtyt/HUe/FF7Tf298Pd2OgentB
 6m0VnFnakhluxYJnNhBzxoJZ/LtIFFci2nEz9N6/HXi4uVjc9tnhxUE2OFw1QSECYOIO
 yOnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8ttDt+YdY3fmQsCLuilstzcYuRt/v4s7XKitAvRPrC/QnAu4yAZ0DyldCmhWtNUDIaOtEFfZeuQQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqKuhBik1GNg+mcrolIng+dLZH2RDtg8Ah+udeouoiZvD+UccE
 vOn3/dO57s3vexWvI1/EtaQcG/AKcWntouxm/+AGdCiFv+0pLnr9689v57r6MbjMdRafDwdduf9
 RkIgNx2sCk7o4DpJThbi49Uz09GSBFqeRr3I+S4C6TfPlJeA3cVyl8oLHBW5oDWYkug==
X-Received: by 2002:a17:907:6d07:b0:a86:7514:e646 with SMTP id
 a640c23a62f3a-a86a54d1473mr220017066b.42.1724434481515; 
 Fri, 23 Aug 2024 10:34:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhVdC/sBgpIb4QXyF7DeK9QFs2pW65OLNMQMpLnl6teatUR7hMdVjiceOHWDOdfggCOHQITQ==
X-Received: by 2002:a17:907:6d07:b0:a86:7514:e646 with SMTP id
 a640c23a62f3a-a86a54d1473mr220015766b.42.1724434481008; 
 Fri, 23 Aug 2024 10:34:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f2a58ddsm285466866b.80.2024.08.23.10.34.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 10:34:40 -0700 (PDT)
Message-ID: <a0ca2cb0-2938-41d7-a290-bb331f2d4c35@redhat.com>
Date: Fri, 23 Aug 2024 19:34:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/dsi: Make Lenovo Yoga Tab 3 X90F DMI match less
 strict
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
References: <20240823075055.17198-1-hdegoede@redhat.com>
 <87v7zr3ays.fsf@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87v7zr3ays.fsf@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 8/23/24 10:22 AM, Jani Nikula wrote:
> On Fri, 23 Aug 2024, Hans de Goede <hdegoede@redhat.com> wrote:
>> There are 2G and 4G RAM versions of the Lenovo Yoga Tab 3 X90F and it
>> turns out that the 2G version has a DMI product name of
>> "CHERRYVIEW D1 PLATFORM" where as the 4G version has
>> "CHERRYVIEW C0 PLATFORM". The sys-vendor + product-version check are
>> unique enough that the product-name check is not necessary.
>>
>> Drop the product-name check so that the existing DMI match for the 4G
>> RAM version also matches the 2G RAM version.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> I'll take your word for it.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Thank you.

I was going to push this directly to drm-intel-fixes, but reading:

https://drm.pages.freedesktop.org/maintainer-tools/repositories/drm-intel.html#repository-and-branches

It seems that I should push this to drm-intel-next and then cherry-pick
it into drm-intel-fixes ?

Regards,

Hans




> 
>> ---
>>  drivers/gpu/drm/i915/display/vlv_dsi.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
>> index 40b3ffd534d3..6cebcc87ef14 100644
>> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
>> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
>> @@ -1874,7 +1874,6 @@ static const struct dmi_system_id vlv_dsi_dmi_quirk_table[] = {
>>  		/* Lenovo Yoga Tab 3 Pro YT3-X90F */
>>  		.matches = {
>>  			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
>> -			DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
>>  			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
>>  		},
>>  		.driver_data = (void *)vlv_dsi_lenovo_yoga_tab3_backlight_fixup,
> 

