Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AE5767A7A
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 03:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C331810E7BB;
	Sat, 29 Jul 2023 01:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C6B10E7BB;
 Sat, 29 Jul 2023 01:08:46 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36T17Dol014911; Sat, 29 Jul 2023 01:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=31WNUuJa0bKrzjYcMRJRxF/3e9MhAiWK8dxqLuwuYPQ=;
 b=J2rSvo2puhBGFzv2mWoDf/FaIYsPU2tjrLDgOwd6f3imgKSIF+D9kwyPq2EoMwbjQvev
 nMgaDc7WpVm9Q/ysLdqfI+8JotloXqV7wdXf444n6DGOVDPg65oMUjdYQOaQpCzqZMtk
 iH/DgztEx/fn5KxRJvC+Enhtc4CppN02v999SYvf5ivIK0HPBfPX/nSWNR1hNQjwbvLL
 C6Hd3YaO6pgg0wku4FL1jNu/IQtk0yES1v3JnS2NkeYnr4R3jJY3uLcM29SOfbnHV0x8
 gav/X5UevyiSnjh0k8Qsh8PWTXXYcf68jqgDpIEKq5n3dazs5FTkgyxnkk0scAdTAiiM Dw== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s4kturgqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jul 2023 01:08:39 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36T18crk016631
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jul 2023 01:08:38 GMT
Received: from [10.110.51.188] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 28 Jul
 2023 18:08:37 -0700
Message-ID: <673312ae-2bc3-2c61-4013-a3504fd69c1b@quicinc.com>
Date: Fri, 28 Jul 2023 18:08:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] drm/msm/dpu: use drmm-managed allocation for
 dpu_encoder_phys
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
 <20230707231251.3849701-12-dmitry.baryshkov@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230707231251.3849701-12-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: oHspV1Drp4M1bfvhCfDHFiNEXsehNUsa
X-Proofpoint-ORIG-GUID: oHspV1Drp4M1bfvhCfDHFiNEXsehNUsa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307290008
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/7/2023 4:12 PM, Dmitry Baryshkov wrote:
> Change struct allocation of encoder's phys backend data to use
> drmm_kzalloc(). This removes the need to perform any actions on encoder
> destruction.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  9 ++++----
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  8 ++++---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 15 ++++---------
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 13 ++++--------
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 21 ++++---------------
>   5 files changed, 22 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 493905a5b63a..7c2cd9ce8acd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2199,6 +2199,7 @@ static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
>   }
>   
>   static int dpu_encoder_virt_add_phys_encs(
> +		struct drm_device *dev,
>   		struct msm_display_info *disp_info,
>   		struct dpu_encoder_virt *dpu_enc,
>   		struct dpu_enc_phys_init_params *params)
> @@ -2220,7 +2221,7 @@ static int dpu_encoder_virt_add_phys_encs(
>   
>   
>   	if (disp_info->intf_type == INTF_WB) {
> -		enc = dpu_encoder_phys_wb_init(params);
> +		enc = dpu_encoder_phys_wb_init(dev, params);
>   
>   		if (IS_ERR(enc)) {
>   			DPU_ERROR_ENC(dpu_enc, "failed to init wb enc: %ld\n",
> @@ -2231,7 +2232,7 @@ static int dpu_encoder_virt_add_phys_encs(
>   		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
>   		++dpu_enc->num_phys_encs;
>   	} else if (disp_info->is_cmd_mode) {
> -		enc = dpu_encoder_phys_cmd_init(params);
> +		enc = dpu_encoder_phys_cmd_init(dev, params);
>   
>   		if (IS_ERR(enc)) {
>   			DPU_ERROR_ENC(dpu_enc, "failed to init cmd enc: %ld\n",
> @@ -2242,7 +2243,7 @@ static int dpu_encoder_virt_add_phys_encs(
>   		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
>   		++dpu_enc->num_phys_encs;
>   	} else {
> -		enc = dpu_encoder_phys_vid_init(params);
> +		enc = dpu_encoder_phys_vid_init(dev, params);
>   
>   		if (IS_ERR(enc)) {
>   			DPU_ERROR_ENC(dpu_enc, "failed to init vid enc: %ld\n",
> @@ -2333,7 +2334,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   			break;
>   		}
>   
> -		ret = dpu_encoder_virt_add_phys_encs(disp_info,
> +		ret = dpu_encoder_virt_add_phys_encs(dpu_kms->dev, disp_info,
>   				dpu_enc, &phys_params);
>   		if (ret) {
>   			DPU_ERROR_ENC(dpu_enc, "failed to add phys encs\n");
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index d48558ede488..4fb0d95f3061 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -281,22 +281,24 @@ struct dpu_encoder_wait_info {
>    * @p:	Pointer to init params structure
>    * Return: Error code or newly allocated encoder
>    */
> -struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
> +struct dpu_encoder_phys *dpu_encoder_phys_vid_init(struct drm_device *dev,
>   		struct dpu_enc_phys_init_params *p);
>   
>   /**
>    * dpu_encoder_phys_cmd_init - Construct a new command mode physical encoder
> + * @dev:  Corresponding device for devres management
>    * @p:	Pointer to init params structure
>    * Return: Error code or newly allocated encoder
>    */
> -struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
> +struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(struct drm_device *dev,
>   		struct dpu_enc_phys_init_params *p);
>   
>   /**
>    * dpu_encoder_phys_wb_init - initialize writeback encoder
> + * @dev:  Corresponding device for devres management
>    * @init:	Pointer to init info structure with initialization params
>    */
> -struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
> +struct dpu_encoder_phys *dpu_encoder_phys_wb_init(struct drm_device *dev,
>   		struct dpu_enc_phys_init_params *p);
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index b856c6286c85..2958b64e6e5e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -13,6 +13,8 @@
>   #include "dpu_trace.h"
>   #include "disp/msm_disp_snapshot.h"
>   
> +#include <drm/drm_managed.h>
> +
>   #define DPU_DEBUG_CMDENC(e, fmt, ...) DPU_DEBUG("enc%d intf%d " fmt, \
>   		(e) && (e)->base.parent ? \
>   		(e)->base.parent->base.id : -1, \
> @@ -563,14 +565,6 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
>   	phys_enc->enable_state = DPU_ENC_DISABLED;
>   }
>   
> -static void dpu_encoder_phys_cmd_destroy(struct dpu_encoder_phys *phys_enc)
> -{
> -	struct dpu_encoder_phys_cmd *cmd_enc =
> -		to_dpu_encoder_phys_cmd(phys_enc);
> -
> -	kfree(cmd_enc);
> -}
> -
>   static void dpu_encoder_phys_cmd_prepare_for_kickoff(
>   		struct dpu_encoder_phys *phys_enc)
>   {
> @@ -736,7 +730,6 @@ static void dpu_encoder_phys_cmd_init_ops(
>   	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
>   	ops->enable = dpu_encoder_phys_cmd_enable;
>   	ops->disable = dpu_encoder_phys_cmd_disable;
> -	ops->destroy = dpu_encoder_phys_cmd_destroy;
>   	ops->control_vblank_irq = dpu_encoder_phys_cmd_control_vblank_irq;
>   	ops->wait_for_commit_done = dpu_encoder_phys_cmd_wait_for_commit_done;
>   	ops->prepare_for_kickoff = dpu_encoder_phys_cmd_prepare_for_kickoff;
> @@ -751,7 +744,7 @@ static void dpu_encoder_phys_cmd_init_ops(
>   	ops->get_line_count = dpu_encoder_phys_cmd_get_line_count;
>   }
>   
> -struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
> +struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(struct drm_device *dev,
>   		struct dpu_enc_phys_init_params *p)
>   {
>   	struct dpu_encoder_phys *phys_enc = NULL;
> @@ -759,7 +752,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>   
>   	DPU_DEBUG("intf\n");
>   
> -	cmd_enc = kzalloc(sizeof(*cmd_enc), GFP_KERNEL);
> +	cmd_enc = drmm_kzalloc(dev, sizeof(*cmd_enc), GFP_KERNEL);
>   	if (!cmd_enc) {
>   		DPU_ERROR("failed to allocate\n");
>   		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 662d74ded1b9..bdfce4ccc0a7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -11,6 +11,8 @@
>   #include "dpu_trace.h"
>   #include "disp/msm_disp_snapshot.h"
>   
> +#include <drm/drm_managed.h>
> +
>   #define DPU_DEBUG_VIDENC(e, fmt, ...) DPU_DEBUG("enc%d intf%d " fmt, \
>   		(e) && (e)->parent ? \
>   		(e)->parent->base.id : -1, \
> @@ -438,12 +440,6 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>   		phys_enc->enable_state = DPU_ENC_ENABLING;
>   }
>   
> -static void dpu_encoder_phys_vid_destroy(struct dpu_encoder_phys *phys_enc)
> -{
> -	DPU_DEBUG_VIDENC(phys_enc, "\n");
> -	kfree(phys_enc);
> -}
> -
>   static int dpu_encoder_phys_vid_wait_for_vblank(
>   		struct dpu_encoder_phys *phys_enc)
>   {
> @@ -681,7 +677,6 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
>   	ops->atomic_mode_set = dpu_encoder_phys_vid_atomic_mode_set;
>   	ops->enable = dpu_encoder_phys_vid_enable;
>   	ops->disable = dpu_encoder_phys_vid_disable;
> -	ops->destroy = dpu_encoder_phys_vid_destroy;
>   	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
>   	ops->wait_for_commit_done = dpu_encoder_phys_vid_wait_for_commit_done;
>   	ops->wait_for_vblank = dpu_encoder_phys_vid_wait_for_vblank;
> @@ -694,7 +689,7 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
>   	ops->get_frame_count = dpu_encoder_phys_vid_get_frame_count;
>   }
>   
> -struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
> +struct dpu_encoder_phys *dpu_encoder_phys_vid_init(struct drm_device *dev,
>   		struct dpu_enc_phys_init_params *p)
>   {
>   	struct dpu_encoder_phys *phys_enc = NULL;
> @@ -704,7 +699,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
>   		return ERR_PTR(-EINVAL);
>   	}
>   
> -	phys_enc = kzalloc(sizeof(*phys_enc), GFP_KERNEL);
> +	phys_enc = drmm_kzalloc(dev, sizeof(*phys_enc), GFP_KERNEL);
>   	if (!phys_enc) {
>   		DPU_ERROR("failed to create encoder due to memory allocation error\n");
>   		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index a466ff70a4d6..9a44a1575682 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -8,6 +8,7 @@
>   #include <linux/debugfs.h>
>   
>   #include <drm/drm_framebuffer.h>
> +#include <drm/drm_managed.h>
>   
>   #include "dpu_encoder_phys.h"
>   #include "dpu_formats.h"
> @@ -552,20 +553,6 @@ static void dpu_encoder_phys_wb_disable(struct dpu_encoder_phys *phys_enc)
>   	phys_enc->enable_state = DPU_ENC_DISABLED;
>   }
>   
> -/**
> - * dpu_encoder_phys_wb_destroy - destroy writeback encoder
> - * @phys_enc:	Pointer to physical encoder
> - */
> -static void dpu_encoder_phys_wb_destroy(struct dpu_encoder_phys *phys_enc)
> -{
> -	if (!phys_enc)
> -		return;
> -
> -	DPU_DEBUG("[wb:%d]\n", phys_enc->hw_wb->idx - WB_0);
> -
> -	kfree(phys_enc);
> -}
> -
>   static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc,
>   		struct drm_writeback_job *job)
>   {
> @@ -661,7 +648,6 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
>   	ops->atomic_mode_set = dpu_encoder_phys_wb_atomic_mode_set;
>   	ops->enable = dpu_encoder_phys_wb_enable;
>   	ops->disable = dpu_encoder_phys_wb_disable;
> -	ops->destroy = dpu_encoder_phys_wb_destroy;
>   	ops->atomic_check = dpu_encoder_phys_wb_atomic_check;
>   	ops->wait_for_commit_done = dpu_encoder_phys_wb_wait_for_commit_done;
>   	ops->prepare_for_kickoff = dpu_encoder_phys_wb_prepare_for_kickoff;
> @@ -677,9 +663,10 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
>   
>   /**
>    * dpu_encoder_phys_wb_init - initialize writeback encoder
> + * @dev:  Corresponding device for devres management
>    * @p:	Pointer to init info structure with initialization params
>    */
> -struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
> +struct dpu_encoder_phys *dpu_encoder_phys_wb_init(struct drm_device *dev,
>   		struct dpu_enc_phys_init_params *p)
>   {
>   	struct dpu_encoder_phys *phys_enc = NULL;
> @@ -692,7 +679,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
>   		return ERR_PTR(-EINVAL);
>   	}
>   
> -	wb_enc = kzalloc(sizeof(*wb_enc), GFP_KERNEL);
> +	wb_enc = drmm_kzalloc(dev, sizeof(*wb_enc), GFP_KERNEL);
>   	if (!wb_enc) {
>   		DPU_ERROR("failed to allocate wb phys_enc enc\n");
>   		return ERR_PTR(-ENOMEM);
> -- 
> 2.39.2
> 
