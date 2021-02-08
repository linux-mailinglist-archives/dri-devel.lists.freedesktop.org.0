Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 938DE313EC3
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 20:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BE16E9D2;
	Mon,  8 Feb 2021 19:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCD86E9D2
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 19:21:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E960D64DC3;
 Mon,  8 Feb 2021 19:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612812083;
 bh=J+Toa4VghZj+wvqsaR/Th+yW7a2hvMnxN0zHE32Q8rs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=IRJjB0RtouhXZNuT9YFz/9r3+iKLyeStKC52O+iBBcv8Tg0oZKDmrRHEXMQn9QdrF
 awbwFt5U7OIUkc9vjqLBVoqamdMw9oBL3No/PY21WQj1mU+XFgsHWXCeF0Y6xFj570
 NqtXT1qL50gf4yhlKw+S9g0hy5L4w0j1mnYsUUf9RTwjkq6sW/e1PM9RiEmkLBWv9d
 9HeBQ7bW81x0Cy10c2hSge2M27r8qNPdBSD8BJ1AFCtf9KIYJwaxWzwAgyX7Zq+zij
 2+vJrsqV2LU4I9nzXviMhjkbmSwwmL8tdl5ahza57mc+5sHUaDieEiJo7/xVYJtDz3
 GxvZoXLPLTkmg==
MIME-Version: 1.0
In-Reply-To: <20210208121752.2255465-2-jernej.skrabec@siol.net>
References: <20210208121752.2255465-1-jernej.skrabec@siol.net>
 <20210208121752.2255465-2-jernej.skrabec@siol.net>
Subject: Re: [PATCH v2 1/5] clk: sunxi-ng: mp: fix parent rate change flag
 check
From: Stephen Boyd <sboyd@kernel.org>
To: Jernej Skrabec <jernej.skrabec@siol.net>, mripard@kernel.org, wens@csie.org
Date: Mon, 08 Feb 2021 11:21:21 -0800
Message-ID: <161281208140.76967.6089044756544560133@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: airlied@linux.ie, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Jernej Skrabec (2021-02-08 04:17:48)
> CLK_SET_RATE_PARENT flag is checked on parent clock instead of current
> one. Fix that.
> 
> Fixes: 3f790433c3cb ("clk: sunxi-ng: Adjust MP clock parent rate when allowed")
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Tested-by: Andre Heider <a.heider@gmail.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/clk/sunxi-ng/ccu_mp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.c
> index fa4ecb915590..5f40be6d2dfd 100644
> --- a/drivers/clk/sunxi-ng/ccu_mp.c
> +++ b/drivers/clk/sunxi-ng/ccu_mp.c
> @@ -108,7 +108,7 @@ static unsigned long ccu_mp_round_rate(struct ccu_mux_internal *mux,
>         max_m = cmp->m.max ?: 1 << cmp->m.width;
>         max_p = cmp->p.max ?: 1 << ((1 << cmp->p.width) - 1);
>  
> -       if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
> +       if (!(clk_hw_get_flags(&cmp->common.hw) & CLK_SET_RATE_PARENT)) {

This is also clk_hw_can_set_rate_parent()

>                 ccu_mp_find_best(*parent_rate, rate, max_m, max_p, &m, &p);
>                 rate = *parent_rate / p / m;
>         } else {
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
