Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5FD724DF0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0AB910E3AA;
	Tue,  6 Jun 2023 20:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B0D10E3AA
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 20:23:50 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 492243F7E2;
 Tue,  6 Jun 2023 22:23:47 +0200 (CEST)
Date: Tue, 6 Jun 2023 22:23:46 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: tidy up some error checking
Message-ID: <gkeclhi5ouudxiwbd6wds7y2svtdcamyuqcnk42z7hr2js52qh@25ox3nxgeuzp>
References: <ZH7vP2Swu8CYpgUL@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH7vP2Swu8CYpgUL@moroto>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-06 11:33:03, Dan Carpenter wrote:
> The "vsync_hz" variable is unsigned int so it can't be less
> than zero.  The dpu_kms_get_clk_rate() function used to return a u64
> but I previously changed it to return an unsigned long and zero on
> error so it matches clk_get_rate().
> 
> Change the "vsync_hz" type to unsigned long as well and change the
> error checking to check for zero instead of negatives.  This change
> does not affect runtime at all.  It's just a clean up.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index d8ed85a238af..6aecaba14e7e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -324,7 +324,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
>  	struct dpu_hw_tear_check tc_cfg = { 0 };
>  	struct drm_display_mode *mode;
>  	bool tc_enable = true;
> -	u32 vsync_hz;
> +	unsigned long vsync_hz;
>  	struct dpu_kms *dpu_kms;
>  
>  	if (phys_enc->has_intf_te) {
> @@ -359,8 +359,8 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
>  	 * frequency divided by the no. of rows (lines) in the LCDpanel.
>  	 */
>  	vsync_hz = dpu_kms_get_clk_rate(dpu_kms, "vsync");
> -	if (vsync_hz <= 0) {
> -		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %u\n",
> +	if (!vsync_hz) {
> +		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %lu\n",
>  				 vsync_hz);

Nit: no need to print the value here, you know it's zero.  Could be
clarified to just "no vsync clock".

- Marijn

>  		return;
>  	}
> @@ -381,7 +381,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
>  	tc_cfg.rd_ptr_irq = mode->vdisplay + 1;
>  
>  	DPU_DEBUG_CMDENC(cmd_enc,
> -		"tc vsync_clk_speed_hz %u vtotal %u vrefresh %u\n",
> +		"tc vsync_clk_speed_hz %lu vtotal %u vrefresh %u\n",
>  		vsync_hz, mode->vtotal, drm_mode_vrefresh(mode));
>  	DPU_DEBUG_CMDENC(cmd_enc,
>  		"tc enable %u start_pos %u rd_ptr_irq %u\n",
> -- 
> 2.39.2
> 
