Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D167C675D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 10:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08FD10E440;
	Thu, 12 Oct 2023 08:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4645310E440
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 08:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697097925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I5BfyE4ROg0DfC04dTnY4NwKgtFpCLhqUD4tbkNuiPI=;
 b=RzTdRp9FGfB+NYFmVVo87hypa0mEdVEkuADK7Fj8ZA0W8jxFJGp/ZvDW7NySumkx0fcwTj
 J0fh5cFyKlcCMDmmyJ7WLzDChL/6Ic5ttp1W85eCztpWDEC8l+osc8Q4T4XB4P+kqg8y5d
 Z8EVJ8lcZnlU5hCLeexVjSsr1Q8B2Mc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-kzarTDNHO1-_DvfJWXAnjg-1; Thu, 12 Oct 2023 04:05:14 -0400
X-MC-Unique: kzarTDNHO1-_DvfJWXAnjg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-32cef5f8af5so781334f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 01:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697097913; x=1697702713;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I5BfyE4ROg0DfC04dTnY4NwKgtFpCLhqUD4tbkNuiPI=;
 b=aRgJSuJYK7qFt9+KJdm1vP80WBlSAtRmWgoqcVIjsf5IgtW0NKg6OimUCg+MPwOKLB
 KZUyPh7InP4TGWqvDvlIB5iYohcpRjys3SNDAJY6buoyESl0JFEyUnGb814NPl0edaQ2
 Usac35Qon0uTOPZimSNj0L6RMtJVbJsirOhgAxI5xzj3V2Mn1EEnZv09HihRAdLmiyoI
 acwEOTlyjDLknM10E550t4/5KqpQmwisDUD1FE10AumXnKJWyMwmAUw3cFSnjMkb0hAw
 fWUxYIoDjKSl694TLp1nGUMsJ4UXxV/e9pr6W7x7TGPVQDudru6zHvSGF7wxm9g5IxQh
 Brzw==
X-Gm-Message-State: AOJu0Yyhy/kvDsDYEq+RdOKv6JAd273FJd56cU2y2WuWrfEpMIXNSIqW
 MZfyQ1jS4EopcJeYuVDm30b9MdODVj6Oqbey0Yr48wXOB5yonV7AxLhz8r9J8ROfjGiJ2FNy3NB
 OqjHFwu8ZQceuomezbDT38QrRgWXt
X-Received: by 2002:adf:f984:0:b0:314:314e:fdda with SMTP id
 f4-20020adff984000000b00314314efddamr18322541wrr.23.1697097913255; 
 Thu, 12 Oct 2023 01:05:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFt1XwzzMhY09tN5qGTlWeEUZKQYgIaFEs1s2yqlG/dcK10DSfyCESrGI1Fxn+bzhxFtBA4g==
X-Received: by 2002:adf:f984:0:b0:314:314e:fdda with SMTP id
 f4-20020adff984000000b00314314efddamr18322516wrr.23.1697097912921; 
 Thu, 12 Oct 2023 01:05:12 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t4-20020a0560001a4400b0032763287473sm17849248wry.75.2023.10.12.01.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 01:05:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 4/6] drm/ssd130x: Add support for the SSD132x OLED
 controller family
In-Reply-To: <CAMuHMdVuDvomz57RHr2NMG9+a=AXy1H39Tv5jN+1J2sqv4+3rg@mail.gmail.com>
References: <20231012065822.1007930-1-javierm@redhat.com>
 <20231012065822.1007930-5-javierm@redhat.com>
 <CAMuHMdVuDvomz57RHr2NMG9+a=AXy1H39Tv5jN+1J2sqv4+3rg@mail.gmail.com>
Date: Thu, 12 Oct 2023 10:05:11 +0200
Message-ID: <877cns466g.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

Thanks for your feedback.

> Hi Javier,
>

[...]

>> +       u32 array_idx = 0;
>> +       int ret, i, j;
>
> unsigned int i, j;
>

Right, I'll change that in v3.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

