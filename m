Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B909479309B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 23:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2686510E518;
	Tue,  5 Sep 2023 21:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A881C10E19D;
 Tue,  5 Sep 2023 21:06:06 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-986d8332f50so465519466b.0; 
 Tue, 05 Sep 2023 14:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693947965; x=1694552765; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9XU7m3iUIhB2czTwQI5E0tsG1IdXbWVa4A+CGA62kvw=;
 b=mAzILez8c73bvRlrtPJnZpE9+OfLG+QwexJhs8xlhu6r5WpF55c4JMpX/dfESnMyxR
 lqmD4RgZlky1kpeq6zM3TcwOfiS7yMxbN1Ff0PKp1VfyNVCYsvhKtks0wJekhBi9i0ro
 +1q8O4jCTG7hy6alwDQaLoclL65jrbg9byt9HEpr/epDLAb661LLpSRqpE7nVtLkrLZQ
 4W9YX/AN5K+axia4tQIW6v5sACqniJZWuDRJ2Es48VxnpbKCIntYmFW5Fe304mZLpH8r
 oB7D7evQArMVm7AMlGdgP45xEynm/A3gNWtzIQRgyeWAgWrCNvvSBjyLWuVMyupxFuFK
 WIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693947965; x=1694552765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9XU7m3iUIhB2czTwQI5E0tsG1IdXbWVa4A+CGA62kvw=;
 b=QHs5N8RsnYf7KJVropqe/WvDTH1rWHR7gmhxyCdlbQuicG/JXqdV+41qgnA3Vr5XLw
 4C7SlpKLAxMN5/WOyeNB/8+ySs4U4znM1LIZoMSVQT23ShZ8onIBCJs8jXccBQFlVLYX
 riRnW5xcPcNwlPRlDHtYgZLU7Ymq7K3QF6maeco5In+A9iWt6bM2CZrKBN2ccYrRYvGs
 j6Xqin7Biko+qV17H+FfdQmX6L2IrjiVhTk8tl4AII2LupddKGVIS2Bo6jb1dDsds9av
 YBfhk94qsuUkW8jpLNsB6jMqMmzS5m6hw/3PjUjvVPzfRwr3QOI8xtWfB6FPNRiMaI8z
 DLAQ==
X-Gm-Message-State: AOJu0Yw6MgEYzSTOvOKagz2pC4pDdsQGFxcg3nH3qXkkpC5dsY0a+Yi5
 GXXSYJk9wx4z0ySlNMSw7l7fbF5zrOXbg01R
X-Google-Smtp-Source: AGHT+IGkmh9tp77O9jdKZ4K1pCktyBByW4OQ7/rwivCx3acTMVK4FoRmIlgULCUgqm2i5B0cQ60LGg==
X-Received: by 2002:a17:907:762a:b0:9a1:bb8f:17d7 with SMTP id
 jy10-20020a170907762a00b009a1bb8f17d7mr692400ejc.12.1693947964868; 
 Tue, 05 Sep 2023 14:06:04 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 kt8-20020a170906aac800b0099df2ddfc37sm8025574ejb.165.2023.09.05.14.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 14:06:04 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: Re: [RFT PATCH 2/6] drm: Call drm_atomic_helper_shutdown() at
 shutdown time for misc drivers
Date: Tue, 05 Sep 2023 23:06:00 +0200
Message-ID: <5970528.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20230901163944.RFT.2.I9115e5d094a43e687978b0699cc1fe9f2a3452ea@changeid>
References: <20230901234015.566018-1-dianders@chromium.org>
 <20230901163944.RFT.2.I9115e5d094a43e687978b0699cc1fe9f2a3452ea@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: alexandre.belloni@bootlin.com, xinliang.liu@linaro.org,
 tomi.valkeinen@ideasonboard.com, liviu.dudau@arm.com,
 linux-hyperv@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 wens@csie.org, jstultz@google.com, kraxel@redhat.com, sumit.semwal@linaro.org,
 yongqin.liu@linaro.org, samuel@sholland.org, sam@ravnborg.org,
 javierm@redhat.com, drawat.floss@gmail.com, kong.kongxinwei@hisilicon.com,
 alain.volmat@foss.st.com, linux-sunxi@lists.linux.dev,
 nicolas.ferre@microchip.com, suijingfeng@loongson.cn, tzimmermann@suse.de,
 alison.wang@nxp.com, airlied@redhat.com,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, jfalempe@redhat.com,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 paul.kocialkowski@bootlin.com, spice-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, tiantao6@hisilicon.com,
 claudiu.beznea@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne sobota, 02. september 2023 ob 01:39:53 CEST je Douglas Anderson 
napisal(a):
> Based on grepping through the source code these drivers appear to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
> 
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart comes straight out of the kernel doc "driver
> instance overview" in drm_drv.c.
> 
> All of the drivers in this patch were fairly straightforward to fix
> since they already had a call to drm_atomic_helper_shutdown() at
> remove/unbind time but were just lacking one at system shutdown. The
> only hitch is that some of these drivers use the component model to
> register/unregister their DRM devices. The shutdown callback is part
> of the original device. The typical solution here, based on how other
> DRM drivers do this, is to keep track of whether the device is bound
> based on drvdata. In most cases the drvdata is the drm_device, so we
> can just make sure it is NULL when the device is not bound. In some
> drivers, this required minor code changes. To make things simpler,
> drm_atomic_helper_shutdown() has been modified to consider a NULL
> drm_device as a noop in the patch ("drm/atomic-helper:
> drm_atomic_helper_shutdown(NULL) should be a noop").
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This commit is only compile-time tested.
> 
> Note that checkpatch yells that "drivers/gpu/drm/tiny/cirrus.c" is
> marked as 'obsolete', but it seems silly not to include the fix if
> it's already been written. If someone wants me to take that out,
> though, I can.
> 
>  drivers/gpu/drm/arm/display/komeda/komeda_drv.c | 9 +++++++++
>  drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 7 +++++++
>  drivers/gpu/drm/arm/display/komeda/komeda_kms.h | 1 +
>  drivers/gpu/drm/arm/hdlcd_drv.c                 | 6 ++++++
>  drivers/gpu/drm/arm/malidp_drv.c                | 6 ++++++
>  drivers/gpu/drm/ast/ast_drv.c                   | 6 ++++++
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c    | 6 ++++++
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c       | 8 ++++++++
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 6 ++++++
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c         | 6 ++++++
>  drivers/gpu/drm/logicvc/logicvc_drm.c           | 9 +++++++++
>  drivers/gpu/drm/loongson/lsdc_drv.c             | 6 ++++++
>  drivers/gpu/drm/mcde/mcde_drv.c                 | 9 +++++++++
>  drivers/gpu/drm/omapdrm/omap_drv.c              | 8 ++++++++
>  drivers/gpu/drm/qxl/qxl_drv.c                   | 7 +++++++
>  drivers/gpu/drm/sti/sti_drv.c                   | 7 +++++++
>  drivers/gpu/drm/sun4i/sun4i_drv.c               | 6 ++++++

For sun4i:
Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/gpu/drm/tiny/bochs.c                    | 6 ++++++
>  drivers/gpu/drm/tiny/cirrus.c                   | 6 ++++++
>  19 files changed, 125 insertions(+)



