Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7219F7C6759
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 10:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB6310E43D;
	Thu, 12 Oct 2023 08:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A02A10E43F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 08:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697097769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/ZJmk/yvxywysiwqAeSgrduB50WCm2128HhTQfYvMZg=;
 b=d3mdDMCHqPgWDLyAH7mIRPidATvbeWc1g+r6kVxKHwlNX0upiw+HPMMEwVivfu4ETDb6L+
 MJM8hol2n7vWRcN561KW6jaWaSHUlUkdBNlyGlvZV+1FIn1HsOxUgpT/orZaXK8+btaVES
 UjZI+8QJwBCrEBrIixWkVsRUaeVEkFY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-ngoGMMx5OxyL-hy5xRGCOw-1; Thu, 12 Oct 2023 04:02:38 -0400
X-MC-Unique: ngoGMMx5OxyL-hy5xRGCOw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f42bcef2acso4583725e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 01:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697097757; x=1697702557;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ZJmk/yvxywysiwqAeSgrduB50WCm2128HhTQfYvMZg=;
 b=I857sKI9cklfYhBIkqlkiAzTTNeDOFWNDQL9IMMqQ8jarJJioe6n02QIXwQV4gmB2E
 nWyQ/6Ln6GH4+DXGcMALuTbn3xfGvOIO/4TJD2IjAtypFkCx/4KWJtWFeBW0k+1UqDtM
 z4IC7R6DJ4VF11vHyLKtnBDva+6eZuzmvpXrK9ErmHf7/GO4V93gEggE/t4hr60Q5Zig
 1Av4Cb3jMw3clegkQL8gM2ADaOtPVT0yuz2FbY4LK80pwhzehbQj9zOeKwxGP15rZJZ2
 jve5QG9T1Fj5ZOPlbFnNlzcJ6NY8G3kXQiMM82DuMSu4jGUhnz/PkARpUvDHtcbbJ459
 lpeg==
X-Gm-Message-State: AOJu0YyP0r79klFMdPt7Lmq9I/q7NQg3Rt9UVoH/kuO0u+rrohC567q/
 rJBvQ5EWXWjTKHaGemn0V8d1LllE39VWGZ+W/GM8aAGZnBL+MgFql5MCEJKDn2yKm32fIl6H4vQ
 61rixQTZW0aP2Td3l63qwBM4Ma8ns
X-Received: by 2002:a7b:c3d2:0:b0:405:514d:eb13 with SMTP id
 t18-20020a7bc3d2000000b00405514deb13mr20614248wmj.24.1697097757428; 
 Thu, 12 Oct 2023 01:02:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv0KCNuksA2uv+yIsdoxozzE1E60kM7Qujdqf8Krj5f35WHmA6AkUHXRhBkdQLnBpDMh81EA==
X-Received: by 2002:a7b:c3d2:0:b0:405:514d:eb13 with SMTP id
 t18-20020a7bc3d2000000b00405514deb13mr20614210wmj.24.1697097756750; 
 Thu, 12 Oct 2023 01:02:36 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q15-20020a5d574f000000b00323384e04e8sm17558032wrw.111.2023.10.12.01.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 01:02:36 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] drm/ssd130x: Add a per controller family
 functions table
In-Reply-To: <e6593ea5-daa1-466a-9d42-0c1872f41a13@suse.de>
References: <20231012065822.1007930-1-javierm@redhat.com>
 <20231012065822.1007930-3-javierm@redhat.com>
 <e6593ea5-daa1-466a-9d42-0c1872f41a13@suse.de>
Date: Thu, 12 Oct 2023 10:02:35 +0200
Message-ID: <87a5so46as.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Peter Robinson <pbrobinson@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

Thanks a lot for your feedback.

> Hi Javier
>
> Am 12.10.23 um 08:58 schrieb Javier Martinez Canillas:
> [...]
>>   
>> +struct ssd130x_funcs {
>> +	int (*init)(struct ssd130x_device *ssd130x);
>> +	int (*set_buffer_sizes)(struct ssd130x_device *ssd130x);
>> +	void (*align_rect)(struct ssd130x_device *ssd130x, struct drm_rect *rect);
>> +	int (*update_rect)(struct ssd130x_device *ssd130x, struct drm_rect *rect,
>> +			   u8 *buf, u8 *data_array);
>> +	void (*clear_screen)(struct ssd130x_device *ssd130x,
>> +			     u8 *data_array);
>> +	void (*fmt_convert)(struct iosys_map *dst, const unsigned int *dst_pitch,
>> +			    const struct iosys_map *src, const struct drm_framebuffer *fb,
>> +			    const struct drm_rect *clip);
>> +};
>> +
>
> You are reinventing DRM's atomic helpers. I strongly advised against 
> doing that, as it often turns out bad. Maybe see my rant at [1] wrt to 
> another driver.
>
> It's much better to create a separate mode-setting pipeline for the 
> ssd132x series and share the common code among pipelines. Your driver 
> will have a clean and readable implementation for each supported 
> chipset. Compare an old version of mgag200 [2] with the current driver 
> to see the difference.
>

I see what you mean. The reason why I didn't go that route was to minimize
code duplication, but you are correct that each level of indirection makes
the driver harder to read, to reason about and fragile (modifying a common
callback could have undesired effects on other chip families as you said).

I'll give it a try to what you propose in v3, have separate modesetting
pipeline for SSD130x and SSD132x, even if this could lead to a little more
duplicated code.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

