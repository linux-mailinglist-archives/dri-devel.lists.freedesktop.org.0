Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F81463B76E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 02:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64ECA10E235;
	Tue, 29 Nov 2022 01:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9943A10E235
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 01:49:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 296E84E6;
 Tue, 29 Nov 2022 02:49:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669686571;
 bh=/1Nt54ClWgGgBbocpx+cmYXusH4F03XgxbvkOckdG/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wQ+/LvHtf1Kundrkfiw5M7Q5Qmd2b6OuIpE1KzGvO9GzQS1YOykDfN7K9+0bHpMJM
 +Yj/JLu00fKakB518TJrZxQ4f6R1hHI5ea7XYrw7xcUscdblJB1oZn13zaBdwm7R77
 ccN/IAKvzVWieTNOj2J28taX7OyN8LCTGiotvGOM=
Date: Tue, 29 Nov 2022 03:49:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 7/7] drm: rcar-du: dsi: Add r8a779g0 support
Message-ID: <Y4VlHIpS9UnvWwt/@pendragon.ideasonboard.com>
References: <20221123065946.40415-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221123065946.40415-8-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221123065946.40415-8-tomi.valkeinen+renesas@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Wed, Nov 23, 2022 at 08:59:46AM +0200, Tomi Valkeinen wrote:
> Add DSI support for r8a779g0. The main differences to r8a779a0 are in
> the PLL and PHTW setups.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c      | 484 +++++++++++++++----
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h |   6 +-
>  2 files changed, 384 insertions(+), 106 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> index a7f2b7f66a17..723c35726c38 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -9,6 +9,7 @@
>  #include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +#include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> @@ -28,6 +29,20 @@
>  #include "rcar_mipi_dsi.h"
>  #include "rcar_mipi_dsi_regs.h"
>  
> +#define MHZ(v) ((v) * 1000000u)

Isn't the U suffix usually spelled in uppercase ? Same below.

> +
> +enum rcar_mipi_dsi_hw_model {
> +	RCAR_DSI_R8A779A0,
> +	RCAR_DSI_R8A779G0,
> +};
> +
> +struct rcar_mipi_dsi_device_info {
> +	enum rcar_mipi_dsi_hw_model model;
> +	const struct dsi_clk_config *clk_cfg;
> +	u8 clockset2_m_offset;
> +	u8 clockset2_n_offset;
> +};
> +
>  struct rcar_mipi_dsi {
>  	struct device *dev;
>  	const struct rcar_mipi_dsi_device_info *info;
> @@ -50,6 +65,17 @@ struct rcar_mipi_dsi {
>  	unsigned int lanes;
>  };
>  
> +struct dsi_setup_info {
> +	unsigned long hsfreq;
> +	u16 hsfreqrange;
> +
> +	unsigned long fout;
> +	u16 m;
> +	u16 n;
> +	u16 vclk_divider;
> +	const struct dsi_clk_config *clkset;
> +};
> +
>  static inline struct rcar_mipi_dsi *
>  bridge_to_rcar_mipi_dsi(struct drm_bridge *bridge)
>  {
> @@ -62,22 +88,6 @@ host_to_rcar_mipi_dsi(struct mipi_dsi_host *host)
>  	return container_of(host, struct rcar_mipi_dsi, host);
>  }
>  
> -static const u32 phtw[] = {
> -	0x01020114, 0x01600115, /* General testing */
> -	0x01030116, 0x0102011d, /* General testing */
> -	0x011101a4, 0x018601a4, /* 1Gbps testing */
> -	0x014201a0, 0x010001a3, /* 1Gbps testing */
> -	0x0101011f,		/* 1Gbps testing */
> -};
> -
> -static const u32 phtw2[] = {
> -	0x010c0130, 0x010c0140, /* General testing */
> -	0x010c0150, 0x010c0180, /* General testing */
> -	0x010c0190,
> -	0x010a0160, 0x010a0170,
> -	0x01800164, 0x01800174,	/* 1Gbps testing */
> -};
> -
>  static const u32 hsfreqrange_table[][2] = {
>  	{ 80000000U,   0x00 }, { 90000000U,   0x10 }, { 100000000U,  0x20 },
>  	{ 110000000U,  0x30 }, { 120000000U,  0x01 }, { 130000000U,  0x11 },
> @@ -103,24 +113,53 @@ static const u32 hsfreqrange_table[][2] = {
>  	{ /* sentinel */ },
>  };
>  
> -struct vco_cntrl_value {
> +struct dsi_clk_config {
>  	u32 min_freq;
>  	u32 max_freq;
> -	u16 value;
> +	u8 vco_cntrl;
> +	u8 cpbias_cntrl;
> +	u8 gmp_cntrl;
> +	u8 int_cntrl;
> +	u8 prop_cntrl;
>  };
>  
> -static const struct vco_cntrl_value vco_cntrl_table[] = {
> -	{ .min_freq = 40000000U,   .max_freq = 55000000U,   .value = 0x3f },
> -	{ .min_freq = 52500000U,   .max_freq = 80000000U,   .value = 0x39 },
> -	{ .min_freq = 80000000U,   .max_freq = 110000000U,  .value = 0x2f },
> -	{ .min_freq = 105000000U,  .max_freq = 160000000U,  .value = 0x29 },
> -	{ .min_freq = 160000000U,  .max_freq = 220000000U,  .value = 0x1f },
> -	{ .min_freq = 210000000U,  .max_freq = 320000000U,  .value = 0x19 },
> -	{ .min_freq = 320000000U,  .max_freq = 440000000U,  .value = 0x0f },
> -	{ .min_freq = 420000000U,  .max_freq = 660000000U,  .value = 0x09 },
> -	{ .min_freq = 630000000U,  .max_freq = 1149000000U, .value = 0x03 },
> -	{ .min_freq = 1100000000U, .max_freq = 1152000000U, .value = 0x01 },
> -	{ .min_freq = 1150000000U, .max_freq = 1250000000U, .value = 0x01 },
> +static const struct dsi_clk_config dsi_clk_cfg_r8a779a0[] = {
> +	{   40000000u,   55000000u, 0x3f, 0x10, 0x01, 0x00, 0x0b },
> +	{   52500000u,   80000000u, 0x39, 0x10, 0x01, 0x00, 0x0b },

Would MHZ(52.5) do the right thing ? If so, I'd use the macro through
those tables.

> +	{   80000000u,  110000000u, 0x2f, 0x10, 0x01, 0x00, 0x0b },
> +	{  105000000u,  160000000u, 0x29, 0x10, 0x01, 0x00, 0x0b },
> +	{  160000000u,  220000000u, 0x1f, 0x10, 0x01, 0x00, 0x0b },
> +	{  210000000u,  320000000u, 0x19, 0x10, 0x01, 0x00, 0x0b },
> +	{  320000000u,  440000000u, 0x0f, 0x10, 0x01, 0x00, 0x0b },
> +	{  420000000u,  660000000u, 0x09, 0x10, 0x01, 0x00, 0x0b },
> +	{  630000000u, 1149000000u, 0x03, 0x10, 0x01, 0x00, 0x0b },
> +	{ 1100000000u, 1152000000u, 0x01, 0x10, 0x01, 0x00, 0x0b },
> +	{ 1150000000u, 1250000000u, 0x01, 0x10, 0x01, 0x00, 0x0c },
> +	{ /* sentinel */ },
> +};
> +
> +static const struct dsi_clk_config dsi_clk_cfg_r8a779g0[] = {
> +	{   40000000u,   45310000u, 0x2b, 0x00, 0x00, 0x08, 0x0a },
> +	{   45310000u,   54660000u, 0x28, 0x00, 0x00, 0x08, 0x0a },
> +	{   54660000u,   62500000u, 0x28, 0x00, 0x00, 0x08, 0x0a },
> +	{   62500000u,   75000000u, 0x27, 0x00, 0x00, 0x08, 0x0a },
> +	{   75000000u,   90630000u, 0x23, 0x00, 0x00, 0x08, 0x0a },
> +	{   90630000u,  109370000u, 0x20, 0x00, 0x00, 0x08, 0x0a },
> +	{  109370000u,  125000000u, 0x20, 0x00, 0x00, 0x08, 0x0a },
> +	{  125000000u,  150000000u, 0x1f, 0x00, 0x00, 0x08, 0x0a },
> +	{  150000000u,  181250000u, 0x1b, 0x00, 0x00, 0x08, 0x0a },
> +	{  181250000u,  218750000u, 0x18, 0x00, 0x00, 0x08, 0x0a },
> +	{  218750000u,  250000000u, 0x18, 0x00, 0x00, 0x08, 0x0a },
> +	{  250000000u,  300000000u, 0x17, 0x00, 0x00, 0x08, 0x0a },
> +	{  300000000u,  362500000u, 0x13, 0x00, 0x00, 0x08, 0x0a },
> +	{  362500000u,  455480000u, 0x10, 0x00, 0x00, 0x08, 0x0a },
> +	{  455480000u,  500000000u, 0x10, 0x00, 0x00, 0x08, 0x0a },
> +	{  500000000u,  600000000u, 0x0f, 0x00, 0x00, 0x08, 0x0a },
> +	{  600000000u,  725000000u, 0x0b, 0x00, 0x00, 0x08, 0x0a },
> +	{  725000000u,  875000000u, 0x08, 0x00, 0x00, 0x08, 0x0a },
> +	{  875000000u, 1000000000u, 0x08, 0x00, 0x00, 0x08, 0x0a },
> +	{ 1000000000u, 1200000000u, 0x07, 0x00, 0x00, 0x08, 0x0a },
> +	{ 1200000000u, 1250000000u, 0x03, 0x00, 0x00, 0x08, 0x0a },
>  	{ /* sentinel */ },
>  };
>  
> @@ -144,7 +183,7 @@ static void rcar_mipi_dsi_set(struct rcar_mipi_dsi *dsi, u32 reg, u32 set)
>  	rcar_mipi_dsi_write(dsi, reg, rcar_mipi_dsi_read(dsi, reg) | set);
>  }
>  
> -static int rcar_mipi_dsi_phtw_test(struct rcar_mipi_dsi *dsi, u32 phtw)
> +static int rcar_mipi_dsi_write_phtw(struct rcar_mipi_dsi *dsi, u32 phtw)
>  {
>  	u32 status;
>  	int ret;
> @@ -163,32 +202,231 @@ static int rcar_mipi_dsi_phtw_test(struct rcar_mipi_dsi *dsi, u32 phtw)
>  	return ret;
>  }
>  
> +static int rcar_mipi_dsi_write_phtw_arr(struct rcar_mipi_dsi *dsi,
> +					const u32 *phtw, unsigned int size)
> +{
> +	for (unsigned int i = 0; i < size; i++) {
> +		int ret = rcar_mipi_dsi_write_phtw(dsi, phtw[i]);
> +
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +#define WRITE_PHTW(...)                                               \
> +	({                                                            \
> +		static const u32 phtw[] = { __VA_ARGS__ };            \
> +		int ret;                                              \
> +		ret = rcar_mipi_dsi_write_phtw_arr(dsi, phtw,         \
> +						   ARRAY_SIZE(phtw)); \
> +		ret;                                                  \
> +	})
> +
> +static int rcar_mipi_dsi_init_phtw_v3u(struct rcar_mipi_dsi *dsi)

You're mixing the R8A779* names and the short names. I'd use one of the
two and stick to it, probably the short name (up to you).

> +{
> +	return WRITE_PHTW(0x01020114, 0x01600115, 0x01030116, 0x0102011d,
> +			  0x011101a4, 0x018601a4, 0x014201a0, 0x010001a3,
> +			  0x0101011f);
> +}
> +
> +static int rcar_mipi_dsi_post_init_phtw_v3u(struct rcar_mipi_dsi *dsi)
> +{
> +	return WRITE_PHTW(0x010c0130, 0x010c0140, 0x010c0150, 0x010c0180,
> +			  0x010c0190, 0x010a0160, 0x010a0170, 0x01800164,
> +			  0x01800174);
> +}
> +
> +static int rcar_mipi_dsi_init_phtw_v4h(struct rcar_mipi_dsi *dsi,
> +				       const struct dsi_setup_info *setup_info)
> +{
> +	int ret;
> +
> +	if (setup_info->hsfreq < MHZ(450)) {
> +		ret = WRITE_PHTW(0x01010100, 0x011b01ac);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = WRITE_PHTW(0x01010100, 0x01030173, 0x01000174, 0x01500175,
> +			 0x01030176, 0x01040166, 0x010201ad);
> +	if (ret)
> +		return ret;
> +
> +	if (setup_info->hsfreq <= MHZ(1000))
> +		ret = WRITE_PHTW(0x01020100, 0x01910170, 0x01020171,
> +				 0x01110172);
> +	else if (setup_info->hsfreq <= MHZ(1500))
> +		ret = WRITE_PHTW(0x01020100, 0x01980170, 0x01030171,
> +				 0x01100172);
> +	else if (setup_info->hsfreq <= MHZ(2500))
> +		ret = WRITE_PHTW(0x01020100, 0x0144016b, 0x01000172);
> +	else
> +		return -EINVAL;
> +
> +	if (ret)
> +		return ret;
> +
> +	if (dsi->lanes <= 1) {
> +		ret = WRITE_PHTW(0x01070100, 0x010e010b);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (dsi->lanes <= 2) {
> +		ret = WRITE_PHTW(0x01090100, 0x010e010b);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (dsi->lanes <= 3) {
> +		ret = WRITE_PHTW(0x010b0100, 0x010e010b);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (setup_info->hsfreq <= MHZ(1500)) {
> +		ret = WRITE_PHTW(0x01010100, 0x01c0016e);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +rcar_mipi_dsi_post_init_phtw_v4h(struct rcar_mipi_dsi *dsi,
> +				 const struct dsi_setup_info *setup_info)
> +{
> +	u32 status;
> +	int ret;
> +
> +	if (setup_info->hsfreq <= MHZ(1500)) {
> +		WRITE_PHTW(0x01020100, 0x00000180);
> +
> +		ret = read_poll_timeout(rcar_mipi_dsi_read, status,
> +					status & PHTR_TEST, 2000, 10000, false,
> +					dsi, PHTR);
> +		if (ret < 0) {
> +			dev_err(dsi->dev, "failed to test PHTR\n");
> +			return ret;
> +		}
> +
> +		WRITE_PHTW(0x01010100, 0x0100016e);
> +	}
> +
> +	return 0;
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * Hardware Setup
>   */
>  
> -struct dsi_setup_info {
> -	unsigned long fout;
> -	u16 vco_cntrl;
> -	u16 prop_cntrl;
> -	u16 hsfreqrange;
> -	u16 div;
> -	unsigned int m;
> -	unsigned int n;
> -};
> +static void rcar_mipi_dsi_pll_calc_r8a779a0(struct rcar_mipi_dsi *dsi,
> +					    struct clk *clk,
> +					    unsigned long fout_target,
> +					    struct dsi_setup_info *setup_info)
> +{
> +	unsigned int best_err = -1;
> +	unsigned long fin;
> +
> +	fin = clk_get_rate(clk);
> +
> +	for (unsigned int n = 3; n <= 8; n++) {
> +		unsigned long fpfd;
> +
> +		fpfd = fin / n;
> +
> +		if (fpfd < MHZ(2) || fpfd > MHZ(8))
> +			continue;
> +
> +		for (unsigned int m = 64; m <= 625; m++) {
> +			unsigned int err;
> +			u64 fout;
> +
> +			fout = (u64)fpfd * m;
> +
> +			if (fout < MHZ(320) || fout > MHZ(1250))
> +				continue;
> +
> +			fout = div64_u64(fout, setup_info->vclk_divider);
> +
> +			if (fout < setup_info->clkset->min_freq ||
> +			    fout > setup_info->clkset->max_freq)
> +				continue;
> +
> +			err = abs((long)(fout - fout_target) * 10000 /
> +				  (long)fout_target);
> +
> +			if (err < best_err) {
> +				setup_info->m = m;
> +				setup_info->n = n;
> +				setup_info->fout = (unsigned long)fout;
> +				best_err = err;
> +
> +				if (err == 0)
> +					return;
> +			}
> +		}
> +	}
> +}
> +
> +static void rcar_mipi_dsi_pll_calc_r8a779g0(struct rcar_mipi_dsi *dsi,
> +					    struct clk *clk,
> +					    unsigned long fout_target,
> +					    struct dsi_setup_info *setup_info)
> +{
> +	unsigned int best_err = -1;
> +	unsigned long fin;
> +
> +	fin = clk_get_rate(clk);

This could move to the caller.

> +
> +	for (unsigned int n = 1; n <= 8; n++) {
> +		unsigned long fpfd;
> +
> +		fpfd = fin / n;
> +
> +		if (fpfd < MHZ(8) || fpfd > MHZ(24))
> +			continue;
> +
> +		for (unsigned int m = 167; m <= 1000; m++) {
> +			unsigned int err;
> +			u64 fout;
> +
> +			fout = div64_u64((u64)fpfd * m, 2);
> +
> +			if (fout < MHZ(2000) || fout > MHZ(4000))
> +				continue;
> +
> +			fout = div64_u64(fout, setup_info->vclk_divider);
> +
> +			if (fout < setup_info->clkset->min_freq ||
> +			    fout > setup_info->clkset->max_freq)
> +				continue;
> +
> +			err = abs((long)(fout - fout_target) * 10000 /
> +				  (long)fout_target);

Add a blank line here, or remove it from the previous function.

> +			if (err < best_err) {
> +				setup_info->m = m;
> +				setup_info->n = n;
> +				setup_info->fout = (unsigned long)fout;
> +				best_err = err;
> +
> +				if (err == 0)
> +					return;
> +			}
> +		}
> +	}
> +}

This function could be parameterized, up to you.

>  
>  static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>  					  struct clk *clk, unsigned long target,
>  					  struct dsi_setup_info *setup_info)
>  {
>  
> -	const struct vco_cntrl_value *vco_cntrl;
> +	const struct dsi_clk_config *clkset;
>  	unsigned long fout_target;
> -	unsigned long fin, fout;
> -	unsigned long hsfreq;
> -	unsigned int best_err = -1;
> -	unsigned int divider;
> -	unsigned int n;
>  	unsigned int i;
>  	unsigned int err;
>  
> @@ -198,70 +436,53 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>  	 */
>  	fout_target = target * mipi_dsi_pixel_format_to_bpp(dsi->format)
>  		    / (2 * dsi->lanes);
> -	if (fout_target < 40000000 || fout_target > 1250000000)
> +	if (fout_target < MHZ(40) || fout_target > MHZ(1250))
>  		return;
>  
>  	/* Find vco_cntrl */
> -	for (vco_cntrl = vco_cntrl_table; vco_cntrl->min_freq != 0; vco_cntrl++) {
> -		if (fout_target > vco_cntrl->min_freq &&
> -		    fout_target <= vco_cntrl->max_freq) {
> -			setup_info->vco_cntrl = vco_cntrl->value;
> -			if (fout_target >= 1150000000)
> -				setup_info->prop_cntrl = 0x0c;
> -			else
> -				setup_info->prop_cntrl = 0x0b;
> +	for (clkset = dsi->info->clk_cfg; clkset->min_freq != 0; clkset++) {
> +		if (fout_target > clkset->min_freq &&
> +		    fout_target <= clkset->max_freq) {
> +			setup_info->clkset = clkset;
>  			break;
>  		}
>  	}
>  
> -	/* Add divider */
> -	setup_info->div = (setup_info->vco_cntrl & 0x30) >> 4;
> +	switch (dsi->info->model) {
> +	case RCAR_DSI_R8A779A0:
> +		setup_info->vclk_divider = 1 << ((clkset->vco_cntrl >> 4) & 0x3);

If you stored (clkset->vco_cntrl >> 4) & 0x3 in setup_info->vclk_divider
you wouldn't have to use __ffs() in rcar_mipi_dsi_startup(). You could
also drop the - 1 there, which would allow dropping one of the
switch(dsi->info->model). You can store the real divider value in
setup_info separately for rcar_mipi_dsi_pll_calc_r8a779a0(), or pass it
to the function.

> +		rcar_mipi_dsi_pll_calc_r8a779a0(dsi, clk, fout_target, setup_info);
> +		break;
> +
> +	case RCAR_DSI_R8A779G0:
> +		setup_info->vclk_divider = 1 << (((clkset->vco_cntrl >> 3) & 0x7) + 1);
> +		rcar_mipi_dsi_pll_calc_r8a779g0(dsi, clk, fout_target, setup_info);
> +		break;
> +
> +	default:
> +		return;
> +	}
>  
>  	/* Find hsfreqrange */
> -	hsfreq = fout_target * 2;
> +	setup_info->hsfreq = setup_info->fout * 2;
>  	for (i = 0; i < ARRAY_SIZE(hsfreqrange_table); i++) {
> -		if (hsfreqrange_table[i][0] >= hsfreq) {
> +		if (hsfreqrange_table[i][0] >= setup_info->hsfreq) {
>  			setup_info->hsfreqrange = hsfreqrange_table[i][1];
>  			break;
>  		}
>  	}
>  
> -	/*
> -	 * Calculate n and m for PLL clock
> -	 * Following the HW manual the ranges of n and m are
> -	 * n = [3-8] and m = [64-625]
> -	 */

I'd keep the comment in rcar_mipi_dsi_pll_calc_r8a779a0(), and add a
similar comment in rcar_mipi_dsi_pll_calc_r8a779g0().

> -	fin = clk_get_rate(clk);
> -	divider = 1 << setup_info->div;
> -	for (n = 3; n < 9; n++) {
> -		unsigned long fpfd;
> -		unsigned int m;
> -
> -		fpfd = fin / n;
> -
> -		for (m = 64; m < 626; m++) {
> -			fout = fpfd * m / divider;
> -			err = abs((long)(fout - fout_target) * 10000 /
> -				  (long)fout_target);
> -			if (err < best_err) {
> -				setup_info->m = m - 2;
> -				setup_info->n = n - 1;
> -				setup_info->fout = fout;
> -				best_err = err;
> -				if (err == 0)
> -					goto done;
> -			}
> -		}
> -	}
> +	err = abs((long)(setup_info->fout - fout_target) * 10000 / (long)fout_target);
>  
> -done:
>  	dev_dbg(dsi->dev,
> -		"%pC %lu Hz -> Fout %lu Hz (target %lu Hz, error %d.%02u%%), PLL M/N/DIV %u/%u/%u\n",
> -		clk, fin, setup_info->fout, fout_target, best_err / 100,
> -		best_err % 100, setup_info->m, setup_info->n, setup_info->div);
> +		"Fout = %u * %lu / (2 * %u * %u) = %lu (target %lu Hz, error %d.%02u%%)\n",

Is the "2 *" valid on V3U too ?

> +		setup_info->m, clk_get_rate(clk), setup_info->n, setup_info->vclk_divider,

If you keep the clk_get_rate() call in this function you wouldn't have
to call it again here.

> +		setup_info->fout, fout_target,
> +		err / 100, err % 100);
> +
>  	dev_dbg(dsi->dev,
>  		"vco_cntrl = 0x%x\tprop_cntrl = 0x%x\thsfreqrange = 0x%x\n",
> -		setup_info->vco_cntrl, setup_info->prop_cntrl,
> +		clkset->vco_cntrl, clkset->prop_cntrl,
>  		setup_info->hsfreqrange);
>  }
>  
> @@ -324,7 +545,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>  {
>  	struct dsi_setup_info setup_info = {};
>  	unsigned int timeout;
> -	int ret, i;
> +	int ret;
>  	int dsi_format;
>  	u32 phy_setup;
>  	u32 clockset2, clockset3;
> @@ -360,10 +581,21 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>  	phy_setup |= PHYSETUP_HSFREQRANGE(setup_info.hsfreqrange);
>  	rcar_mipi_dsi_write(dsi, PHYSETUP, phy_setup);
>  
> -	for (i = 0; i < ARRAY_SIZE(phtw); i++) {
> -		ret = rcar_mipi_dsi_phtw_test(dsi, phtw[i]);
> +	switch (dsi->info->model) {
> +	case RCAR_DSI_R8A779A0:
> +		ret = rcar_mipi_dsi_init_phtw_v3u(dsi);
> +		if (ret < 0)
> +			return ret;
> +		break;
> +
> +	case RCAR_DSI_R8A779G0:
> +		ret = rcar_mipi_dsi_init_phtw_v4h(dsi, &setup_info);
>  		if (ret < 0)
>  			return ret;
> +		break;
> +
> +	default:
> +		return -ENODEV;

This can't happen. Same below.

>  	}
>  
>  	/* PLL Clock Setting */
> @@ -371,12 +603,13 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>  	rcar_mipi_dsi_set(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
>  	rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
>  
> -	clockset2 = CLOCKSET2_M(setup_info.m) | CLOCKSET2_N(setup_info.n)
> -		  | CLOCKSET2_VCO_CNTRL(setup_info.vco_cntrl);
> -	clockset3 = CLOCKSET3_PROP_CNTRL(setup_info.prop_cntrl)
> -		  | CLOCKSET3_INT_CNTRL(0)
> -		  | CLOCKSET3_CPBIAS_CNTRL(0x10)
> -		  | CLOCKSET3_GMP_CNTRL(1);
> +	clockset2 = CLOCKSET2_M(setup_info.m - dsi->info->clockset2_m_offset)
> +		  | CLOCKSET2_N(setup_info.n - dsi->info->clockset2_n_offset)
> +		  | CLOCKSET2_VCO_CNTRL(setup_info.clkset->vco_cntrl);
> +	clockset3 = CLOCKSET3_PROP_CNTRL(setup_info.clkset->prop_cntrl)
> +		  | CLOCKSET3_INT_CNTRL(setup_info.clkset->int_cntrl)
> +		  | CLOCKSET3_CPBIAS_CNTRL(setup_info.clkset->cpbias_cntrl)
> +		  | CLOCKSET3_GMP_CNTRL(setup_info.clkset->gmp_cntrl);
>  	rcar_mipi_dsi_write(dsi, CLOCKSET2, clockset2);
>  	rcar_mipi_dsi_write(dsi, CLOCKSET3, clockset3);
>  
> @@ -407,10 +640,21 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>  		return -ETIMEDOUT;
>  	}
>  
> -	for (i = 0; i < ARRAY_SIZE(phtw2); i++) {
> -		ret = rcar_mipi_dsi_phtw_test(dsi, phtw2[i]);
> +	switch (dsi->info->model) {
> +	case RCAR_DSI_R8A779A0:
> +		ret = rcar_mipi_dsi_post_init_phtw_v3u(dsi);
>  		if (ret < 0)
>  			return ret;
> +		break;
> +
> +	case RCAR_DSI_R8A779G0:
> +		ret = rcar_mipi_dsi_post_init_phtw_v4h(dsi, &setup_info);
> +		if (ret < 0)
> +			return ret;
> +		break;
> +
> +	default:
> +		return -ENODEV;
>  	}
>  
>  	/* Enable DOT clock */
> @@ -427,8 +671,21 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>  		dev_warn(dsi->dev, "unsupported format");
>  		return -EINVAL;
>  	}
> -	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_DIV(setup_info.div)
> -		|  VCLKSET_LANE(dsi->lanes - 1);
> +
> +	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_LANE(dsi->lanes - 1);
> +
> +	switch (dsi->info->model) {
> +	case RCAR_DSI_R8A779A0:
> +		vclkset |= VCLKSET_DIV_R8A779A0(__ffs(setup_info.vclk_divider));
> +		break;
> +
> +	case RCAR_DSI_R8A779G0:
> +		vclkset |= VCLKSET_DIV_R8A779G0(__ffs(setup_info.vclk_divider) - 1);
> +		break;
> +
> +	default:
> +		return -ENODEV;
> +	}
>  
>  	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
>  
> @@ -841,8 +1098,25 @@ static int rcar_mipi_dsi_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct rcar_mipi_dsi_device_info r8a779a0_data = {
> +	.model = RCAR_DSI_R8A779A0,
> +	.clk_cfg = dsi_clk_cfg_r8a779a0,
> +	.clockset2_m_offset = 2,
> +	.clockset2_n_offset = 1,
> +

Extra blank line.

> +};
> +
> +static const struct rcar_mipi_dsi_device_info r8a779g0_data = {
> +	.model = RCAR_DSI_R8A779G0,
> +	.clk_cfg = dsi_clk_cfg_r8a779g0,
> +	.clockset2_m_offset = 0,
> +	.clockset2_n_offset = 1,

You could possibly drop clockset2_n_offset as it's identical for the two
variants, and there's no indication it would be different in another
version of the IP core.

> +

Here too.

> +};
> +
>  static const struct of_device_id rcar_mipi_dsi_of_table[] = {
> -	{ .compatible = "renesas,r8a779a0-dsi-csi2-tx" },
> +	{ .compatible = "renesas,r8a779a0-dsi-csi2-tx", .data = &r8a779a0_data },
> +	{ .compatible = "renesas,r8a779g0-dsi-csi2-tx", .data = &r8a779g0_data },
>  	{ }
>  };
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
> index 2eaca54636f3..608851340acf 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
> @@ -122,7 +122,8 @@
>  #define VCLKSET_CKEN			(1 << 16)
>  #define VCLKSET_COLOR_RGB		(0 << 8)
>  #define VCLKSET_COLOR_YCC		(1 << 8)
> -#define VCLKSET_DIV(x)			(((x) & 0x3) << 4)
> +#define VCLKSET_DIV_R8A779A0(x)		(((x) & 0x3) << 4)
> +#define VCLKSET_DIV_R8A779G0(x)		(((x) & 0x7) << 4)
>  #define VCLKSET_BPP_16			(0 << 2)
>  #define VCLKSET_BPP_18			(1 << 2)
>  #define VCLKSET_BPP_18L			(2 << 2)
> @@ -166,6 +167,9 @@
>  #define PHTW_CWEN			(1 << 8)
>  #define PHTW_TESTDIN_CODE(x)		(((x) & 0xff) << 0)
>  
> +#define PHTR				0x1038
> +#define PHTR_TEST			(1 << 16)
> +
>  #define PHTC				0x103c
>  #define PHTC_TESTCLR			(1 << 0)
>  

-- 
Regards,

Laurent Pinchart
