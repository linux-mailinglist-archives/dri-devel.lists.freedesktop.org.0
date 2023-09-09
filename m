Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A9E7998E4
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 16:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4FD10E143;
	Sat,  9 Sep 2023 14:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A9510E143
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694270312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0+4HcA1k/8qF1IXNw0Bg9+Q9i2TWOoU8T7hDCYKbYZ0=;
 b=G14NTEOIVYciUIIIDstqiysVj4XiQr+7voS9d7sscsNa/hX8czG0fQTbU35NKVBLWmNSfY
 0PkM6jMZNp4oObshsDJxXMRqAMjurT/yd6wUSqB6SDxEh166RIxAMZJLKqQHbCMfTc/P8C
 tQEu7+h2McPo4TRYExNYBxgJ8UVBP5Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-Bk9lrzQSPrGjDqW0c4yV2A-1; Sat, 09 Sep 2023 10:38:31 -0400
X-MC-Unique: Bk9lrzQSPrGjDqW0c4yV2A-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-401c4f03b00so23297175e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Sep 2023 07:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694270309; x=1694875109;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0+4HcA1k/8qF1IXNw0Bg9+Q9i2TWOoU8T7hDCYKbYZ0=;
 b=d05VUNIGy0pFVT/9JU4NioH2kMjtYcJujjEtA9o9O8VzZ3h4AHv5DEM8nydYPXKkiE
 RLuDe21Fu8XPxP8dU6N9bVOIP3++A3aC+pDtekOuLV4ZAwRABO/7czdGmkiO0haqWZ2t
 axn5BdMl7zc4803+5xG3vVcnR0WZCvxGhFZOCLyJg/xwhRZy+jaGWAOnSs+CLAsIehMv
 MgLiz6voiFkKCM/i8mYYToEIB4+RU7alSre5FyuGYF8lx0KkCRRfHiEeCICxvI6Qr41I
 HKg+NWql+k64lgaNi8YLzbOYE+WZqtoLKHDxu6Ns7NsyLQsPi1xtAAsqXyONGrJwYJNJ
 Dzzg==
X-Gm-Message-State: AOJu0Yy3l6lh3yrpTuWZ3wTVuDytUJ8ZR0NKfh28xlrjtKJ+KBnJ5i9b
 vs6FFgHjeM4P4MRs1AjFqwk1bEy8nnq8GYagJ9OdkOIboduWqJmklsE1KW0jZ+UPPPzBqAgKl19
 3e1B+RTmQU+lZCknMU8XiiEfIsA2iHAIdGuamnrc=
X-Received: by 2002:a1c:ed08:0:b0:401:d803:6242 with SMTP id
 l8-20020a1ced08000000b00401d8036242mr4639448wmh.27.1694270309542; 
 Sat, 09 Sep 2023 07:38:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOej/d14sWmLizTh2i9esPauTJp58e7fPOscywQN9ddxhYmMXBFm9Ht5FE7LNRjGS+PLhdRQ==
X-Received: by 2002:a1c:ed08:0:b0:401:d803:6242 with SMTP id
 l8-20020a1ced08000000b00401d8036242mr4639434wmh.27.1694270309221; 
 Sat, 09 Sep 2023 07:38:29 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c315300b00402bda974ddsm4869260wmo.6.2023.09.09.07.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 07:38:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Helge Deller
 <deller@gmx.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: Re: [PATCH 2/3] video: fbdev: ssd1307fb: Print the PWM's label
 instead of its number
In-Reply-To: <87lef0xcw4.fsf@minerva.mail-host-address-is-not-set>
References: <20230728145824.616687-1-u.kleine-koenig@pengutronix.de>
 <20230728145824.616687-3-u.kleine-koenig@pengutronix.de>
 <87lef0xcw4.fsf@minerva.mail-host-address-is-not-set>
Date: Sat, 09 Sep 2023 16:38:28 +0200
Message-ID: <87zg1vif8b.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:
>
>> struct pwm_device::pwm is a write-only variable in the pwm core and used
>> nowhere apart from this and another dev_dbg. So it isn't useful to
>> identify the used PWM. Emit the PWM's label instead in the debug
>> message.
>>
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>> ---
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

Pushed to drm-misc (drm-misc-next). Thanks!

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

