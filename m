Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D089B02486
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 21:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81FE10E036;
	Fri, 11 Jul 2025 19:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UQrOoZUc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D894110EABF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 19:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752261905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kGO4vRGgXGLL3hZnBNYmBbSAWGoCIWSfs9lOrm3uA2M=;
 b=UQrOoZUcwccLKwvtDF/88I5iWqeOW+vP7c6HVjKAjgPpK6Kc2YKIh9kzRk7k/rWocVhDCY
 5GxrAaPs260lJE7K2xEKsZwqyePIHmHrOCzBCHjan+Y8dK6pF4rwnfRzMBhfAUziPHo/pC
 6JnPwiXG+nOmrnRaBI3/X8BA+ZsYL3U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-m0O_DJTnOIiMyd-NUyOrdw-1; Fri, 11 Jul 2025 15:25:04 -0400
X-MC-Unique: m0O_DJTnOIiMyd-NUyOrdw-1
X-Mimecast-MFC-AGG-ID: m0O_DJTnOIiMyd-NUyOrdw_1752261903
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-455d95e711cso3840545e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 12:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752261903; x=1752866703;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kGO4vRGgXGLL3hZnBNYmBbSAWGoCIWSfs9lOrm3uA2M=;
 b=u6gMiBoiLGkRIRTE8NlBMjvVoTTWN6+mI+qdLtbjDj5a8K3EgRkCT8MZ9X+LiS/aUt
 nKRY1Qznvz1rIurMWM70PRvziwvVLkhQIhTaSwPJM1wjJFwg3brqsrgo7og6PlP7lQG4
 aCjjVxisRx25cf74C1e4fNf0o5VkatsmNreqOiZTlsWhAvf6RrcpyedkJxdYrcfZA4XV
 4ggj4wCoAhz07zt+qBFJpd+NN4E/TIlqJe7CiHfj2A+dvXPeD8VevNxyO/mDOW1V2rTx
 Mj7JS5WXq0dc+o/1LbJLpFkP2NyRT7USzwMXgZZCKWsgk823OigNCmrGxAT+FdZoU4SX
 8m3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxlR5C8essVgfSbvlNUUmRcQh9NomJkxROmxkINls/KGS9kYpQumiNGV0JA4jVj5H1T2eWvGYzvHI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMqr1MWL1bGNOahNSfZW8gCqnaaF3dDQX7sQTQZRUJ5Np/R324
 r/KikDB+Rq7pvoLuE6yqfO8nJJuniSAh+v4NbJ/47joxdDGt3yO5IRzwptRESD8p3CX/deRka8N
 U7fPeifn7k2/98DlJlmrl2T/SWTrDC3plr8qp+QuixbxkpmVL/fxd514IR4zIps+7N1YGrg==
X-Gm-Gg: ASbGncvfT84Lx8nVY16OfLXuIEZFbwEDliu8m5q+y5JLgOrxZXlB2zGltWr4RxiXe1j
 snduqfkl0miUW9BCpZC3TbExckLmOmgOfS0QElbBsSDisP4Gne4B7ZkcG6KFZFTeCG8ZEy14fhY
 oYbdKfRttocCZtkY87WTQM89Q+7td00jZFphB49eVEiQL/aLjxNDJ1WfUEmIJslqOZA/5yjG9S4
 VakPGh3542QFgbNxoW/KJEF7NSwHta5LJOYZyoNtC0FT0Z7P2LGplcJh9OWh1QNGEftVNep7oLx
 +vhnhz88UhAVUc4FNw7A1r+7Po+C0j6D2jO8a9DjvT9/okpfVNsm5qq4Zir0NrFwWCZYr2Tvsfg
 AdYzWkJaFN2GKUYiniH5zRw==
X-Received: by 2002:a05:600c:1e02:b0:450:c9e3:91fe with SMTP id
 5b1f17b1804b1-454e2a426afmr43642545e9.0.1752261903405; 
 Fri, 11 Jul 2025 12:25:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsVTpi9JlkuFNtnbmvXjIbTw8+Bi0t6SWJf6PftBV3tD/DcW6zZ9OovWNlJ03/UuP8WcYcUg==
X-Received: by 2002:a05:600c:1e02:b0:450:c9e3:91fe with SMTP id
 5b1f17b1804b1-454e2a426afmr43642385e9.0.1752261902955; 
 Fri, 11 Jul 2025 12:25:02 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d88dsm5328231f8f.65.2025.07.11.12.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 12:25:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-kernel@vger.kernel.org, ipedrosa@redhat.com, David Airlie
 <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/sitronix/st7571-i2c: Make the reset GPIO to be
 optional
In-Reply-To: <aG-ftUl7l2zNm_eH@gmail.com>
References: <20250710102453.101078-1-javierm@redhat.com>
 <20250710102453.101078-3-javierm@redhat.com> <aG-aXTgycE4JEJEZ@gmail.com>
 <87jz4gfgyu.fsf@minerva.mail-host-address-is-not-set>
 <aG-ftUl7l2zNm_eH@gmail.com>
Date: Fri, 11 Jul 2025 21:25:00 +0200
Message-ID: <875xfyedir.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tPH1lvAjrRlcoZuxQQsf2WL-loXb-63RhmjZtdnO7jM_1752261903
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

> Hello Javier,
>
> On Thu, Jul 10, 2025 at 01:00:41PM +0200, Javier Martinez Canillas wrote:
>> >
>> > devm_gpiod_get_optional() returns -ENOENT when the GPIO is not found,
>> > and that is no error we want to propagage upwards.
>> >
>> > Maybe something like this instead:
>> > if (IS_ERR(st7571->reset) && IS_ERR(st7571->reset) != -ENOENT)
>> >
>> 
>> Are you sure about that? As far as I know, that is exactly the
>> difference between gpiod_get() and gpiod_get_optional() variants.
>> 
>> From the gpiod_get_optional() function helper kernel-doc [0]:
>> 
>> /**
>>  * gpiod_get_optional - obtain an optional GPIO for a given GPIO function
>>  * @dev: GPIO consumer, can be NULL for system-global GPIOs
>>  * @con_id: function within the GPIO consumer
>>  * @flags: optional GPIO initialization flags
>>  *
>>  * This is equivalent to gpiod_get(), except that when no GPIO was assigned to
>>  * the requested function it will return NULL. This is convenient for drivers
>>  * that need to handle optional GPIOs.
>>  *
>>  * Returns:
>>  * The GPIO descriptor corresponding to the function @con_id of device
>>  * dev, NULL if no GPIO has been assigned to the requested function, or
>>  * another IS_ERR() code if an error occurred while trying to acquire the GPIO.
>>  */
>> 
>> while the gpiod_get() kernel-doc says the following:
>> 
>> /**
>>  * gpiod_get - obtain a GPIO for a given GPIO function
>>  * @dev:	GPIO consumer, can be NULL for system-global GPIOs
>>  * @con_id:	function within the GPIO consumer
>>  * @flags:	optional GPIO initialization flags
>>  *
>>  * Returns:
>>  * The GPIO descriptor corresponding to the function @con_id of device
>>  * dev, -ENOENT if no GPIO has been assigned to the requested function, or
>>  * another IS_ERR() code if an error occurred while trying to acquire the GPIO.
>>  */
>> 
>
> You are completely righ.
>
> Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>

Thanks for your review! Do you plan to look at the other patches too ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

