Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F58A1CEEA
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 22:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC4E10E257;
	Sun, 26 Jan 2025 21:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="asWOmQyi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7753D10E257
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 21:54:18 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30229d5b21cso35155511fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 13:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737928457; x=1738533257; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=L8HEYbWsn8DThS9QqVXusb3e0TEgpqJm0LL8Ju+dVLc=;
 b=asWOmQyiHuNMlGhNpNw2R2rVd3Kugx0FeB5558t3d4wVUUcgcmdmkDGWPSYJ4JI2Bu
 775PFD+KKgRUs3Lmwhe8VkTx6n6+PvgCfXUcec6kJ40i0CYFmPAGXqAVBGt8AhMk3sXi
 kENB3/vyHax85zDWPXVUQlMxf/PqYi+eXBxxmHrRHMvP/OfYSY8n2ickTPoJu7+88+Lw
 895I7WrT0l0oeYiGmmgOoFr8mHSUphLImiBnAzoxqRU712KgMtHzG4S+kLwajeCVnLfa
 Tj5UqOlh7nWkVGQr/VE9dF2+EubWNe62HynXrZg604yACc+8Oy+wp4/VjRWmsZwWxLJK
 QBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737928457; x=1738533257;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L8HEYbWsn8DThS9QqVXusb3e0TEgpqJm0LL8Ju+dVLc=;
 b=E8Jj7jSYuQPlECIocya6ocRG6EAyHW7hqDDE7c+XYHwhoj9G0oQrlDe3an3hqcN7yp
 hLxUiI7Ojwj89v6hQCg45BDhL8WMMmODPkCm+6afKa88Ec3s8T9y8P9/8elWMmWqRWVJ
 llWLSeIFhfjMffyh4mB7jfy7V/UDRrig0ChFybtE3O8boFSQDZEk/+DRSmf2Y8Xo8O+p
 plhbDfv2cbAmSldiAacQLZVBpK8LF6eRbynf7wenyXM70DHiicpdSyFyzmGpTWgrhT+h
 OAzdi+Qeaxk4n+9Ls1mnCkvDpS63rvlwIGaXKC3nMWpPKuyYYpEQrMnGi+iJpH0oc/cP
 o0mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhwKzNH/rqz/3sezfXjc9ZoVX/KmjI/JMGXykhJdH2yjMaD3H9QM2a1cYhXm3vXfMC4hONa0OeXCk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPUrI1RzeYLxsPm3ZSCNMiL/DMNI6qEaKuNKZtUcLEtxIiyNKB
 pWN34z7ew64KvXE0SFPfgOJcKBvJU2Rpc+QyGARFUV53QPhQxPO0mzxno2XCZ9Q=
X-Gm-Gg: ASbGncuTF107SvBuIbma9+nqx2hULMWT7KZPFXTIgj4BQgYGYct3cmfuRBKJf8Drcr9
 nai5AZTBZcBv1/MYLDrCJYIVe6omR3ReUb3/Z7SVPUYrAh2gOg0bvO+Yw0LyNsnW0AC2z3TjTy0
 kAliGIYix2Hv1eOur0lEY6FPlXKKIS5W0OtgRnDZD/Kd8lqQGKv1vmXiQQ8qfkygogdD/g/euP5
 oEwiWiIV8wpzhSLyQdVkLZT5BtR/WnGkq9UF+SU8Sd6Hw0957aYxJISBC5fwJw7L8AZAAtwb7SC
 2LLBROMwfUkWpwLBu210Hivo9uJYFxFQ4BOOBNFGIYSSvWqE4HtRs0WFWEAM
X-Google-Smtp-Source: AGHT+IEq93jfTqjSI9XtdpbCt25bExghQLsF7YuBRJVcTO0sRkQR3hXVeQcvfQvckz8oPKwSTLnXqw==
X-Received: by 2002:a05:651c:107a:b0:307:2b7e:6ba0 with SMTP id
 38308e7fff4ca-3072caaf1acmr116151361fa.6.1737928456678; 
 Sun, 26 Jan 2025 13:54:16 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bc497efsm11569791fa.92.2025.01.26.13.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 13:54:15 -0800 (PST)
Date: Sun, 26 Jan 2025 23:54:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 11/13] drm/atomic-helper: Separate out bridge
 pre_enable/post_disable from enable/disable
Message-ID: <4srelpkf4ks6xdzsxdaqkruktyk6gieeirvi7vrmscp7yg753a@ckoe6hnjmqmk>
References: <20250126191551.741957-1-aradhya.bhatia@linux.dev>
 <20250126191551.741957-12-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250126191551.741957-12-aradhya.bhatia@linux.dev>
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

On Mon, Jan 27, 2025 at 12:45:49AM +0530, Aradhya Bhatia wrote:
> The encoder-bridge ops occur by looping over the new connector states of
> the display pipelines. The enable sequence runs as follows -
> 
> 	- pre_enable(bridge),
> 	- enable(encoder),
> 	- enable(bridge),
> 
> while the disable sequnce runs as follows -
> 
> 	- disable(bridge),
> 	- disable(encoder),
> 	- post_disable(bridge).
> 
> Separate out the pre_enable(bridge), and the post_disable(bridge)
> operations into separate functions each.
> 
> This patch keeps the sequence same for any singular disaplay pipe, but
> changes the sequence across multiple display pipelines.
> 
> This patch is meant to be an interim patch, to cleanly pave the way for
> the sequence re-ordering patch, and maintain bisectability in the
> process.
> 
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 92 +++++++++++++++++++++++++++--
>  1 file changed, 88 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
