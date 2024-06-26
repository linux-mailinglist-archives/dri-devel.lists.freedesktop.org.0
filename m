Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2C1917916
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 08:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E79B10E781;
	Wed, 26 Jun 2024 06:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JgF0zHBc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87AB10E781
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 06:37:35 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52cdcd26d61so4487713e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 23:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1719383854; x=1719988654;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sCHdJxQ4oC2ts4y76NGgpAIUHQqpky7E3Iqo+x2BgZM=;
 b=JgF0zHBcWzE1mkke/oc8ou/Df/aA/MK3QOKJMeaUufVaDtfwR7Rwl7A06FKszADJ4X
 NXUSjGUF7pRek5/yw6SW5aFWB1E/Kys2n/+ne6Eueourx8a9JCklOfZvC8d2fG46Nhf4
 PeLv6IWKzonz5NVH9ERonuQZhkW4jUIY70qlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719383854; x=1719988654;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sCHdJxQ4oC2ts4y76NGgpAIUHQqpky7E3Iqo+x2BgZM=;
 b=cB9WPGxukSV+PHQcI1WwRANpyyWlX5OTT0NOoh35evTmp2azPBvtUUNlHDtdtrVgdY
 bxnkRHqY6aC3vDdG3H/ob6KoyNGCUiox9uESPe01sSzpmPkugF6WAVzkVHF8Mtm4twaY
 nAI9R+AOgoKT4DIvDwvoSEfgbvduV92EAP2R4tP5nGwJ2UmHJX5Za827POvOSuHis7Ds
 GKrIGJx3ZmfNQXKCoznAWGlf0njJ8moOHXpNRXPu+OHm1NlT07VYDc/SbUlTVyI0l90K
 54Zp39Hn26EwCfcOy/ZSgmsP23jaRE6DzVmXhdHTKVXtDIdyIJjtk8SVfxUZ8v/GvOQm
 Z1hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGeq41FVNnTEzYnWLpJhw+WvMcMm1YwVA+nYYnxf+JS6m+NdLdzvddM8nAHMI3RDGXT9MkuEh4cb6s5XTeV1oNjxd4foamEhfOE6Lkxutd
X-Gm-Message-State: AOJu0Yykf38TQbJPs0OuIlQYE/zCsn5WoGE5t1ShDZm/PFunG4fD4JxR
 PWOhTWK+4I8t7niS66/2RlBMi/EnsanTG2dtJqI+xhW7aQ6kLY/3cbJgAIsCMv+DfHn3H//F53U
 OMpMENUH3Tt48xuk1VtoVJ7cQnK6oZEE6TYHK5BbPAuiqTgFgBg==
X-Google-Smtp-Source: AGHT+IGXqfaK3Lp76aXfYjIzKpRey4MNxVqRhxxMs8nwcgXn/YAU0hTJQfa4vETDGz2L4s7B3bv6pwtt1mZk4jfCHBU=
X-Received: by 2002:a05:6512:39c8:b0:52c:e4cf:4f31 with SMTP id
 2adb3069b0e04-52ce4cf502dmr7041057e87.49.1719383853555; Tue, 25 Jun 2024
 23:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240620054708.2230665-1-wenst@chromium.org>
 <CAAOTY_9tLUAcw+C5D78SNwrV6kHds7JhtAoFYFmxxfAH9vtkDQ@mail.gmail.com>
In-Reply-To: <CAAOTY_9tLUAcw+C5D78SNwrV6kHds7JhtAoFYFmxxfAH9vtkDQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 26 Jun 2024 14:37:22 +0800
Message-ID: <CAGXv+5FQaJFuouB4feS4KEK+KqSZaJ=en8d9700gkqpQLOBr5g@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: select DRM_GEM_DMA_HELPER if
 DRM_FBDEV_EMULATION=y
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Jun 20, 2024 at 10:20=E2=80=AFPM Chun-Kuang Hu <chunkuang.hu@kernel=
.org> wrote:
>
> Hi, Chen-Yu:
>
> Chen-Yu Tsai <wenst@chromium.org> =E6=96=BC 2024=E5=B9=B46=E6=9C=8820=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=881:47=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > With the recent switch from fbdev-generic to fbdev-dma, the driver now
> > requires the DRM GEM DMA helpers. This dependency is missing, and will
> > cause a link failure if fbdev emulation is enabled.
> >
> > Add the missing dependency.
>
> Acked-by: Chun-Kuang Hu <chunkuang.hu@mediatek.com>

Could you help merge this?

Thanks
ChenYu

> >
> > Fixes: 0992284b4fe4 ("drm/mediatek: Use fbdev-dma")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > The commit this patch fixes is in drm-misc-next. Ideally this patch
> > should be applied on top of it directly.
> >
> > CK, could you give your ack for it?
> >
> >  drivers/gpu/drm/mediatek/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediate=
k/Kconfig
> > index 96cbe020f493..d6449ebae838 100644
> > --- a/drivers/gpu/drm/mediatek/Kconfig
> > +++ b/drivers/gpu/drm/mediatek/Kconfig
> > @@ -7,6 +7,7 @@ config DRM_MEDIATEK
> >         depends on HAVE_ARM_SMCCC
> >         depends on OF
> >         depends on MTK_MMSYS
> > +       select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION
> >         select DRM_KMS_HELPER
> >         select DRM_MIPI_DSI
> >         select DRM_PANEL
> > --
> > 2.45.2.741.gdbec12cfda-goog
> >
