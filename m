Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1C395DDF5
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 14:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9F310E0FE;
	Sat, 24 Aug 2024 12:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IHZBXYdI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C9C10E113
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2024 12:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724504319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/4aGAsDOJIJwkIUQOnH6hQwr0Ls6PfwsJJf8WLYNLw0=;
 b=IHZBXYdI6rxIN46Fh067xnI0Eyd00x+sbI53lKMEAcqmbmzU5Gje2358M6jObi9VvY6oW1
 HfBYfBAyXDvww3VSSRr4zfuyY5rBR3HeqeRfngG0x+Vt6ev+8dw5nFpfRnpA7HV8KLkHUn
 OAkZSWe0SXc4dZoG+7YfZCFX6I+6pM8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-4lymir5hP8mGfK4lveSy6w-1; Sat, 24 Aug 2024 08:58:38 -0400
X-MC-Unique: 4lymir5hP8mGfK4lveSy6w-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a8691010836so288155566b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2024 05:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724504317; x=1725109117;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/4aGAsDOJIJwkIUQOnH6hQwr0Ls6PfwsJJf8WLYNLw0=;
 b=Yu4u4KBywg8wREc7BcXuSpVvc7mx1dRDnsslQwcpqxQINodP0GvGsJzyiGps9Cvc6+
 fr/aZepvimTlt2q2kINM/28hi8Fjm3y7/Ijz3SwA8G9oChUVaSdCpgVPd+HWEYEE3io9
 pZOMNFv0GA8/de4EytJcQzrRdYeL7vi43CdNI6Xj5RGlRZcG7pGFUOQDMYXENdPV+Yxw
 6830wHhePmMOmq3bkgahbpojmG+tF0uXMUbXUmkwrFmzAXwueL2aVH/1dYvhsBkhCXOO
 VyAzqs1fXRHYNaMaRodJL5D4hIJx697LPlf0PIyETthskP3d3vJLX8cI5Jp8o6NAIhSy
 5I0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1d3nKKeEHAlHLQyNEaWquQxKfZrsQ3eC+W/gaAnSalBpEhrEpHNnimLQ5m9caeww2f2VHWJivMkE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfOSpRkZX11K8e34NKE29+GQTsv8D7yRgjNeoJIIa0yHjEYgEe
 AHT4DYe51aYZsJl9HhbqVMlGvpoRNV8eQN1diWpi71qCkU1l+vTsU/nvYkoPxqMdzUi7jLsQJRP
 djYS3ByaH4kfl8m7V+7GG8zqKBNx1b/YsDQ5XqesmYNnsw+BIB5HHREqFofnbBz3j4Q==
X-Received: by 2002:a17:907:d3e4:b0:a86:a30f:4aef with SMTP id
 a640c23a62f3a-a86a519cb64mr365674966b.22.1724504316689; 
 Sat, 24 Aug 2024 05:58:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDhuA96Z6XUcbM4hBurtFoY3PCqhJGgaTyuRdVuvZQzN4ZPDkb+YOyQmUHtVdkvYAfojWRyA==
X-Received: by 2002:a17:907:d3e4:b0:a86:a30f:4aef with SMTP id
 a640c23a62f3a-a86a519cb64mr365673366b.22.1724504316158; 
 Sat, 24 Aug 2024 05:58:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f4f4aa0sm398809866b.213.2024.08.24.05.58.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Aug 2024 05:58:35 -0700 (PDT)
Message-ID: <c2de3bba-e864-4443-b80a-73f49e8a98ac@redhat.com>
Date: Sat, 24 Aug 2024 14:58:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/dsi: Make Lenovo Yoga Tab 3 X90F DMI match less
 strict
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
References: <20240823075055.17198-1-hdegoede@redhat.com>
 <87v7zr3ays.fsf@intel.com> <a0ca2cb0-2938-41d7-a290-bb331f2d4c35@redhat.com>
 <Zsjl0OuA7hzyRbzs@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zsjl0OuA7hzyRbzs@intel.com>
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

On 8/23/24 9:41 PM, Rodrigo Vivi wrote:
> On Fri, Aug 23, 2024 at 07:34:39PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 8/23/24 10:22 AM, Jani Nikula wrote:
>>> On Fri, 23 Aug 2024, Hans de Goede <hdegoede@redhat.com> wrote:
>>>> There are 2G and 4G RAM versions of the Lenovo Yoga Tab 3 X90F and it
>>>> turns out that the 2G version has a DMI product name of
>>>> "CHERRYVIEW D1 PLATFORM" where as the 4G version has
>>>> "CHERRYVIEW C0 PLATFORM". The sys-vendor + product-version check are
>>>> unique enough that the product-name check is not necessary.
>>>>
>>>> Drop the product-name check so that the existing DMI match for the 4G
>>>> RAM version also matches the 2G RAM version.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> I'll take your word for it.
>>>
>>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>>
>> Thank you.
>>
>> I was going to push this directly to drm-intel-fixes, but reading:
>>
>> https://drm.pages.freedesktop.org/maintainer-tools/repositories/drm-intel.html#repository-and-branches
>>
>> It seems that I should push this to drm-intel-next and then cherry-pick
>> it into drm-intel-fixes ?
> 
> Just push to drm-intel-next and let the fixes tag take care of its magic:
> 
> Fixes: f6f4a0862bde ("drm/i915/vlv_dsi: Add DMI quirk for backlight control issues on Lenovo Yoga Tab 3 (v2)")
> 
> The cherry-pick to -fixes branches is handled weekly by whoever maintainer
> is tacking care of that round. Usually the 'Fixes' tag will be enough to ensure
> it gets propagated. But on the lack of the fixes tag of if you noticed something was missed,
> then just ping us.

Thanks. I've pushed this to drm-intel-next now with the fixes tag added.

Regards,

Hans




>>>> ---
>>>>  drivers/gpu/drm/i915/display/vlv_dsi.c | 1 -
>>>>  1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
>>>> index 40b3ffd534d3..6cebcc87ef14 100644
>>>> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
>>>> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
>>>> @@ -1874,7 +1874,6 @@ static const struct dmi_system_id vlv_dsi_dmi_quirk_table[] = {
>>>>  		/* Lenovo Yoga Tab 3 Pro YT3-X90F */
>>>>  		.matches = {
>>>>  			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
>>>> -			DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
>>>>  			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
>>>>  		},
>>>>  		.driver_data = (void *)vlv_dsi_lenovo_yoga_tab3_backlight_fixup,
>>>
>>
> 

