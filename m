Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3244B87EF15
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 18:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302B810EF63;
	Mon, 18 Mar 2024 17:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KA0YjSiy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8784F10EF63
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 17:41:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 788FC7E9;
 Mon, 18 Mar 2024 18:40:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710783646;
 bh=05oiR2lU2TsDEcoK5/SsgXTOvq07hiupNFthPxkAt/Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KA0YjSiy3NPZm8PF5+ZqDwPxUQoNwb6o57uy+1iXHwqDvaZkCN8B/ws0rHpxjXV45
 3Lg8PBe7MyNVRd1BsDXfwAIVCwgVKZ+jVOrnL2zZwaycmt6lLcHmpW8fU1dBx5P1gQ
 GKZBVIQmf8aFinvN1H4uvUeT+gmcEXKq2ZKHywc8=
Date: Mon, 18 Mar 2024 19:41:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 4/6] drm: zynqmp_dp: Split off several helper functions
Message-ID: <20240318174110.GK13682@pendragon.ideasonboard.com>
References: <20240315230916.1759060-1-sean.anderson@linux.dev>
 <20240315230916.1759060-5-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240315230916.1759060-5-sean.anderson@linux.dev>
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

Hi Sean,

Thank you for the patch.

On Fri, Mar 15, 2024 at 07:09:14PM -0400, Sean Anderson wrote:
> In preparation for supporting compliance testing, split off several
> helper functions. No functional change intended.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 49 +++++++++++++++++++++-----------
>  1 file changed, 33 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index d2dee58e7bf2..24043847dab4 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -627,6 +627,7 @@ static void zynqmp_dp_adjust_train(struct zynqmp_dp *dp,
>  /**
>   * zynqmp_dp_update_vs_emph - Update the training values
>   * @dp: DisplayPort IP core structure
> + * @train_set: A set of training values
>   *
>   * Update the training values based on the request from sink. The mapped values
>   * are predefined, and values(vs, pe, pc) are from the device manual.
> @@ -634,12 +635,12 @@ static void zynqmp_dp_adjust_train(struct zynqmp_dp *dp,
>   * Return: 0 if vs and emph are updated successfully, or the error code returned
>   * by drm_dp_dpcd_write().
>   */
> -static int zynqmp_dp_update_vs_emph(struct zynqmp_dp *dp)
> +static int zynqmp_dp_update_vs_emph(struct zynqmp_dp *dp, u8 *train_set)
>  {
>  	unsigned int i;
>  	int ret;
>  
> -	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, dp->train_set,
> +	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, train_set,
>  				dp->mode.lane_cnt);
>  	if (ret < 0)
>  		return ret;
> @@ -647,7 +648,7 @@ static int zynqmp_dp_update_vs_emph(struct zynqmp_dp *dp)
>  	for (i = 0; i < dp->mode.lane_cnt; i++) {
>  		u32 reg = ZYNQMP_DP_SUB_TX_PHY_PRECURSOR_LANE_0 + i * 4;
>  		union phy_configure_opts opts = { 0 };
> -		u8 train = dp->train_set[i];
> +		u8 train = train_set[i];
>  
>  		opts.dp.voltage[0] = (train & DP_TRAIN_VOLTAGE_SWING_MASK)
>  				   >> DP_TRAIN_VOLTAGE_SWING_SHIFT;
> @@ -691,7 +692,7 @@ static int zynqmp_dp_link_train_cr(struct zynqmp_dp *dp)
>  	 * So, This loop should exit before 512 iterations
>  	 */
>  	for (max_tries = 0; max_tries < 512; max_tries++) {
> -		ret = zynqmp_dp_update_vs_emph(dp);
> +		ret = zynqmp_dp_update_vs_emph(dp, dp->train_set);
>  		if (ret)
>  			return ret;
>  
> @@ -756,7 +757,7 @@ static int zynqmp_dp_link_train_ce(struct zynqmp_dp *dp)
>  		return ret;
>  
>  	for (tries = 0; tries < DP_MAX_TRAINING_TRIES; tries++) {
> -		ret = zynqmp_dp_update_vs_emph(dp);
> +		ret = zynqmp_dp_update_vs_emph(dp, dp->train_set);
>  		if (ret)
>  			return ret;
>  
> @@ -779,28 +780,28 @@ static int zynqmp_dp_link_train_ce(struct zynqmp_dp *dp)
>  }
>  
>  /**
> - * zynqmp_dp_train - Train the link
> - * @dp: DisplayPort IP core structure
> + * zynqmp_dp_setup() - Set up major link parameters
> + * @bw_code: The link bandwidth as a multiple of 270 MHz
> + * @lane_cnt: The number of lanes to use
> + * @enhanced: Use enhanced framing
> + * @downspread: Enable spread-spectrum clocking
>   *
> - * Return: 0 if all trains are done successfully, or corresponding error code.
> + * Return: 0 on success, or -errno on failure
>   */
> -static int zynqmp_dp_train(struct zynqmp_dp *dp)
> +static int zynqmp_dp_setup(struct zynqmp_dp *dp, u8 bw_code, u8 lane_cnt,
> +			   bool enhanced, bool downspread)
>  {
>  	u32 reg;
> -	u8 bw_code = dp->mode.bw_code;
> -	u8 lane_cnt = dp->mode.lane_cnt;
>  	u8 aux_lane_cnt = lane_cnt;
> -	bool enhanced;
>  	int ret;
>  
>  	zynqmp_dp_write(dp, ZYNQMP_DP_LANE_COUNT_SET, lane_cnt);
> -	enhanced = drm_dp_enhanced_frame_cap(dp->dpcd);
>  	if (enhanced) {
>  		zynqmp_dp_write(dp, ZYNQMP_DP_ENHANCED_FRAME_EN, 1);
>  		aux_lane_cnt |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
>  	}
>  
> -	if (dp->dpcd[3] & 0x1) {
> +	if (downspread) {
>  		zynqmp_dp_write(dp, ZYNQMP_DP_DOWNSPREAD_CTL, 1);
>  		drm_dp_dpcd_writeb(&dp->aux, DP_DOWNSPREAD_CTRL,
>  				   DP_SPREAD_AMP_0_5);
> @@ -843,8 +844,24 @@ static int zynqmp_dp_train(struct zynqmp_dp *dp)
>  	}
>  
>  	zynqmp_dp_write(dp, ZYNQMP_DP_PHY_CLOCK_SELECT, reg);
> -	ret = zynqmp_dp_phy_ready(dp);
> -	if (ret < 0)
> +	return zynqmp_dp_phy_ready(dp);
> +}
> +
> +
> +/**
> + * zynqmp_dp_train - Train the link
> + * @dp: DisplayPort IP core structure
> + *
> + * Return: 0 if all trains are done successfully, or corresponding error code.
> + */
> +static int zynqmp_dp_train(struct zynqmp_dp *dp)
> +{
> +	int ret;
> +
> +	ret = zynqmp_dp_setup(dp, dp->mode.bw_code, dp->mode.lane_cnt,
> +			      drm_dp_enhanced_frame_cap(dp->dpcd),
> +			      dp->dpcd[3] & 0x1);

This patch looks OK. Assuming you make correct use of the new functions
in the next patches,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On a side note, I think the above could be written

	ret = zynqmp_dp_setup(dp, dp->mode.bw_code, dp->mode.lane_cnt,
			      drm_dp_enhanced_frame_cap(dp->dpcd),
			      dp->dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5);

> +	if (ret)
>  		return ret;
>  
>  	zynqmp_dp_write(dp, ZYNQMP_DP_SCRAMBLING_DISABLE, 1);

-- 
Regards,

Laurent Pinchart
