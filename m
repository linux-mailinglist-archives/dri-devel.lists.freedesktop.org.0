Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 246B95A949A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 12:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA01C10E6B4;
	Thu,  1 Sep 2022 10:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C20A10E6B2
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 10:28:23 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1oThQq-0000YK-87; Thu, 01 Sep 2022 12:28:20 +0200
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1oThQn-0000Tb-NO; Thu, 01 Sep 2022 12:28:17 +0200
Date: Thu, 1 Sep 2022 12:28:17 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: Re: [PATCH v6 3/6] clk: qcom: gdsc: Add a reset op to poll gdsc
 collapse
Message-ID: <20220901102817.GB32271@pengutronix.de>
References: <1661923108-789-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220831104741.v6.3.I162c4be55f230cd439f0643f1624527bdc8a9831@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831104741.v6.3.I162c4be55f230cd439f0643f1624527bdc8a9831@changeid>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, krzysztof.kozlowski@linaro.org,
 Andy Gross <agross@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 31, 2022 at 10:48:24AM +0530, Akhil P Oommen wrote:
> Add a reset op compatible function to poll for gdsc collapse.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - Minor update to function prototype
> 
>  drivers/clk/qcom/gdsc.c | 23 +++++++++++++++++++----
>  drivers/clk/qcom/gdsc.h |  7 +++++++
>  2 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 44520ef..2d0f1d1 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -17,6 +17,7 @@
>  #include <linux/reset-controller.h>
>  #include <linux/slab.h>
>  #include "gdsc.h"
> +#include "reset.h"
>  
>  #define PWR_ON_MASK		BIT(31)
>  #define EN_REST_WAIT_MASK	GENMASK_ULL(23, 20)
> @@ -116,7 +117,8 @@ static int gdsc_hwctrl(struct gdsc *sc, bool en)
>  	return regmap_update_bits(sc->regmap, sc->gdscr, HW_CONTROL_MASK, val);
>  }
>  
> -static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
> +static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status,
> +		s64 timeout_us, unsigned int interval_ms)
>  {
>  	ktime_t start;
>  
> @@ -124,7 +126,9 @@ static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
>  	do {
>  		if (gdsc_check_status(sc, status))
>  			return 0;
> -	} while (ktime_us_delta(ktime_get(), start) < TIMEOUT_US);
> +		if (interval_ms)
> +			msleep(interval_ms);
> +	} while (ktime_us_delta(ktime_get(), start) < timeout_us);

Could this loop be implemented with read_poll_timeout()?

>  	if (gdsc_check_status(sc, status))
>  		return 0;
> @@ -172,7 +176,7 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
>  		udelay(1);
>  	}
>  
> -	ret = gdsc_poll_status(sc, status);
> +	ret = gdsc_poll_status(sc, status, TIMEOUT_US, 0);
>  	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
>  
>  	if (!ret && status == GDSC_OFF && sc->rsupply) {
> @@ -343,7 +347,7 @@ static int _gdsc_disable(struct gdsc *sc)
>  		 */
>  		udelay(1);
>  
> -		ret = gdsc_poll_status(sc, GDSC_ON);
> +		ret = gdsc_poll_status(sc, GDSC_ON, TIMEOUT_US, 0);
>  		if (ret)
>  			return ret;
>  	}
> @@ -565,3 +569,14 @@ int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
> +
> +int gdsc_wait_for_collapse(void *priv)
> +{
> +	struct gdsc *sc = priv;
> +	int ret;
> +
> +	ret = gdsc_poll_status(sc, GDSC_OFF, 500000, 5);
> +	WARN(ret, "%s status stuck at 'on'", sc->pd.name);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(gdsc_wait_for_collapse);

Superficially, using this as a reset op seems like abuse of the reset
controller API. Calling reset_control_reset() on this in the GPU driver
will not trigger a reset signal on the GPU's "cx_collapse" reset input.

So at the very least, this patchset should contain an explanation why
this is a good idea regardless, and how this is almost a reset control.

I have read the linked discussion, and I'm not sure I understand all
of it, so please correct me if I'm wrong: There is some other way to
force the GDSC into a state that will eventually cause a GPU reset, and
this is just the remaining part to make sure that the workaround dance
is finished?

If so, it should be explained that this depends on something else to
actually indirectly trigger the reset, and where this happens.

regards
Philipp
