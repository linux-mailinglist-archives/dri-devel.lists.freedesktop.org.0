Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12709233BF3
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 01:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52B96E973;
	Thu, 30 Jul 2020 23:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F2C6E973
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 23:13:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D285E9B1;
 Fri, 31 Jul 2020 01:12:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1596150777;
 bh=U2AhUcM9xOgRljTgW3Ir7sj8Vyh/2BUPnmUtHh6/7hY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nVehFujmy2MNmF9aWy/qBjKtueH9/PbcqtF55T236zWL9omjo7J52V4vi+PCYFkzT
 IfYTb3/UQ3J9/4w578NQslOxOLZyxSPBLArLgesUHpr8PE8gIjUks02iG/CRTy8fA5
 3TLTfsbHI4QtrL1wdMfGEEhXCZWvVEVDJY+5mDCI=
Date: Fri, 31 Jul 2020 02:12:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH v2 1/1] drm: xlnx: zynqmp: Use switch - case for link
 rate downshift
Message-ID: <20200730231246.GJ6107@pendragon.ideasonboard.com>
References: <1596065445-4630-1-git-send-email-hyun.kwon@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596065445-4630-1-git-send-email-hyun.kwon@xilinx.com>
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hyun,

Thank you for the patch.

On Wed, Jul 29, 2020 at 04:30:45PM -0700, Hyun Kwon wrote:
> Use switch - case to downshift from the current link rate. It's a small
> loop now, so fine to be replaced with switch - case. With a loop, it is
> confusing and hard to follow as reported below.
> 
> The patch d76271d22694: "drm: xlnx: DRM/KMS driver for Xilinx ZynqMP
> DisplayPort Subsystem" from Jul 7, 2018, leads to the following
> static checker warning:
> 
> 	drivers/gpu/drm/xlnx/zynqmp_dp.c:594 zynqmp_dp_mode_configure()
> 	error: iterator underflow 'bws' (-1)-2
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
> ---
> v2
> - Convert the for loop into switch - case
> ---
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 29 ++++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index b735072..5d6adeaa 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -567,34 +567,37 @@ static int zynqmp_dp_mode_configure(struct zynqmp_dp *dp, int pclock,
>  				    u8 current_bw)
>  {
>  	int max_rate = dp->link_config.max_rate;
> -	u8 bws[3] = { DP_LINK_BW_1_62, DP_LINK_BW_2_7, DP_LINK_BW_5_4 };
> +	u8 bw_code;
>  	u8 max_lanes = dp->link_config.max_lanes;
>  	u8 max_link_rate_code = drm_dp_link_rate_to_bw_code(max_rate);
>  	u8 bpp = dp->config.bpp;
>  	u8 lane_cnt;
> -	s8 i;
>  
> -	if (current_bw == DP_LINK_BW_1_62) {
> +	/* Downshift from current one */

Maybe "Downshift from the current bandwidth" ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	switch (current_bw) {
> +	case DP_LINK_BW_5_4:
> +		bw_code = DP_LINK_BW_2_7;
> +		break;
> +	case DP_LINK_BW_2_7:
> +		bw_code = DP_LINK_BW_1_62;
> +		break;
> +	case DP_LINK_BW_1_62:
>  		dev_err(dp->dev, "can't downshift. already lowest link rate\n");
>  		return -EINVAL;
> -	}
> -
> -	for (i = ARRAY_SIZE(bws) - 1; i >= 0; i--) {
> -		if (current_bw && bws[i] >= current_bw)
> -			continue;
> -
> -		if (bws[i] <= max_link_rate_code)
> -			break;
> +	default:
> +		/* If not given, start with max supported */
> +		bw_code = max_link_rate_code;
> +		break;
>  	}
>  
>  	for (lane_cnt = 1; lane_cnt <= max_lanes; lane_cnt <<= 1) {
>  		int bw;
>  		u32 rate;
>  
> -		bw = drm_dp_bw_code_to_link_rate(bws[i]);
> +		bw = drm_dp_bw_code_to_link_rate(bw_code);
>  		rate = zynqmp_dp_max_rate(bw, lane_cnt, bpp);
>  		if (pclock <= rate) {
> -			dp->mode.bw_code = bws[i];
> +			dp->mode.bw_code = bw_code;
>  			dp->mode.lane_cnt = lane_cnt;
>  			dp->mode.pclock = pclock;
>  			return dp->mode.bw_code;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
