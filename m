Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A249563F1BB
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 14:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF0B10E5E2;
	Thu,  1 Dec 2022 13:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E82910E5E2
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 13:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669901687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00jxYf1q3fxGkE8vzDP/kmUB4+CIeLC98DKRmKHBSEw=;
 b=X3VbclHZzUZoZzHlB8SQfZ6/TuVdMnEHxPKeneupoL6+Ak34WUEKZlzeGTTrdAEuHrRZ6r
 eotus2TmxnrC1Twrr7CoOKJ9mBP9biIMD6gSsVM5k0Eopwx6c/5yDrsuZGHrR6ZGuL5IlY
 Zv+SHu95MPLyPkPHQg3BmWL5gpYl1ks=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-650-hmNoSCIPN0az4_qeHP5gIg-1; Thu, 01 Dec 2022 08:34:44 -0500
X-MC-Unique: hmNoSCIPN0az4_qeHP5gIg-1
Received: by mail-wm1-f70.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso2561033wms.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 05:34:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=00jxYf1q3fxGkE8vzDP/kmUB4+CIeLC98DKRmKHBSEw=;
 b=t1pnqDQLT+JsZnHqt1nQk0aA3o/hh3k4uKggnNBcY/mN20kHd0dv+XbC66w7vFyggI
 kS8aRz/gdQ6YHjZh/bB94Qhmkh9XfgGwkH7zOcTCwWn669+sqQpdruYKhxyCmLnOj7Lg
 aOdB2sbmIWBRVTKL/38s/hxI7F4admR2NO2vRIv8Gion4/ULmhr36qDeNdE5qjilRgy5
 fyACv0Jd0SY6uc2IGlhkmSzWjW2fAnn47AvmM7s59ctgqnHuZk3K8jHd/fcaygyAXUv9
 c3XC8jJ0o+CzEBGzVz2xeSXmCqgLVmcFNvtDCA/NgXPVwuoCXV8IaYikgsS+AGNHtd+e
 9xGA==
X-Gm-Message-State: ANoB5png38EDfs39w9GHc1HfoIAa7m8tVGiWJbpV/0V8hudZ3PB9gc2/
 bJ6l8fxnxU622SVVFXRFOAJOEQQksx1LWzZ8qI25uOTruw1EJjXJAnMOSI5EAlAY/kW9a1A9Z0c
 MzQdcbTy8mfzODxdhJecszKoVYLYo
X-Received: by 2002:a7b:c4d8:0:b0:3cf:9bcd:5009 with SMTP id
 g24-20020a7bc4d8000000b003cf9bcd5009mr41039328wmk.196.1669901683018; 
 Thu, 01 Dec 2022 05:34:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6a1UceeJ8fuUb2jb/nO/ppeJaHDF1cSo6k7XADI/2XvITfAPjrofctw68A+B8wCYDc36oeZg==
X-Received: by 2002:a7b:c4d8:0:b0:3cf:9bcd:5009 with SMTP id
 g24-20020a7bc4d8000000b003cf9bcd5009mr41039315wmk.196.1669901682750; 
 Thu, 01 Dec 2022 05:34:42 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v24-20020a05600c4d9800b003cfbe1da539sm5152014wmp.36.2022.12.01.05.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 05:34:42 -0800 (PST)
Message-ID: <e57deac6-5344-3f81-8ef5-55dd28b8c363@redhat.com>
Date: Thu, 1 Dec 2022 14:34:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 0/6] drm/gud: Use the shadow plane helper
To: Greg KH <gregkh@linuxfoundation.org>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
 <Y4hB5odv9IGaq3Di@kroah.com>
 <1cb40762-5f0a-1739-1670-155f59ec7110@tronnes.org>
 <Y4iaODY6hMVNsfP1@kroah.com>
 <4e75582c-b3d6-fb0e-19b4-e4fd58c6bf55@tronnes.org>
 <Y4iqR94aGFa3NahQ@kroah.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Y4iqR94aGFa3NahQ@kroah.com>
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
Cc: tools@linux.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Greg,

On 12/1/22 14:21, Greg KH wrote:

[...]

>>>> This patchset was sent using the b4 tool and I can't control this
>>>> aspect. Everyone mentioned in the patches gets the whole set.
>>>
>>> Fair enough, but watch out, bots will report this as being a problem as
>>> they can't always read through all patches in a series to notice this...
>>>
>>
>> Konstantin,
>>
>> Can you add a rule in b4 to exclude stable@vger.kernel.org
>> (stable@kernel.org as well?) from getting the whole patchset?
> 
> stable@kernel.org is a pipe to /dev/null so that's not needed to be
> messed with.
> 
> As for this needing special casing in b4, it's rare that you send out a
> patch series and only want 1 or 2 of them in stable, right?
>

Not really, it's very common for a patch-series to contain fixes (that could
go to stable if applicable) and change that are not suitable for stable. The
problem as Noralf mentioned is that the b4 tool doesn't seem to allow Cc'ing
individual patches to different recipients, and everyone get the whole set.

So either b4 needs to have this support, exclude stable@vger.kernel.org when
sending a set or stable@vger.kernel.org ignore patches without a Fixes: tag.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

