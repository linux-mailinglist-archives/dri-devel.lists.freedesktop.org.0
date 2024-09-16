Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E4F979AAC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 07:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9215210E20C;
	Mon, 16 Sep 2024 05:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DV/Xgx7b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A6D10E20C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 05:15:15 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dff1ccdc17bso3793556276.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2024 22:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726463714; x=1727068514; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yrR+EZEGlODA53oQ2phxVg0Pf18MwT6amUL7GRN1Q4c=;
 b=DV/Xgx7brtZZBiV0s/CLahMgFG8JgtZ1BO4z67P/Vv4CE/btjtPk6r8Ugfk1UYafHr
 FfIhJowltWMucWLdxEZIlrVnsIz/KsyEH1Q13DU1eP8jSXwL3i5c8M/K5Xt/Xr00vk9I
 1iZV3BrMVVaWkYOWsna6OnNpqSIVoe3SXx7uOmGjeFrZmgpAWKns2B1GvQ4r2mV16Xrr
 DBYka/O8/HGNacmDfTf5ZsrYEHq5CquAgQwmIvAznBbU/DleVJhVzitk3qwE3oNTl/Rl
 EbV19PkIRYC126jsQs1RLmpRdhd9E3X9/20ADkdwi6F972q4lcF/B5c1Q/uBMGUv01Ju
 Zmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726463714; x=1727068514;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yrR+EZEGlODA53oQ2phxVg0Pf18MwT6amUL7GRN1Q4c=;
 b=J6enQ1ZOD0WZ7Mxnf4VVX6FmrBtGS1HJmLoYbSv1fXstqsd3j7/J+Bl4kvdMD2UqsK
 DIqNdMldS1e7KZMAfDQNBIlsEGe9GrpMwHamE/MQpBuGkVw4L1WmlKbLL9qvgi+l2lqn
 wyrcSyNl0qsqSQmF5UiPS5b0OkewBdwZ6Q6zO4WoHuaCpxib86iBTjWx8ZVi0zef9jGy
 hULXFJiks0saP4BVsVEIInpKJV2sWk0VfpplL4lcCczVgamuRbvsYvNWAsjOysZ6ivL+
 UBKW0tkjNYtbljyslSBS+bavkQsoAlwKLfpTF46SfVczqZW1g1VX/a3AuYuX4/YlzIPV
 k/7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUblwtGIw08Kal0o2HaKzKDo0nJvV+GB0TVJnPh7zYVlSnF2ZHF1spDSHWRl2sVsl/id53fq/3IE5A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJkV6N/0RWDn9BNGG4xqZdsGHJSUffGYYOaRmp6yXKN7qgdWCF
 Ze5b51nIymauxQcs8bvjuUmEmi4Rm6vF+y62pheT1VrKOx+Gh/XZuNFyi9CQH6SejonCBfVFJ78
 PDkXHh8EHT4mD0Wby5sDaGdosR4YJu7k/6drwYg==
X-Google-Smtp-Source: AGHT+IE1BD0gww+GsvJt2s2A6MI3g0bWI4tMgjSI2z12kTREulECla62TeLkViBP3+qyc5475k+sZk0eMJp2U5UCCbM=
X-Received: by 2002:a05:690c:f02:b0:6b2:28c3:b729 with SMTP id
 00721157ae682-6dbb6add252mr146179877b3.4.1726463714100; Sun, 15 Sep 2024
 22:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240915080830.11318-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240915080830.11318-3-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240915080830.11318-3-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Sep 2024 07:15:03 +0200
Message-ID: <CAA8EJpqC5tQ45gj8-0bDutinCs7CoxiQVL1EAzwDK9RJTXYMcQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panel: boe-th101mb31ig002: Modify Starry panel
 timing
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dianders@chromium.org, hsinyi@google.com, 
 awarnecke002@hotmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Same comment as the one that I've provided to the other patch, plus:

On Sun, 15 Sept 2024 at 10:11, Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> In order to meet the timing, remove the delay between "backlight off"
> and "display off", and reduce the delay between "display_off" and
> "enter_sleep"

Separate commit, separate _justification_. Why, not what.

>
> Removing variables: display_off_to_enter_sleep_delay_ms

This phrase is useless.

>
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> index 0b87f1e6ecae..c2d0ec199829 100644
> --- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> +++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> @@ -29,7 +29,7 @@ struct panel_desc {
>         bool lp11_before_reset;
>         unsigned int vcioo_to_lp11_delay_ms;
>         unsigned int lp11_to_reset_delay_ms;
> -       unsigned int backlight_off_to_display_off_delay_ms;
> +       unsigned int display_off_to_enter_sleep_delay_ms;
>         unsigned int enter_sleep_to_reset_down_delay_ms;
>         unsigned int power_off_delay_ms;
>  };
> @@ -184,12 +184,10 @@ static int boe_th101mb31ig002_disable(struct drm_panel *panel)
>                                                       panel);
>         struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>
> -       if (ctx->desc->backlight_off_to_display_off_delay_ms)
> -               mipi_dsi_msleep(&dsi_ctx, ctx->desc->backlight_off_to_display_off_delay_ms);
> -
>         mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>
> -       mipi_dsi_msleep(&dsi_ctx, 120);
> +       if (ctx->desc->display_off_to_enter_sleep_delay_ms)
> +               mipi_dsi_msleep(&dsi_ctx, ctx->desc->display_off_to_enter_sleep_delay_ms);
>
>         mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>
> @@ -275,6 +273,7 @@ static const struct panel_desc boe_th101mb31ig002_desc = {
>                           MIPI_DSI_MODE_NO_EOT_PACKET |
>                           MIPI_DSI_MODE_LPM,
>         .init = boe_th101mb31ig002_enable,
> +       .display_off_to_enter_sleep_delay_ms = 120,
>  };
>
>  static const struct drm_display_mode starry_er88577_default_mode = {
> @@ -302,7 +301,7 @@ static const struct panel_desc starry_er88577_desc = {
>         .lp11_before_reset = true,
>         .vcioo_to_lp11_delay_ms = 5,
>         .lp11_to_reset_delay_ms = 50,
> -       .backlight_off_to_display_off_delay_ms = 100,
> +       .display_off_to_enter_sleep_delay_ms = 50,
>         .enter_sleep_to_reset_down_delay_ms = 100,
>         .power_off_delay_ms = 1000,
>  };
> --
> 2.17.1
>


--
With best wishes
Dmitry
