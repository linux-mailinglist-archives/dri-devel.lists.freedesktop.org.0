Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C7A5A941A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 12:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DBE10E695;
	Thu,  1 Sep 2022 10:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA04710E694
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 10:17:41 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1oThGU-0007Ov-7H; Thu, 01 Sep 2022 12:17:38 +0200
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1oThGQ-000073-U2; Thu, 01 Sep 2022 12:17:34 +0200
Date: Thu, 1 Sep 2022 12:17:34 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: Re: [PATCH v6 2/6] clk: qcom: Allow custom reset ops
Message-ID: <20220901101734.GA32271@pengutronix.de>
References: <1661923108-789-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220831104741.v6.2.I75baff799a363bbb960376539e3a0f737377c3f1@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831104741.v6.2.I75baff799a363bbb960376539e3a0f737377c3f1@changeid>
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

Hi Akhil,

On Wed, Aug 31, 2022 at 10:48:23AM +0530, Akhil P Oommen wrote:
> Allow soc specific clk drivers to specify a custom reset operation. We
> will use this in an upcoming patch to allow gpucc driver to specify a
> differet reset operation for cx_gdsc.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - Use pointer to const for "struct qcom_reset_ops" in qcom_reset_map (Krzysztof)
> 
> Changes in v2:
> - Return error when a particular custom reset op is not implemented. (Dmitry)
> 
>  drivers/clk/qcom/reset.c | 27 +++++++++++++++++++++++++++
>  drivers/clk/qcom/reset.h |  8 ++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/clk/qcom/reset.c b/drivers/clk/qcom/reset.c
> index 819d194..b7ae4a3 100644
> --- a/drivers/clk/qcom/reset.c
> +++ b/drivers/clk/qcom/reset.c
> @@ -13,6 +13,21 @@
>  
>  static int qcom_reset(struct reset_controller_dev *rcdev, unsigned long id)
>  {
> +	struct qcom_reset_controller *rst;
> +	const struct qcom_reset_map *map;
> +
> +	rst = to_qcom_reset_controller(rcdev);
> +	map = &rst->reset_map[id];
> +
> +	if (map->ops && map->ops->reset)
> +		return map->ops->reset(map->priv);
> +	/*
> +	 * If custom ops is implemented but just not this callback, return
> +	 * error
> +	 */
> +	else if (map->ops)
> +		return -EOPNOTSUPP;
> +

It doesn't seem necessary to stack reset_ops -> qcom_reset_ops for what
you need here.
Just add an optional const struct reset_ops * to qcom_cc_desc and feed
that into qcom_cc_really_probe to replace &qcom_reset_ops.

[...]
> +struct qcom_reset_ops {
> +	int (*reset)(void *priv);
> +	int (*assert)(void *priv);
> +	int (*deassert)(void *priv);

Why add assert and deassert ops? There doesn't seem to be any user.

> +};
> +
>  struct qcom_reset_map {
>  	unsigned int reg;
>  	u8 bit;
> +	const struct qcom_reset_ops *ops;
> +	void *priv;

Adding per-reset ops + priv counters seems excessive to me.

Are you expecting different reset controls in the same reset controller
to have completely different ops at some point? If so, I would wonder
whether it wouldn't be better to split the reset controller in that
case. Either way, for the GDSC collapse workaround this does not seem
to be required at all.

regards
Philipp
