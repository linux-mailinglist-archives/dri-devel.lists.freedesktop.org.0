Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737857EEDFD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 09:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB2510E732;
	Fri, 17 Nov 2023 08:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E9410E730
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 08:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700211553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Byhpwk2/A3BTTrDnw3Tvan6MgRg9rKnyNsb/HuoIkE=;
 b=PggCT6JKfBYVo0jxO3s2KkLxUMtN0/QLQ1Z/AJ2jr5zbxB5+UW501fvsuwyhyQI4iIKNjM
 oJqbfDHqnYqQHBilX/4B+ZQnS54TN/waB7Cpyian0sV5IY+Tb7JVQp5uGG4l6TlzOhi4ye
 Q4my8RqNo0rG41PpsF+gDt1cPwq49Yo=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-aC36Ex8lNaeQKp91UyTV5A-1; Fri, 17 Nov 2023 03:59:11 -0500
X-MC-Unique: aC36Ex8lNaeQKp91UyTV5A-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-507a3426041so2055979e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 00:59:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700211549; x=1700816349;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Byhpwk2/A3BTTrDnw3Tvan6MgRg9rKnyNsb/HuoIkE=;
 b=LfQPTHqMN7TlU7vx+MdX5uRVgLhx+5Uv90s7yD3WuZv+YqfL3dv0McPKgJMWZFcG9b
 xdWUB7fbhrC6Bo5L6Vyoq5rKroLXOCimCgVDTC+U5tF+RydW+GMqOnOAA/G8e2FIG871
 lsVUGz60+2VrTQgSAsOhqwrvhhwC+LEftvNYy2rHlKViYmoH5fP3rJVz3akYmtQ5SseO
 fbZSv7zCYhfspuxkcoVvEwzEM1Xd3HTM3uheJqKowHZXBsTZM6cN0cwSOlsdLpf0fnTd
 7PglRgTaI4h3FuODe3IZAof+kUeIfzJivqKgHihSmTOLdNSJyHr44A1TbW13WsmP2F7n
 2uBQ==
X-Gm-Message-State: AOJu0YzCxXkY//KCEh9q7V4K4dhl53GLskfZx9ZaOK0KAsexfePTn8+j
 frTuMO6OPXdX60uixNaMDVNzO2qP6RgvjzmOcdrzYZElY3YGiBzP8Z6uOhs1bPz946k7x7x84Ob
 245yyJHkCkDLpjkGR81BKWfeQeMam
X-Received: by 2002:a19:6750:0:b0:504:4165:54ab with SMTP id
 e16-20020a196750000000b00504416554abmr12509660lfj.56.1700211549351; 
 Fri, 17 Nov 2023 00:59:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1Xx/JkBR8X2j/yAZzxPqImj1jjZaqjRHY0rocPVsfRInahUfAj7V5QZs0li/AiGaluqsLJQ==
X-Received: by 2002:a19:6750:0:b0:504:4165:54ab with SMTP id
 e16-20020a196750000000b00504416554abmr12509649lfj.56.1700211548917; 
 Fri, 17 Nov 2023 00:59:08 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i3-20020a5d5583000000b0031f82743e25sm1648384wrv.67.2023.11.17.00.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 00:59:08 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 3/3] drm/ssd130x: Change "solomon,page-offset" property
 default value
In-Reply-To: <yqneztpzmhhqenommpvhw2pksjspq7srpeba7ckfia5z3c5aap@wmnxhbgcflnd>
References: <20231116180743.2763021-1-javierm@redhat.com>
 <20231116180743.2763021-3-javierm@redhat.com>
 <yqneztpzmhhqenommpvhw2pksjspq7srpeba7ckfia5z3c5aap@wmnxhbgcflnd>
Date: Fri, 17 Nov 2023 09:59:08 +0100
Message-ID: <87bkbs21sz.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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
Cc: Sahaj Sarup <sahaj.sarup@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

Hello Maxime,

> On Thu, Nov 16, 2023 at 07:07:39PM +0100, Javier Martinez Canillas wrote:
>> This is used to specify the page start address offset of the display RAM.
>> 
>> The value is used as offset when setting the page start address with the
>> SSD130X_SET_PAGE_RANGE command, and the driver currently sets its value to
>> 1 if the property is not present in the Device Tree.
>> 
>> But the datasheet mentions that the value on reset for the page start is a
>> 0, so it makes more sense to also have 0 as the default value for the page
>> offset if the property is not present.
>
> I can see the argument, but that's a DT ABI breaking change.
>

Yes, I know it's a DT ABI breaking change but what I'm trying to argue is
that the DT binding schema isn't correct to start with. Even the RPi DTBO
for this device (which I guess is used by most people with a SSD1306) has
a property to explicitly set this to 0:

  ssd1306: oled@3c{
    ...
    solomon,page-offset = <0>;
    ...
  };

https://github.com/raspberrypi/linux/blob/rpi-6.1.y/arch/arm/boot/dts/overlays/ssd1306-overlay.dts

>> In fact, using a default value of 1 leads to the display not working when
>> the emulated fbdev is attached to the framebuffer console.
>
> Could we fix that one instead? What is the issue about, exactly
>

This is the issue that Sahaj reported:

https://twitter.com/sahajsarup/status/1725088484736766364

I can try to figure out how to make the fbcon to work with a page-offset=1
but didn't investigate since thought that 0 is a much better default. Just
like the maximum resolution is the default if no width and height are set.

> Maxime

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

