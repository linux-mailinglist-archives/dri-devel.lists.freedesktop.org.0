Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F02CCFC9F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 13:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B0C10EF94;
	Fri, 19 Dec 2025 12:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pKqriBGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C672B10EF9C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 12:30:15 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-597d57d8bb3so1386564e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 04:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766147414; x=1766752214; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DPb4j3wVisA9JnR3oRWF7sfi9svvn8zl+0LCubY1oLY=;
 b=pKqriBGJaC/hozzftTs1BkbUiPAzjGjFVu65z85tsLaPR0OTpkwl4GfEy7kIypKrAR
 FABgw2uusrbwbcEWFlznC337YIu2i0Yuit3EZS5L6Bgnw7P6erc2XD5ycnZ3pYnslA0M
 GmdezoXvWKdCmAxtiYbKdS7z0ITPApeOElHDRkYB1fh7CLaZj7pBzSkuc3oUPsuzCmHM
 dVsBSDphmGgFmXxGpJwhx3anCJeE7Zd45a1jiIXRWwtI2Xa1E3rdZX0V4nVQiUTfPvkF
 HbKEyvgd9vT2sxpVb4Qcn+EoA04CMDsuJQ1QzhoWQtwZOyWdMF4Ymfl+wR3vKKJOCnNR
 f1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766147414; x=1766752214;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DPb4j3wVisA9JnR3oRWF7sfi9svvn8zl+0LCubY1oLY=;
 b=Mg650U1dyhXilmdfSWRGcgWyqBpgDMbYfYcNnPBhFpM7er5QceEpMV+XvA7tNkV4Ye
 N3UNOOYjT6wELdKz7EO18n+/Qp6JWGb5seKi+EPU3SOkkhFUSzcJ0a5KX4M11qSHCa4z
 FZlMYMSppyuNp+kLMegkOmwuvSJHMnl5rbktLFDCt4oeJD9GeakHbWOuIcbhsXQsMQ6g
 X1MxCkMNJsspt85oRayV9ymjl78yr5iBMXGJsn0fzd2wyKLpQtaJGicouKx4mdndjD4N
 5OZix1xjSM9Qa4n1iPlumQtm8yn2kvzaJyFO/BwAXQDBeCdOBCvy5ScNQpLxUGPul7je
 1+zA==
X-Gm-Message-State: AOJu0Yx8YS5/CSqTOxBFukuVGYIii9b/wH3Xii8U8x5SoKrpL+v4OORf
 onRh5U3CKsfhuzEmz2l0KQ7SSPxFpodIyntcQn6krEyi9V94tvHIZ+nt4BY6N5g81xo=
X-Gm-Gg: AY/fxX54EZIZbuToJ/eLsLrwr+4+9zyjI6jRGUbGeje2InRofnek6H4cP7x5n52qm9d
 kKel41CRbsrr+IL9x6vS3xTRuuKu0zB3cajDXcDoEbxcf3ieXn7bMvNm2CbZ5aPtNSLqMrMElml
 BU6x6L35C9f/Gy5ZIeBZEmvPOpRx7R/ha4GBlcKy/AAgiA5i1/wTqXR8FCP8XLv6VxOt+YgQGTz
 hHqm9/ZDHbY9pkJxvDUjtMZb5Uduwsn44200ljz8efSps899AnSuUsh9eenYOezGvEAaWDou3gv
 1QJtSSRUhSy8l0SgjDOIAEbnatilMgfsLoiu5P1JV8tDKW9CsYKhos1gvMPf0wAGjcYjpzV9jrM
 SqG3gNI1FfCMYpR2woB0GKwN2iLHnyhAjqSbVSBgDRy9+IOp2VTqqsYaJyPEFMlkQbQDxko3pfc
 P3loCJmJzp6lY6yENVNe5An2FHYWsknR7Xuta0I3jeGuPJVkc+XsfxDkY=
X-Google-Smtp-Source: AGHT+IGJG+5oeetxlteCBI8eC8fSDh53fINWZpZaKlCc+ybCfd0LgBWIHILYHH2d0ftxpNb+VTZkhg==
X-Received: by 2002:a05:6512:2304:b0:595:7daf:9425 with SMTP id
 2adb3069b0e04-59a17d3ea12mr1114950e87.28.1766147413776; 
 Fri, 19 Dec 2025 04:30:13 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185d5ee4sm681986e87.17.2025.12.19.04.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 04:30:13 -0800 (PST)
Date: Fri, 19 Dec 2025 14:30:11 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, Bill Mills <bill.mills@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [PATCH 0/2] drm: xlnx: zynqmp_kms: 16 bpp fixes for Xorg startup
 on AMD KV260
Message-ID: <aUVFUx55XTjb_2nO@nuoska>
References: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
 <533168f1-1655-4947-9032-b08463f502d7@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <533168f1-1655-4947-9032-b08463f502d7@ideasonboard.com>
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

Hi,

On Fri, Dec 19, 2025 at 01:59:14PM +0200, Tomi Valkeinen wrote:
> Hi Mikko,
> 
> On 05/12/2025 14:37, Mikko Rapeli wrote:
> > Hi,
> > 
> > Currently on default yocto images Xorg fails to start on AMD KV260
> > because 24/32 color depth gets detected but does not actually work.
> > 
> > These two patches fix the issue and now 16 bpp gets detected
> > and Xorg starts and draws on external HDMI display using
> > kernel.org based linux-yocto kernel.
> > 
> > Anatoliy Klymenko (1):
> >   drm: xlnx: zynqmp_kms: Init fbdev with 16 bit color
> > 
> > Mikko Rapeli (1):
> >   drm: xlnx: zynqmp_kms: set preferred_depth to 16 bpp
> > 
> >  drivers/gpu/drm/xlnx/zynqmp_kms.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> 
> Did you notice the few already sent serieses on the list where the topic
> has been discussed?

> [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
> [PATCH 0/3] drm: zynqmp: Make the video plane primary

Oh I wasn't aware of these.

> Or is there something else on KV260 that messes up the 24 bit color?

These look very similar and likely fix the X11 startup. I will give them
a try.

Cheers,

-Mikko
