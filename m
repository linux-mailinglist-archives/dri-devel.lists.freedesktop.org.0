Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4CE70CBA0
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6425310E2AA;
	Mon, 22 May 2023 20:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A67C10E2AA
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 20:54:09 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id CC6773EED9;
 Mon, 22 May 2023 22:54:06 +0200 (CEST)
Date: Mon, 22 May 2023 22:54:04 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v4 4/5] drm/msm/dpu: Set DATA_COMPRESS for command mode
Message-ID: <6rip5brx7pu63f4b56zsa6xmilbhxswybxjuc2wrkukvvhlnjv@dxrhp6iywpoq>
References: <20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com>
 <20230405-add-dsc-support-v4-4-15daf84f8dcb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405-add-dsc-support-v4-4-15daf84f8dcb@quicinc.com>
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

How about: Enable INTF DATA_COMPRESS bit (on cmdmode) for DCE/DSC 1.2?

Drop parenthesis at your convenience.

On 2023-05-22 13:30:23, Jessica Zhang wrote:
> Add a DPU INTF op to set DATA_COMPRESS register if the
> DPU_INTF_DATA_COMPRESS feature is enabled. This bit needs to be set in
> order for DSC v1.2 to work.

"in order for .. to work" sounds like bugfixing... How about just:
"set the DCE_DATA_COMPRESS bit to enable the DCE/DSC 1.2 datapath",
which I think is what it is doing?  Everyone seems to favour the
"datapath" word anyway :)

> Note: For now, this op is called for command mode encoders only. Changes to
> set DATA_COMPRESS for video mode encoders will be posted along with DSC
> v1.2 support for DP.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  3 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 13 +++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          |  2 ++
>  3 files changed, 18 insertions(+)
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
> index 6485500eedb8..a462c6780e6e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -91,6 +91,7 @@
>  
>  #define INTF_CFG2_DATABUS_WIDEN	BIT(0)
>  #define INTF_CFG2_DATA_HCTL_EN	BIT(4)
> +#define INTF_CFG2_DCE_DATA_COMPRESS     BIT(12)
>  
>  static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>  		const struct intf_timing_params *p,
> @@ -522,6 +523,15 @@ static void dpu_hw_intf_disable_autorefresh(struct dpu_hw_intf *intf,
>  
>  }
>  
> +static void dpu_hw_intf_enable_compression(struct dpu_hw_intf *ctx)
> +{
> +	u32 intf_cfg2 = DPU_REG_READ(&ctx->hw, INTF_CONFIG2);
> +
> +	intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
> +
> +	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
> +}
> +
>  static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
>  		unsigned long cap)
>  {
> @@ -542,6 +552,9 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
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
> index 73b0885918f8..72fe907729f1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -70,6 +70,7 @@ struct intf_status {
>   * @get_autorefresh:            Retrieve autorefresh config from hardware
>   *                              Return: 0 on success, -ETIMEDOUT on timeout
>   * @vsync_sel:                  Select vsync signal for tear-effect configuration
> + * @enable_compression:         Enable data compression
>   */
>  struct dpu_hw_intf_ops {
>  	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
> @@ -107,6 +108,7 @@ struct dpu_hw_intf_ops {
>  	 * Disable autorefresh if enabled
>  	 */
>  	void (*disable_autorefresh)(struct dpu_hw_intf *intf, uint32_t encoder_id, u16 vdisplay);

Newline here.


For the contents of the patch though:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> +	void (*enable_compression)(struct dpu_hw_intf *intf);
>  };
>  
>  struct dpu_hw_intf {
> 
> -- 
> 2.40.1
> 
