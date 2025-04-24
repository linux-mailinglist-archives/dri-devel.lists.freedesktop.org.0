Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71F6A9A281
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 08:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FFD10E72D;
	Thu, 24 Apr 2025 06:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ghRccGvN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECD110E72D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 06:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745477121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qry02Jna1PBtzsWWvIZILFK6/+S37RFrn9UY0skeI+c=;
 b=ghRccGvNIPLntaJFwQusxYih8sEdT5+s5mzubFDkkfh/7bPeS5GU7VwmYj/r7m0mkmVhQb
 SqiVa9a9OaieDQmap7iQyNsVkXhLGkH+ke8dFXmVR+cJxjeyQPFnfF1HUG0doy3zHl97jD
 mEfO0WXxOwVyuBNIiayb4jHficHuFdY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-lv6j3CCCO4-IuHF0gw5YAQ-1; Thu, 24 Apr 2025 02:45:19 -0400
X-MC-Unique: lv6j3CCCO4-IuHF0gw5YAQ-1
X-Mimecast-MFC-AGG-ID: lv6j3CCCO4-IuHF0gw5YAQ_1745477118
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43d0a037f97so2917725e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 23:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745477118; x=1746081918;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qry02Jna1PBtzsWWvIZILFK6/+S37RFrn9UY0skeI+c=;
 b=kO/8/wloqb1jhgfmIbS1mdIl1J33BlFwmOJK1dBz+t4+ANzV21e0lMWCzqxeYQKjJ5
 CTWPbuz5Pacxpy6zYjGljefcHJ4Ye/I5ihSDCEzsrVVajSf3nTFUzCirMZG1qgSB8PsP
 LksxGLDC26/mxwccVFZbY7apnxpP86WWhbttjaV5kl1ztTkNhD9dM2iAxLQ2H7hOwQjo
 AcgzD2v35eiUn8QPXOj+eP7VYayYTcZAfUE3BcLgbIGYqPT8NZS+oc58tHVugEPKy4GY
 fdurTwIUXqRXN/lky/K1PMHNPMwF2+f2ASyK87p1LsnKoFW5NH1m/2uWLAI0TXBjDDnG
 WY2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWchvigFkCvidyRbIqeXyPVezk0XHT2OWZZteVklVDLawI0q63fzd6WkEbG7UlqzwHP2TmAe8qqrzI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaMOuWGHmqaFsrCSC+Vlg15Z+gUu9kSm/yC7gRiy62Sqf471lh
 OEdtecrBz77Z7jVvpxpv/73hZLUxln8Tz0bw6Ss7XsqiwBT7vu/6d3ygHuo4zera3fyjRzb3km+
 t+j/QO/NTJdcwXrQ3E1mN32XwZd6W58IPWdmVmzZMJu45qyu0T+DFi4oGZrZZkl7ZfA==
X-Gm-Gg: ASbGncvCRZvS1SUPycbNfKMDYXFd6lad8nDZQsn4FBUvJdprV2RQs48J0ceodUaC7Fj
 L9MyHuMdqStX5sR2Z6fI6wKOYn7xGSRJMT4rehnfTAXEvhe/7GGggm43b60/6HLF9WdZOajqlyy
 lnhXh+rW8K13ZXzv32SHI8vTTh3xUvEKYUvNdlJDb7rOq4n6otzs1b2f7/yNYLvb1mPEtZd6B4A
 /SuOsIvY6+3+r0EfJ7sgzFp7RpBhvWAY8IqAow+DTtw8nHGOoTHxOlbiJ7feT6YpLtz8BIaNPk2
 3HrOr7iTWNiQ/ZnjszSonYHUsH5bgDdlQolgLufwOc6kz1F6wal4S2okPioBmWt4fDkcKA==
X-Received: by 2002:a05:600c:3487:b0:43b:ca39:6c7d with SMTP id
 5b1f17b1804b1-4409bd050f9mr12158215e9.3.1745477118461; 
 Wed, 23 Apr 2025 23:45:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwbNdfCqgffEIdROOn7ufwYiYIlZP1WbjZdiw5JEvm9+u5qpIj14gNnOoTiUF1Ibt/YIL6PQ==
X-Received: by 2002:a05:600c:3487:b0:43b:ca39:6c7d with SMTP id
 5b1f17b1804b1-4409bd050f9mr12157895e9.3.1745477118044; 
 Wed, 23 Apr 2025 23:45:18 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4408d0a7802sm46104405e9.1.2025.04.23.23.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 23:45:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas
 Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
In-Reply-To: <aAnb_97kxSDvDcdd@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <aAnb_97kxSDvDcdd@gmail.com>
Date: Thu, 24 Apr 2025 08:45:15 +0200
Message-ID: <87zfg6xdl0.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rPKYgBvUlDcAuVpm-CJItLUqIqjerkl6rtlJ1nAjdqY_1745477118
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

> Hello Javier,
>
> On Tue, Apr 08, 2025 at 12:44:46PM +0200, Javier Martinez Canillas wrote:
>> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>> 
>> Hello Marcus,
>> 
>> > Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
>> > The controller has a SPI, I2C and 8bit parallel interface, this
>> > driver is for the I2C interface only.
>> >
>> 
>> I would structure the driver differently. For example, what was done
>> for the Solomon SSD130X display controllers, that also support these
>> three interfaces:
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/solomon
>> 
>> Basically, it was split in a ssd130x.c module that's agnostic of the
>> transport interface and implements all the core logic for the driver.
>> 
>> And a set of different modules that have the interface specific bits:
>> ssd130x-i2c.c and ssd130x-spi.c.
>> 
>> That way, adding for example SPI support to your driver would be quite
>> trivial and won't require any refactoring. Specially since you already
>> are using regmap, which abstracts away the I2C interface bits.
>> 
>> > Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
>> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>> > ---
>> >  drivers/gpu/drm/tiny/Kconfig      |  11 +
>> >  drivers/gpu/drm/tiny/Makefile     |   1 +
>> >  drivers/gpu/drm/tiny/st7571-i2c.c | 721 ++++++++++++++++++++++++++++++++++++++
>> 
>> I personally think that the tiny sub-directory is slowly becoming a
>> dumping ground for small drivers. Instead, maybe we should create a
>> drivers/gpu/drm/sitronix/ sub-dir and put all Sitronix drivers there?
>> 
>> So far we have drivers in tiny for: ST7735R, ST7586 and ST7571 with
>> your driver. And also have a few more Sitronix drivers in the panel
>> sub-directory (although those likely should remain there).
>> 
>> I have a ST7565S and plan to write a driver for it. And I know someone
>> who is working on a ST7920 driver. That would be 5 Sitronix drivers and
>> the reason why I think that a dedicated sub-dir would be more organized.
>
> I'm looking into moving all the (tiny) Sitronix drivers into their own

Great!

> subdirectory.
> When doing that, should I replace the TINYDRM part with DRM for those drivers?
> E.g. CONFIG_TINYDRM_ST7735R -> CONFIG_DRM_ST7735R.
>

I would drop the TINY prefix. That's also why I thought that your new
driver not having TINY in its Kconfig symbol name was the correct call. 

> Or do we want to keep the config name intact?
>
> Best regards,
> Marcus Folkesson

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

