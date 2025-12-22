Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E67FACD5372
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 09:58:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7F810E16F;
	Mon, 22 Dec 2025 08:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y070gjNP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBC510E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 08:58:46 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-59583505988so5712134e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 00:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766393925; x=1766998725; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jRoWj6fQIVZ5ec4l8AKBjpMeh7YDL/EPpVGkUu95T8Q=;
 b=Y070gjNPB9qsl+t9kOtEWdR04NWyQMfEM9IAEyC8eEfolwg2sgvipbCWHjQy83kdB8
 EMiticSn1JQrY/S9CZoDX9WOemC7XvZxNwP5jbU28aRy7hwkqnvl0iamwPBUXxNhC63P
 NZwmBC8E1G79nXc1EO6hh9/lIs/SPCVZytHsBvQTC3CkrPRn/+i/gTBni9n/gMH3hCXd
 CPnXm2oc8elR2cChGZmTLSxJc/qx3X1YV8QawdWuRNv02BFs+UAKTSb+oXVRZIM0bNSN
 oa+mE9T3PwasLCTupxUj6WCaCUWW/LaV10WvLAhIih0eluVY8OX70u4VduEtkAMhRjm5
 vNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766393925; x=1766998725;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jRoWj6fQIVZ5ec4l8AKBjpMeh7YDL/EPpVGkUu95T8Q=;
 b=LmoiboEoT1vlDZBmL/GvzlEpN2s9iCGQHmQ1ae2JljY9Ywjfo4vImLfSkaE+VvJg+3
 379ppyKUIcnzfw4fh0T2+c5EeoqWZMKZ11u2Lx2N1+m0Pie8lha9sCFs2pmZTGhsXtoP
 KXYDAYxR9erJFoj/g2ovVItKKHcxVCUyrosIxdot3ObkSYcD8kuNHdv5PofNhKmRrmPt
 Wv8EvLH8l2rOVhJ4HXHEO4s1SZQfftRj5RXOu2vNDyrIVxZ8qfVhlem50XayYLvuNtF7
 bf8p7+EjHEAo47/ixnYU+ZmEh4wWwEM/VjRI3iy+i9dIzFZOaaIU+Xl68WS6IxvoD4gx
 Ixdg==
X-Gm-Message-State: AOJu0YzbY7uqLFVoNf7aUNTyg98vIRbM5d1tqNR8DuPCmpv7yhquXcqe
 QI9TTacXIQ3TlQvb+hA8lR20PF1+ghim/ejqIbOo9LnGd0omB6xEfruoCCVCKbGKROY=
X-Gm-Gg: AY/fxX5rz5EZZ0mkM2CL9yTKoJifVQLFjVVsLP+WBQHSDYEpNJj6Ok7yT96R/t0m1oE
 q3AregPpVfTLrVRXZaN4jJVa16gV8sahC2+gHARabR92vhZPDTBh+7sNyjgulGBDoK2FHZB7BcW
 hBpwR+IvCljThiEQ0JW6I5OyfPgWDnO1BF7+LRLp0yyYhhO3HqCQTH8FRUZd6Mdhe8vJxOGFg8K
 CjQWp2gutglckvNs/UdceFfMcpUqgJhIc1xLqaLq4O0AwcJCb6hcN/hOE41cPpry5RMp1AY+hFq
 /Vvg+8WwupJ1wR/fzfccOYunqOVQVYZT81sPy9exx17MynlF3+kkaK4wIFLWQI8DqT8tdwW1WlV
 amBm1S7XH10iJRJksQcKDSpFGKJORk7f0BS4LuVjUS9QjdwjZhN7O8d5KLZcCarWH+TCMiZFQm8
 gMJLwuW9nalFSLcy09aQPvHkCPXeX19+S9nc+cxtX1dCH7
X-Google-Smtp-Source: AGHT+IEjjr2NLFmDrfryDt5WBn7sCmpJeVOqGFgaS3Jyv/31cVGYeFCzkDxyXbjv1PH5pPRcEO8DrQ==
X-Received: by 2002:a05:6512:3e1f:b0:599:daee:12af with SMTP id
 2adb3069b0e04-59a126e50bfmr4705785e87.14.1766393924759; 
 Mon, 22 Dec 2025 00:58:44 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a186280b1sm2936036e87.89.2025.12.22.00.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:58:44 -0800 (PST)
Date: Mon, 22 Dec 2025 10:58:42 +0200
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
Message-ID: <aUkIQjKpd3MhNHjk@nuoska>
References: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
 <533168f1-1655-4947-9032-b08463f502d7@ideasonboard.com>
 <aUVFUx55XTjb_2nO@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUVFUx55XTjb_2nO@nuoska>
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

On Fri, Dec 19, 2025 at 02:30:11PM +0200, Mikko Rapeli wrote:
> On Fri, Dec 19, 2025 at 01:59:14PM +0200, Tomi Valkeinen wrote:
> > On 05/12/2025 14:37, Mikko Rapeli wrote:
> > > Currently on default yocto images Xorg fails to start on AMD KV260
> > > because 24/32 color depth gets detected but does not actually work.
> > > 
> > > These two patches fix the issue and now 16 bpp gets detected
> > > and Xorg starts and draws on external HDMI display using
> > > kernel.org based linux-yocto kernel.
> > > 
> > > Anatoliy Klymenko (1):
> > >   drm: xlnx: zynqmp_kms: Init fbdev with 16 bit color
> > > 
> > > Mikko Rapeli (1):
> > >   drm: xlnx: zynqmp_kms: set preferred_depth to 16 bpp
> > > 
> > >  drivers/gpu/drm/xlnx/zynqmp_kms.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > 
> > Did you notice the few already sent serieses on the list where the topic
> > has been discussed?
> 
> > [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
> > [PATCH 0/3] drm: zynqmp: Make the video plane primary
> 
> Oh I wasn't aware of these.
> 
> > Or is there something else on KV260 that messes up the 24 bit color?
> 
> These look very similar and likely fix the X11 startup. I will give them
> a try.

Right, now I've tested:

 * these patches from Anatoliy and me to help X11 use 16bpp mode by default
   and removes the need to manually setup Xorg for 16bpp
 * "drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888" which enables the X11 default
   24bpp to work, no need to set Xorg config to 16bpp
 * "drm: zynqmp: Make the video plane primary" which also fixes the X11 default
   24bpp to work, no need to set Xorg config to 16bpp

All of these fix HDMI graphics output on AMD KV260 board with yocto genericarm64 machine
and core-image-sato image which includes Xorg. The graphics rendering is still
very slow but I think that is a different problem.

I guess the last series from Sean Anderson is moving forward so I'll
reply to that thread separately.

Tested-by: Mikko Rapeli <mikko.rapeli@linaro.org>

Cheers,
-Mikko
