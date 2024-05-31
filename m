Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911B48D5E54
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 11:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1523F10E32F;
	Fri, 31 May 2024 09:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="M3wxgUki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867E610E32F
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 09:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717147962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2SeROL+Hu8TRX1uXF26mJkdFBlgFuFZhLZS/uCs4PqQ=;
 b=M3wxgUkiU8yMTbJ6ef06J99oSoL4986pj/tyNBz1IKsULMrnFk46qzTHr4t+3KVU+/6wM5
 +OCdQHdi2O6Qs9jqLjztBBcU+cyxndJNf1FD85EcHxoqQ6Ufi01KhQ3rKKv4Afy9LSvxx3
 Cmz87kJCTb0arwCM/QhZAJA7krGiA8U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-P7NhGh4sPmWpAD0ZYF5CcA-1; Fri, 31 May 2024 05:32:40 -0400
X-MC-Unique: P7NhGh4sPmWpAD0ZYF5CcA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-35e0f069ad4so345555f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 02:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717147959; x=1717752759;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2SeROL+Hu8TRX1uXF26mJkdFBlgFuFZhLZS/uCs4PqQ=;
 b=kFTe7xUs5LVVTPSLmU72jaD1pm9ofX/qC6hbW27q/ftsQz+sJnMoXo7BID708Q4LTx
 03eofqHpoHHKqePyhpSeYRIBrfL3smxRC4za6f6lsBV6Jjetlchvp9NlApE4FYM0mfRE
 LosUyZUKzzLL9Wb6yFZcqWFbJ4pWsyWbW7od8FRa8hmkbt/sDEvoO68gkTZzgzP1V6K/
 PoPEwWAUSKffxVIrJ57P6xL87N3boyVyajY3kItcxbHH3Awz7bkuobzng3+Agm4mjbLp
 NE+1oSusfqeA1TIT+yt4lsBuDcsGtK8blHZ7Xa223qlywfu5pKsFEQ0qJyb7nS45wBEC
 xh6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQmuoJEleEbNDrHgx7OHmOt8IYFLStzpPyGmDu+ZtF1DJuMpl4PZH0KrLEcLG8bGT4trXaHIPzUyzSD3lg1LObtzlzLbNdFya9wE61Bm5p
X-Gm-Message-State: AOJu0Yz+pQJi6OQqiuwrB9exeBu2BsgXybhODmL8o/mk0V3K0I0ernW9
 xHUdDbPGIh8UOv0HI0EidVU5uxNQ4QpiwGpisevJzVGlx4cb7f73HeDbObj2RfKCfKVnxXLk9I5
 J1b2Udx8Ytd8yMG2Q8Ih0vgY3hVHV9xtWR8VzvEAHZIc8np+7jC5o6oxqE04eM22Z5w==
X-Received: by 2002:adf:fd92:0:b0:354:f359:735a with SMTP id
 ffacd0b85a97d-35e0f2550c2mr1145360f8f.5.1717147959264; 
 Fri, 31 May 2024 02:32:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ9uamLv/yL5S6+HEwYaI+D9n1amX51OZQ2STOq8pfx1J/Spvvmua5+6pdo7c8wvLj60cFnA==
X-Received: by 2002:adf:fd92:0:b0:354:f359:735a with SMTP id
 ffacd0b85a97d-35e0f2550c2mr1145348f8f.5.1717147958913; 
 Fri, 31 May 2024 02:32:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b?
 ([2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064afe3sm1409645f8f.97.2024.05.31.02.32.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 02:32:38 -0700 (PDT)
Message-ID: <1d27d752-117b-4332-9582-bc0f3255d09f@redhat.com>
Date: Fri, 31 May 2024 11:32:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/panic: Add a set_pixel() callback to
 drm_scanout_buffer
To: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240531080750.765982-1-jfalempe@redhat.com>
 <20240531080750.765982-3-jfalempe@redhat.com>
 <87cyp21goh.fsf@minerva.mail-host-address-is-not-set>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87cyp21goh.fsf@minerva.mail-host-address-is-not-set>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 31/05/2024 11:20, Javier Martinez Canillas wrote:
> Jocelyn Falempe <jfalempe@redhat.com> writes:
> 
>> This allows drivers to draw the pixel, and handle tiling, or specific
>> color formats.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_panic.c | 120 +++++++++++++++++++++++-------------
>>   include/drm/drm_panic.h     |   9 +++
>>   2 files changed, 85 insertions(+), 44 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> index 9d95c7eaae83..27e26b9d842c 100644
>> --- a/drivers/gpu/drm/drm_panic.c
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -241,40 +241,54 @@ static void drm_panic_blit32(struct iosys_map *dmap, unsigned int dpitch,
>>   				iosys_map_wr(dmap, y * dpitch + x * sizeof(u32), u32, color);
>>   }
>>   
>> +static void drm_panic_blit_pixel(struct drm_scanout_buffer *sb, struct drm_rect *clip,
>> +				 const u8 *sbuf8, unsigned int spitch, u32 color)
>> +{
>> +	unsigned int y, x;
>> +
>> +	for (y = 0; y < drm_rect_height(clip); y++)
>> +		for (x = 0; x < drm_rect_width(clip); x++)
>> +			if (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8)))
> 
> You have the same check for fb vs bg in all your blit helpers, so maybe
> this can be a macro or static inline function instead ? That would also
> help with the issue I mentioned about making the logic easier to read.

Sure, I can do a v2, or send an additional patch for that.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 

Thanks,

-- 

Jocelyn

