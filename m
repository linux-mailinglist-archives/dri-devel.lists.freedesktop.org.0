Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B196999C183
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 09:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000A510E3A4;
	Mon, 14 Oct 2024 07:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bMoUfoUV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859AB10E3A4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 07:38:54 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-539f84907caso555597e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 00:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728891533; x=1729496333; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Rk4QxLNEwsyzZXP0YPS09TQSucKgCrUhh8MMP3HebVA=;
 b=bMoUfoUVarrqFnFk0Q2wVXhKB2vjjwDyNlP27rjN2ZxoWpKZAAb7hftYaa0OmRMpYe
 aJK+qi0eTVNiR8UqYfGpCEH52T5dSSanKoLjVZvYxz+7d3jKb/ADI31/C7FP5w9FEgq2
 VU8MzaXpP/EQZa61yGrOWG3wFkhOxrdzrICYCXy+MnumFSOra0vFOxMBXHU2DnQmFeOc
 b02zS08M+PxNk9GXq3tWe4bWlcm48OAVXbWC7979P6DKlAWLfovRrkaWPTPV7tqw6gfq
 wHfs+JF+MJk+GXcDsPvmzmhx3ozCm8k2Ofp4hvTiLk49O4PaqUX32q9E7QRElCn4sFn8
 M5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728891533; x=1729496333;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rk4QxLNEwsyzZXP0YPS09TQSucKgCrUhh8MMP3HebVA=;
 b=LXnBQT0hdgcWkecnyLYB5ppp4u2E00jxgcRSei7h8SUaANdY58WqjQKMir9B+9yKTE
 FzsYyzql11wFkuk4dEuG1lJ4KWttRTLZmUNbaF4Bo/3rE2yzDn8uRXyoLalQj7zi4D5N
 XST0apXpsxltu0r4R0axs6eFtNeRD41Guuin/1XrV9qfUwsteqGN6Fw7fQU/az+c5ieo
 odQLgWxVsqHjmdIme21NsJjK/FU7dxVP0s+cvf9XrNOgsh8YTQYtZZ9dw49ihrRYNMMZ
 dWbyqGz/bKhdlVC+FDF/SLp7FpDjzu6UDnRyGIR33Iqg92scZ867QsVmkxHZWfL5o74Q
 GLuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpYgz/Kv1W4BIXc9KUD64baGrkcZ5QK442TFuU+UCAQorg7CWWG7Ub5Vm7qS+cOtSHA9FMLwN1O20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzqguXjqMoh6m4AoetzPRxmN0HdJmXvOb3TtKVe1w36jhEoNcI
 +Fjupc3Q1oCg9IIS59JYbMk8GyfKrZC5dc1XGVEQITuKKWrtjcBvE2JEpHjN+XM=
X-Google-Smtp-Source: AGHT+IGNuE7vrBBXDi1MiauEpNLyh+kIr9HGY+e68HLWEmc/QK6X0iLQvyhPZqFQLW8amaU8CG2fyg==
X-Received: by 2002:a05:6512:baa:b0:539:e94d:b490 with SMTP id
 2adb3069b0e04-539e94dbcd1mr1984693e87.43.1728891532559; 
 Mon, 14 Oct 2024 00:38:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539eb3416a4sm667052e87.278.2024.10.14.00.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 00:38:52 -0700 (PDT)
Date: Mon, 14 Oct 2024 10:38:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Advait Dhamorikar <advaitdhamorikar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, 
 anupnewsmail@gmail.com, kernel test robot <lkp@intel.com>, 
 Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] drm/atmel_hlcdc: Fix uninitialized variable
Message-ID: <rr7pp6a77tmur62vu2xdpasokokta7g6kcgjcd4iydmzyqpd5e@z45genf4gsv3>
References: <20241007150904.9840-1-advaitdhamorikar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007150904.9840-1-advaitdhamorikar@gmail.com>
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

On Mon, Oct 07, 2024 at 08:39:04PM +0530, Advait Dhamorikar wrote:
> atmel_hlcdc_plane_update_buffers: may use an uninitialized
> sr variable when the if condition remains unsatisfied.
> The variable may contain an arbitrary value left from earlier computations.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202409240320.MZPgi3Up-lkp@intel.com/
> Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>

Fixes: d498771b0b83 ("drm: atmel_hlcdc: Add support for XLCDC using IP specific driver ops")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
