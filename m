Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D9F4CDEE6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 21:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99AD11293F;
	Fri,  4 Mar 2022 20:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B6911292D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 20:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646426883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fIKaFpflRd9hwR16NlF6OnU9QoRFMeWutPRp1q0p0c0=;
 b=XFhNIIaGGxeEaNe5UIGYV8BXf8vMC6N4SK8tl6WFFVUlQpOm5RYMw6b4YOOtSEbI3RLOVj
 ZoB+FoM8quLDSd4VIFRMlmg0pyhkMWvj4jOg2rmTX6yuUnF7Tx5Z0fynaadEitHYRCrey4
 XwgcmLhgb8bT84t59AHjC8sD42YZm9w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-xX4p6LqfNbCqT50eDh2Mqg-1; Fri, 04 Mar 2022 15:48:00 -0500
X-MC-Unique: xX4p6LqfNbCqT50eDh2Mqg-1
Received: by mail-wm1-f69.google.com with SMTP id
 f13-20020a05600c154d00b003818123caf9so2857534wmg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 12:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fIKaFpflRd9hwR16NlF6OnU9QoRFMeWutPRp1q0p0c0=;
 b=g7mLNNonIeLhuy7E2KThd1lkOz9igLRZLngN+mjqz9CmJV/uTGmXRpYIuyZmZqYzxq
 uhq6SLNh2bHYmHJ/r6jI+8uD86cQXIEtqXUq0XOo4Z4W8GAG/D6vX9IDYBAGj5V4kT8n
 JKtLeuH4krdx92E+IoNlksV+ucTvUJtRv1Z6v50kKKlJWvzPercOSFZeUi+/t56KHyyY
 kDsUWSGlGtT5ytoHuKE0AhO8AUzIB75dVxdCiy0Ga/GfqhNkXmV/X9KYedhMChf7UTQe
 33psT7jS0Ahd8Qi15yg5f8jEsDOwZgKs5kPlPFw37TIn2SrdgcLdmlsejiC365MeJm4F
 oEcw==
X-Gm-Message-State: AOAM530Gip2jALv+BbKbs4F6o8ifuAaDHkgQPUIDx8OZoBiNoUkAYobJ
 d+hAG76IMDNDG7YkhQu1f5Pbg4hLQquEQDUa/Iwa7ORcAzZjlGEGGnd+dp7HJ+bLVqSZoVmJj0G
 iADN0uo+TFgQc94uKsUEveBk7GxXU
X-Received: by 2002:a5d:6c66:0:b0:1f0:5fd5:697 with SMTP id
 r6-20020a5d6c66000000b001f05fd50697mr365411wrz.65.1646426878899; 
 Fri, 04 Mar 2022 12:47:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzltMdM718VwuVL5pcJNjWElXTGeJCCvXaeW2MlBTYMP981ds1+0SMQ7OOkDx5SiXxjBKq6wA==
X-Received: by 2002:a5d:6c66:0:b0:1f0:5fd5:697 with SMTP id
 r6-20020a5d6c66000000b001f05fd50697mr365399wrz.65.1646426878644; 
 Fri, 04 Mar 2022 12:47:58 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a5d6b43000000b001e317fb86ecsm5110984wrw.57.2022.03.04.12.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 12:47:58 -0800 (PST)
Message-ID: <8d1c3caf-96ad-ae4c-021e-ac38f179dfcb@redhat.com>
Date: Fri, 4 Mar 2022 21:47:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] simpldrm: Enable boot time VESA graphic mode selection.
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20220218093334.24830-1-msuchanek@suse.de>
 <354f3cfd-bfa0-3ebe-3d67-705423d9294e@suse.de>
 <20220302193846.GT3113@kunlun.suse.cz>
 <2ba8497f-ba6d-558b-d782-bb3ee67d23ec@redhat.com>
 <81f87874-4aa8-265d-a0ed-c8a67708a92a@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <81f87874-4aa8-265d-a0ed-c8a67708a92a@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-video@atrey.karlin.mff.cuni.cz, Borislav Petkov <bp@alien8.de>,
 Maxime Ripard <maxime@cerno.tech>, "H. Peter Anvin" <hpa@zytor.com>,
 Martin Mares <mj@ucw.cz>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Ingo Molnar <mingo@redhat.com>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 3/4/22 21:00, Thomas Zimmermann wrote:
> Hi,
> 
> I've merged the patches into drm-misc-fixes. Thanks a lot to both of you.
> 

Ard already picked these through the efi tree:

https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git/log/

> Best regards
> Thomas
> 
-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

