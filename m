Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E3DCD55C2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 10:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EBC10E361;
	Mon, 22 Dec 2025 09:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ae3Swsgp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D5A10E361
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:42:14 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id
 2adb3069b0e04-5959187c5a9so3356372e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 01:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766396532; x=1767001332; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4v+w9CPYJEPXs3YxAAuS8q/mpHCHhgqqzQWL+Q2HXy8=;
 b=Ae3SwsgpWl8+s5buJsCbdpWjvvjmezTxEIQDzZ++0I3DPRPY/1E9ROAMT1EpbTejXy
 lSCKzjuBYjhTqrPXzhUkiRML2zNdx5aoAPlWH9Ksjtf4bev5P1PqZ9x+a9Am6F3aNSNY
 vMJTOnRWyPGp5Rw39c3wRyInZjCFCDtp8ZLfS2FjK3efIoCXiOC2DuB+c1BwT0JyWc4e
 iAkL2Z7FJQB65eXmQK473YpAMc0kYhPbbISGJ8oRuZNcizpo1C9NTgj6fMT8GjBrB9Mv
 DqtPJFw0sea9qLrup6KwzFBSP5aFBJRc6hd2241qKtH7jjAmP9anETdL8/YT6W67qCeW
 oNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766396532; x=1767001332;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4v+w9CPYJEPXs3YxAAuS8q/mpHCHhgqqzQWL+Q2HXy8=;
 b=rJGL2sYV0bUzXzreLm/1x3sRIs0AoCjVEis86gFnvnXLQ9Mwub8iBgJmRjr/O/LlBP
 xLc+DZbXZvy03tO2fGzsCDAG/DXlViUciXuYYlTycoEOe7qcAt4dRt6E2B0z6m8irugF
 9yH+V/UbFhxEsiF7N4Gn+tTg37qc5S+hKlfCm4xL17QGih5/TF4+VwJ0hLnE4BCE08M6
 6OpS4jhOkx/ppDOs4tau/+rbSnSaTJDRkccxGOao2ICBfYtczTKVNsiB8X52AIx3/vQ5
 Nvzsgu06f/D11gZfA5hnEK1GTiOQan9eb3NxAHeZW7Wedl942xKWj+9Ug7uxnZTGFjjs
 oh1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQnTcEwdPk/Xnj8n2itm7thG24QODBayO2MmBSodiLVMAmK4uSz0dCySlghT9v/4AyjD+xnwJOhyw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRtOaagOC5qVaTT+zy/Ah4l5lpfxyFmnQtpYoG0iCzYeyz70Ih
 6j5rym7er9LOMWKOVBB5eadMRYUNHD4w93Eu32mAIJviv+aT7CMaAGH7JNkaEjqs+tw=
X-Gm-Gg: AY/fxX7wyhJ+QJllG9fEC2I79Bp0wnRmYvuMZb206MWQI/RIoVKPiqB1xRU/1GrYHDk
 S3ZS2RuCgjtpo3cgS44ztCKZlBhaTrv/kF+6BLNfHiZ0BcxDobZYKhTSskhkSy8CL5FRqdmo3FP
 GxV+iHZnGJR/pOq2MI1A6bXhDkMfghTC66L5hhJ0vPkGqJK9+qT0Q523j2ucbYLAtruyGQGwGLX
 nAgzPqGA/PMEduX+bR286j7Nmq1aQ0kW/Qt+YdMXabb5ESVCb0JAQLBFHv1wszpbNlhsQp7mOAF
 /Tm3EpQT8LMDmcl/oEsnX7lqWnxO2pUwKCvRir739XtN/14dxmuRnwcV8CC2VEWmpOKvGu/Ia17
 IxeHjgVyRl+eeDJS8z1lD4cOP384mRXvW1iloxuB41p4l75vmOC9/XEAhWZgbojhqgEXBz5YWX8
 SyYRzot6gJjhq9PeIa05hE6mn0eWnMsFZPpI29aebh5Aj012RkNLIjsR0=
X-Google-Smtp-Source: AGHT+IGro+wwQsR/NYh1lOG3a8YsY1zVzwtGWwXW0iRMHe8R+JAt821t5/4DYVjAoWTd+d+cAOY8xA==
X-Received: by 2002:ac2:4e08:0:b0:594:93b8:88b6 with SMTP id
 2adb3069b0e04-59a17db705bmr2948525e87.38.1766396532340; 
 Mon, 22 Dec 2025 01:42:12 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185d5e32sm2958869e87.8.2025.12.22.01.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 01:42:11 -0800 (PST)
Date: Mon, 22 Dec 2025 11:42:10 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mike Looijmans <mike.looijmans@topic.nl>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 0/3] drm: zynqmp: Make the video plane primary
Message-ID: <aUkSclVzlRCXDdug@nuoska>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113203715.2768107-1-sean.anderson@linux.dev>
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

On Thu, Nov 13, 2025 at 03:37:11PM -0500, Sean Anderson wrote:
> The graphics plane does not support XRGB8888, which is the default mode
> X uses for 24-bit color. Because of this, X must be set to use 16-bit
> color, which has a measurable performance penalty. Make the video plane
> the primary plane as it natively supports XRGB8888. An alternative
> approach to add XRGB8888 to the graphics plane is discussed in [1], as
> well as in patch 2.
> 
> [1] https://lore.kernel.org/dri-devel/20250627145058.6880-1-mike.looijmans@topic.nl/

I've tested this series on AMD KV260 running Yocto genericarm64 machine config and
core-image-sato with Xorg. This series fixes HDMI output using X11, no need to
configure Xorg to 16bpp as workaround.

Tested-by: Mikko Rapeli <mikko.rapeli@linaro.org>

That said, I also tested
https://lore.kernel.org/dri-devel/20250627145058.6880-1-mike.looijmans@topic.nl/
and it works.

And I tested and submitted the patch for zynqmp framebuffer to prefer 16bpp
until different modes are actually support, which fixes Xorg startup and
the depth detection logic used there:

https://lore.kernel.org/dri-devel/20251205123751.2257694-3-mikko.rapeli@linaro.org/

This series and Mike's patches enable 24bpp mode to work, which I guess is the long
term path, but it is not clear to me what is still missing.

The patch from me fixes the current situtation where only 16bpp works but framebuffer
driver does not prefer that and thus userspace X11 uses the default 24bpp
which then fails. My patch could be merged right now until the XRGB8888 support
is finalized.

Cheers,

-Mikko
