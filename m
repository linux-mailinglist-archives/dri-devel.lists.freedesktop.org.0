Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DF2913E41
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 22:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFEA010E180;
	Sun, 23 Jun 2024 20:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YHKAftP3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEBE10E180
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 20:56:32 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52ce674da85so351840e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 13:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719176191; x=1719780991; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HMIjy1gK0TpUCo1LhjYc9489mlQhGsXBTfI3ZFcq2PQ=;
 b=YHKAftP33bJF+xrmGaUtDm0eq3Ow1ZlX4svoNEXBoPqYZ/lwD7ktBMo5Y4ofnxSiMP
 poMHiTb3EkZLPxXYI7EgdwuBDxLLqoHwjm/oHhBC4hMyyWFJXjynXoytPkA6tKaQSQ6C
 NJoDLyAPIh2WsIrKdAElTIn4TTzf7oY2CqCz0FCiv8XvZxw+K1R0SGSRdZAFMGskWakk
 URBNUqJst2MvkUntyENRkm4oScJni1pdhPO5dvNw9MOqmhrXVGMKZj766IeJs0BoQqPU
 r9tz17/5hggTay4EhUI6nRAu2llQxd8vLFnI39EAE611PVTMiTQP2M76A9SVTjWX66FL
 PNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719176191; x=1719780991;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HMIjy1gK0TpUCo1LhjYc9489mlQhGsXBTfI3ZFcq2PQ=;
 b=vb3g15KANOpLU2E/LfN1lpLHu2kTeIabyTKvhqXXd6ECbjBNlz5cyImIRkoHZput3a
 79Z0apB9RRG4cjV+lymbYaRKDk0WkAVjWd514Jo1md+k6jaMT7a6eKo9DfnWkwRWvKb7
 IjDZGqMK66vI9jc2Pwouyfg3YPPO6WBJD5GbExy+gEMFWvJWJe6/AeIxQAkvL7b/V10j
 /AJpLs7VKTM3/h//rLGTiHOnjm75/u0vbDzFeZj1IWLvka52uz3AYo0IDmCj2DrSvP9s
 oYFVBZO/uHUqY5yaiVzza8eNneRaZz4a6hEE3ok3VQKKMxU6HBoLKFRwUwS7PGESRjEi
 ylFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVViChtrzWJNvg+GNJ1mBSrpbhkm25LrJ+rfI9irg/ReyVYunESb/nOCRf0CKv+/8ubVBmf2dxj67QwUtTlZiKXzPRGVo0lzr/aDdfT+nlw
X-Gm-Message-State: AOJu0Yzx8RyeLavySwggosG2/gnrz34XW5kR3KEEo/FcOb+s88imH3hp
 lT1vhL2qidkCQTIat8R1vISxbivVqNu8BsG1EohuPKIG0T9FzijY3msho2Ad3J4=
X-Google-Smtp-Source: AGHT+IEuXd8WWnOuecjW0sjT9QmBmiw0iQ8Vi8NvjkJfFJ74SjLxYkdIlq/BXl1u5IWs6g/xDYQryQ==
X-Received: by 2002:ac2:5505:0:b0:52c:dee0:9f6e with SMTP id
 2adb3069b0e04-52ce183b1f2mr1620174e87.38.1719176190747; 
 Sun, 23 Jun 2024 13:56:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce729cb07sm88694e87.234.2024.06.23.13.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 13:56:30 -0700 (PDT)
Date: Sun, 23 Jun 2024 23:56:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, 
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, 
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, 
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>, 
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "hjc@rock-chips.com" <hjc@rock-chips.com>, "heiko@sntech.de" <heiko@sntech.de>,
 "andy.yan@rock-chips.com" <andy.yan@rock-chips.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, 
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 Jack Zhu <jack.zhu@starfivetech.com>, 
 Shengyang Chen <shengyang.chen@starfivetech.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 07/10] drm/vs: add ctrc fun
Message-ID: <73pee4uoo5fq3rgqrrs77zavz7727766sw5pb7zszoqk6a6yd2@roxrcdgwxfcq>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-8-keith.zhao@starfivetech.com>
 <zevlkgeiezpi77uiiobmtzhaps7qkm7bur2kltlrqmbucrk4ad@af6lulqqllyj>
 <NTZPR01MB1050C59A5A8D3A2F790F557CEECB2@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <NTZPR01MB1050C59A5A8D3A2F790F557CEECB2@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
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

On Sun, Jun 23, 2024 at 07:17:04AM GMT, Keith Zhao wrote:
> > On Tue, May 21, 2024 at 06:58:14PM +0800, keith wrote:
> > > add crtc funs and helper funs
> > >
> > > Signed-off-by: keith <keith.zhao@starfivetech.com>
> > > ---
> > >  drivers/gpu/drm/verisilicon/Makefile  |   3 +-
> > >  drivers/gpu/drm/verisilicon/vs_crtc.c | 241
> > > ++++++++++++++++++++++++++  drivers/gpu/drm/verisilicon/vs_crtc.h |
> > > 17 ++
> > >  3 files changed, 260 insertions(+), 1 deletion(-)  create mode 100644
> > > drivers/gpu/drm/verisilicon/vs_crtc.c
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
> > >

> > > diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.h
> > > b/drivers/gpu/drm/verisilicon/vs_crtc.h
> > > new file mode 100644
> > > index 000000000000..b1e588bb780d
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/verisilicon/vs_crtc.h
> > > @@ -0,0 +1,17 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
> > > + */
> > > +
> > > +#ifndef __VS_CRTC_H__
> > > +#define __VS_CRTC_H__
> > > +
> > > +#include <drm/drm_crtc.h>
> > > +#include <drm/drm_crtc_helper.h>
> > 
> > Do you really need to include them here?
> > 
> The location of include can be optimized
> Delete #include <drm/drm_crtc.h>
> Move drm_crtc_helper.h to vs_crtc.c

Yes, please.

> 
> > > +
> > > +#include "vs_drv.h"
> > > +
> > > +struct vs_crtc *vs_crtc_create(struct drm_device *drm_dev,
> > > +			       struct vs_dc_info *info);

This prototype needs #include <drm_device.h>, not drm_crtc*.
Or even better drop the include completely and just formward-declare the
structure:

struct drm_device;
struct vs_crtc *vs_crtc_create(struct drm_device *drm_dev, struct
			       vs_dc_info *info);

> > > +
> > > +#endif /* __VS_CRTC_H__ */
> > > --
> > > 2.27.0
> > >
> > 
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
