Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C257F9129
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 04:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544CB10E049;
	Sun, 26 Nov 2023 03:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3528F10E049
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 03:51:49 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6d81173a219so684076a34.3
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 19:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700970708; x=1701575508; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=n3ePcv5eyiWbDO+V9MEwPvr8kWuH4Kzge2qv1KaLJqs=;
 b=VAuKJ09ov0GY3l14AlcI04OrdMLm7XeR55XoazdlbYoOdafuFEca5iCBqqOCzIuSJh
 AZRQqbA+AMSOwOUqfDYbQOGGpCmwTumcJ6YoLhPGIuDmMthPEEov6279njV+y5LlYYb6
 2H6ETBjEGbegYeJk5AYQNbVnUvYqJvCGtoEkJ3AoY0fpak29KFHbREgzMKNezgPM0vyR
 RuZPy7kJ8TxXkzYV2qQEkLLr040Ja3+i8UMszgy87BuSQAfD/0TahAGTK3BbQjF8Wu3r
 rtSAq2SJUXLE2Bncni7ZbTyadeLzgoU1kYfsZWJaET5tXRquUf4AMUBuBbIrNlc6wFDv
 GleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700970708; x=1701575508;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n3ePcv5eyiWbDO+V9MEwPvr8kWuH4Kzge2qv1KaLJqs=;
 b=NNZWrCnUZ9VIyoAHOgIAgKTWXZ7uIdEkjZDJBDKD+3r0YZnVzIcWSpAb3lNuj8YZtH
 b+1GOn3owR+bOgxDcQPMvtfAuU9l3MzourGTuMCBHxtEjnd0o/KQu595BCEo4pl6A4UB
 5QPR9xgXKxkd078OlSlfU8q6NpIlL6RZ5R/tenl93qL2shwJVKdZx5V5jyzRsRWuLBut
 XBZ2ghZoCyiriITRnWo8JN0689kikQEEfTsSSTEQMtzP3Pi1ERvnGvYGQ6WJw035RcwB
 jaxocDCbB7hlgl5ejAQs223z7A5UuQULKVnhtp9auB3TKhx3FzkLo9TQOjhd0ZgjAyfI
 g9AA==
X-Gm-Message-State: AOJu0YwVm+b6oQq+KnglvWRPzGI8/Vy5PR/Sioxzc9Sez1YJ43F3z8Zb
 F+uTrt/2gcujxofzpOAH6jA=
X-Google-Smtp-Source: AGHT+IF/X8aRobgXRIN9qGUIxqzUHSyxSexoCuANEUhynakNMA+LmC0DkbZCl5A53nkihBW/EJWx5g==
X-Received: by 2002:a05:6808:1407:b0:3b2:f2e0:6b39 with SMTP id
 w7-20020a056808140700b003b2f2e06b39mr10679999oiv.12.1700970708056; 
 Sat, 25 Nov 2023 19:51:48 -0800 (PST)
Received: from neuromancer. ([75.28.21.198]) by smtp.gmail.com with ESMTPSA id
 be8-20020a056808218800b003b2e4754cc2sm1064673oib.26.2023.11.25.19.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 19:51:47 -0800 (PST)
Message-ID: <6562c0d3.050a0220.2a5c5.554b@mx.google.com>
X-Google-Original-Message-ID: <ZWLA0WS8boG6j1Rc@neuromancer.>
Date: Sat, 25 Nov 2023 21:51:45 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: Re: [PATCH V4 2/6] drm/panel: nv3051d: Hold panel in reset for
 unprepare
References: <20231117202536.1387815-1-macroalpha82@gmail.com>
 <20231117202536.1387815-3-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117202536.1387815-3-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 Macebrooks@gmail.com, Jessica Zhang <quic_jesszhan@quicinc.com>,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 17, 2023 at 02:25:32PM -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Improve the panel's ability to restore from suspend by holding the
> panel in suspend after unprepare.

Now I have confirmation this does fix a bug for some users, and a
somewhat serious bug at that. A user had their device suspended for
approximately 12 hours and when they returned the screen was not
displaying correctly, even after a reboot. This patch was recommended
for troubleshooting, and confirmed to fix the problem (note, the screen
did eventually "right" itself after several hours of being off prior to
testing this fix). So now knowing it's really a bug as there was some
question previously if there were actual issues, is there a way this
can be added to the 6.6 and older supported kernels?

Thanks to brooksytech for the bug report and confirmation of fixes.

Might be a bit late for this, but:
Tested-by: brooksytech <macebrooks@gmail.com>

> 
> Fixes: b1d39f0f4264 ("drm/panel: Add NewVision NV3051D MIPI-DSI LCD panel")
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/panel/panel-newvision-nv3051d.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> index 79de6c886292..c44c6945662f 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> @@ -261,6 +261,8 @@ static int panel_nv3051d_unprepare(struct drm_panel *panel)
>  
>  	usleep_range(10000, 15000);
>  
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +
>  	regulator_disable(ctx->vdd);
>  
>  	return 0;
> -- 
> 2.34.1
> 
