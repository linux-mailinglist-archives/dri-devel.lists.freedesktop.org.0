Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B9B84A12F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 18:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06C310E143;
	Mon,  5 Feb 2024 17:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AeYJbErZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C145B10E143
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 17:45:31 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-40fdc653665so8792095e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 09:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707155130; x=1707759930; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m0wzRpVZw3TnGWQm+s3AU8BkpazXaoqZkM6kOW1G/WQ=;
 b=AeYJbErZNuIDvti6xQQx7noa+1Yl/MjzxGEp7Qt5mDiJMi4VK9yidykrc/C9biEvny
 c4QsxFraOrxv2WiEY4u59lvg9lTwH587AQk7EbLVy+xPhRZIUwEgadHok7l2/wP5nEGJ
 Q0r1eHS6tepSruCgbfp6HLvYJ0SOIOaTiTGhdzQp/uPkxUkgab4ZnOHOqJbLl/erNLno
 unc+YK6A2MB2acGL3LhekyabnYQ6lebOOW+BuK7XUmjcFGY9k1Z8q3ITubSfWTOGkWin
 mr9yf6CozI3j1wp6RDLxIDR7i7rZfu4jWAvT0ZMm9eqIKuC/Gyu3iKpe2pG3qJVni8pu
 eI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707155130; x=1707759930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m0wzRpVZw3TnGWQm+s3AU8BkpazXaoqZkM6kOW1G/WQ=;
 b=C6bj6Ca5gttbVX8Bx7fWq5cfXzeBJ2JC10n90xf1Xm6wcM3exbSyEOyJWsa44/hckp
 lXLJ8Y9k3XFXBZWVw3b+L4ttCxYGotp0B0S1jvyt3Qh8DGr4aKTISoCGbffNZ+czXBnA
 cLDfEGZE8U9u3AkKELGHM1SGLNOcMX+uCINAQNpYAvC6RWgQIl/+Aks27iVK6Il+hdhW
 U6X/7wy6VMx+pPP0Fs9zltzRRVFG+nEzFQb14JMUBm8JLjnwJhTV5K9KpESs5ftGK6cA
 fWuBkXEjCcFeyDshn+Ou4NBAek6NZdDwaq79XioKr4azzGelASb+Q8u3x76yDOjisbnI
 Jjsw==
X-Gm-Message-State: AOJu0YyRULRO3cnv7HJbb+oXnZiGYRyjk1qmsZt8ESf/7YmLJTL6hanG
 zprhbzXGw5hCFpVeQpj2G4AxuRYQr+ANh1BUK+O/HTFppIStoYVS
X-Google-Smtp-Source: AGHT+IHDzn+x37VJ4FfaK12jdyWyrj6HN0Ue2YwTRPprISDD+A1uWFfuwbmrJ9tOHYqi9adBbIFrKQ==
X-Received: by 2002:a05:600c:3011:b0:40f:ddb1:dff6 with SMTP id
 j17-20020a05600c301100b0040fddb1dff6mr376290wmh.28.1707155129866; 
 Mon, 05 Feb 2024 09:45:29 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW0iRwJ4iK/1l5nccg8ejnbUpry1gNIfzjuLEOOT/5O1SnadHX8mF30Lt3dBquSMQ9iBWZaAoK5LYPVtw1BvDa73qNxIRIEekrw9/tuSsE5FzQt8XqtRIPnpXQ5cBWwzSiyse3B9eo51Np58H2ro7TB/GI/P/+CiHaHz9l4Le+ywVgofn63hBmTW+4vTMr9if42Vwn/dFxY+ZoTJO/4Bbs7c2Pmq4TiVExtmgujQocrxxEfWCd87n9GOQkCjgtFaKP/4JvXK+xvBpDrHK4CNj2wgp8h2GcBza2Gryvws8wnBOfFmbl1fL0/Cki6IYQ/19GQzIiRsikzV1xeytnJRhJzMjXH/HgPSktAktmvacMmOrTc27BBfSsxAcKCD/RwdZdN6utM9vwri1vyVZFbjwetOyIut79zZ+5d4g6jB1n4zLn1puq56QGYEHZVkxdnVD6UfOBCEMjn3FDx+gMRd1AgLnMuyWx/m1ENdeCIhAEdosVo2qjy9NEJlCNXhcpHWTP0Xk9O1mVBuJfKvCqNe+9ibSfD5ULoPlfEY7EzcpDDSDCNWa+nWgN6gC2dI7Hx1NlJXasSQMEDTDJZtP/CVz57zJIbVlcGNKGpgGof8Fv5KYPm03vyNz6Q2m+mMgPqqO69hb240frSev4L8YN8ugz7sHcK2k0XYvOn48j3wO+GP6KwVjX7XHv3AQ5KNx+fiauVQqvytkLaskwKk8P3CQRoi3zlNdwsuY4qSgZRAIl7VDRi/9pVggsxdyZfaqTsgbT9c5hy+uXxRA==
Received: from jernej-laptop.localnet (82-149-13-182.dynamic.telemach.net.
 [82.149.13.182]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c1d1200b0040e541ddcb1sm499607wms.33.2024.02.05.09.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 09:45:29 -0800 (PST)
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
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH v2 1/6] clk: sunxi-ng: nkm: Support constraints on m/n
 ratio and parent rate
Date: Mon, 05 Feb 2024 18:45:27 +0100
Message-ID: <2717565.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20240205-pinephone-pll-fixes-v2-1-96a46a2d8c9b@oltmanns.dev>
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <20240205-pinephone-pll-fixes-v2-1-96a46a2d8c9b@oltmanns.dev>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne ponedeljek, 05. februar 2024 ob 16:22:24 CET je Frank Oltmanns napisal(a):
> The Allwinner A64 manual lists the following constraints for the
> PLL-MIPI clock:
>  - M/N <= 3
>  - (PLL_VIDEO0)/M >= 24MHz
> 
> The PLL-MIPI clock is implemented as ccu_nkm. Therefore, add support for
> these constraints.
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

Haven't we discussed that this patch is unnecessary because same effect can
be reached by limiting minimum frequency?

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu_nkm.c | 21 +++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu_nkm.h |  2 ++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
> index 853f84398e2b..1168d894d636 100644
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
> +	if (nkm->max_m_n_ratio && (m > nkm->max_m_n_ratio * n))
> +		return false;
> +
> +	if (nkm->min_parent_m_ratio && (parent < nkm->min_parent_m_ratio * m))
> +		return false;
> +
> +	return true;
> +}
> +
>  static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common,
>  						       struct clk_hw *parent_hw,
>  						       unsigned long *parent, unsigned long rate,
> @@ -31,6 +45,10 @@ static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common
>  				unsigned long tmp_rate, tmp_parent;
>  
>  				tmp_parent = clk_hw_round_rate(parent_hw, rate * _m / (_n * _k));
> +
> +				if (!ccu_nkm_is_valid_rate(common, tmp_parent, _n, _m))
> +					continue;
> +
>  				tmp_rate = tmp_parent * _n * _k / _m;
>  
>  				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate) ||
> @@ -64,6 +82,9 @@ static unsigned long ccu_nkm_find_best(unsigned long parent, unsigned long rate,
>  	for (_k = nkm->min_k; _k <= nkm->max_k; _k++) {
>  		for (_n = nkm->min_n; _n <= nkm->max_n; _n++) {
>  			for (_m = nkm->min_m; _m <= nkm->max_m; _m++) {
> +				if (!ccu_nkm_is_valid_rate(common, parent, _n, _m))
> +					continue;
> +
>  				unsigned long tmp_rate;
>  
>  				tmp_rate = parent * _n * _k / _m;
> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.h b/drivers/clk/sunxi-ng/ccu_nkm.h
> index 6601defb3f38..c409212ee40e 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkm.h
> +++ b/drivers/clk/sunxi-ng/ccu_nkm.h
> @@ -27,6 +27,8 @@ struct ccu_nkm {
>  	struct ccu_mux_internal	mux;
>  
>  	unsigned int		fixed_post_div;
> +	unsigned long		max_m_n_ratio;
> +	unsigned long		min_parent_m_ratio;
>  
>  	struct ccu_common	common;
>  };
> 
> 




