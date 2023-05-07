Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AD56F9995
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E035E10E1C3;
	Sun,  7 May 2023 16:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E985310E1C3
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:06:48 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 248A23F1F3;
 Sun,  7 May 2023 18:06:46 +0200 (CEST)
Date: Sun, 7 May 2023 18:06:44 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v2 4/4] drm/msm/dpu: Set DATA_COMPRESS for command mode
Message-ID: <j5wa45g4v6swvsiakl23azu7qgxtdllf2gav5wdc7s7zukxe4c@jkcu2wnyn6rn>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-4-1072c70e9786@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405-add-dsc-support-v2-4-1072c70e9786@quicinc.com>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-05 14:23:51, Jessica Zhang wrote:
> Add a DPU INTF op to set DATA_COMPRESS register for command mode panels if
> the DPU_INTF_DATA_COMPRESS feature flag is set. This flag needs to be
> enabled in order for DSC v1.2 to work.
> 
> Note: These changes are for command mode only. Video mode changes will
> be posted along with the DSC v1.2 support for DP.

Nit: the "command mode" parts of both paragraphs only apply to the call
in dpu_encoder_phys_cmd, right?  If so, and the INTF op remains the same
for video mode (but only the call needs to be added to the
dpu_encoder_phy_vid), make this a bit more clear in your commit message.

> Changes in v2:
> - Fixed whitespace issue in macro definition
> - Read INTF_CONFIG2 before writing to DATA_COMPRESS bit
> - Only set dpu_hw_intf_ops.data_compress if DATA_COMPRESS feature is set
> - Removed `inline` from dpu_hw_intf_enable_compression declaration
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  3 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 11 +++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          |  2 ++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index d8ed85a238af..1a4c20f02312 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -68,6 +68,9 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>  				phys_enc->hw_intf,
>  				true,
>  				phys_enc->hw_pp->idx);
> +
> +	if (phys_enc->hw_intf->ops.enable_compression)
> +		phys_enc->hw_intf->ops.enable_compression(phys_enc->hw_intf);
>  }
>  
>  static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 6485500eedb8..322c55a5042c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -91,6 +91,14 @@
>  
>  #define INTF_CFG2_DATABUS_WIDEN	BIT(0)
>  #define INTF_CFG2_DATA_HCTL_EN	BIT(4)
> +#define INTF_CFG2_DCE_DATA_COMPRESS     BIT(12)
> +
> +static void dpu_hw_intf_enable_compression(struct dpu_hw_intf *ctx)
> +{
> +	u32 intf_cfg2 = DPU_REG_READ(&ctx->hw, INTF_CONFIG2);
> +
> +	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2 | INTF_CFG2_DCE_DATA_COMPRESS);

I'm not sure if it's more idiomatic to write:

    intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;

On a separate line.

> +}

Move the function close to the bottom of this file.  Right now all the
functions are defined approximately in the same order as they're listed
in the header and assigned in _setup_intf_ops().

>  
>  static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>  		const struct intf_timing_params *p,
> @@ -542,6 +550,9 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
>  		ops->vsync_sel = dpu_hw_intf_vsync_sel;
>  		ops->disable_autorefresh = dpu_hw_intf_disable_autorefresh;
>  	}
> +
> +	if (cap & BIT(DPU_INTF_DATA_COMPRESS))
> +		ops->enable_compression = dpu_hw_intf_enable_compression;
>  }
>  
>  struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 73b0885918f8..a8def68a5ec2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -70,6 +70,7 @@ struct intf_status {
>   * @get_autorefresh:            Retrieve autorefresh config from hardware
>   *                              Return: 0 on success, -ETIMEDOUT on timeout
>   * @vsync_sel:                  Select vsync signal for tear-effect configuration
> + * @enable_compression: Enable data compression

Indent to match above.

- Marijn

>   */
>  struct dpu_hw_intf_ops {
>  	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
> @@ -107,6 +108,7 @@ struct dpu_hw_intf_ops {
>  	 * Disable autorefresh if enabled
>  	 */
>  	void (*disable_autorefresh)(struct dpu_hw_intf *intf, uint32_t encoder_id, u16 vdisplay);
> +	void (*enable_compression)(struct dpu_hw_intf *intf);
>  };
>  
>  struct dpu_hw_intf {
> 
> -- 
> 2.40.1
> 
