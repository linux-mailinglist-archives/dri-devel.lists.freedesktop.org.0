Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A06C146EEC4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F221910E942;
	Thu,  9 Dec 2021 16:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F3510E118
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 10:17:29 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id u80so4979500pfc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 02:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qkgmXR3Qg7ObZaJ2FOxIFOIUs96TcoxwxPu3sBMau/8=;
 b=bB5F7U3C9yoInnsJUROFJXpLXjfsfazmMqhwb3qC7YfPCxpfJ6E3empQ7yjEGmrNRz
 SwHvDoM0aoNIGcjE8jOm8mGHvv03J9TY1CXxT+McOwTf5Tp8s74w5I5Ick0l9CT/V5as
 Lgv01rNq3mDWqMyrQgrWHXHaO64r+yRs8/4rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qkgmXR3Qg7ObZaJ2FOxIFOIUs96TcoxwxPu3sBMau/8=;
 b=5+J9cUCjPtyljEX8Dgg0gk4gkhB9sem2KrwRxtV1W0sIbHrIxMOF3R5a6NcdehZcUI
 iOHAysLzFiZrGkZHKaZc0BnwerPcS4vcgFOlaVOblHptRy0A0N+Yfx417Gh1L6CKta3W
 CTTf+y4L+iVOSbWss4nKTMaAzllIJutJLXypml8gAZ+2ib3tsBSN/UM67vNJw7Ejnv35
 O/vEfbTeAGKCY2wy/18qCfDSWbkooFm1oFFJTmZLv3eAbNBJObe2Cv+lzauOTqu1LRn8
 Wr4/pqm2e+0bLKIOetoDzb/4W3uX4TriyTrz3P2kLKAMLNDBX+KtHdJyd+EE2iztsb03
 PQKA==
X-Gm-Message-State: AOAM531Tx2IqFhbQcfMeVjEU2aIJqrLqQDe5tpCUrFrH0JXfyMMH0uc+
 Zo9LPqWm/yPJ4/rIMXWaHLqqy03nnbTjuEdQ/DK6OA==
X-Google-Smtp-Source: ABdhPJwlgi3NF3sbonhF2xanFeVkWgLWtprLvSiH/mbXz4zKidymQ9MfvFFr7ReQvnMcwYsPKO2stf+DBSZYEMw2vL8=
X-Received: by 2002:a63:ef58:: with SMTP id c24mr34197281pgk.94.1639045048976; 
 Thu, 09 Dec 2021 02:17:28 -0800 (PST)
MIME-Version: 1.0
References: <20211016145827.586870-1-michael@amarulasolutions.com>
In-Reply-To: <20211016145827.586870-1-michael@amarulasolutions.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 9 Dec 2021 11:17:17 +0100
Message-ID: <CAOf5uw=DffhS=WAh-OFXOCO+4kd5ey=2Eqf0Zhyrgd_d5D8meA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Avoid unbalance
 prepare/unprepare
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all

On Sat, Oct 16, 2021 at 4:58 PM Michael Trimarchi
<michael@amarulasolutions.com> wrote:
>
> All the panel driver check the fact that their prepare/unprepare
> call was already called. It's not an ideal solution but fix
> for now the problem on ili9881c
>
> [ 9862.283296] ------------[ cut here ]------------
> [ 9862.288490] unbalanced disables for vcc3v3_lcd
> [ 9862.293555] WARNING: CPU: 0 PID: 1 at drivers/regulator/core.c:2851
> _regulator_disable+0xd4/0x190
>
> from:
>
> [ 9862.038619]  drm_panel_unprepare+0x2c/0x4c
> [ 9862.043212]  panel_bridge_post_disable+0x18/0x24
> [ 9862.048390]  dw_mipi_dsi_bridge_post_disable+0x3c/0xf0
> [ 9862.054153]  drm_atomic_bridge_chain_post_disable+0x8c/0xd0
>
> and:
>
> [ 9862.183103]  drm_panel_unprepare+0x2c/0x4c
> [ 9862.187695]  panel_bridge_post_disable+0x18/0x24
> [ 9862.192872]  drm_atomic_bridge_chain_post_disable+0x8c/0xd0
> [ 9862.199117]  disable_outputs+0x120/0x31c
>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index 103a16018975..f75eecb0e65c 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -52,6 +52,8 @@ struct ili9881c {
>
>         struct regulator        *power;
>         struct gpio_desc        *reset;
> +
> +       bool                    prepared;
>  };
>

I found that this can be a general problem. Should not mandatory to
track panel status

DRM_PANEL_PREPARED
DRM_PANEL_ENABLED

Michael
>  #define ILI9881C_SWITCH_PAGE_INSTR(_page)      \
> @@ -707,6 +709,10 @@ static int ili9881c_prepare(struct drm_panel *panel)
>         unsigned int i;
>         int ret;
>
> +       /* Preparing when already prepared is a no-op */
> +       if (ctx->prepared)
> +               return 0;
> +
>         /* Power the panel */
>         ret = regulator_enable(ctx->power);
>         if (ret)
> @@ -745,6 +751,8 @@ static int ili9881c_prepare(struct drm_panel *panel)
>         if (ret)
>                 return ret;
>
> +       ctx->prepared = true;
> +
>         return 0;
>  }
>
> @@ -770,10 +778,16 @@ static int ili9881c_unprepare(struct drm_panel *panel)
>  {
>         struct ili9881c *ctx = panel_to_ili9881c(panel);
>
> +       /* Unpreparing when already unprepared is a no-op */
> +       if (!ctx->prepared)
> +               return 0;
> +
>         mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
>         regulator_disable(ctx->power);
>         gpiod_set_value(ctx->reset, 1);
>
> +       ctx->prepared = false;
> +
>         return 0;
>  }
>
> --
> 2.25.1
>


-- 
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
