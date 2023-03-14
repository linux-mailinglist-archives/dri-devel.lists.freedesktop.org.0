Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B456B9AA1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 17:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B840F10E844;
	Tue, 14 Mar 2023 16:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AD010E84F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 16:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678809913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dGR7rnzQU4+OplsWaATHZ55m61w54EhaATkQ2WBXuU8=;
 b=e4I8Stp6kv6kcYNN4iejf/hOkk3tY+d9S5WxGJfbJYoN+3/53asKNeXMXXJRzzdkMjAioM
 VZzDnqWIGgO8iSfQ4u2JhVi52h0mZLOyQyrl+iJs2WhK+Haq8y/yeD4lIbrgWvLI+ziP4U
 fuBBNlLNU0jGZKa34cuby8D0k/obQoQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43--7_pQ5AwPuuz6-R2XA0coQ-1; Tue, 14 Mar 2023 12:05:10 -0400
X-MC-Unique: -7_pQ5AwPuuz6-R2XA0coQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 o2-20020a05600c510200b003ed2c898324so1029755wms.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 09:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678809907;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dGR7rnzQU4+OplsWaATHZ55m61w54EhaATkQ2WBXuU8=;
 b=kMkT39s020s1ZNh95GFUgiaAot9jUfyhsv7YNGlDxeTCnEukm2FmyfRVUn5SyHOY+R
 d5T6iYwsasv1iTabH5e5GDXocodk58CLTN6U43UvXT6jgELbstMASrlFWVGMpIT7Qpaj
 fc0foFNZg0KB+boLxVHkILMkp5Oa5QjtujvIUvW8g0uFuMWwMDzATBuCU5FVg2QVbb8x
 v/d2GmV8gZ9ygGChuN2cDUVmYPfph1aj5TCgqYo6vzD7MXdYL/qUdxLbyKHF0Cnuxs9g
 aFaiKd+yA+UOI2CqbEqOhR+c6yKsYGV9iwsapK4lMgivl5ICTdF4E6VTHzd6LCG4LHvT
 QSMA==
X-Gm-Message-State: AO0yUKUfv71azB4TH+oZ4hvuh2WFuk2VJo5z4QUQ7qDlRkoh9FfyDq+X
 z0Wov66CU2r2e1rcH9y+yjuHXd0eYzegsnjzrLMqlkHo3JDR0jh3UdiOemJrO4Is9JeApuzN3Qk
 IIkjJlGAPCC9dhwhKRCnR4T3KFWq8
X-Received: by 2002:a05:600c:4f91:b0:3ed:2c92:9f4f with SMTP id
 n17-20020a05600c4f9100b003ed2c929f4fmr2497188wmq.10.1678809907240; 
 Tue, 14 Mar 2023 09:05:07 -0700 (PDT)
X-Google-Smtp-Source: AK7set9xSEo7gCICSkLAf2zsB02OWfCkjdy+yaejHZtyJwi5t5dZZAehVmN38jPmBozEi8lyKugTiQ==
X-Received: by 2002:a05:600c:4f91:b0:3ed:2c92:9f4f with SMTP id
 n17-20020a05600c4f9100b003ed2c929f4fmr2497152wmq.10.1678809906889; 
 Tue, 14 Mar 2023 09:05:06 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t18-20020a1c7712000000b003ed2987690dsm3148966wmi.26.2023.03.14.09.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:05:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6ni?=
 =?utf-8?Q?g?=
 <u.kleine-koenig@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo
 Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Tomi
 Valkeinen <tomba@kernel.org>, Alain Volmat <alain.volmat@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH] drm: Drop ARCH_MULTIPLATFORM from dependencies
In-Reply-To: <bbd54405501ec660ac941971e2203855fd79a90f.camel@pengutronix.de>
References: <20221209220555.3631364-1-u.kleine-koenig@pengutronix.de>
 <bbd54405501ec660ac941971e2203855fd79a90f.camel@pengutronix.de>
Date: Tue, 14 Mar 2023 17:05:04 +0100
Message-ID: <87ilf3l3nz.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-samsung-soc@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Philipp Zabel <p.zabel@pengutronix.de> writes:

> On Fr, 2022-12-09 at 23:05 +0100, Uwe Kleine-K=C3=B6nig wrote:
>> Some of these dependencies used to be sensible when only a small part of
>> the platforms supported by ARCH=3Darm could be compiled together in a
>> single kernel image. Nowadays ARCH_MULTIPLATFORM is only used as a guard
>> for kernel options incompatible with a multiplatform image. See commit
>> 84fc86360623 ("ARM: make ARCH_MULTIPLATFORM user-visible") for some more
>> details.
>>=20
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>> ---
>> =C2=A0drivers/gpu/drm/imx/Kconfig     | 2 +-
>> =C2=A0drivers/gpu/ipu-v3/Kconfig      | 2 +-
>
> For i.MX / IPUv3,
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>

Pushed to drm-misc (drm-misc-next). Thanks!

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

