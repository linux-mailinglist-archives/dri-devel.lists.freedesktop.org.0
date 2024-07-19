Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEE5937699
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 12:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AB010EBC6;
	Fri, 19 Jul 2024 10:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FrxJWyPv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CC310EBC4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 10:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721384624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BPcPOkfxnKc2CZr4wRynXmET7LzBIXLhcUJVObsM3/c=;
 b=FrxJWyPv4AvZSw3UEZpmAWJCuvjWtiE8Sl2lGq7xshcVmBACArvVN6TS84sRzPgQNt0bY+
 pxwBoaV5R+GCrWMF4SXiEcCS/YIJj5iJkFBb/WhlvN2VS8h5eWf0L26N/RQik6jz3cwADk
 b1kFtwaFRhohOl9o05M6u/xl+WE7wik=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-l-iYSY0mNkaZ63Ag41QlNg-1; Fri, 19 Jul 2024 06:23:42 -0400
X-MC-Unique: l-iYSY0mNkaZ63Ag41QlNg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4266fbae4c6so11381065e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 03:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721384621; x=1721989421;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BPcPOkfxnKc2CZr4wRynXmET7LzBIXLhcUJVObsM3/c=;
 b=Qc40cUl5jfkagZJdA+7ODCp0lEx41w1XnumrBYMTLBrdeQ98SLuSkjalQpLgxNUWA4
 kFuoGo/UvOueQv1S/+FZez0byRH8l5hmuQYTi9Pz+rXqhITRqwXDBZKvVrCS/lefLGGZ
 VIAqR2kgf5FkF/f74YTitvygeNGAwF2MWDb8B7e7oEN6T42ouXdHGUtlgNa9PRLMyZlh
 4DoCSrrjK6GQTeDEJxpxKxv6oecdu5z7wzRk93MQAIq5cOZEEU/PBp3VI82QFV/4fbDV
 C1YuwLDWGBaCoJ0jxjvriPkaqAia00SG6wUl6TqFxaNFSRoqtXTqEfC+sFRgG0DCFGoI
 7HKA==
X-Gm-Message-State: AOJu0YyrgR4t/F7v39L17XUHR5qGI99yTBFVGYspfG6Iv+OQdvDRE1Ml
 AAvwAEuRPKHCzoNj3/5tFQwCZuAzcHtLI8ON3eXzeSP+K9xInOQ0TBm6idohvW0Jate+7nqIGM/
 SjuU7p5HpcRGux6Z70mgJR9nZJMyyB1j+gyZEOkMRbeU8ZLrzwgHKRktMJbAcUatW2CScE1KMxh
 9Z7eIsPvpEGNfGv5XU8c7BgyuXj3B29J9oS6vvqQoIBSkuUT38IQ==
X-Received: by 2002:a05:600c:198b:b0:427:ac40:d4b1 with SMTP id
 5b1f17b1804b1-427c2d1bffcmr43037405e9.27.1721384621461; 
 Fri, 19 Jul 2024 03:23:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGftzQberIQQ4SrCTYXu9CGb7XW2fS0MvQdpDoQiA/J2s0BR7Lr7YnR6k+NyA0xZNXMgvzZiQ==
X-Received: by 2002:a05:600c:198b:b0:427:ac40:d4b1 with SMTP id
 5b1f17b1804b1-427c2d1bffcmr43037265e9.27.1721384620916; 
 Fri, 19 Jul 2024 03:23:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d6906a96sm19338075e9.22.2024.07.19.03.23.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 03:23:40 -0700 (PDT)
Message-ID: <0f893744-c9b3-4292-867d-64d5465a7697@redhat.com>
Date: Fri, 19 Jul 2024 12:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/panic: Add drm_panic_is_enabled()
To: dri-devel@lists.freedesktop.org
References: <20240717090102.968152-1-jfalempe@redhat.com>
 <20240717090102.968152-2-jfalempe@redhat.com>
 <Zpo9Xv6wLevidsNa@ideak-desk.fi.intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <Zpo9Xv6wLevidsNa@ideak-desk.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/07/2024 12:18, Imre Deak wrote:
> Hi,
> 
> On Wed, Jul 17, 2024 at 10:48:39AM +0200, Jocelyn Falempe wrote:
>> It allows to check if the drm device supports drm_panic.
>> Prepare the work to have better integration with fbcon and vtconsole.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_panic.c | 20 ++++++++++++++++++++
>>   include/drm/drm_panic.h     |  2 ++
>>   2 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> index 948aed00595e..d9a25c2d0a65 100644
>> --- a/drivers/gpu/drm/drm_panic.c
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -703,6 +703,26 @@ static void debugfs_register_plane(struct drm_plane *plane, int index)
>>   static void debugfs_register_plane(struct drm_plane *plane, int index) {}
>>   #endif /* CONFIG_DRM_PANIC_DEBUG */
>>   
>> +/**
>> + * drm_panic_is_enabled
>> + * @dev: the drm device that may supports drm_panic
>> + *
>> + * returns true if the drm device supports drm_panic
>> + */
>> +bool drm_panic_is_enabled(struct drm_device *dev)
>> +{
>> +	struct drm_plane *plane;
>> +
>> +	if (!dev->mode_config.num_total_plane)
>> +		return false;
>> +
>> +	drm_for_each_plane(plane, dev)
>> +		if (plane->helper_private && plane->helper_private->get_scanout_buffer)
>> +			return true;
>> +	return false;
>> +}
>> +EXPORT_SYMBOL(drm_panic_is_enabled);
>> +
>>   /**
>>    * drm_panic_register() - Initialize DRM panic for a device
>>    * @dev: the drm device on which the panic screen will be displayed.
>> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
>> index 73bb3f3d9ed9..c3a358dc3e27 100644
>> --- a/include/drm/drm_panic.h
>> +++ b/include/drm/drm_panic.h
>> @@ -148,11 +148,13 @@ struct drm_scanout_buffer {
>>   
>>   #ifdef CONFIG_DRM_PANIC
>>   
>> +bool drm_panic_is_enabled(struct drm_device *dev);
>>   void drm_panic_register(struct drm_device *dev);
>>   void drm_panic_unregister(struct drm_device *dev);
>>   
>>   #else
>>   
>> +bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
> 
> This was moved to drivers/gpu/drm/drm_crtc_internal.h in the applied
> version and I can't find that version on the mailing list; imo this kind
> of change requires a resend.

Sorry, I though that was a minor change, but I messed it up.

Yes sending to the mailing list also triggers the CI, and checks for 
simple errors like this, I will send a fix shortly.

> 
> Also, the above breaks CONFIG_DRM_PANIC=n builds:
> 
> In file included from drivers/gpu/drm/drm_atomic_uapi.c:43:
> drivers/gpu/drm/drm_crtc_internal.h:322:6: error: no previous prototype for ‘drm_panic_is_enabled’ [-Werror=missing-prototypes]
>    322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
> 
> Stubs like the above must be an inline function.
> 
>>   static inline void drm_panic_register(struct drm_device *dev) {}
>>   static inline void drm_panic_unregister(struct drm_device *dev) {}
>>   
>> -- 
>> 2.45.2
>>
> 

