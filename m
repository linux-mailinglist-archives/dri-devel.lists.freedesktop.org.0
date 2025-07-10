Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF79AFFFF3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 13:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9383610E224;
	Thu, 10 Jul 2025 11:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dKUPOFas";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FD310E224
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 11:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752145248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gomE3MBXXGfxhr5npCwS6+iwSNbCirqyEk3ljYY0xkk=;
 b=dKUPOFas+ZemP3PUGLVyPq/W29DdFHKA/itx5e3c00VmqDcNoB+fb4niQvC92pi1Pw2QN6
 ctTdh8Mdhd3p93v4j2Uo1zFFjcF0IauXUHLnIGIhKXvyYriE0a401Rcei9UzUtyMcWTrdn
 qexJYzSB4B9EQ0jrM2t1ybW3Ub6552E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-wp_s6EXuN9WATzJmfTQHag-1; Thu, 10 Jul 2025 07:00:47 -0400
X-MC-Unique: wp_s6EXuN9WATzJmfTQHag-1
X-Mimecast-MFC-AGG-ID: wp_s6EXuN9WATzJmfTQHag_1752145246
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-451d30992bcso6415525e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 04:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752145246; x=1752750046;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gomE3MBXXGfxhr5npCwS6+iwSNbCirqyEk3ljYY0xkk=;
 b=DtiqOp5f7ZMjs5usyD8sWOaD6wrPuV+jXvRaSzx3Q/k1G9EhD+uZL5Qfy4n067Dn8k
 SPnN+9weSI8VvH5NCc1IvEdsj/T6/WU33FnJOn70Ybppe9QNu1VNWNkJrJAmJr0Ul5+N
 ZzWKWlkUGLyC2+Qb3XXRjsUAbhG5s6CHgJvNYoVyya9acgU/QsE2iBPzr250zARReyjJ
 QQ3ieMDU8z92dh3b2Qd2MEOUCcDm64HOmGGBu4yaVz4hGx1QaDq8J2OvPeAelC3Qd5TO
 TyWjNBEtRZWkjNYWNbTsAzq3EqVdjKTy1KgR3YM7HzWudGgbr0nsaK2At0Mld4Nz4Q5j
 WDOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcU6RUvtAbQYRGBfXkI27XDrICpTywaF60zbz+7dxAiL71RnTp1Mqrm87Danm1T36r75zwzgsBkb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzMpEJqjILrCqHG2JC7sfHc+dc2ysI7I16H8ezQUXc7dkt2wNN
 eQfmVk5Df5OH2M8lPCmvOdopi54gyTxnym9WRKmMH0Y2xTvVtE7Knl/kWSjnXNkG66Z3EW1HPua
 p8X0mrmkLdTP5BW6fizfxLdrWqw8NQuwE4PWtAg8EiibOhSqT0B5Q7wLbYbPY0p4vo/FdFA==
X-Gm-Gg: ASbGnctaTUOCUgotf/G8/FsLoSAooWsnu36fZCpapBM4a8PXNvuf8KeLYza+gcbvOrZ
 HuLqI859FaH0jMJZs/FAfkY/1a4hneuiYvqbJnUPCOhJRBbVmsr9sAJXFYMMQVgHY7xb7zppDTJ
 tgGuXoqwajIVTQUIznDHM+ci9Qqqn5RGGiR5KlwM+/Pvz2DYV/NdgczLorduLTdUDHYEUmLvo3U
 KvLroVqVK92d4FiGogEXXT8hb9DzuCK+daMbCr6GhajvOlOrxaLE4aI+EBOStHGOexAPOHoT6xD
 tImG5gX4COrtcGxwqt2MkUdVz6nydRhPkMnr1eHt1bPMeOCAI/reyGqkgXU3XAEnzEo4UR8WMPf
 In4hP
X-Received: by 2002:a05:600c:6092:b0:439:643a:c8d5 with SMTP id
 5b1f17b1804b1-454dd12d764mr21215045e9.0.1752145245316; 
 Thu, 10 Jul 2025 04:00:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwjvEZSbjGBPdvjbpTjZORnYH8PHW0YCHE4yPTmzJg1yY7nN5xlDWDPbulbRm+wpcocA2RuA==
X-Received: by 2002:a05:600c:6092:b0:439:643a:c8d5 with SMTP id
 5b1f17b1804b1-454dd12d764mr21214605e9.0.1752145244788; 
 Thu, 10 Jul 2025 04:00:44 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d512c2bfsm54037455e9.39.2025.07.10.04.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 04:00:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-kernel@vger.kernel.org, ipedrosa@redhat.com, David Airlie
 <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/sitronix/st7571-i2c: Make the reset GPIO to be
 optional
In-Reply-To: <aG-aXTgycE4JEJEZ@gmail.com>
References: <20250710102453.101078-1-javierm@redhat.com>
 <20250710102453.101078-3-javierm@redhat.com> <aG-aXTgycE4JEJEZ@gmail.com>
Date: Thu, 10 Jul 2025 13:00:41 +0200
Message-ID: <87jz4gfgyu.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 58BZcBGfZ-uV1nVPDO-rPVkD_sCgS6X99bbeqSLtTI0_1752145246
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

Thanks for your feedback.

> On Thu, Jul 10, 2025 at 12:24:34PM +0200, Javier Martinez Canillas wrote:
>> Some Sitronix LCD controllers (such as the ST7567) don't have a reset pin,
>> so lets relax this in the driver and make the reset GPIO to be optional.
>> 
>> The devm_gpiod_get_optional() helper is similar to devm_gpiod_get(), but
>> returns NULL when there isn't a reset-gpios property defined in a DT node.
>> 
>> The DT binding schema for "sitronix,st7571" that require a reset GPIO will
>> enforce the "reset-gpios" to be present, due being a required DT property.
>> But in the driver itself the property can be made optional if not defined.
>> 
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>> 
>>  drivers/gpu/drm/sitronix/st7571-i2c.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
>> index eec846892962..73e8db25f895 100644
>> --- a/drivers/gpu/drm/sitronix/st7571-i2c.c
>> +++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
>> @@ -802,15 +802,19 @@ static int st7571_parse_dt(struct st7571_device *st7571)
>>  	st7571->nlines = dt.vactive.typ;
>>  	st7571->ncols = dt.hactive.typ;
>>  
>> -	st7571->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>> +	st7571->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>>  	if (IS_ERR(st7571->reset))
>> -		return PTR_ERR(st7571->reset);
>> +		return dev_err_probe(dev, PTR_ERR(st7571->reset),
>> +				     "Failed to get reset gpio\n");
>
> devm_gpiod_get_optional() returns -ENOENT when the GPIO is not found,
> and that is no error we want to propagage upwards.
>
> Maybe something like this instead:
> if (IS_ERR(st7571->reset) && IS_ERR(st7571->reset) != -ENOENT)
>

Are you sure about that? As far as I know, that is exactly the
difference between gpiod_get() and gpiod_get_optional() variants.

From the gpiod_get_optional() function helper kernel-doc [0]:

/**
 * gpiod_get_optional - obtain an optional GPIO for a given GPIO function
 * @dev: GPIO consumer, can be NULL for system-global GPIOs
 * @con_id: function within the GPIO consumer
 * @flags: optional GPIO initialization flags
 *
 * This is equivalent to gpiod_get(), except that when no GPIO was assigned to
 * the requested function it will return NULL. This is convenient for drivers
 * that need to handle optional GPIOs.
 *
 * Returns:
 * The GPIO descriptor corresponding to the function @con_id of device
 * dev, NULL if no GPIO has been assigned to the requested function, or
 * another IS_ERR() code if an error occurred while trying to acquire the GPIO.
 */

while the gpiod_get() kernel-doc says the following:

/**
 * gpiod_get - obtain a GPIO for a given GPIO function
 * @dev:	GPIO consumer, can be NULL for system-global GPIOs
 * @con_id:	function within the GPIO consumer
 * @flags:	optional GPIO initialization flags
 *
 * Returns:
 * The GPIO descriptor corresponding to the function @con_id of device
 * dev, -ENOENT if no GPIO has been assigned to the requested function, or
 * another IS_ERR() code if an error occurred while trying to acquire the GPIO.
 */

[0]: https://elixir.bootlin.com/linux/v6.16-rc5/source/drivers/gpio/gpiolib.c#L4755

>
> Best regards,
> Marcus Folkesson

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

