Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CB846F663
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 23:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271DF10E3A2;
	Thu,  9 Dec 2021 22:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D0D10E396;
 Thu,  9 Dec 2021 22:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639087338; x=1670623338;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mlxFHPwyn031NG3Bea8qphpci8XmwSamaHtwrEbF7/E=;
 b=gU5HA8bCF6xyeFE2yONbY/iO19BvcWBd41FZvHzrUCW34odxtekOrw5O
 NrqG1P+0LDJbiTEffUGJLXRwuT+7IJirTnhWQN9kL/8fL/bXPCMN8cgjM
 ZyhxFDONJsl5Z7m3SnBjXcEaduM1uvLZs9KkrV0TBdLQI+4n1FXWQeZHS I=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 09 Dec 2021 14:02:17 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 14:02:17 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 9 Dec 2021 14:02:16 -0800
Received: from [10.111.171.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 9 Dec 2021
 14:02:14 -0800
Message-ID: <5b537a80-818b-0763-8ce7-be53e0519e77@quicinc.com>
Date: Thu, 9 Dec 2021 14:02:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH v1 7/8] drm/msm/dpu: simplify DPU's regset32
 code
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <abhinavk@codeaurora.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
 <20211201222633.2476780-8-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211201222633.2476780-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/1/2021 2:26 PM, Dmitry Baryshkov wrote:
> Squash dpu_debugfs_setup_regset32() into dpu_debugfs_create_regset32().
> it makes little sense to have separate function to just setup the
> structure.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   | 32 ++++++++++++-------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h   | 38 +++--------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 27 +++++-----------
>   3 files changed, 33 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 4c04982c71b2..7e7a619769a8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -182,6 +182,15 @@ static void dpu_debugfs_danger_init(struct dpu_kms *dpu_kms,
>   
>   }
>   
> +/*
> + * Companion structure for dpu_debugfs_create_regset32.
> + */
> +struct dpu_debugfs_regset32 {
> +	uint32_t offset;
> +	uint32_t blk_len;
> +	struct dpu_kms *dpu_kms;
> +};
> +
>   static int _dpu_debugfs_show_regset32(struct seq_file *s, void *data)
>   {
>   	struct dpu_debugfs_regset32 *regset = s->private;
> @@ -229,24 +238,23 @@ static const struct file_operations dpu_fops_regset32 = {
>   	.release =	single_release,
>   };
>   
> -void dpu_debugfs_setup_regset32(struct dpu_debugfs_regset32 *regset,
> +void dpu_debugfs_create_regset32(const char *name, umode_t mode,
> +		void *parent,
>   		uint32_t offset, uint32_t length, struct dpu_kms *dpu_kms)
>   {
> -	if (regset) {
> -		regset->offset = offset;
> -		regset->blk_len = length;
> -		regset->dpu_kms = dpu_kms;
> -	}
> -}
> +	struct dpu_debugfs_regset32 *regset;
>   
> -void dpu_debugfs_create_regset32(const char *name, umode_t mode,
> -		void *parent, struct dpu_debugfs_regset32 *regset)
> -{
> -	if (!name || !regset || !regset->dpu_kms || !regset->blk_len)
> +	if (WARN_ON(!name || !dpu_kms || !length))
> +		return;
> +
> +	regset = devm_kzalloc(&dpu_kms->pdev->dev, sizeof(*regset), GFP_KERNEL);
> +	if (!regset)
>   		return;
>   
>   	/* make sure offset is a multiple of 4 */
> -	regset->offset = round_down(regset->offset, 4);
> +	regset->offset = round_down(offset, 4);
> +	regset->blk_len = length;
> +	regset->dpu_kms = dpu_kms;
>   
>   	debugfs_create_file(name, mode, parent, regset, &dpu_fops_regset32);
>   }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 775bcbda860f..b53cdeb1b5c4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -160,33 +160,9 @@ struct dpu_global_state
>    *
>    * Documentation/filesystems/debugfs.rst
>    *
> - * @dpu_debugfs_setup_regset32: Initialize data for dpu_debugfs_create_regset32
>    * @dpu_debugfs_create_regset32: Create 32-bit register dump file
> - * @dpu_debugfs_get_root: Get root dentry for DPU_KMS's debugfs node
>    */
>   
> -/**
> - * Companion structure for dpu_debugfs_create_regset32. Do not initialize the
> - * members of this structure explicitly; use dpu_debugfs_setup_regset32 instead.
> - */
> -struct dpu_debugfs_regset32 {
> -	uint32_t offset;
> -	uint32_t blk_len;
> -	struct dpu_kms *dpu_kms;
> -};
> -
> -/**
> - * dpu_debugfs_setup_regset32 - Initialize register block definition for debugfs
> - * This function is meant to initialize dpu_debugfs_regset32 structures for use
> - * with dpu_debugfs_create_regset32.
> - * @regset: opaque register definition structure
> - * @offset: sub-block offset
> - * @length: sub-block length, in bytes
> - * @dpu_kms: pointer to dpu kms structure
> - */
> -void dpu_debugfs_setup_regset32(struct dpu_debugfs_regset32 *regset,
> -		uint32_t offset, uint32_t length, struct dpu_kms *dpu_kms);
> -
>   /**
>    * dpu_debugfs_create_regset32 - Create register read back file for debugfs
>    *
> @@ -195,20 +171,16 @@ void dpu_debugfs_setup_regset32(struct dpu_debugfs_regset32 *regset,
>    * names/offsets do not need to be provided. The 'read' function simply outputs
>    * sequential register values over a specified range.
>    *
> - * Similar to the related debugfs_create_regset32 API, the structure pointed to
> - * by regset needs to persist for the lifetime of the created file. The calling
> - * code is responsible for initialization/management of this structure.
> - *
> - * The structure pointed to by regset is meant to be opaque. Please use
> - * dpu_debugfs_setup_regset32 to initialize it.
> - *
>    * @name:   File name within debugfs
>    * @mode:   File mode within debugfs
>    * @parent: Parent directory entry within debugfs, can be NULL
> - * @regset: Pointer to persistent register block definition
> + * @offset: sub-block offset
> + * @length: sub-block length, in bytes
> + * @dpu_kms: pointer to dpu kms structure
>    */
>   void dpu_debugfs_create_regset32(const char *name, umode_t mode,
> -		void *parent, struct dpu_debugfs_regset32 *regset);
> +		void *parent,
> +		uint32_t offset, uint32_t length, struct dpu_kms *dpu_kms);
>   
>   /**
>    * dpu_debugfs_get_root - Return root directory entry for KMS's debugfs
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index d3176f58708e..ef66af696a40 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -108,11 +108,6 @@ struct dpu_plane {
>   	bool is_virtual;
>   	struct list_head mplane_list;
>   	struct dpu_mdss_cfg *catalog;
> -
> -	/* debugfs related stuff */
> -	struct dpu_debugfs_regset32 debugfs_src;
> -	struct dpu_debugfs_regset32 debugfs_scaler;
> -	struct dpu_debugfs_regset32 debugfs_csc;
>   };
>   
>   static const uint64_t supported_format_modifiers[] = {
> @@ -1379,35 +1374,29 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
>   			debugfs_root, (unsigned long *)&pdpu->pipe_hw->cap->features);
>   
>   	/* add register dump support */
> -	dpu_debugfs_setup_regset32(&pdpu->debugfs_src,
> +	dpu_debugfs_create_regset32("src_blk", 0400,
> +			debugfs_root,
>   			sblk->src_blk.base + cfg->base,
>   			sblk->src_blk.len,
>   			kms);
> -	dpu_debugfs_create_regset32("src_blk", 0400,
> -			debugfs_root, &pdpu->debugfs_src);
>   
>   	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
>   			cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
>   			cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
> -			cfg->features & BIT(DPU_SSPP_SCALER_QSEED4)) {
> -		dpu_debugfs_setup_regset32(&pdpu->debugfs_scaler,
> +			cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
> +		dpu_debugfs_create_regset32("scaler_blk", 0400,
> +				debugfs_root,
>   				sblk->scaler_blk.base + cfg->base,
>   				sblk->scaler_blk.len,
>   				kms);
> -		dpu_debugfs_create_regset32("scaler_blk", 0400,
> -				debugfs_root,
> -				&pdpu->debugfs_scaler);
> -	}
>   
>   	if (cfg->features & BIT(DPU_SSPP_CSC) ||
> -			cfg->features & BIT(DPU_SSPP_CSC_10BIT)) {
> -		dpu_debugfs_setup_regset32(&pdpu->debugfs_csc,
> +			cfg->features & BIT(DPU_SSPP_CSC_10BIT))
> +		dpu_debugfs_create_regset32("csc_blk", 0400,
> +				debugfs_root,
>   				sblk->csc_blk.base + cfg->base,
>   				sblk->csc_blk.len,
>   				kms);
> -		dpu_debugfs_create_regset32("csc_blk", 0400,
> -				debugfs_root, &pdpu->debugfs_csc);
> -	}
>   
>   	debugfs_create_u32("xin_id",
>   			0400,
> 
