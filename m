Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F47570121C
	for <lists+dri-devel@lfdr.de>; Sat, 13 May 2023 00:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AA210E6D7;
	Fri, 12 May 2023 22:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA3D10E6D7;
 Fri, 12 May 2023 22:18:31 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CFtXil000925; Fri, 12 May 2023 22:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=9kM0qiWz0RDaA/flNlf7o/IUihhX40q1SIYFDTELzOo=;
 b=XLdOYdikmSF+BkAYDAyO7f9ooWENICOqhtnxvrmSmHxHavPMcZn2grZUf/iYVZhdPbDS
 aIAUPPpi4k6Zupb+dZqu08QTKerKT64l5V65n8ClS71yz/r90GaZN7fWmxdfthQp0LDr
 u1SooQLQJqagG9dXnHOQcQWBxyE/8+f1Uey9x/5VzVy8gF/B30Lbu5m/OJlDGqLuv2ft
 1esK/+2m3XKtwFGT1Fm6xg+qcEFaZachQdlhoAodG/XoF5si87ks4TBK5YWljKHfCl3t
 Uxr7mQMQ5qvIlW4fd04Bi+xivqvH2moMsSyjkQ9zFsP3cJZfSZ5X6AVVSnliShFedcFu Tw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qh24h3tny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 22:18:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34CMIOS1027515
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 22:18:24 GMT
Received: from [10.110.82.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 12 May
 2023 15:18:23 -0700
Message-ID: <47ade353-a46a-9f10-f712-4d5502e03ce1@quicinc.com>
Date: Fri, 12 May 2023 15:18:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH v2 03/13] drm/msm/dpu: encoder: simplify debugfs
 handling
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-4-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230321011821.635977-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: yI_diAiSQm48Hy0xC8tzAgTO_uJLl3Pb
X-Proofpoint-ORIG-GUID: yI_diAiSQm48Hy0xC8tzAgTO_uJLl3Pb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305120186
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



On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> As the debugfs is fully cleared on drm device removal, drop the
> encoder-specific cleanup function, remove debugfs_root from dpu_encoder
> struct and also remove phys_encoder late_register() ops which has been
> unused since the driver being added.
> 

Agreed, late_register of encoder_phys is unused, so we can drop that.

For the other two things which this patch does:

1) remove debugfs_root from dpu_encoder
2) remove early_unregister of dpu_encoder

I think this has been posted separately here 
https://patchwork.freedesktop.org/patch/534802/?series=117150&rev=1 for 
which I had given my feedback about why it cant be removed

So these 2 parts have to be kept till we sort out that feedback

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 22 +++----------------
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  3 ---
>   2 files changed, 3 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 97d8d777f178..28729c77364f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -142,7 +142,6 @@ enum dpu_enc_rc_states {
>    * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
>    *				all CTL paths
>    * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
> - * @debugfs_root:		Debug file system root file node
>    * @enc_lock:			Lock around physical encoder
>    *				create/destroy/enable/disable
>    * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
> @@ -186,7 +185,6 @@ struct dpu_encoder_virt {
>   	struct drm_crtc *crtc;
>   	struct drm_connector *connector;
>   
> -	struct dentry *debugfs_root;
>   	struct mutex enc_lock;
>   	DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
>   	void (*crtc_frame_event_cb)(void *, u32 event);
> @@ -2134,7 +2132,7 @@ DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
>   static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
>   {
>   	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	int i;
> +	struct dentry *debugfs_root;
>   
>   	char name[DPU_NAME_SIZE];
>   
> @@ -2146,18 +2144,12 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
>   	snprintf(name, DPU_NAME_SIZE, "encoder%u", drm_enc->base.id);
>   
>   	/* create overall sub-directory for the encoder */
> -	dpu_enc->debugfs_root = debugfs_create_dir(name,
> +	debugfs_root = debugfs_create_dir(name,
>   			drm_enc->dev->primary->debugfs_root);
>   
>   	/* don't error check these */
>   	debugfs_create_file("status", 0600,
> -		dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
> -
> -	for (i = 0; i < dpu_enc->num_phys_encs; i++)
> -		if (dpu_enc->phys_encs[i]->ops.late_register)
> -			dpu_enc->phys_encs[i]->ops.late_register(
> -					dpu_enc->phys_encs[i],
> -					dpu_enc->debugfs_root);
> +		debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
>   
>   	return 0;
>   }
> @@ -2173,13 +2165,6 @@ static int dpu_encoder_late_register(struct drm_encoder *encoder)
>   	return _dpu_encoder_init_debugfs(encoder);
>   }
>   
> -static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
> -{
> -	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
> -
> -	debugfs_remove_recursive(dpu_enc->debugfs_root);
> -}
> -
>   static int dpu_encoder_virt_add_phys_encs(
>   		struct msm_display_info *disp_info,
>   		struct dpu_encoder_virt *dpu_enc,
> @@ -2406,7 +2391,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>   static const struct drm_encoder_funcs dpu_encoder_funcs = {
>   		.destroy = dpu_encoder_destroy,
>   		.late_register = dpu_encoder_late_register,
> -		.early_unregister = dpu_encoder_early_unregister,
>   };
>   
>   int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 1d434b22180d..9e29079a6fc4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -63,7 +63,6 @@ struct dpu_encoder_phys;
>   /**
>    * struct dpu_encoder_phys_ops - Interface the physical encoders provide to
>    *	the containing virtual encoder.
> - * @late_register:		DRM Call. Add Userspace interfaces, debugfs.
>    * @prepare_commit:		MSM Atomic Call, start of atomic commit sequence
>    * @is_master:			Whether this phys_enc is the current master
>    *				encoder. Can be switched at enable time. Based
> @@ -93,8 +92,6 @@ struct dpu_encoder_phys;
>    */
>   
>   struct dpu_encoder_phys_ops {
> -	int (*late_register)(struct dpu_encoder_phys *encoder,
> -			struct dentry *debugfs_root);
>   	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
>   	bool (*is_master)(struct dpu_encoder_phys *encoder);
>   	void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,
