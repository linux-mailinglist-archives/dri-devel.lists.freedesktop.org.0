Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAE9183D1E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 00:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DF36EB54;
	Thu, 12 Mar 2020 23:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1FE6EB54
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 23:13:57 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC2D3206F7;
 Thu, 12 Mar 2020 23:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584054837;
 bh=KdJ376DrupqSBe4hSilpFPULBV8+maazUojKqMfa2Hs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=OPQZ9/crlt1D8ScrMECNiBOu3Ewxf1OnMJkB6zbrAZUkT4KA0/XSQZ7E+XiLRoIfV
 CtME35UK548pS59QOb5MmyuPCYA7AxrPTGjW6qQ6ZPj2wTNFRaQY4DFbg0bNE2EKMr
 AGmSq5wEHbayZYhgGVSng7s7xs0zFYDuiL3S8eZI=
MIME-Version: 1.0
In-Reply-To: <ab03d578775df76c12e1dcff5d5cc5c1eb4d6fa7.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <ab03d578775df76c12e1dcff5d5cc5c1eb4d6fa7.1582533919.git-series.maxime@cerno.tech>
Subject: Re: [PATCH 05/89] clk: Return error code when of provider pointer is
 NULL
From: Stephen Boyd <sboyd@kernel.org>
To: Eric Anholt <eric@anholt.net>, Maxime Ripard <maxime@cerno.tech>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Date: Thu, 12 Mar 2020 16:13:56 -0700
Message-ID: <158405483605.149997.16173757299414738003@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2020-02-24 01:06:07)
> The clock framework DT provider helpers don't check the pointers in the
> array registered by the clock provider before returning it.
> 
> This means that if the array is sparse, we will end up returning a NULL
> pointer while the caller expects an error pointer, resulting in a crash.
> 
> Let's test the pointer returned and properly return an error if the pointer
> is NULL.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/clk.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index f0f2b599fd7e..8532b5ed1060 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -4318,13 +4318,18 @@ struct clk *of_clk_src_onecell_get(struct of_phandle_args *clkspec, void *data)
>  {
>         struct clk_onecell_data *clk_data = data;
>         unsigned int idx = clkspec->args[0];
> +       struct clk *clk;
>  
>         if (idx >= clk_data->clk_num) {
>                 pr_err("%s: invalid clock index %u\n", __func__, idx);
>                 return ERR_PTR(-EINVAL);
>         }
>  
> -       return clk_data->clks[idx];
> +       clk = clk_data->clks[idx];
> +       if (!clk)

NULL is a valid clk. That should keep working and not be overriden with
an error pointer. If you want to return an error pointer either fill it
in with an error pointer or write your own version of this.

> +               return ERR_PTR(-ENODEV);
> +
> +       return clk;
>  }
>  EXPORT_SYMBOL_GPL(of_clk_src_onecell_get);
>  
> @@ -4333,13 +4338,18 @@ of_clk_hw_onecell_get(struct of_phandle_args *clkspec, void *data)
>  {
>         struct clk_hw_onecell_data *hw_data = data;
>         unsigned int idx = clkspec->args[0];
> +       struct clk_hw *hw;
>  
>         if (idx >= hw_data->num) {
>                 pr_err("%s: invalid index %u\n", __func__, idx);
>                 return ERR_PTR(-EINVAL);
>         }
>  
> -       return hw_data->hws[idx];
> +       hw = hw_data->hws[idx];
> +       if (!hw)

And this one is the same. We let NULL be returned so that it can be
returned as a NULL pointer to the caller if desired. That indicates a
clk that does nothing when used.

> +               return ERR_PTR(-ENODEV);
> +
> +       return hw;
>  }
>  EXPORT_SYMBOL_GPL(of_clk_hw_onecell_get);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
