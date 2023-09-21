Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9169D7A9B24
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 20:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB6610E31A;
	Thu, 21 Sep 2023 18:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315F010E31A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 18:54:22 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50307acd445so2253215e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 11:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695322460; x=1695927260;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+SgMdBTw9y+aSwwtmwk5xQ1ZAPfF4LIv2yTZ0dNleis=;
 b=SMhtWHyf1yy2bn4I87o0Pdji/bMt8OZNQ96Ag6zGayHFqDL+iFESK//y4KAbsvjQXu
 sBkMzYpB/VhduSFcmNxEtSV8p7c3sIfdBQQBxqW31BIdeBorSR3IN6iR7/m8BY93tseT
 a+BKkYozt/VJl3mXl1SvZ3xZo618qJ4Mylthk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695322460; x=1695927260;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+SgMdBTw9y+aSwwtmwk5xQ1ZAPfF4LIv2yTZ0dNleis=;
 b=kTU7OAi7SITKD73/R9B9wPcyYiCVSvpJgv+/nh/H5hWvhDMD+G8NT7Iml0TZrRhGNZ
 ABXczdWUkbgWTcnt8DkkhLHnpzY389zpLKWo8/jUlnNW7lYksqibKMQbFIid2Sq6B9rM
 vaf1+IV1IznY6cEwvLWc6hDnFfLMSzVef92iiPLmPrO6v3VA+HGKB8N3Y3aHekDPucPn
 2ouylE3wuc9sCetk1Or8ew9kKZMt8vAvG7hlbK4qBNR9tR0B6B538akQCNMRU1nufJgu
 zhxvqsDwoWKRV+aH6ZVGtEeyk+pqQoquwdVtqRGuMva80cqcVoaIFDRBboRk9Nur1ml2
 JP9Q==
X-Gm-Message-State: AOJu0YyVlfvt7JjihCOgavtZcu8gG7bQU0Ad81O9FCIiWdBYHmI7KB1V
 yShP+fhEi/qerj69EmnoRr2YFXiJgsGYXFqfKi1kUb1/
X-Google-Smtp-Source: AGHT+IG2O+vG2i7qfmfpuLG0ZDq33Tb6EMbEmPhNimXQrhwzoneonWT3OP28lDIFgnunPxdOZc76Cw==
X-Received: by 2002:a05:6512:3484:b0:503:3590:fc5e with SMTP id
 v4-20020a056512348400b005033590fc5emr5586215lfr.31.1695322459692; 
 Thu, 21 Sep 2023 11:54:19 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 v22-20020a056402185600b0052a3aa50d72sm1188360edy.40.2023.09.21.11.54.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 11:54:17 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4053a7b36b0so18955e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 11:54:17 -0700 (PDT)
X-Received: by 2002:a05:600c:1ca4:b0:405:320a:44f9 with SMTP id
 k36-20020a05600c1ca400b00405320a44f9mr98844wms.5.1695321993367; Thu, 21 Sep
 2023 11:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234015.566018-1-dianders@chromium.org>
 <20230901163944.RFT.2.I9115e5d094a43e687978b0699cc1fe9f2a3452ea@changeid>
In-Reply-To: <20230901163944.RFT.2.I9115e5d094a43e687978b0699cc1fe9f2a3452ea@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Sep 2023 11:46:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WRqe7twJ+eLb3DavumknCxWFK5ey007fLuWkCBrzzyPQ@mail.gmail.com>
Message-ID: <CAD=FV=WRqe7twJ+eLb3DavumknCxWFK5ey007fLuWkCBrzzyPQ@mail.gmail.com>
Subject: Re: [RFT PATCH 2/6] drm: Call drm_atomic_helper_shutdown() at
 shutdown time for misc drivers
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: alexandre.belloni@bootlin.com, xinliang.liu@linaro.org,
 tomi.valkeinen@ideasonboard.com, liviu.dudau@arm.com,
 linux-hyperv@vger.kernel.org, nicolas.ferre@microchip.com, wens@csie.org,
 jstultz@google.com, kraxel@redhat.com, sumit.semwal@linaro.org,
 yongqin.liu@linaro.org, samuel@sholland.org, sam@ravnborg.org,
 javierm@redhat.com, jernej.skrabec@gmail.com, drawat.floss@gmail.com,
 kong.kongxinwei@hisilicon.com, alain.volmat@foss.st.com,
 linux-sunxi@lists.linux.dev, suijingfeng@loongson.cn, tzimmermann@suse.de,
 alison.wang@nxp.com, airlied@redhat.com,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, jfalempe@redhat.com,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 paul.kocialkowski@bootlin.com, spice-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, tiantao6@hisilicon.com,
 claudiu.beznea@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Sep 1, 2023 at 4:40=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
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
>  drivers/gpu/drm/tiny/bochs.c                    | 6 ++++++
>  drivers/gpu/drm/tiny/cirrus.c                   | 6 ++++++
>  19 files changed, 125 insertions(+)

This has been about 3 weeks now and it feels like that's enough bake
time and several people have managed to test it (thanks!). Landing in
drm-misc-next:

ce3d99c83495 drm: Call drm_atomic_helper_shutdown() at shutdown time
for misc drivers
