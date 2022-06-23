Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D278557815
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 12:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC2710E0E3;
	Thu, 23 Jun 2022 10:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9EB10E111
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 10:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655981184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wvp4c8ma6q+0nmczjb+eMGTpk4qCAW2Qq2qJF/kNVDA=;
 b=abDuqiyP34St/9sJ9iAQl2kPDkH51DkMyX9vCEzjnBi2btJowRxs2geV+vY3/oBfg9FVh/
 2UJLCk0lQBPoPq8iH+zD3ax/9QCTxqSEGfyX7pdY1jut3hSU8ibQMmwDhIvB/6wdT1avAR
 P/Tk6tWjIbMw/qZ/57+mbcQcRzU32NI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-sQeAlINFPBm6kcgpBcd8WQ-1; Thu, 23 Jun 2022 06:46:23 -0400
X-MC-Unique: sQeAlINFPBm6kcgpBcd8WQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 y4-20020aa7ccc4000000b0042df06d83bcso15473983edt.22
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 03:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Wvp4c8ma6q+0nmczjb+eMGTpk4qCAW2Qq2qJF/kNVDA=;
 b=v7ihofAp1KdyQ4VKZRV2kFF10CYqJlrmZEkGzZ1/ejFQos2AC8gPkjIAj2ZIkol8RL
 gD+guwlGJc6reDkqg26lnaLUBjE/F/7Qr5npmpAyTTmOBWuX8YFbg6iJ8EXKcly2pvr7
 HC6Y70aOGq4a6HYmgNXrAi0a9aCra5m6c5e7Ay42++eyji2L+m78kDl7+K3N3Emw58VG
 Oc7AIY5nzep9gSU8wVkRDJ+b8cSsbKKYz1MZmhn5s2e7ZyXbTOP02dZwcdC28hvwP+Im
 D66PsnlfNOk/w/q9g9dZAVC3COIhtM8dLAtAUAKqjUbssUQXGrenh2rlVJWphTZPrssv
 Bx/Q==
X-Gm-Message-State: AJIora/6gVRYFs+8ApLrufog1++vCQ3amfxcjo7iiDRJyCUNB3HoMWNq
 V4CiiHFJGuulqwLUjpvRJNnYTW1tEqeZLeBtQPBXUBdTYffKbqrHc4Icbxb7Sg1Vtk+woik1sDD
 vKib0LqBm0nAoeAzplN7hejSaLo8L
X-Received: by 2002:a05:6402:21a:b0:431:5c52:82bb with SMTP id
 t26-20020a056402021a00b004315c5282bbmr10109198edv.70.1655981182347; 
 Thu, 23 Jun 2022 03:46:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tjt++oOvFx/5E7Gp7jK8UO2JpIA50Cx1YCtKCpEKeOTZijLz0SEbeKL+o3STwwczsrWERh3Q==
X-Received: by 2002:a05:6402:21a:b0:431:5c52:82bb with SMTP id
 t26-20020a056402021a00b004315c5282bbmr10109165edv.70.1655981182073; 
 Thu, 23 Jun 2022 03:46:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 la12-20020a170907780c00b007081282cbd8sm10468360ejc.76.2022.06.23.03.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 03:46:21 -0700 (PDT)
Message-ID: <3591bbb1-8f11-cb00-742a-da0f9c12deb3@redhat.com>
Date: Thu, 23 Jun 2022 12:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/nouveau/Kconfig: Drop duplicate "select ACPI_VIDEO"
To: Lyude Paul <lyude@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>
References: <20220620094627.9730-1-hdegoede@redhat.com>
 <58bc64d81295092de0a9cab9c16dfae5600fc821.camel@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <58bc64d81295092de0a9cab9c16dfae5600fc821.camel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lyude,

On 6/21/22 22:08, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Also, you have my permission to push this to drm-misc-next.

Thanks, I've pushed this to drm-misc-next now.

Regards,

Hans


> 
> On Mon, 2022-06-20 at 11:46 +0200, Hans de Goede wrote:
>> Before this change nouveau's Kconfig section had 2 "select ACPI_VIDEO"
>> statements:
>>
>> select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
>> select ACPI_VIDEO if ACPI && X86
>>
>> Drop the one with the extra conditions, if the conditions for that
>> one are true then the second statement will always select ACPI_VIDEO
>> already.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/gpu/drm/nouveau/Kconfig | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/Kconfig
>> b/drivers/gpu/drm/nouveau/Kconfig
>> index 34760164c271..03d12caf9e26 100644
>> --- a/drivers/gpu/drm/nouveau/Kconfig
>> +++ b/drivers/gpu/drm/nouveau/Kconfig
>> @@ -11,7 +11,6 @@ config DRM_NOUVEAU
>>         select DRM_TTM
>>         select DRM_TTM_HELPER
>>         select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
>> -       select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
>>         select X86_PLATFORM_DEVICES if ACPI && X86
>>         select ACPI_WMI if ACPI && X86
>>         select MXM_WMI if ACPI && X86
> 

