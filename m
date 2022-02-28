Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B734C661D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 10:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED42110E2B5;
	Mon, 28 Feb 2022 09:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A3E10E2B3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 09:50:55 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id g24so9887189qkl.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 01:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ChCJy+0OwFHzxUqMKUpKVLhG2Ciw026npYT/0GQ0Yk=;
 b=hTAs+3Xrr+6O7Mn2pIyT3WlaYT4dcHLyCkL6jprx+rcKO4WDXKPAoVsxvKUYypPwwB
 IXO8ZfW2Xi8IyJ3LlYi+wST6t6yGyjM/N3uxgvUNyUP+3PH+Mn91ZWhX00qzZ0MdJSac
 3Mqm6l9D+Bv6SwWPNpZqKI+pJ2BfbDqmjpr6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ChCJy+0OwFHzxUqMKUpKVLhG2Ciw026npYT/0GQ0Yk=;
 b=hLISCYXXX7rWZP6B/ydQCyVbGAs0fNi4csm9igPAQypurpw+D0kX3w3//iaAHx6z1G
 L6YMLz5eewf3AHec6e4Ux0XcnoH6oAqOF2H6HL7woxeVngkYffYETj3MOlyh+y4I2aka
 fS9OsncqhRDa/unUSnMhEjP7VFXRhxuzUawJzHyq7XVbOi1Jav9IiZ66KiVHnlkNDcnf
 v4HXljtwrLcv6P6LlW/5RZA8f5kDLgf+2dOopP9Jtx9KHFM+X6TgEKrnG7mx0OoZFCwh
 0rWKDyiELEAzrr5myfImqJR0WZQq76w0+HweZGr/Z5c7ewPP2sS9Mpn73Zu263RqRLmP
 nJVA==
X-Gm-Message-State: AOAM531GEQxWjBd8DubPwzWud2XAqPggj/Pe1LWx5d+Sx3xX7thgmygy
 Afo/ooSwpFEHai3dljHX0rhaP9NXrbcseo9tVaI=
X-Google-Smtp-Source: ABdhPJxsSC68f5owG834t4sYFt0lQ26A2pHLgsq9IIBoF/ngeOjEx55gUbXsZf3pje2bAidXWaANv68oojEax4AM2qs=
X-Received: by 2002:a37:f903:0:b0:648:ca74:b7dc with SMTP id
 l3-20020a37f903000000b00648ca74b7dcmr10479323qkj.666.1646041854321; Mon, 28
 Feb 2022 01:50:54 -0800 (PST)
MIME-Version: 1.0
References: <20211208013337.13806-1-tommy_huang@aspeedtech.com>
 <20211208013337.13806-6-tommy_huang@aspeedtech.com>
In-Reply-To: <20211208013337.13806-6-tommy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Feb 2022 09:50:42 +0000
Message-ID: <CACPK8XfA8Mz6tU2r=G+PxuVkvTZ5Nzw0g-V7EAoBhkKO-TOPfQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] drm/aspeed: Add reset and clock for AST2600
To: Tommy Haung <tommy_huang@aspeedtech.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, BMC-SW <BMC-SW@aspeedtech.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 8 Dec 2021 at 01:34, Tommy Haung <tommy_huang@aspeedtech.com> wrote:
>
> From: tommy-huang <tommy_huang@aspeedtech.com>
>
> Add more reset and clock select code for AST2600.
> The gfx_flags parameter was added for chip caps idenified.

Can you tell me a bit more about the two reset lines:

What is the CRT reset line controlling?

What does the engine reset line control?

Can we use devm_reset_control_array_get() to get whichever are
specified in the device tree, so we don't need to have different logic
for the 2600 and earlier chips?



>
> Signed-off-by: tommy-huang <tommy_huang@aspeedtech.com>
> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx.h      | 16 +++++++-
>  drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 16 ++++++++
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 50 ++++++++++++++++++++++--
>  3 files changed, 77 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
> index 4e6a442c3886..2c733225d3c7 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
> @@ -8,7 +8,8 @@ struct aspeed_gfx {
>         struct drm_device               drm;
>         void __iomem                    *base;
>         struct clk                      *clk;
> -       struct reset_control            *rst;
> +       struct reset_control            *rst_crt;
> +       struct reset_control            *rst_engine;
>         struct regmap                   *scu;
>
>         u32                             dac_reg;
> @@ -16,6 +17,7 @@ struct aspeed_gfx {
>         u32                             vga_scratch_reg;
>         u32                             throd_val;
>         u32                             scan_line_max;
> +       u32                             flags;
>
>         struct drm_simple_display_pipe  pipe;
>         struct drm_connector            connector;
> @@ -106,3 +108,15 @@ int aspeed_gfx_create_output(struct drm_device *drm);
>  /* CRT_THROD */
>  #define CRT_THROD_LOW(x)               (x)
>  #define CRT_THROD_HIGH(x)              ((x) << 8)
> +
> +/* SCU control */
> +#define SCU_G6_CLK_COURCE              0x300
> +
> +/* GFX FLAGS */
> +#define RESET_MASK                     BIT(0)
> +#define RESET_G6                       BIT(0)
> +#define CLK_MASK                       BIT(4)
> +#define CLK_G6                         BIT(4)
> +
> +#define G6_CLK_MASK                    (BIT(8) | BIT(9) | BIT(10))
> +#define G6_USB_40_CLK                  BIT(9)
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> index 827e62c1daba..e0975ecda92d 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> @@ -77,6 +77,18 @@ static void aspeed_gfx_disable_controller(struct aspeed_gfx *priv)
>         regmap_update_bits(priv->scu, priv->dac_reg, BIT(16), 0);
>  }
>
> +static void aspeed_gfx_set_clk(struct aspeed_gfx *priv)
> +{
> +       switch (priv->flags & CLK_MASK) {
> +       case CLK_G6:
> +               regmap_update_bits(priv->scu, SCU_G6_CLK_COURCE, G6_CLK_MASK, 0x0);
> +               regmap_update_bits(priv->scu, SCU_G6_CLK_COURCE, G6_CLK_MASK, G6_USB_40_CLK);
> +               break;
> +       default:
> +               break;
> +       }
> +}
> +
>  static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
>  {
>         struct drm_display_mode *m = &priv->pipe.crtc.state->adjusted_mode;
> @@ -87,6 +99,8 @@ static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
>         if (err)
>                 return;
>
> +       aspeed_gfx_set_clk(priv);
> +
>  #if 0
>         /* TODO: we have only been able to test with the 40MHz USB clock. The
>          * clock is fixed, so we cannot adjust it here. */
> @@ -193,6 +207,7 @@ static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
>  static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe *pipe)
>  {
>         struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
> +
>         u32 reg = readl(priv->base + CRT_CTRL1);
>
>         /* Clear pending VBLANK IRQ */
> @@ -207,6 +222,7 @@ static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe *pipe)
>  static void aspeed_gfx_disable_vblank(struct drm_simple_display_pipe *pipe)
>  {
>         struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
> +
>         u32 reg = readl(priv->base + CRT_CTRL1);
>
>         reg &= ~CRT_CTRL_VERTICAL_INTR_EN;
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index d10246b1d1c2..59a0de92650f 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -64,6 +64,7 @@ struct aspeed_gfx_config {
>         u32 vga_scratch_reg;    /* VGA scratch register in SCU */
>         u32 throd_val;          /* Default Threshold Seting */
>         u32 scan_line_max;      /* Max memory size of one scan line */
> +       u32 gfx_flags;          /* Flags for gfx chip caps */
>  };
>
>  static const struct aspeed_gfx_config ast2400_config = {
> @@ -72,6 +73,7 @@ static const struct aspeed_gfx_config ast2400_config = {
>         .vga_scratch_reg = 0x50,
>         .throd_val = CRT_THROD_LOW(0x1e) | CRT_THROD_HIGH(0x12),
>         .scan_line_max = 64,
> +       .gfx_flags = 0,
>  };
>
>  static const struct aspeed_gfx_config ast2500_config = {
> @@ -80,6 +82,7 @@ static const struct aspeed_gfx_config ast2500_config = {
>         .vga_scratch_reg = 0x50,
>         .throd_val = CRT_THROD_LOW(0x24) | CRT_THROD_HIGH(0x3c),
>         .scan_line_max = 128,
> +       .gfx_flags = 0,
>  };
>
>  static const struct aspeed_gfx_config ast2600_config = {
> @@ -88,6 +91,7 @@ static const struct aspeed_gfx_config ast2600_config = {
>         .vga_scratch_reg = 0x50,
>         .throd_val = CRT_THROD_LOW(0x50) | CRT_THROD_HIGH(0x70),
>         .scan_line_max = 128,
> +       .gfx_flags = RESET_G6 | CLK_G6,
>  };
>
>  static const struct of_device_id aspeed_gfx_match[] = {
> @@ -138,6 +142,44 @@ static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
>         return IRQ_NONE;
>  }
>
> +static int aspeed_gfx_reset(struct drm_device *drm)
> +{
> +       struct platform_device *pdev = to_platform_device(drm->dev);
> +       struct aspeed_gfx *priv = to_aspeed_gfx(drm);
> +
> +       switch (priv->flags & RESET_MASK) {
> +       case RESET_G6:
> +               priv->rst_crt = devm_reset_control_get(&pdev->dev, "crt");
> +               if (IS_ERR(priv->rst_crt)) {
> +                       dev_err(&pdev->dev,
> +                               "missing or invalid crt reset controller device tree entry");
> +                       return PTR_ERR(priv->rst_crt);
> +               }
> +               reset_control_deassert(priv->rst_crt);
> +
> +               priv->rst_engine = devm_reset_control_get(&pdev->dev, "engine");
> +               if (IS_ERR(priv->rst_engine)) {
> +                       dev_err(&pdev->dev,
> +                               "missing or invalid engine reset controller device tree entry");
> +                       return PTR_ERR(priv->rst_engine);
> +               }
> +               reset_control_deassert(priv->rst_engine);
> +               break;
> +
> +       default:
> +               priv->rst_crt = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +               if (IS_ERR(priv->rst_crt)) {
> +                       dev_err(&pdev->dev,
> +                               "missing or invalid reset controller device tree entry");
> +                       return PTR_ERR(priv->rst_crt);
> +               }
> +               reset_control_deassert(priv->rst_crt);
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
>  static int aspeed_gfx_load(struct drm_device *drm)
>  {
>         struct platform_device *pdev = to_platform_device(drm->dev);
> @@ -163,6 +205,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
>         priv->vga_scratch_reg = config->vga_scratch_reg;
>         priv->throd_val = config->throd_val;
>         priv->scan_line_max = config->scan_line_max;
> +       priv->flags = config->gfx_flags;
>
>         priv->scu = syscon_regmap_lookup_by_phandle(np, "syscon");
>         if (IS_ERR(priv->scu)) {
> @@ -186,13 +229,12 @@ static int aspeed_gfx_load(struct drm_device *drm)
>                 return ret;
>         }
>
> -       priv->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> -       if (IS_ERR(priv->rst)) {
> +       ret = aspeed_gfx_reset(drm);
> +       if (ret) {
>                 dev_err(&pdev->dev,
>                         "missing or invalid reset controller device tree entry");
> -               return PTR_ERR(priv->rst);
> +               return ret;
>         }
> -       reset_control_deassert(priv->rst);
>
>         priv->clk = devm_clk_get(drm->dev, NULL);
>         if (IS_ERR(priv->clk)) {
> --
> 2.17.1
>
