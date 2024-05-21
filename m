Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C463E8CAFCA
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 15:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB3E10EC35;
	Tue, 21 May 2024 13:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 435 seconds by postgrey-1.36 at gabe;
 Tue, 21 May 2024 13:43:05 UTC
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B817B10E42F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 13:43:05 +0000 (UTC)
Received: from raven.mansr.com (raven.mansr.com [IPv6:2001:8b0:ca0d:1::3])
 by unicorn.mansr.com (Postfix) with ESMTPS id 5E1C915362;
 Tue, 21 May 2024 14:35:47 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
 id 4E7CB219E4D; Tue, 21 May 2024 14:35:47 +0100 (BST)
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Guido
 =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Purism Kernel Team
 <kernel@puri.sm>, Ondrej
 Jirman <megi@xff.cz>, Neil Armstrong <neil.armstrong@linaro.org>, Jessica
 Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v4 1/5] clk: sunxi-ng: common: Support minimum and
 maximum rate
In-Reply-To: <20240310-pinephone-pll-fixes-v4-1-46fc80c83637@oltmanns.dev>
 (Frank Oltmanns's message of "Sun, 10 Mar 2024 14:21:11 +0100")
References: <20240310-pinephone-pll-fixes-v4-0-46fc80c83637@oltmanns.dev>
 <20240310-pinephone-pll-fixes-v4-1-46fc80c83637@oltmanns.dev>
Date: Tue, 21 May 2024 14:35:47 +0100
Message-ID: <yw1xo78z8ez0.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 21 May 2024 13:58:23 +0000
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

Frank Oltmanns <frank@oltmanns.dev> writes:

> The Allwinner SoC's typically have an upper and lower limit for their
> clocks' rates. Up until now, support for that has been implemented
> separately for each clock type.
>
> Implement that functionality in the sunxi-ng's common part making use of
> the CCF rate liming capabilities, so that it is available for all clock
> types.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> Cc: stable@vger.kernel.org
> ---
>  drivers/clk/sunxi-ng/ccu_common.c | 19 +++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu_common.h |  3 +++
>  2 files changed, 22 insertions(+)

This just landed in 6.6 stable, and it broke HDMI output on an A20 based
device, the clocks ending up all wrong as seen in this diff of
/sys/kernel/debug/clk/clk_summary:

@@ -70,16 +71,14 @@
           apb1-i2c0                  0       0        0        24000000   =
 0=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
        pll-gpu                       0       0        0        1200000000 =
 0=20=20=20
-       pll-video1                    3       3        1        159000000  =
 0=20=20=20
+       pll-video1                    2       2        1        159000000  =
 0=20=20=20
           hdmi                       1       1        0        39750000   =
 0=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
           tcon0-ch1-sclk2            1       1        1        39750000   =
 0=20=20=20
              tcon0-ch1-sclk1         1       1        1        39750000   =
 0=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
-          pll-video1-2x              1       1        0        318000000  =
 0=20=20=20
+          pll-video1-2x              0       0        0        318000000  =
 0=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
-             hdmi-tmds               2       2        0        39750000   =
 0=20=20=20
-                hdmi-ddc             1       1        0        1987500    =
 0=20=20=20
        pll-periph-base               2       2        0        1200000000 =
 0=20=20=20
           mbus                       1       1        0        300000000  =
 0=20=20=20
           pll-periph-sata            0       0        0        100000000  =
 0=20=20=20
@@ -199,7 +198,7 @@
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
           ace                        0       0        0        384000000  =
 0=20=20=20
           ve                         0       0        0        384000000  =
 0=20=20=20
-       pll-video0                    4       4        2        297000000  =
 0=20=20=20
+       pll-video0                    5       5        2        297000000  =
 0=20=20=20
           hdmi1                      0       0        0        297000000  =
 0=20=20=20
           tcon1-ch1-sclk2            0       0        0        297000000  =
 0=20=20=20
              tcon1-ch1-sclk1         0       0        0        297000000  =
 0=20=20=20
@@ -222,8 +221,10 @@
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
           de-be0                     1       1        1        297000000  =
 0=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
-          pll-video0-2x              0       0        0        594000000  =
 0=20=20=20
+          pll-video0-2x              1       1        0        594000000  =
 0=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
+             hdmi-tmds               2       2        0        594000000  =
 0=20=20=20
+                hdmi-ddc             1       1        0        29700000   =
 0=20=20=20
        pll-audio-base                0       0        0        1500000    =
 0=20=20=20
           pll-audio-8x               0       0        0        3000000    =
 0=20=20=20
              i2s2                    0       0        0        3000000    =
 0=20=20=20

Reverting this commit makes it work again.

> diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu=
_common.c
> index 8babce55302f..ac0091b4ce24 100644
> --- a/drivers/clk/sunxi-ng/ccu_common.c
> +++ b/drivers/clk/sunxi-ng/ccu_common.c
> @@ -44,6 +44,16 @@ bool ccu_is_better_rate(struct ccu_common *common,
>  			unsigned long current_rate,
>  			unsigned long best_rate)
>  {
> +	unsigned long min_rate, max_rate;
> +
> +	clk_hw_get_rate_range(&common->hw, &min_rate, &max_rate);
> +
> +	if (current_rate > max_rate)
> +		return false;
> +
> +	if (current_rate < min_rate)
> +		return false;
> +
>  	if (common->features & CCU_FEATURE_CLOSEST_RATE)
>  		return abs(current_rate - target_rate) < abs(best_rate - target_rate);
>
> @@ -122,6 +132,7 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, str=
uct device *dev,
>
>  	for (i =3D 0; i < desc->hw_clks->num ; i++) {
>  		struct clk_hw *hw =3D desc->hw_clks->hws[i];
> +		struct ccu_common *common =3D hw_to_ccu_common(hw);
>  		const char *name;
>
>  		if (!hw)
> @@ -136,6 +147,14 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, st=
ruct device *dev,
>  			pr_err("Couldn't register clock %d - %s\n", i, name);
>  			goto err_clk_unreg;
>  		}
> +
> +		if (common->max_rate)
> +			clk_hw_set_rate_range(hw, common->min_rate,
> +					      common->max_rate);
> +		else
> +			WARN(common->min_rate,
> +			     "No max_rate, ignoring min_rate of clock %d - %s\n",
> +			     i, name);
>  	}
>
>  	ret =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
> diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu=
_common.h
> index 942a72c09437..329734f8cf42 100644
> --- a/drivers/clk/sunxi-ng/ccu_common.h
> +++ b/drivers/clk/sunxi-ng/ccu_common.h
> @@ -31,6 +31,9 @@ struct ccu_common {
>  	u16		lock_reg;
>  	u32		prediv;
>
> +	unsigned long	min_rate;
> +	unsigned long	max_rate;
> +
>  	unsigned long	features;
>  	spinlock_t	*lock;
>  	struct clk_hw	hw;
>
> --=20
>
> 2.44.0
>

--=20
M=E5ns Rullg=E5rd
