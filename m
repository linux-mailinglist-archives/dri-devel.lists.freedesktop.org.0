Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1D2A4C112
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 13:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EED10E1EF;
	Mon,  3 Mar 2025 12:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x4SgLyFf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D2B10E1EF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 12:57:46 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-54965898051so1105736e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 04:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741006665; x=1741611465; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rw6/8c80oXJe6NH1bCDHhdB7//uqsyHdcvO1rFYowNk=;
 b=x4SgLyFf0gB3ht6Ucc3++hik4VOmzPT4LWvd+OJtPtPEErRvs+uCIviK9aQnaLhO2a
 IvaVYQ2IuweO+jvIKNg+D30E64vwj3i+Fs7q0IDbSAxcEBPsTztJTX+MDI8U7X4305cL
 dUCpkQi6RlwDSlpl+puGAprBKymX0IlA4B8QPFf3qQd4K7h1nC75hPVdqPBUwxmB9CKp
 +BHrCMSzSExWEwF6OPDnrzzKKANdXvdylMMpsx1CO1Ud4GkPhw9iMhOxQMUPuqLU+K3f
 qCOyZhYsKTTWUq77rpNML2+CuOHEUNBrhOmE747sxpZsa7XEkDZlH1yxfMgJ76BDQn2u
 VNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741006665; x=1741611465;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rw6/8c80oXJe6NH1bCDHhdB7//uqsyHdcvO1rFYowNk=;
 b=aM7GkSgRscO78smCRodd2/TrIsRP6Zmtxu70+vRaezmSHINkCcJPqlh945pgoWtK68
 TlnHMWOBlvkQW5xn7FKSg0WrMlxAQGzYskGS74ygKFvyJABb/A3OufybYFqfTlbnQIln
 QkYjcY30k54IjBH3g6shgmY81i1oRcH/TUcrmsMyEB//eiU+TmbqPPT0YqBiaRAUb+R3
 Ek8DF24bU+WU9hO5KJqiDBfKVIW3rK/i8z1SxU77/b8Fv3qT8T82b2ZNYK03gzS3XmGv
 B0SsRUzM1WwIBPbX8nu+WQE7QvTC5KLq2fg3jT+fRwCSFuVYrlw3c7GiaqfcxNUkJ5vj
 /Igg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf9sQIG7vmHJ/QGKirS3HeuoJgXoFeYvByaSqaZwlPo0cdHLOfuR0CnfHKa3epyTR/hLOzy1B59Qo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpQ5o2iUvipSNUMZzzTMAumTdTohPNWl/tKqbVhwnzoUoWIhS6
 leS4eLYrlbTd94HPk2+s7ANCK7JbKXgabCY4FFKBofGGS/qUA5yoR6uXlq9PRtI=
X-Gm-Gg: ASbGnctGTvNH50yI2D/AcHAg/1FqC+S90Q1WpMDLH/gmaxkc/zmjjqSyCINAkWVFP19
 F9M82SDIdRSMeVQ9t47L0qmKTATs6x7b2MiPRcaEbHAeYRu/vh8MU7a5MEiLi+MMxAURcyd2cOL
 +p8DEw9GLtVqNfG/BDUd2VL5VZzko1Bzk0UYbEusNIvbH/E+CatgSL1h/jouA8xOwrXiloAqwJG
 IZsDEBZR4TtWo3UTXiBcs7USBUIQ9Oa5dPy9xdGsJP4SY4ACeI2RonS6zGWzmmrkyPeTvvcUngn
 iCaWXcQlcjhxG4nEENaUxUllUBYNYpLIuW0p7c9sRGEvZaZdPJeckWjVvaf7t8Yzbc0vwlOY0zH
 Hr7V4SbtVe3Y6HGxihVP2Kl6A
X-Google-Smtp-Source: AGHT+IEjjiVkoNRYdat4T0qxmeBYEe6kE8gmB95rUVf9r8bSvejeCAHmMqYFebm9jSnJR4afSnK9VA==
X-Received: by 2002:a05:6512:318e:b0:549:38d5:8858 with SMTP id
 2adb3069b0e04-5494c124ab1mr4483210e87.20.1741006664977; 
 Mon, 03 Mar 2025 04:57:44 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494ad419acsm1117002e87.127.2025.03.03.04.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 04:57:44 -0800 (PST)
Date: Mon, 3 Mar 2025 14:57:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yubing Zhang <yubing.zhang@rock-chips.com>
Cc: Andy Yan <andyshrk@163.com>, neil.armstrong@linaro.org, 
 sebastian.reichel@collabora.com, heiko@sntech.de, devicetree@vger.kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/6] drm/bridge: synopsys: Add DW DPTX Controller support
 library
Message-ID: <udunb6r3yvjc5i5cfk5xeaz6ezvyzbnor3gujjhcfoavdwtrsl@26yxnjan6yqb>
References: <20250223113036.74252-1-andyshrk@163.com>
 <20250223113036.74252-3-andyshrk@163.com>
 <563i7xcbbsxfezkgs4txsa6lar5tb5folp7zk7dc7sbvf54n6y@vqbtuwvj3fcw>
 <65706d63-18aa-41e0-81c4-4eab3d186250@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65706d63-18aa-41e0-81c4-4eab3d186250@rock-chips.com>
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

On Mon, Mar 03, 2025 at 04:59:50PM +0800, Yubing Zhang wrote:
> Hi Dmitry,
> 
> On 2025/3/2 2:14, Dmitry Baryshkov wrote:
> > On Sun, Feb 23, 2025 at 07:30:25PM +0800, Andy Yan wrote:
> > > From: Andy Yan <andy.yan@rock-chips.com>
> > > 
> > > The DW DP TX Controller is compliant with the DisplayPort Specification
> > > Version 1.4 with the following features:
> > > 
> > > * DisplayPort 1.4a
> > > * Main Link: 1/2/4 lanes
> > > * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> > > * AUX channel 1Mbps
> > > * Single Stream Transport(SST)
> > > * Multistream Transport (MST)
> > > *Type-C support (alternate mode)
> > > * HDCP 2.2, HDCP 1.3
> > > * Supports up to 8/10 bits per color component
> > > * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> > > * Pixel clock up to 594MHz
> > > * I2S, SPDIF audio interface
> > > 
> > > Add library with common helpers to make it can be shared with
> > > other SoC.
> > > 
> > > Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> > > 
> > > drm/bridge: cleanup
> > 
> > Stray line?
> > 
> > > 
> > > ---
> > > 
> > >   drivers/gpu/drm/bridge/synopsys/Kconfig  |    7 +
> > >   drivers/gpu/drm/bridge/synopsys/Makefile |    1 +
> > >   drivers/gpu/drm/bridge/synopsys/dw-dp.c  | 2155 ++++++++++++++++++++++
> > >   include/drm/bridge/dw_dp.h               |   19 +
> > >   4 files changed, 2182 insertions(+)
> > >   create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-dp.c
> 
> ......
> 
> > > +
> > > +static u8 dw_dp_voltage_max(u8 preemph)
> > > +{
> > > +	switch (preemph & DP_TRAIN_PRE_EMPHASIS_MASK) {
> > > +	case DP_TRAIN_PRE_EMPH_LEVEL_0:
> > > +		return DP_TRAIN_VOLTAGE_SWING_LEVEL_3;
> > > +	case DP_TRAIN_PRE_EMPH_LEVEL_1:
> > > +		return DP_TRAIN_VOLTAGE_SWING_LEVEL_2;
> > > +	case DP_TRAIN_PRE_EMPH_LEVEL_2:
> > > +		return DP_TRAIN_VOLTAGE_SWING_LEVEL_1;
> > > +	case DP_TRAIN_PRE_EMPH_LEVEL_3:
> > > +	default:
> > > +		return DP_TRAIN_VOLTAGE_SWING_LEVEL_0;
> > > +	}
> > > +}
> > > +
> > > +static void dw_dp_link_get_adjustments(struct dw_dp_link *link,
> > > +				       u8 status[DP_LINK_STATUS_SIZE])
> > > +{
> > > +	struct dw_dp_link_train_set *adjust = &link->train.adjust;
> > > +	u8 v = 0;
> > > +	u8 p = 0;
> > > +	unsigned int i;
> > > +
> > > +	for (i = 0; i < link->lanes; i++) {
> > > +		v = drm_dp_get_adjust_request_voltage(status, i);
> > > +		p = drm_dp_get_adjust_request_pre_emphasis(status, i);
> > > +		if (p >=  DP_TRAIN_PRE_EMPH_LEVEL_3) {
> > > +			adjust->pre_emphasis[i] = DP_TRAIN_PRE_EMPH_LEVEL_3 >>
> > > +						  DP_TRAIN_PRE_EMPHASIS_SHIFT;
> > > +			adjust->pre_max_reached[i] = true;
> > > +		} else {
> > > +			adjust->pre_emphasis[i] = p >> DP_TRAIN_PRE_EMPHASIS_SHIFT;
> > > +			adjust->pre_max_reached[i] = false;
> > > +		}
> > > +		v = min(v, dw_dp_voltage_max(p));
> > > +		if (v >= DP_TRAIN_VOLTAGE_SWING_LEVEL_3) {
> > > +			adjust->voltage_swing[i] = DP_TRAIN_VOLTAGE_SWING_LEVEL_3 >>
> > > +						   DP_TRAIN_VOLTAGE_SWING_SHIFT;
> > > +			adjust->voltage_max_reached[i] = true;
> > > +		} else {
> > > +			adjust->voltage_swing[i] = v >> DP_TRAIN_VOLTAGE_SWING_SHIFT;
> > > +			adjust->voltage_max_reached[i] = false;
> > > +		}
> > > +	}
> > > +}
> > > +
> > > +static void dw_dp_link_train_adjust(struct dw_dp_link_train *train)
> > > +{
> > > +	struct dw_dp_link_train_set *request = &train->request;
> > > +	struct dw_dp_link_train_set *adjust = &train->adjust;
> > > +	unsigned int i;
> > > +
> > > +	for (i = 0; i < 4; i++) {
> > 
> > Shouldn't it be a loop up to link->lanes?
> > 
> > > +		if (request->voltage_swing[i] != adjust->voltage_swing[i])
> > > +			request->voltage_swing[i] = adjust->voltage_swing[i];
> > > +		if (request->voltage_max_reached[i] != adjust->voltage_max_reached[i])
> > > +			request->voltage_max_reached[i] = adjust->voltage_max_reached[i];
> > > +	}
> > > +
> > > +	for (i = 0; i < 4; i++) {
> > > +		if (request->pre_emphasis[i] != adjust->pre_emphasis[i])
> > > +			request->pre_emphasis[i] = adjust->pre_emphasis[i];
> > > +		if (request->pre_max_reached[i] != adjust->pre_max_reached[i])
> > > +			request->pre_max_reached[i] = adjust->pre_max_reached[i];
> > 
> > Why do you need separate request and adjustment structs?
> During link training cr sequence, if dprx keep the LANEx_CR_DONE bit(s)
> cleared, the request and adjustment structs are used to check the
> old and new valud of ADJUST_REQUEST_LANEx_y register(s) is changed or not.

This can be compared in dw_dp_link_get_adjustments(), before / while
updating the request data.

> 
> > 
> > > +	}
> > > +}
> > > +
> > > +static int dw_dp_link_clock_recovery(struct dw_dp *dp)
> > > +{
> > > +	struct dw_dp_link *link = &dp->link;
> > > +	u8 status[DP_LINK_STATUS_SIZE];
> > > +	unsigned int tries = 0;
> > > +	int ret;
> > > +
> > > +	ret = dw_dp_link_train_set_pattern(dp, DP_TRAINING_PATTERN_1);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	for (;;) {
> > > +		ret = dw_dp_link_train_update_vs_emph(dp);
> > > +		if (ret)
> > > +			return ret;
> > > +
> > > +		drm_dp_link_train_clock_recovery_delay(&dp->aux, link->dpcd);
> > > +
> > > +		ret = drm_dp_dpcd_read_link_status(&dp->aux, status);
> > > +		if (ret < 0) {
> > > +			dev_err(dp->dev, "failed to read link status: %d\n", ret);
> > > +			return ret;
> > > +		}
> > > +
> > > +		if (drm_dp_clock_recovery_ok(status, link->lanes)) {
> > > +			link->train.clock_recovered = true;
> > > +			break;
> > > +		}
> > > +
> > > +		dw_dp_link_get_adjustments(link, status);
> > > +
> > > +		if (link->train.request.voltage_swing[0] ==
> > > +		    link->train.adjust.voltage_swing[0])
> > 
> > Should this take all lanes to account? I think it might be posssible to
> > drop the adjust / request split and adjust tries in
> > dw_dp_link_get_adjustments() instead.
> Yes, here shall compare both swing and pre-emphasis for all lanes. It's a
> good idea to drop the adjust / request split. The swing and pre-emphasis
> compare just need by cr sequence. But both cr and eq sequences use
> dw_dp_link_get_adjustments(). It will be better to delete
> dw_dp_link_train_adjust() and add a new function to adjust tries for cr
> sequence.

SGTM.

> > 
> > > +			tries++;
> > > +		else
> > > +			tries = 0;
> > > +
> > > +		if (tries == 5)
> > > +			break;
> > > +
> > > +		dw_dp_link_train_adjust(&link->train);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int dw_dp_link_channel_equalization(struct dw_dp *dp)
> > > +{
> > > +	struct dw_dp_link *link = &dp->link;
> > > +	u8 status[DP_LINK_STATUS_SIZE], pattern;
> > > +	unsigned int tries;
> > > +	int ret;
> > > +
> > > +	if (link->caps.tps4_supported)
> > > +		pattern = DP_TRAINING_PATTERN_4;
> > > +	else if (link->caps.tps3_supported)
> > > +		pattern = DP_TRAINING_PATTERN_3;
> > > +	else
> > > +		pattern = DP_TRAINING_PATTERN_2;
> > > +	ret = dw_dp_link_train_set_pattern(dp, pattern);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	for (tries = 1; tries < 5; tries++) {
> > > +		ret = dw_dp_link_train_update_vs_emph(dp);
> > > +		if (ret)
> > > +			return ret;
> > > +
> > > +		drm_dp_link_train_channel_eq_delay(&dp->aux, link->dpcd);
> > > +
> > > +		ret = drm_dp_dpcd_read_link_status(&dp->aux, status);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +
> > > +		if (!drm_dp_clock_recovery_ok(status, link->lanes)) {
> > > +			dev_err(dp->dev, "clock recovery lost while equalizing channel\n");
> > > +			link->train.clock_recovered = false;
> > > +			break;
> > > +		}
> > > +
> > > +		if (drm_dp_channel_eq_ok(status, link->lanes)) {
> > > +			link->train.channel_equalized = true;
> > > +			break;
> > > +		}
> > > +
> > > +		dw_dp_link_get_adjustments(link, status);
> > > +		dw_dp_link_train_adjust(&link->train);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> ......
> > > +
> > > +struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
> > > +			 const struct dw_dp_plat_data *plat_data);
> > > +#endif /* __DW_DP__ */
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
