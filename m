Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 225D66508D7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 09:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B919910E215;
	Mon, 19 Dec 2022 08:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276F810E207
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 08:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671439766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IktmGi/GH9m87qz738gkFkEcXhvUHauf4KIOhOQpfo=;
 b=fIbrYh59zgsbCBtm8OeWulT+FZOT4giMOdyKg6hktkHbd1KyKekULc5v/EPdvJniurbERi
 uOzqoGWZSDYBxdmBvAiHbg84cACMKWD/Jvfse8jU+lN/I03mdv84y9MfWZLsKrqkZpX6dq
 Z8Fe7pXKt5g7pcH26XTuRrhIn1A5ODY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-358-6bvsfel0PF25uk1pMlGwwQ-1; Mon, 19 Dec 2022 03:49:24 -0500
X-MC-Unique: 6bvsfel0PF25uk1pMlGwwQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so6322838wme.7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 00:49:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3IktmGi/GH9m87qz738gkFkEcXhvUHauf4KIOhOQpfo=;
 b=6KB/J0VmFOUow0BDPS3npxQxvMEJFvfVU7TAlxLva30bDG67e34Nv9WF14CKzJ+MnP
 ULVw3wHHVKAMN2AtJwVypn1bq4m9OaMrCScVzs7hj1aVxL8PrhKUCHmVIBHccrSv/yO5
 /VajEum8Lab569TPXKcaLu1VGTVUc+sh88qBWxJ4vFJogOg09EfQgPHOEp4eR23jL3Ap
 JJUW84TQoC14ilrboQ+dLqn9abTn+nPN6fLLVlWthiGf1Bf6Y8mfN4Ea3uD3sunS7eit
 DnwTbXyl34iTwoFjSaI4Cio4FDLOUWfgCrSHGWS5SuygD7KvJFBAFlQVvnvdtPd5PQax
 Sosg==
X-Gm-Message-State: ANoB5pnJvl6IOg3nPxydoEEB2mNVFjnb74PbnfPFg1JspOV54oOuoNHq
 /oMf21/HHt72z2vVDYa1pFFlAt2Q7uHcH2VpUXY/KT+0XvZjLkr8pmSs0mnK6rg33HQKB0UwaV2
 zMzTMb0F9ZvMPE0gmL+c/dt7YKc/N
X-Received: by 2002:a1c:6a01:0:b0:3cf:d365:1e86 with SMTP id
 f1-20020a1c6a01000000b003cfd3651e86mr42747686wmc.31.1671439763823; 
 Mon, 19 Dec 2022 00:49:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5mBzP19fZOdLBEJmJRVSsZifpUbMwbq1/5C+qMXTEcf81BL0BpsCtpT5x/OuE2fmd/lVCHFg==
X-Received: by 2002:a1c:6a01:0:b0:3cf:d365:1e86 with SMTP id
 f1-20020a1c6a01000000b003cfd3651e86mr42747667wmc.31.1671439763587; 
 Mon, 19 Dec 2022 00:49:23 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n15-20020a1c720f000000b003cf4ec90938sm11399798wmc.21.2022.12.19.00.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 00:49:23 -0800 (PST)
Message-ID: <c1f358fc-5784-b3b2-2d9e-bc896b8036ff@redhat.com>
Date: Mon, 19 Dec 2022 09:49:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3] drm: Only select I2C_ALGOBIT for drivers that actually
 need it
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Dave Airlie <airlied@redhat.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 John Stultz <jstultz@google.com>, Xinwei Kong
 <kong.kongxinwei@hisilicon.com>, Chen Feng <puck.chen@hisilicon.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
References: <20221219083627.1401627-1-u.kleine-koenig@pengutronix.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219083627.1401627-1-u.kleine-koenig@pengutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: kernel@pengutronix.de, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Uwe,

On 12/19/22 09:36, Uwe Kleine-König wrote:
> While working on a drm driver that doesn't need the i2c algobit stuff I
> noticed that DRM selects this code even though only 8 drivers actually use
> it. While also only some drivers use i2c, keep the select for I2C for the
> next cleanup patch. Still prepare this already by also selecting I2C for
> the individual drivers.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Thanks for sending a v3 of this.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

