Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD68A05BB4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 13:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB8C10E0D5;
	Wed,  8 Jan 2025 12:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bLzQFqEx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30B810E0D5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 12:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736339570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k1UEPDcsnN4NWhYwC/sb2nmfU8hOvBlPL6EYS1RqShk=;
 b=bLzQFqExXWzk83DlhRDzssFV+wABWu9V3SV+1BV7oMn4cmBWytqZe8wA494imZaWY8Db69
 AwPsTE+ixDJl6DciSgykovNHY54LSd7BesJg0hy0MZwuuHStxwAYwh0zmN7wywjmuMB7dZ
 XA1bc7ApoFERhuSnZozkwa60ZGB5yfo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142--bQjkIsKP3Sbv0wgr7FzAA-1; Wed, 08 Jan 2025 07:32:49 -0500
X-MC-Unique: -bQjkIsKP3Sbv0wgr7FzAA-1
X-Mimecast-MFC-AGG-ID: -bQjkIsKP3Sbv0wgr7FzAA
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4361fc2b2d6so53513575e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 04:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736339568; x=1736944368;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k1UEPDcsnN4NWhYwC/sb2nmfU8hOvBlPL6EYS1RqShk=;
 b=OXW80zvLCqUA8/cIhclaCkmgCFchEjykUpT+1/l7fU2/hOsO/DC1PM1CZaLNhiLROy
 s28cy52mRod65k4oCuNNOFBKZR4Tv12F6f1sTuzwegq+guEWjxjDnmpv2OVT3HEtYI9N
 Xbdaf8qiIcazrLULy0ZMy5tnAQ8RDS2IYiHHw1iKJ4/grQKNiJUIhdx+XCsI1u3Z1Wai
 6IoO5yuTkHOVTTik94FfuHsJbfIxihm6pKUYpls/h8O71Rm+1rWUfIAMmHAVYYYJUyUi
 eqisgH7nz57lsyL5gwQ8phXKs3Xdm22Ju/7NX6jjfNnmwfy4lBW4Gmdad3mPuwVmRpqv
 dVMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdk826gqEtZZJnIUOkTIlQVTVsrNicLcdb4GQSLPdYDqJtlEslGHNctZfaB9niTpegJoSOBG1XyTY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0WpBEQafMHjZge+C4ZoQnE0V1hxEFmOJ1/nI2zbum68Bl133c
 w7Co/DLCWI9iPZrqEWvvqBR+3aezukyyTQbc6RuoBpPUEFLUpECcvIaa2o3FMXRT3KKzOQIDy5T
 eG+66rZSoLedsDKOzr0VdZgP7wvP1D7HHFxjtQ4zt/kbhfY+BxIVnCpRqWPHkNYFTUw==
X-Gm-Gg: ASbGncuXSeuj2ytVGdeTA/ATt/Rjqqf4SsqOXloE0V7f7Dk3KAxlwxWhvYITl5slhsL
 Q/fn6Prv+yvsSkS4+WUHwdOCI5YFm9F/S2OJcOWQyxpeqZVzFTlIEz1rg7W2TrLSsKQLWb3LM/6
 BrnorsPZRIhmW9FJ20gMtYQUxW5hvSCyzMA+Nuwb78OWSOPaI2Em62cvgdv53f7VhmosUTAD80l
 lrBf8+ZoRQePsfVQnPVTFvTARzHaq7xmn+0DSMqQDHVbtH1NfanU2BQ+2mLxmTGCDuQlTfmm17M
 sJMPaep/hjndtBjlGWYrseBL1SMDACH1ntZcQm4=
X-Received: by 2002:a05:6000:401e:b0:386:366d:5d03 with SMTP id
 ffacd0b85a97d-38a872da868mr2167430f8f.16.1736339568405; 
 Wed, 08 Jan 2025 04:32:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3m1fLbO7hQhrw5TYsrYCXVEskXDvHw1Rd6gLmWrZvoyyPUUNzgMR6flo65Nq/VSQH5WP8Ag==
X-Received: by 2002:a05:6000:401e:b0:386:366d:5d03 with SMTP id
 ffacd0b85a97d-38a872da868mr2167403f8f.16.1736339567996; 
 Wed, 08 Jan 2025 04:32:47 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a28f17315sm47342858f8f.108.2025.01.08.04.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 04:32:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, David
 Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ssd130x: Set SPI .id_table to prevent an SPI core
 warning
In-Reply-To: <874j2jkcnt.fsf@minerva.mail-host-address-is-not-set>
References: <20241231114516.2063201-1-javierm@redhat.com>
 <p2hzb3ysmthgfi4j6ehwulzk44zf4s5d6bm3nqs2rww47boshl@jr6aqmas4l5p>
 <877c7fkgs5.fsf@minerva.mail-host-address-is-not-set>
 <vrk6nb6umj6754ttm6hugpgiczzuxm2qwpzwptskwdbzozmnjz@tbasj7yk4ksf>
 <874j2jkcnt.fsf@minerva.mail-host-address-is-not-set>
Date: Wed, 08 Jan 2025 13:32:46 +0100
Message-ID: <87wmf5iiz5.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rtqAEeInwnxkPdALAQNWolmX78UEVH1pb35sjy_ryFk_1736339568
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

Javier Martinez Canillas <javierm@redhat.com> writes:

> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
>> On Tue, Dec 31, 2024 at 04:34:34PM +0100, Javier Martinez Canillas wrote:
>>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>>> 
>>> Hello Dmitry,
>>> 
>>> > On Tue, Dec 31, 2024 at 12:44:58PM +0100, Javier Martinez Canillas wrote:
>>
>> [...]
>>
>>> >> Since the check is done even for built-in drivers, drop the condition to
>>> >> only define the ID table when the driver is built as a module. Finally,
>>> >> rename the variable to use the "_spi_id" convention used for ID tables.
>>> >> 
>>> >> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>>> >
>>> > Fixes: 74373977d2ca ("drm/solomon: Add SSD130x OLED displays SPI support")
>>> >
>>> 
>>> I was on the fence about adding a Fixes: tag due a) the issue being there
>>> from the beginning as you pointed out and b) the warning being harmless.
>>> 
>>> But I'll add it to v2 or just before pushing it to drm-misc-next.
>>
>> Just before pushing is enough. dim b4-shazam can do that for you.
>>
>
> Yeah, I meant in case that I post a v2. I'll wait a few days before
> pushing in case someone else chimes in. Thanks again!
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

