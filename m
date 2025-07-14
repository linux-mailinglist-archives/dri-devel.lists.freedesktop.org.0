Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B24AB03B18
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 11:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B8D10E16F;
	Mon, 14 Jul 2025 09:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FSgIbP1E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D7010E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 09:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752486140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p8Tx95/WvSTK8NTF77+QTvu/+GuQhrx4IJVb9WBQk78=;
 b=FSgIbP1EPtQRWbfHutByC5X/XrZG4jnvJ+psT94N7wRRzvdQD919AkDWZDrtwrIwcT4ylk
 KspWdPu6MD5XmjpEzaqP4lYvmCC3/uq2TZYhhQvD2EExBzMMTLwnfj7C4Rhlbot6T7DbIZ
 tqn6iW1NnkmpuYSpoPrhn6ejkrnCn1s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-gbpOiivOOLWbBH7thOmzjA-1; Mon, 14 Jul 2025 05:42:19 -0400
X-MC-Unique: gbpOiivOOLWbBH7thOmzjA-1
X-Mimecast-MFC-AGG-ID: gbpOiivOOLWbBH7thOmzjA_1752486138
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a50049f8eeso1801249f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 02:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752486138; x=1753090938;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p8Tx95/WvSTK8NTF77+QTvu/+GuQhrx4IJVb9WBQk78=;
 b=vFGo7pcPzeO1/nchY2Kc9rpsTr8fD6TNoc0Oxc6nDCKXyeDL6drj1v+lm8DPYSlz6t
 /Qsk/Uw5PeM5lMKqdVAjdMurLuZKxakqoaopxylpE74o/Hl/1OM8chahkOQfbebnHJ4Q
 xftPri+h7vwCF98RNHiiR+iIOUq3gqdwqHpx6q5V2wTPC1573U9b2iAFuUUPgDmXFCHG
 7E5CuN11RY9e1Z9cuMRc0tbqF8g8piqSz7NujuSvW3MZmvAbEhomBO5VmEtfXKeXqfWO
 X3705SN2f3hwIt+LcUrCb0YEXWDwietm/EKFqRwh87XV7BzZbAri9BVid/PNiVTe9fHk
 xMkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+7LxRlgONXlAnesoiTIPrqECyub6aPuOCZA/gZf+US5z9eNHP8ZvALTAFnYwUlO1T0HhENe6NdE0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzkwt2zAT11PjNiu7FCRukIPnPUJm8n1kNH7nKbZcvZR1mglhDs
 tgzxqXW1jKC2n9O9kRolxv6iDNZLbm+hp73SGRZ/QfHatgZ++Tt93z/sKjrh+nd8vA27SIaAOqN
 wv8fJKRWScUBxz15QD8f8PKmxVQgejsT9CjiWKh7mqcRQj3XTBaIAIUFDDME/p0cz+NbyEA==
X-Gm-Gg: ASbGncuEsP0BExw5WyJ4ixsTOKRImHprnytqQBdhS2dC0aef7G0sT8IG3Y0azv+fHHf
 mj430OKKdc3mrG8BTsAvCWXo9GopG+m0xpjSxmsdAnok/S0NA2Y0Rh7MLwCMO+0Z/ideVUtsZwk
 p/xWuR13QJPWNynWgu1bwOy3tmZ0VWNPrb75dGevX/k6MhYDOyO35lJo8MGZcZVMGa3n5QP1ea9
 lS9mx0YbfUHJjw8eTczthcO/+hQ6p+prtEMSii596mpv4KDodr3FvrpqSbkeoRXXtNGu5HGWdt5
 /39waNOOydpmgapFBkDYiKDQeRiKYHTqC0CnMZm0mN9Cr7o8i48rXvqFqlAJFQW8HA==
X-Received: by 2002:a05:6000:e0a:b0:3a4:e841:b236 with SMTP id
 ffacd0b85a97d-3b5f18cebeemr8726629f8f.33.1752486137659; 
 Mon, 14 Jul 2025 02:42:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5V4Ve8BAPt6NU+cG8lX/fpEurIJIrdqdQxfcQNaUpGgaXzhyffw4d2Lxh8B67YSliB2bm2g==
X-Received: by 2002:a05:6000:e0a:b0:3a4:e841:b236 with SMTP id
 ffacd0b85a97d-3b5f18cebeemr8726599f8f.33.1752486137180; 
 Mon, 14 Jul 2025 02:42:17 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-455ef31717dsm91187365e9.6.2025.07.14.02.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 02:42:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Cc: ipedrosa@redhat.com, David Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Maxime Ripard <mripard@kernel.org>, Simona
 Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/sitronix/st7571-i2c: Make the reset GPIO to be
 optional
In-Reply-To: <10bb159a-0c6a-4950-b038-68608e2a771d@suse.de>
References: <20250710102453.101078-1-javierm@redhat.com>
 <20250710102453.101078-3-javierm@redhat.com>
 <10bb159a-0c6a-4950-b038-68608e2a771d@suse.de>
Date: Mon, 14 Jul 2025 11:42:15 +0200
Message-ID: <87zfd7cdmw.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5NAW2W_Sv64CYODXGe0dr2mZX3QdZz6ATWSeqhHzcog_1752486138
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi
>
> Am 10.07.25 um 12:24 schrieb Javier Martinez Canillas:
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
>>   drivers/gpu/drm/sitronix/st7571-i2c.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
>> index eec846892962..73e8db25f895 100644
>> --- a/drivers/gpu/drm/sitronix/st7571-i2c.c
>> +++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
>> @@ -802,15 +802,19 @@ static int st7571_parse_dt(struct st7571_device *st7571)
>>   	st7571->nlines = dt.vactive.typ;
>>   	st7571->ncols = dt.hactive.typ;
>>   
>> -	st7571->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>> +	st7571->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>>   	if (IS_ERR(st7571->reset))
>> -		return PTR_ERR(st7571->reset);
>> +		return dev_err_probe(dev, PTR_ERR(st7571->reset),
>> +				     "Failed to get reset gpio\n");
>>   
>>   	return 0;
>>   }
>>   
>>   static void st7571_reset(struct st7571_device *st7571)
>>   {
>> +	if (!st7571->reset)
>> +		return;
>> +
>
> My interpretation of this function is that calling it guarantees a 
> device reset (or an error). So I'd push this test into the caller.
>

That's a good point. I'll then do the check in the caller.

Actually... at the end I didn't need a st7571_reset() call for ST7567
since it has its own struct st7571_panel_data .init callback function.

So I can just drop the test for st7571->reset being NULL.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

