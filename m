Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1B9818CF8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 17:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6726F10E2BC;
	Tue, 19 Dec 2023 16:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B5310E2BC
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 16:52:44 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a235eb41251so310634166b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 08:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703004763; x=1703609563; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uxC6S8Df4SvnkAXMbWUKpOTSQ1v3y3ScMeHuaO257hA=;
 b=nDmovUAIny0VkH+l46q/3w6KibpbPOjf+5fOL3q6eaiKtfUcCeEwKO+spC5+X513qg
 J3PI5Qm73cKSTjwLzJuB4gLfCUJVe7YeRID+36TeHiJMz6Y4MKfLXUodi9bH1iv/5IGh
 v2Axn2x45CqBsdXP784/3eYDeWfVck4+u9kZZvMZAVgIQVuh9D7USb7HJGpOmzoije3L
 Aklqv1SPFcmp4wMfAOr4S+w1YM6lk20rsTmXqNIcS9soV9eyvwatcjeCNl+3gKNcZU21
 IYVc1PxahWTHT/LKc3hK6a4nDaRhdnkaW9lsqrEXik0YtWWAkARF3RnnitsV0rvbTxHF
 wpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703004763; x=1703609563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uxC6S8Df4SvnkAXMbWUKpOTSQ1v3y3ScMeHuaO257hA=;
 b=MDGoNQGIpIvuQTJS7fx+NG9qiQEX1b6rGzC0CYxqEvGiU67pPwEeikQpKusmO4u4p0
 Rq4AkkiyXL/J4H7Xt0mdPob+xtgqKqzMAQVhkKoqax3SVK5O7BKIRI9aWBRZSxTeC30M
 a0CVP8XHT/RUrVjMD3JCaoSkcJql0jK9fhIyR0fDGzCu4FTG2PiF+BkIOsAAao+uD3D1
 k2NH7aQHhiQ7toNrFEdSmLGSjHYg8ZRiC8oucMeC5dIY7SF5MTDOoindYJ8iYFamdd4M
 3Mk72a+OT4ulndZd3Byl8l/Tu2A2weiwLou7nXGTtaQQNGsn7oNmneZLh3gelw1dtsrV
 iu5A==
X-Gm-Message-State: AOJu0YwwkXX1tJa+YlfELgod3gy0LUq9JsIf7QWmfJqOYLuqpo8Hvjkq
 klQMnRnCGG1XTEstDz+KgR0=
X-Google-Smtp-Source: AGHT+IGAGwRqdPR1+1UIH4G19Rxphe2JUwS3RizzhgFClQPqT3fjslJQZ2yevwgtTAN2fDlpbvd1Wg==
X-Received: by 2002:a17:906:e011:b0:a23:350a:2d02 with SMTP id
 cu17-20020a170906e01100b00a23350a2d02mr1742458ejb.104.1703004762981; 
 Tue, 19 Dec 2023 08:52:42 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 lm11-20020a17090718cb00b00a1db76f99c8sm15833180ejc.93.2023.12.19.08.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 08:52:41 -0800 (PST)
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
Subject: Re: [PATCH 3/5] clk: sunxi-ng: nm: Support constraints on n/m ratio
 and parent rate
Date: Tue, 19 Dec 2023 17:52:40 +0100
Message-ID: <1871631.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20231218-pinephone-pll-fixes-v1-3-e238b6ed6dc1@oltmanns.dev>
References: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
 <20231218-pinephone-pll-fixes-v1-3-e238b6ed6dc1@oltmanns.dev>
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

Dne ponedeljek, 18. december 2023 ob 14:35:21 CET je Frank Oltmanns napisal(a):
> The Allwinner A64 manual lists the following constraint for the
> PLL-VIDEO0 clock: 8 <= N/M <= 25
> 
> The PLL-MIPI clock is implemented as ccu_nm. Therefore, add support for
> this constraint.
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> ---
>  drivers/clk/sunxi-ng/ccu_nm.c | 21 +++++++++++++++++++--
>  drivers/clk/sunxi-ng/ccu_nm.h | 34 ++++++++++++++++++++++++++++++++--
>  2 files changed, 51 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_nm.c b/drivers/clk/sunxi-ng/ccu_nm.c
> index ffac3deb89d6..cfc6981e398b 100644
> --- a/drivers/clk/sunxi-ng/ccu_nm.c
> +++ b/drivers/clk/sunxi-ng/ccu_nm.c
> @@ -27,6 +27,19 @@ static unsigned long ccu_nm_calc_rate(unsigned long parent,
>  	return rate;
>  }
>  
> +static bool ccu_nm_is_valid_rate(struct ccu_common *common, unsigned long n, unsigned long m)
> +{
> +	struct ccu_nm *nm = container_of(common, struct ccu_nm, common);
> +
> +	if (nm->max_nm_ratio && (n > nm->max_nm_ratio * m))
> +		return false;
> +
> +	if (nm->min_nm_ratio && (n < nm->min_nm_ratio * m))
> +		return false;
> +
> +	return true;
> +}
> +
>  static unsigned long ccu_nm_find_best(struct ccu_common *common, unsigned long parent,
>  				      unsigned long rate, struct _ccu_nm *nm)
>  {
> @@ -36,8 +49,12 @@ static unsigned long ccu_nm_find_best(struct ccu_common *common, unsigned long p
>  
>  	for (_n = nm->min_n; _n <= nm->max_n; _n++) {
>  		for (_m = nm->min_m; _m <= nm->max_m; _m++) {
> -			unsigned long tmp_rate = ccu_nm_calc_rate(parent,
> -								  _n, _m);
> +			unsigned long tmp_rate;
> +
> +			if (!ccu_nm_is_valid_rate(common, _n, _m))
> +				continue;
> +
> +			tmp_rate = ccu_nm_calc_rate(parent, _n, _m);
>  
>  			if (ccu_is_better_rate(common, rate, tmp_rate, best_rate)) {
>  				best_rate = tmp_rate;
> diff --git a/drivers/clk/sunxi-ng/ccu_nm.h b/drivers/clk/sunxi-ng/ccu_nm.h
> index 93c11693574f..0075df6d9697 100644
> --- a/drivers/clk/sunxi-ng/ccu_nm.h
> +++ b/drivers/clk/sunxi-ng/ccu_nm.h
> @@ -31,6 +31,8 @@ struct ccu_nm {
>  	unsigned int		fixed_post_div;
>  	unsigned int		min_rate;
>  	unsigned int		max_rate;
> +	unsigned long		min_nm_ratio; /* minimum value for m/n */
> +	unsigned long		max_nm_ratio; /* maximum value for m/n */

Comment is wrong, it should be "n/m". For consistency with nkm patch,
min_n_m_ratio and max_n_m_ratio.

Best regards,
Jernej

>  
>  	struct ccu_common	common;
>  };
> @@ -108,7 +110,8 @@ struct ccu_nm {
>  		},							\
>  	}
>  
> -#define SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT(_struct, _name,	\
> +#define SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT_NM_RATIO(		\
> +						 _struct, _name,	\
>  						 _parent, _reg,		\
>  						 _min_rate, _max_rate,	\
>  						 _nshift, _nwidth,	\
> @@ -117,7 +120,9 @@ struct ccu_nm {
>  						 _frac_rate_0,		\
>  						 _frac_rate_1,		\
>  						 _gate, _lock, _flags,	\
> -						 _features)		\
> +						 _features,		\
> +						 _min_nm_ratio,		\
> +						 _max_nm_ratio)		\
>  	struct ccu_nm _struct = {					\
>  		.enable		= _gate,				\
>  		.lock		= _lock,				\
> @@ -128,6 +133,8 @@ struct ccu_nm {
>  						  _frac_rate_1),	\
>  		.min_rate	= _min_rate,				\
>  		.max_rate	= _max_rate,				\
> +		.min_nm_ratio	= _min_nm_ratio,			\
> +		.max_nm_ratio	= _max_nm_ratio,			\
>  		.common		= {					\
>  			.reg		= _reg,				\
>  			.features	= _features,			\
> @@ -138,6 +145,29 @@ struct ccu_nm {
>  		},							\
>  	}
>  
> +#define SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT(_struct, _name,	\
> +						 _parent, _reg,		\
> +						 _min_rate, _max_rate,	\
> +						 _nshift, _nwidth,	\
> +						 _mshift, _mwidth,	\
> +						 _frac_en, _frac_sel,	\
> +						 _frac_rate_0,		\
> +						 _frac_rate_1,		\
> +						 _gate, _lock, _flags,	\
> +						 _features)		\
> +	SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT_NM_RATIO(		\
> +						_struct, _name,		\
> +						_parent, _reg,		\
> +						_min_rate, _max_rate,	\
> +						_nshift, _nwidth,	\
> +						_mshift, _mwidth,	\
> +						_frac_en, _frac_sel,	\
> +						_frac_rate_0,		\
> +						_frac_rate_1,		\
> +						_gate, _lock, _flags,	\
> +						_features,		\
> +						0, 0)
> +
>  #define SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX(_struct, _name,	\
>  						 _parent, _reg,		\
>  						 _min_rate, _max_rate,	\
> 
> 




