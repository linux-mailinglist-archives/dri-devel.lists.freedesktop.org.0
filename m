Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC88732301
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 01:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591B210E567;
	Thu, 15 Jun 2023 23:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F31C10E567;
 Thu, 15 Jun 2023 23:04:34 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id F3BC540424;
 Fri, 16 Jun 2023 01:04:30 +0200 (CEST)
Date: Fri, 16 Jun 2023 01:04:29 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 06/22] drm/msm/dpu: simplify peer LM handling
Message-ID: <cjspdreamae7wvvxo45yiru2b6f57faxguf3er5vdmj62zesej@hwwik7mps7ru>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
 <20230613001004.3426676-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613001004.3426676-7-dmitry.baryshkov@linaro.org>
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
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-13 03:09:45, Dmitry Baryshkov wrote:
> For each LM there is at max 1 peer LM which can be driven by the same
> CTL, so there no need to have a mask instead of just an ID of the peer
> LM.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nit: I think you can describe the the patch contents in the title:

    Replace LM peer mask with index

Instead of the vague (IMHO) "simplify handling".

> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  2 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  4 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 34 +++++++------------
>  3 files changed, 15 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 0de507d4d7b7..30fb5b1f3966 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -394,7 +394,7 @@ static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
>  	.features = _fmask, \
>  	.sblk = _sblk, \
>  	.pingpong = _pp, \
> -	.lm_pair_mask = (1 << _lmpair), \
> +	.lm_pair = _lmpair, \
>  	.dspp = _dspp \
>  	}
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index b860784ade72..b07caa4b867e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -554,14 +554,14 @@ struct dpu_sspp_cfg {
>   * @features           bit mask identifying sub-blocks/features
>   * @sblk:              LM Sub-blocks information
>   * @pingpong:          ID of connected PingPong, PINGPONG_NONE if unsupported
> - * @lm_pair_mask:      Bitmask of LMs that can be controlled by same CTL
> + * @lm_pair:           ID of LM that can be controlled by same CTL

Of *the* LM
By *the* same CTL

But then the rest of these comments have this borked hard-to-read style
as well.

>   */
>  struct dpu_lm_cfg {
>  	DPU_HW_BLK_INFO;
>  	const struct dpu_lm_sub_blks *sblk;
>  	u32 pingpong;
>  	u32 dspp;
> -	unsigned long lm_pair_mask;
> +	unsigned long lm_pair;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 471842bbb950..e333f4eeafc1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -253,28 +253,19 @@ static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
>  }
>  
>  /**
> - * _dpu_rm_check_lm_peer - check if a mixer is a peer of the primary
> + * _dpu_rm_get_lm_peer - get the id of a mixer which is a peer of the primary

... mixer?

>   * @rm: dpu resource manager handle
>   * @primary_idx: index of primary mixer in rm->mixer_blks[]
> - * @peer_idx: index of other mixer in rm->mixer_blks[]
> - * Return: true if rm->mixer_blks[peer_idx] is a peer of
> - *          rm->mixer_blks[primary_idx]
>   */
> -static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
> -		int peer_idx)
> +static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
>  {
>  	const struct dpu_lm_cfg *prim_lm_cfg;
> -	const struct dpu_lm_cfg *peer_cfg;
>  
>  	prim_lm_cfg = to_dpu_hw_mixer(rm->mixer_blks[primary_idx])->cap;
> -	peer_cfg = to_dpu_hw_mixer(rm->mixer_blks[peer_idx])->cap;
>  
> -	if (!test_bit(peer_cfg->id, &prim_lm_cfg->lm_pair_mask)) {
> -		DPU_DEBUG("lm %d not peer of lm %d\n", peer_cfg->id,
> -				peer_cfg->id);
> -		return false;
> -	}
> -	return true;
> +	if (prim_lm_cfg->lm_pair >= LM_0 && prim_lm_cfg->lm_pair < LM_MAX)
> +		return prim_lm_cfg->lm_pair - LM_0;
> +	return -EINVAL;
>  }
>  
>  /**
> @@ -351,7 +342,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>  	int lm_idx[MAX_BLOCKS];
>  	int pp_idx[MAX_BLOCKS];
>  	int dspp_idx[MAX_BLOCKS] = {0};
> -	int i, j, lm_count = 0;
> +	int i, lm_count = 0;
>  
>  	if (!reqs->topology.num_lm) {
>  		DPU_ERROR("invalid number of lm: %d\n", reqs->topology.num_lm);
> @@ -376,16 +367,15 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>  		++lm_count;
>  
>  		/* Valid primary mixer found, find matching peers */
> -		for (j = i + 1; j < ARRAY_SIZE(rm->mixer_blks) &&
> -				lm_count < reqs->topology.num_lm; j++) {
> -			if (!rm->mixer_blks[j])
> +		if (lm_count < reqs->topology.num_lm) {
> +			int j = _dpu_rm_get_lm_peer(rm, i);
> +
> +			/* ignore the peer if there is an error or if the peer was already processed */

I would not call this an "error" (though it is -EINVAL): 0 (out of range
of LM_0 <= x M LM_MAX) is a valid value meaning "LM has no peer" and
maybe another error code is more fitting?

> +			if (j < 0 || j < i)
>  				continue;
>  
> -			if (!_dpu_rm_check_lm_peer(rm, i, j)) {
> -				DPU_DEBUG("lm %d not peer of lm %d\n", LM_0 + j,
> -						LM_0 + i);
> +			if (!rm->mixer_blks[j])
>  				continue;

This seems silly now, why would an existing LM have a pair to an LM that
might not be in the catalog?  Return -EINVAL?

Nits aside, this is some tight cleanup:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

- Marijn

> -			}
>  
>  			if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
>  					global_state, enc_id, j,
> -- 
> 2.39.2
> 
