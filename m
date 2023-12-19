Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF5E818CB3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 17:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A3910E1B2;
	Tue, 19 Dec 2023 16:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E35810E1B2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 16:46:12 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a23350cd51cso369802766b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 08:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703004371; x=1703609171; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9iyYRRTfOYCdZhFzzYt7vcnK5tnPRi7bc1hwQ2Xgkro=;
 b=b6smsnAZrjoD5DSSxtUwzyw2VLHOVdrEWrFwGnesHXxSFy6ttw5lE9/W8mSZ/Vh2l9
 +Xs6xyShiKv5OuyXkmigr7Z5kMk/NzwT/12fL231l4cVDuJ+wF+4tkxhXO1C5Bwpy8d8
 I06GEFN4SH2iKDOKwQhVVpzo5/Lcsn4AR8+fx3qZ7gT7unBGEpFvJ09XMEKpada0/W8d
 l2GFLrOaWkcN2Nilv4knEM55UdN526A00LvJYr8jXb4lbpSX+6HiCzXYq1xffhfOlrx4
 EOYoKGjQcemG+pNq43in8lv0YoRVSe1OyfLlY2TWqbpEY+qBlTeyOloQSVx30zn2xonF
 F+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703004371; x=1703609171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9iyYRRTfOYCdZhFzzYt7vcnK5tnPRi7bc1hwQ2Xgkro=;
 b=Pi36ZJRis31gbHP1uJnT82A6hNvF2m9KMErtZc6SJwKhbB4rowqseAolmK7tQJmGB0
 HW+FwCqzdw+GRgf1eulX+sif+aLXoKZRkISR8r4CJaVh1CUxEjsnsdbJY5zuLvbutx7Z
 6euJVOP7yOZvkujs6MQaEsX6zXW2bFYdA1Bjcq6zIOFx/iiYAwDXt993POoBURD2O1Zz
 S27azhNklvdCCKIisVWExhXSkV+Aeza6ZrrPKOSWkLZqr96yHDzp/3su5OIhZoP/APOj
 DVfu0JvZ7w/JjrmPE7RT/ZiyyAnfWiGV4QglnfykxwAekzLgYBjUFU1UEe/gF4Hiyg2P
 tp5w==
X-Gm-Message-State: AOJu0YzKZ/qhCYhN9PdiRcTV7pKe/fFESxIFaegDwkSTN3SXR+P/Ko6q
 tOsB1AQTQKHuVUkb7e55rTQ=
X-Google-Smtp-Source: AGHT+IFJfMra7NcuO7fQEfUYtCoN4Bxnp51stjqeihm0piqP+Wi1lNVa1b2/OyVghxfcNYQDfZPAyA==
X-Received: by 2002:a17:906:2206:b0:a23:3299:f332 with SMTP id
 s6-20020a170906220600b00a233299f332mr2818692ejs.140.1703004370668; 
 Tue, 19 Dec 2023 08:46:10 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 vx4-20020a170907a78400b00a0a2553ec99sm15564251ejc.65.2023.12.19.08.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 08:46:10 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH 1/5] clk: sunxi-ng: nkm: Support constraints on m/n ratio
 and parent rate
Date: Tue, 19 Dec 2023 17:46:08 +0100
Message-ID: <5736273.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20231218-pinephone-pll-fixes-v1-1-e238b6ed6dc1@oltmanns.dev>
References: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
 <20231218-pinephone-pll-fixes-v1-1-e238b6ed6dc1@oltmanns.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Frank Oltmanns <frank@oltmanns.dev>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Frank!

Dne ponedeljek, 18. december 2023 ob 14:35:19 CET je Frank Oltmanns napisal(a):
> The Allwinner A64 manual lists the following constraints for the
> PLL-MIPI clock:
>  - M/N >= 3

This should be "<="

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

You already figured this part.

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

What about max_m_n_ratio and max_parent_m_ratio, to be consistent? This
should also allow to simplify description.

Best regards,
Jernej

>  
>  	struct ccu_common	common;
>  };
> 
> 




