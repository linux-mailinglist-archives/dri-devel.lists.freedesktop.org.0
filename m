Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8CC8C4583
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 19:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B4210E8AC;
	Mon, 13 May 2024 17:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ag9GVljN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0578310E8AC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:00:20 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-51f40b5e059so5334741e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 10:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715619618; x=1716224418; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3VvJAKTAjtjf+05qkCH0L1zTjltbF2Wcxv3NsnRIjV0=;
 b=ag9GVljNKxKv/u24w1ucG9XCwPwkO2ywY+By2waAQWb+wX8YOl9eTBr5HiJyTCGGBL
 f2cQVt7k29kNLKrhvXvEzfDp7ChpllsDDt9jd7ZiUMoeGamQ3AIRqPM7ETfAvD3VWLQz
 M/aX0zNXPrdwW8kVQs2iVbhtFxuOZeL7tGsqeT3jFKsyAFTNistYmERsw5+kUa9DNE1w
 Nz/ZpwSw2aWsB14JDJyGpkp0jrF2QkXjw6B7VyWSyAg2xAhlnXLTpx1gwvsFlIQM6FPx
 mfIBH9oolU8DfDOLQYtWhpCAf4i+nOeEjsqwuTQ89Cjnu1pMXby/JidPJQHarHX5bRXZ
 UY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715619618; x=1716224418;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3VvJAKTAjtjf+05qkCH0L1zTjltbF2Wcxv3NsnRIjV0=;
 b=tRUkkS/BC8WN0wpi+biOMi8je4ixOGTFJpVEWXQoYf0RBKOEpAxaXWDw5DWxxxG5Sk
 3xd2HIsxa8gxZTRPWbyU6URx4WGEDeI0dKurC2ieo0iyM98UCgHKLN6KKPtaf3TQ+Grt
 8HNvZFfo+hpeODLm9MwB3Nq2O2GW67WKMQpWBdSJxHa8ioesVWmQfFBFRmtldqYyPbyb
 VKo37GIhS0YxZ7TpXt4lBiPNuusOzMi0nvVvFdCrDkywhHisIdNLR28Zttjq/VBrR8zq
 ai+SYni1o5yNADX1SHELTSZYv2gHuMHzCXYlYg/VZK0AFrOmxrOobmD9yG6mo4bn/5DZ
 kThw==
X-Gm-Message-State: AOJu0Yxjd8qVOMN98TLuaat25a2QItaWl0tQh4nnarji/0yG/QxAB4op
 Yi/8rs+mozcaibccPLoTw/UVXGEnF1Yi1M5WBLui8bZMWGby6NaotdJvcwUkNtk=
X-Google-Smtp-Source: AGHT+IE1mwrThPnIipbuTaOPXZfA9vT+nYi8u59/SRJqtpAcxW7ICkkb44kAR6TosurkezVDg5IVjw==
X-Received: by 2002:ac2:4437:0:b0:519:2d60:d71b with SMTP id
 2adb3069b0e04-5220fb748e2mr6498931e87.22.1715619618592; 
 Mon, 13 May 2024 10:00:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d898fsm1828634e87.208.2024.05.13.10.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 10:00:18 -0700 (PDT)
Date: Mon, 13 May 2024 20:00:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, 
 lvzhaoxiong@huaqin.corp-partner.google.com,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Hsin-Yi Wang <hsinyi@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>, Joel Selvaraj <jo@jsfamily.in>, 
 Brian Norris <briannorris@chromium.org>,
 Ritesh Kumar <quic_riteshk@quicinc.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/9] drm/panel: novatek-nt36672e: Switch to
 mipi_dsi_dcs_write_seq_multi()
Message-ID: <ejpuzvwdzjtakhmunl3247lhnygdfxhbt36hpcqtytx5kifni7@ctfmhbr3ch6f>
References: <20240508205222.2251854-1-dianders@chromium.org>
 <20240508135148.v4.6.I3c08a7d02c467d2bc88da14e513ea4c8649fce45@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508135148.v4.6.I3c08a7d02c467d2bc88da14e513ea4c8649fce45@changeid>
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

On Wed, May 08, 2024 at 01:51:48PM -0700, Douglas Anderson wrote:
> This is a mechanical conversion of the novatek-nt36672e driver to use
> the new mipi_dsi_dcs_write_seq_multi(). The new function is easier for
> clients to understand and using it also causes smaller code to be
> generated. Specifically:
> 
> $ scripts/bloat-o-meter \
>   ...after/panel-novatek-nt36672e.ko \
>   ...ctx/panel-novatek-nt36672e.ko
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-988 (-988)
> Function                                     old     new   delta
> nt36672e_1080x2408_60hz_init                6236    5248    -988
> Total: Before=10651, After=9663, chg -9.28%
> 
> Cc: Ritesh Kumar <quic_riteshk@quicinc.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This change is only compile tested. I don't use this panel myself but
> arbitrarily picked it as an example to look at when working on the
> MIPI DSI macros.
> 
> NOTE: as of the posting of v4 this change still has no tags. Without
> any tags (Reviewed-by/Tested-by/Acked-by) I won't actually land this
> change even if the rest of the series lands.
> 
> (no changes since v3)
> 
> Changes in v3:
> - Fix spacing of init function.
> 
> Changes in v2:
> - New
> 
>  .../gpu/drm/panel/panel-novatek-nt36672e.c    | 576 +++++++++---------
>  1 file changed, 289 insertions(+), 287 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
