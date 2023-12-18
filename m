Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CBB817A34
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF9910E366;
	Mon, 18 Dec 2023 18:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1556 seconds by postgrey-1.36 at gabe;
 Mon, 18 Dec 2023 18:47:54 UTC
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C81110E383
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:47:54 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Sv6MX6LDzz9sp7;
 Mon, 18 Dec 2023 18:32:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1702920728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+vve0NiBqF/ep9e79zQnM4N2qRMtt/LCYu4PuzewmJ0=;
 b=QZq2hHeyxhgZWBwpbBlpRX5VLY/977BHVX6kCqLDDjCUMrNBHnvN7SIPIneOtBnKlkjMmC
 iL89+dK142E8S9UB7gyrpj/QdCIratTBdOK61d5RGJogDWj7BcgsfioU/ZG0efG3gOxI2J
 WLIEovlqlukfGthr9hjkicgKNe/JuVFvIZIe0ykW47p4XXTlhjVff6bjOnAsW8L5Q3fl7k
 RMQ2eDrZcOYd/fiXy+waNgXtKFFWs858qVZ29wnY2wSo5SgFZYvg9Ldw8420NCTrakhywn
 x3/XY/u2ZqDgfjA2u/pizqRWIC1RqlVAYAdqBwM0EVYpcvGKp1uVgIu3+0uMRw==
References: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
 <20231218-pinephone-pll-fixes-v1-1-e238b6ed6dc1@oltmanns.dev>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH 1/5] clk: sunxi-ng: nkm: Support constraints on m/n
 ratio and parent rate
Date: Mon, 18 Dec 2023 18:26:51 +0100
In-reply-to: <20231218-pinephone-pll-fixes-v1-1-e238b6ed6dc1@oltmanns.dev>
Message-ID: <8734vz1kok.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Purism Kernel Team <kernel@puri.sm>, Samuel Holland <samuel@sholland.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <megi@xff.cz>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-12-18 at 14:35:19 +0100, Frank Oltmanns <frank@oltmanns.dev> wrote:
> The Allwinner A64 manual lists the following constraints for the
> PLL-MIPI clock:
>  - M/N >= 3
>  - (PLL_VIDEO0)/M >= 24MHz
>
> The PLL-MIPI clock is implemented as ccu_nkm. Therefore, add support for
> these constraints.
>
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> ---
>  drivers/clk/sunxi-ng/ccu_nkm.c | 23 +++++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu_nkm.h |  8 ++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
> index eed64547ad42..2af5c1ebd527 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> @@ -16,6 +16,20 @@ struct _ccu_nkm {
>  	unsigned long	m, min_m, max_m;
>  };
>
> +static bool ccu_nkm_is_valid_rate(struct ccu_common *common, unsigned long parent,
> +				  unsigned long n, unsigned long m)
> +{
> +	struct ccu_nkm *nkm = container_of(common, struct ccu_nkm, common);
> +
> +	if (nkm->max_mn_ratio && (m > nkm->max_mn_ratio * n))
> +		return false;
> +
> +	if (nkm->parent_wo_nk && (parent < nkm->parent_wo_nk * m))
> +		return false;
> +
> +	return true;
> +}
> +
>  static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common,
>  						       struct clk_hw *parent_hw,
>  						       unsigned long *parent, unsigned long rate,
> @@ -32,6 +46,9 @@ static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common
>
>  				tmp_parent = clk_hw_round_rate(parent_hw, rate * _m / (_n * _k));
>
> +				if (!ccu_nkm_is_valid_rate(common, tmp_parent, _n, _m))
> +					continue;
> +
>  				tmp_rate = tmp_parent * _n * _k / _m;
>
>  				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate) ||
> @@ -65,6 +82,12 @@ static unsigned long ccu_nkm_find_best(unsigned long parent, unsigned long rate,
>  	for (_k = nkm->min_k; _k <= nkm->max_k; _k++) {
>  		for (_n = nkm->min_n; _n <= nkm->max_n; _n++) {
>  			for (_m = nkm->min_m; _m <= nkm->max_m; _m++) {
> +				if ((common->reg == 0x040) && (_m > 3 * _n))
> +					break;
> +
> +				if ((common->reg == 0x040) && (parent < 24000000 * _m))
> +					continue;
> +

This, of course, is rubbish and should be this instead:
+				if (!ccu_nkm_is_valid_rate(common, parent, _n, _m))
+					continue;
+

I'll submit a V2 after receiving some feedback.

>  				unsigned long tmp_rate;
>
>  				tmp_rate = parent * _n * _k / _m;
> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.h b/drivers/clk/sunxi-ng/ccu_nkm.h
> index 6601defb3f38..d3d3eaf55faf 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkm.h
> +++ b/drivers/clk/sunxi-ng/ccu_nkm.h
> @@ -16,6 +16,12 @@
>   * struct ccu_nkm - Definition of an N-K-M clock
>   *
>   * Clocks based on the formula parent * N * K / M
> + *
> + * @max_mn_ratio:	Maximum value for M / N.
> + * @parent_wo_nk:	The minimum rate the parent must provide after applying the divisor,
> + *			but without applying the multipliers, i.e. the contstraint
> + *			   (parent rate)/M >= parent_wo_nk
> + *			must be fulfilled.
>   */
>  struct ccu_nkm {
>  	u32			enable;
> @@ -27,6 +33,8 @@ struct ccu_nkm {
>  	struct ccu_mux_internal	mux;
>
>  	unsigned int		fixed_post_div;
> +	unsigned long		max_mn_ratio;
> +	unsigned long           parent_wo_nk;
>
>  	struct ccu_common	common;
>  };
