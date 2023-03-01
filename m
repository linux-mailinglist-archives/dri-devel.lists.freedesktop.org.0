Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8CC6A6A5F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 11:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DDD10E220;
	Wed,  1 Mar 2023 10:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4234510E220
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 10:03:35 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 18DB43F8BE;
 Wed,  1 Mar 2023 11:03:33 +0100 (CET)
Date: Wed, 1 Mar 2023 11:03:31 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v4 1/4] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
Message-ID: <20230301100331.3altimojtca4zx6m@SoMainline.org>
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
 <20230221184256.1436-2-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221184256.1436-2-quic_jesszhan@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-21 10:42:53, Jessica Zhang wrote:
> Currently, DPU will enable TE during prepare_commit(). However, this
> will cause a crash and reboot to sahara when trying to read/write to
> register in get_autorefresh_config(), because the core clock rates
> aren't set at that time.

Haven't seeen a crash like this on any of my devices (after implementing
INTF TE).  get_autorefresh_config() always reads zero (or 1 for
frame_count) except the first time it is called (autorefresh is left
enabled by our bootloader on SM6125) and triggers the disable codepath.

It does look like prepare_for_kickoff() is much more susceptible to
delays in code than prepare_commit().  The debug logs used to figure
this out together with this series result in FPS drops on SM6125 and
SM8150.  Not an issue with this series, just something to keep in mind.

> This used to work because phys_enc->hw_pp is only initialized in mode
> set [1], so the first prepare_commit() will return before any register
> read/write as hw_pp would be NULL.
> 
> However, when we try to implement support for INTF TE, we will run into
> the clock issue described above as hw_intf will *not* be NULL on the
> first prepare_commit(). This is because the initialization of
> dpu_enc->hw_intf has been moved to dpu_encoder_setup() [2].
> 
> To avoid this issue, let's enable TE during prepare_for_kickoff()
> instead as the core clock rates are guaranteed to be set then.

For the change itself:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

And tested on SM6125, SM8150 (INTF TE) and SDM845 (PP TE).

Then, for some patch hygiene, starting here:

> Depends on: "Implement tearcheck support on INTF block" [3]
> 
> Changes in V3:
> - Added function prototypes
> - Reordered function definitions to make change more legible
> - Removed prepare_commit() function from dpu_encoder_phys_cmd
> 
> Changes in V4:
> - Reworded commit message to be more specific
> - Removed dpu_encoder_phys_cmd_is_ongoing_pptx() prototype

... until here: all this info belongs /below the cut/ outside of the
messge that becomes part of the commit when this patch is applied to the
tree.

> [1] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L1109
> [2] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2339

Please replace these with "permalinks" (to a commit hash): a branch with
line number annotation will fall out of date soon as more patches are
applied that touch these files.

> [3] https://patchwork.freedesktop.org/series/112332/

Is this a hard dependency?  It seems this series applies cleanly on
-next and - from a cursory view - should be applicable and testable
without my INTF TE series.  However, Dmitry asked me to move some code
around in review resulting in separate callbacks in the encoder, rather
than having various if(has_intf_te) within those callbacks.  That'll
cause conflicts when I eventually get to respin a v2.

- Marijn

> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index cb05036f2916..98958c75864a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -40,6 +40,8 @@
>  
>  #define DPU_ENC_MAX_POLL_TIMEOUT_US	2000
>  
> +static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc);
> +
>  static bool dpu_encoder_phys_cmd_is_master(struct dpu_encoder_phys *phys_enc)
>  {
>  	return (phys_enc->split_role != ENC_ROLE_SLAVE);
> @@ -611,6 +613,8 @@ static void dpu_encoder_phys_cmd_prepare_for_kickoff(
>  			  phys_enc->hw_pp->idx - PINGPONG_0);
>  	}
>  
> +	dpu_encoder_phys_cmd_enable_te(phys_enc);
> +
>  	DPU_DEBUG_CMDENC(cmd_enc, "pp:%d pending_cnt %d\n",
>  			phys_enc->hw_pp->idx - PINGPONG_0,
>  			atomic_read(&phys_enc->pending_kickoff_cnt));
> @@ -641,8 +645,7 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
>  	return false;
>  }
>  
> -static void dpu_encoder_phys_cmd_prepare_commit(
> -		struct dpu_encoder_phys *phys_enc)
> +static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc)
>  {
>  	struct dpu_encoder_phys_cmd *cmd_enc =
>  		to_dpu_encoder_phys_cmd(phys_enc);
> @@ -799,7 +802,6 @@ static void dpu_encoder_phys_cmd_trigger_start(
>  static void dpu_encoder_phys_cmd_init_ops(
>  		struct dpu_encoder_phys_ops *ops)
>  {
> -	ops->prepare_commit = dpu_encoder_phys_cmd_prepare_commit;
>  	ops->is_master = dpu_encoder_phys_cmd_is_master;
>  	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
>  	ops->enable = dpu_encoder_phys_cmd_enable;
> -- 
> 2.39.2
> 
