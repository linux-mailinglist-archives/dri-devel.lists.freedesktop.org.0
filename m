Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6957970A3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 10:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31AF10E790;
	Thu,  7 Sep 2023 08:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2791B10E791
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 08:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694074279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BcKSRQ7c7HAQu4Or5q0ezdUK5yii8WLxMAITQoeqr8E=;
 b=SHSYRxE/aTyo5h4IMeNKyXDhhExPyLBOBZB9RHNoLxlMEdeNo/krtGLiCkRP7R8ykuA6vc
 vsw+Jo0IOKzNIQzFXnDPOYyYpLHdocaoc4aQF2wutfzvPegwC+4UZ9oZkCb2xJn29qVP++
 phTTBQX1LQsLp3Cn4h5Zqzdz9oiHLHk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-D1JZgnhXMM2lwUst-oeHgg-1; Thu, 07 Sep 2023 04:11:17 -0400
X-MC-Unique: D1JZgnhXMM2lwUst-oeHgg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-401c4f03b00so5311795e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Sep 2023 01:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694074276; x=1694679076;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BcKSRQ7c7HAQu4Or5q0ezdUK5yii8WLxMAITQoeqr8E=;
 b=XkfFjfIjIX27xndWb+Y/o2jNBMsG34JqC0QE/ogCks2AJTgGMwbOgSvFKdK499hEnv
 Sq1sl5iW7egDHa4e3emAuivRpYPesSmt9uIICDR9evQ+WelF8dVJzr/avL1ihUZBJuyp
 tYKAKlINVEBc2YwfQhw1Sd8dk26CeVbW0OP4ZTFgxjgs3nusYDL/qBo9TOPH1Iti9vXK
 At6uUDtTFtW90SHj8kLY+6jUEdF84ytjKtrkuAPPbpvdcQlAlh4jxmW4Hw/Qhtvepos5
 MwRHuqRTKkqGsE0GJp5i1nXwWFOIA+U3kNMsXQvXZoLNo35HTmE8+hdk8ygJYgRZwPfm
 JRNw==
X-Gm-Message-State: AOJu0YwfIoEWZHpEna8bnFDy3lQukS52WmKCLPTo7WIVIQDit5kOs6pZ
 QWO8jkRfZe6xPgO7WXDmb1KrtoNmy0BFTZHWTD4am+PAU5HawHDHVOF63GTMuBjvhgeC0PxDL0n
 xnvXsErfKDKHTA9XqNIrCOD4021SI
X-Received: by 2002:a05:600c:2409:b0:3fa:97ad:2ba5 with SMTP id
 9-20020a05600c240900b003fa97ad2ba5mr4396554wmp.31.1694074276286; 
 Thu, 07 Sep 2023 01:11:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE0w0khHfKvp0sEzGDKoRSGsjGPZ4Cz6RhTflL6GnLAlc8FN5WXx0baP2ZiRXWh1E8BESOFg==
X-Received: by 2002:a05:600c:2409:b0:3fa:97ad:2ba5 with SMTP id
 9-20020a05600c240900b003fa97ad2ba5mr4396538wmp.31.1694074276014; 
 Thu, 07 Sep 2023 01:11:16 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f7-20020a7bcd07000000b00401c595fcc7sm1749391wmj.11.2023.09.07.01.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 01:11:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: Remove existing framebuffer only if we
 support display
In-Reply-To: <ZPmCf4892gI88ZNc@orome>
References: <20230825132229.1109445-1-thierry.reding@gmail.com>
 <87y1htawi7.fsf@minerva.mail-host-address-is-not-set>
 <ZPmCf4892gI88ZNc@orome>
Date: Thu, 07 Sep 2023 10:11:14 +0200
Message-ID: <87wmx22yjh.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thierry Reding <thierry.reding@gmail.com> writes:

Hello Thierry,

> On Wed, Aug 30, 2023 at 08:13:04AM +0200, Javier Martinez Canillas wrote:

[...]

>> I also wonder if is worth to move the drm_num_crtcs() function from
>> drivers/gpu/drm/drm_crtc.c to include/drm/drm_crtc.h and use that helper
>> instead?
>
> I've been looking at this, there's a few things that come to mind. It
> seems like we have a couple of different ways to get the number of CRTCs
> for a device. We have struct drm_device's num_crtcs, which is set during
> drm_vblank_init(), then we have struct drm_mode_config's num_crtc, which
> is incremented every time a new CRTC is added (and decremented when a
> CRTC is removed), and finally we've got the drm_num_crtcs() which
> "computes" the number of CRTCs registered by iterating over all CRTCs
> that have been registered.
>
> Are there any cases where these three can yield different values? Would
> it not make sense to consolidate these into a single variable?
>

I als was confused by that when looked at the implementation of the
mentioned helpers and couldn't find a reason why there are different
ways to calculate the number of CRTCs.

Maybe Sima or someone else can shed some light?

> Thierry

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

