Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1179C6FD700
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 08:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFC110E451;
	Wed, 10 May 2023 06:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2204510E44E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 06:29:49 +0000 (UTC)
Received: from SoMainline.org (unknown [89.205.225.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 17AB72015A;
 Wed, 10 May 2023 08:29:46 +0200 (CEST)
Date: Wed, 10 May 2023 08:29:44 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v7 2/8] drm/display/dsc: add helper to set semi-const
 parameters
Message-ID: <tl5zijcxx7326jdgr6lyjptvvvyxosoupz3vekvhex3vnviw5t@3vswzg244tme>
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-2-df48a2c54421@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v7-2-df48a2c54421@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-09 15:06:48, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add a helper setting config values which are typically constant across
> operating modes (table E-4 of the standard) and mux_word_size (which is
> a const according to 3.5.2).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Same question about ordering.

Reviewed-by:  Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/display/drm_dsc_helper.c | 22 ++++++++++++++++++++++
>  include/drm/display/drm_dsc_helper.h     |  1 +
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
> index 65e810a54257..b9c4e10ced41 100644
> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> @@ -270,6 +270,28 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
>  }
>  EXPORT_SYMBOL(drm_dsc_pps_payload_pack);
>  
> +/**
> + * drm_dsc_set_const_params() - Set DSC parameters considered typically
> + * constant across operation modes
> + *
> + * @vdsc_cfg:
> + * DSC Configuration data partially filled by driver
> + */
> +void drm_dsc_set_const_params(struct drm_dsc_config *vdsc_cfg)
> +{
> +	if (!vdsc_cfg->rc_model_size)
> +		vdsc_cfg->rc_model_size = DSC_RC_MODEL_SIZE_CONST;
> +	vdsc_cfg->rc_edge_factor = DSC_RC_EDGE_FACTOR_CONST;
> +	vdsc_cfg->rc_tgt_offset_high = DSC_RC_TGT_OFFSET_HI_CONST;
> +	vdsc_cfg->rc_tgt_offset_low = DSC_RC_TGT_OFFSET_LO_CONST;
> +
> +	if (vdsc_cfg->bits_per_component <= 10)
> +		vdsc_cfg->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
> +	else
> +		vdsc_cfg->mux_word_size = DSC_MUX_WORD_SIZE_12_BPC;
> +}
> +EXPORT_SYMBOL(drm_dsc_set_const_params);
> +
>  /* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
>  static const u16 drm_dsc_rc_buf_thresh[] = {
>  	896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
> index 422135a33d65..bfa7f3acafcb 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -21,6 +21,7 @@ void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
>  int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
>  void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
>  			      const struct drm_dsc_config *dsc_cfg);
> +void drm_dsc_set_const_params(struct drm_dsc_config *vdsc_cfg);
>  void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>  int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind);
>  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
> 
> -- 
> 2.40.1
> 
