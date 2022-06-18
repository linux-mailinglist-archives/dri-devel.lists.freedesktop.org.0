Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD4555057D
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 16:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AF810E70B;
	Sat, 18 Jun 2022 14:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6552610E532;
 Sat, 18 Jun 2022 14:24:06 +0000 (UTC)
Received: from g550jk.localnet (31-151-115-246.dynamic.upc.nl [31.151.115.246])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id D24AACD40E;
 Sat, 18 Jun 2022 14:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1655562214; bh=luy5YZGlZEEKjfBIkx9OpJ+p5eKHeGc9LiBC5Wfl1M0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=rSapFq4KF7xWO4KAgFobJPWoUo1kP2Pt/XB7HHfCLCRihd1IQsamIHMWCB7XK3aeZ
 csA1lEgaiJDlVRiqGGubs1uY1+Sf9572TpG5xMHp01pl1Mg1uEIG0yhMAFdSS0z9sC
 F+Q8BnOXnAVuA3j4I7tNbU/ICA9MLMeHKYxs98i8=
From: Luca Weiss <luca@z3ntu.xyz>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/5] drm/msm/mdss: enable optional core clock for MDP5 MDSS
Date: Sat, 18 Jun 2022 16:23:33 +0200
Message-ID: <11998546.O9o76ZdvQC@g550jk>
In-Reply-To: <20220615135935.87381-2-dmitry.baryshkov@linaro.org>
References: <20220615135935.87381-1-dmitry.baryshkov@linaro.org>
 <20220615135935.87381-2-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Mittwoch, 15. Juni 2022 15:59:32 CEST Dmitry Baryshkov wrote:
> Enable (optional) core (MDP_CLK) clock that allows accessing HW_REV
> registers during the platform init.
> 

I believe you also need to update Documentation/devicetree/bindings/display/
msm/mdp5.txt with the new clock.

Regards
Luca

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index b41848bfff91..f7b4628986b8 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -288,7 +288,7 @@ static int msm_mdss_reset(struct device *dev)
>  /*
>   * MDP5 MDSS uses at most three specified clocks.
>   */
> -#define MDP5_MDSS_NUM_CLOCKS 3
> +#define MDP5_MDSS_NUM_CLOCKS 4
>  static int mdp5_mdss_parse_clock(struct platform_device *pdev, struct
> clk_bulk_data **clocks) {
>  	struct clk_bulk_data *bulk;
> @@ -305,6 +305,7 @@ static int mdp5_mdss_parse_clock(struct platform_device
> *pdev, struct clk_bulk_d bulk[num_clocks++].id = "iface";
>  	bulk[num_clocks++].id = "bus";
>  	bulk[num_clocks++].id = "vsync";
> +	bulk[num_clocks++].id = "core"; /* for hw_rev access */
> 
>  	ret = devm_clk_bulk_get_optional(&pdev->dev, num_clocks, bulk);
>  	if (ret)




