Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6907AAEC2
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 11:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEDB10E05B;
	Fri, 22 Sep 2023 09:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F8A10E05B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 09:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695376245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kZdUq4bBr+9g8/wPQcLNCnBOGM2aLPYGN/Yjl9htiv8=;
 b=MC472L3qnNl0NJ5RX72O3gTvucvD3mhey2f1LCknp5AR3P/r434+H9jamMKcneJpuqvO2E
 FP0V0JX7uRZRWNPYPzE2feV73bC/2JmY7Oxni2dQCslAGjaBu8c36hqo0Vjb+v6KOz0VHR
 JiKlnrv7RSz2cU6ZYLNR3Gs5IZBZDLU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-nyUwU3oAMhq32CGLatCPYQ-1; Fri, 22 Sep 2023 05:50:44 -0400
X-MC-Unique: nyUwU3oAMhq32CGLatCPYQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4053f023d77so2905275e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 02:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695376242; x=1695981042;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kZdUq4bBr+9g8/wPQcLNCnBOGM2aLPYGN/Yjl9htiv8=;
 b=haARtygoAi2GGrcKwDI/6F3LayVRv/yyNq90Mqk134NPwrdM3QOn3wkg5dMyubxgpz
 5fTqPuz+UR1HvkefiWC0PRG+o5OLYe66Bs/h1bGle7q0dPA5PfIwMa2sRsaGaWOaVCry
 nfsw2KVVSLhOsPyx05s216zd/W7R+YUINMfQufaGIdtrS/jllQBB2HzpzmlANOO1rcvv
 krLgN2x2P54jZC4xxaE/MHA32iKjr4sT0iO1xvR0X8V596nFV52vPIuoiSt3lxPj1S/i
 S0Z4pq5zReOsvMwHsmSreNDwtwX8q61/jqScFh2HH79UiLfV/XXLBA7a0CO+U43eiYkU
 h2tg==
X-Gm-Message-State: AOJu0YzScORxS3z67GKkeQpHF7lnX3Kp424cK4QPWmxm+VviTlXLhf6M
 vrtWvEqh7Dlc456V2YzumOKFxhhyneeL0SzZtFwtQtmnoHPDZDXXRl2We47beTOMq8JmkUSfcsx
 l4A1WuziU3Ghg32gS+OBJsCvbkc33
X-Received: by 2002:a05:600c:2e4c:b0:405:3f06:c075 with SMTP id
 q12-20020a05600c2e4c00b004053f06c075mr876350wmf.6.1695376242592; 
 Fri, 22 Sep 2023 02:50:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkca4yZ67Qrwm6oiKqUmbmS5dmwU75efDVvG95Z6Zrk7fJrIHZ6senSxziEpE9nmlan6YTvA==
X-Received: by 2002:a05:600c:2e4c:b0:405:3f06:c075 with SMTP id
 q12-20020a05600c2e4c00b004053f06c075mr876329wmf.6.1695376242207; 
 Fri, 22 Sep 2023 02:50:42 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m20-20020a05600c281400b003fe1630a8f0sm7019555wmb.24.2023.09.22.02.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 02:50:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/ssd130x: Drop _helper prefix from struct
 drm_*_helper_funcs callbacks
In-Reply-To: <f171c049112dfc21f0a1127edcd5717f.mripard@kernel.org>
References: <20230914195138.1518065-1-javierm@redhat.com>
 <f171c049112dfc21f0a1127edcd5717f.mripard@kernel.org>
Date: Fri, 22 Sep 2023 11:50:41 +0200
Message-ID: <87sf76k03y.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Maxime Ripard" <mripard@kernel.org> writes:

> On Thu, 14 Sep 2023 21:51:24 +0200, Javier Martinez Canillas wrote:
>> The driver uses a naming convention where functions for struct drm_*_funcs
>> callbacks are named ssd130x_$object_$operation, while the callbacks for
>> struct drm_*_helper_funcs are named ssd130x_$object_helper_$operation.
>> 
>> The idea is that this helper_ prefix in the function names denote that are
>> 
>> [ ... ]
>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

