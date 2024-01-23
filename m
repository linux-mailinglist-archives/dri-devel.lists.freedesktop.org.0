Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3029E839C07
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 23:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2223310E8DE;
	Tue, 23 Jan 2024 22:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE2210E8CD;
 Tue, 23 Jan 2024 22:23:33 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40NMNPnX032173; Tue, 23 Jan 2024 22:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=XlC4JDxigxxjs2X/Ym32sTVO0mcIcKc7tXhItLRp/QE=; b=kN
 GTr3oSMiGTgZvjoULFjQlqReZS4OK0HjoNTD/Ss++KV4+6yeml5rqUfNpOQaKdtF
 Rry2HLzHIYIZUTOJkH94B18+plrEANK90cy0dSTkfvWcQa3LrtyKLGY4N9C8FAv0
 P54tNlaQvydadlfpbDv5o+gu4hyo46I5m0iX+cSm5PA6AH0PCT1qhEnSWrrQLT9L
 QagbC9cvbYYHiF8r4Xb7qt0u2nm7jwb89Eti7eLeQ+MQYNj0YnwBT0HzKBKyHzNF
 0H6LHu7SeSMsqFyFO4V+TsCrlgifDYQq318tJtMbZZzfWRGPI96aaa5R8ZHAqPtt
 ahB8WAv1vHEE/zAAqtQw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vtmmeg606-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jan 2024 22:23:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40NMNNPS009362
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jan 2024 22:23:23 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 23 Jan
 2024 14:23:22 -0800
Message-ID: <211f0818-04a2-7dc3-fe37-c09b756765d1@quicinc.com>
Date: Tue, 23 Jan 2024 14:23:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 4/5] drm/msm/dpu: move writeback's atomic_check to
 dpu_writeback.c
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
 <20231225130853.3659424-5-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231225130853.3659424-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: F2JLE9z4SDTXQM2_Imb4sMzfUMEXJDRh
X-Proofpoint-ORIG-GUID: F2JLE9z4SDTXQM2_Imb4sMzfUMEXJDRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_12,2024-01-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401230166
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
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/25/2023 5:08 AM, Dmitry Baryshkov wrote:
> dpu_encoder_phys_wb is the only user of encoder's atomic_check callback.
> Move corresponding checks to drm_writeback_connector's implementation
> and drop the dpu_encoder_phys_wb_atomic_check() function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 54 ------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  9 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 57 ++++++++++++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  3 +-
>   4 files changed, 64 insertions(+), 59 deletions(-)
> 

While validating this change with kms_writeback, we found that this is 
breaking back to back validate of kms_writeback with a NULL ptr 
dereference in below stack:

[   86.701062] Call trace:
[   86.701067]  dpu_wb_conn_atomic_check+0x118/0x18c
[   86.701076]  drm_atomic_helper_check_modeset+0x2d8/0x688
[   86.701084]  drm_atomic_helper_check+0x24/0x98
[   86.701095]  msm_atomic_check+0x90/0x9c
[   86.701103]  drm_atomic_check_only+0x4f4/0x8e8
[   86.701111]  drm_atomic_commit+0x64/0xd8
[   86.701120]  drm_mode_atomic_ioctl+0xbfc/0xe74
[   86.701129]  drm_ioctl_kernel+0xd4/0x114
[   86.701137]  drm_ioctl+0x274/0x508
[   86.701143]  __arm64_sys_ioctl+0x98/0xd0
[   86.701152]  invoke_syscall+0x48/0xfc
[   86.701161]  el0_svc_common+0x88/0xe4
[   86.701167]  do_el0_svc+0x24/0x30
[   86.701175]  el0_svc+0x34/0x80
[   86.701184]  el0t_64_sync_handler+0x44/0xec
[   86.701192]  el0t_64_sync+0x1a8/0x1ac
[   86.701200] ---[ end trace 0000000000000000 ]---

We analysed this and found why. Please see below.

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index a0a28230fc31..8220cd920e6f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -354,59 +354,6 @@ static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
>   	}
>   }
>   
> -/**
> - * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic states
> - * @phys_enc:	Pointer to physical encoder
> - * @crtc_state:	Pointer to CRTC atomic state
> - * @conn_state:	Pointer to connector atomic state
> - */
> -static int dpu_encoder_phys_wb_atomic_check(
> -		struct dpu_encoder_phys *phys_enc,
> -		struct drm_crtc_state *crtc_state,
> -		struct drm_connector_state *conn_state)
> -{
> -	struct drm_framebuffer *fb;
> -	const struct drm_display_mode *mode = &crtc_state->mode;
> -
> -	DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
> -			phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
> -
> -	if (!conn_state || !conn_state->connector) {
> -		DPU_ERROR("invalid connector state\n");
> -		return -EINVAL;
> -	} else if (conn_state->connector->status !=
> -			connector_status_connected) {
> -		DPU_ERROR("connector not connected %d\n",
> -				conn_state->connector->status);
> -		return -EINVAL;
> -	}
> -
> -	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
> -		return 0;
> -
> -	fb = conn_state->writeback_job->fb;
> -
> -	DPU_DEBUG("[fb_id:%u][fb:%u,%u]\n", fb->base.id,
> -			fb->width, fb->height);
> -
> -	if (fb->width != mode->hdisplay) {
> -		DPU_ERROR("invalid fb w=%d, mode w=%d\n", fb->width,
> -				mode->hdisplay);
> -		return -EINVAL;
> -	} else if (fb->height != mode->vdisplay) {
> -		DPU_ERROR("invalid fb h=%d, mode h=%d\n", fb->height,
> -				  mode->vdisplay);
> -		return -EINVAL;
> -	} else if (fb->width > phys_enc->hw_wb->caps->maxlinewidth) {
> -		DPU_ERROR("invalid fb w=%d, maxlinewidth=%u\n",
> -				  fb->width, phys_enc->hw_wb->caps->maxlinewidth);
> -		return -EINVAL;
> -	}
> -
> -	return drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
> -}
> -
> -
>   /**
>    * _dpu_encoder_phys_wb_update_flush - flush hardware update
>    * @phys_enc:	Pointer to physical encoder
> @@ -777,7 +724,6 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
>   	ops->is_master = dpu_encoder_phys_wb_is_master;
>   	ops->enable = dpu_encoder_phys_wb_enable;
>   	ops->disable = dpu_encoder_phys_wb_disable;
> -	ops->atomic_check = dpu_encoder_phys_wb_atomic_check;
>   	ops->wait_for_commit_done = dpu_encoder_phys_wb_wait_for_commit_done;
>   	ops->prepare_for_kickoff = dpu_encoder_phys_wb_prepare_for_kickoff;
>   	ops->handle_post_kickoff = dpu_encoder_phys_wb_handle_post_kickoff;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 723cc1d82143..48728be27e15 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -630,23 +630,26 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
>   {
>   	struct drm_encoder *encoder = NULL;
>   	struct msm_display_info info;
> +	const enum dpu_wb wb_idx = WB_2;
> +	u32 maxlinewidth;
>   	int rc;
>   
>   	memset(&info, 0, sizeof(info));
>   
>   	info.num_of_h_tiles = 1;
>   	/* use only WB idx 2 instance for DPU */
> -	info.h_tile_instance[0] = WB_2;
> +	info.h_tile_instance[0] = wb_idx;
>   	info.intf_type = INTF_WB;
>   
> +	maxlinewidth = dpu_rm_get_wb(&dpu_kms->rm, info.h_tile_instance[0])->caps->maxlinewidth;
> +
>   	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_VIRTUAL, &info);
>   	if (IS_ERR(encoder)) {
>   		DPU_ERROR("encoder init failed for dsi display\n");
>   		return PTR_ERR(encoder);
>   	}
>   
> -	rc = dpu_writeback_init(dev, encoder, wb_formats,
> -			n_formats);
> +	rc = dpu_writeback_init(dev, encoder, wb_formats, n_formats, maxlinewidth);
>   	if (rc) {
>   		DPU_ERROR("dpu_writeback_init, rc = %d\n", rc);
>   		return rc;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> index 2a5a68366582..232b5f410de8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <drm/drm_edid.h>
> +#include <drm/drm_framebuffer.h>
>   
>   #include "dpu_writeback.h"
>   
> @@ -24,6 +25,57 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
>   			dev->mode_config.max_height);
>   }
>   
> +static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
> +				    struct drm_atomic_state *state)
> +{
> +	struct drm_writeback_connector *wb_conn = drm_connector_to_writeback(connector);
> +	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(wb_conn);
> +	struct drm_connector_state *conn_state =
> +		drm_atomic_get_new_connector_state(state, connector);
> +	struct drm_crtc *crtc = conn_state->crtc;
> +	struct drm_crtc_state *crtc_state;
> +	const struct drm_display_mode *mode;
> +	struct drm_framebuffer *fb;
> +
> +	crtc_state = drm_atomic_get_crtc_state(state, crtc);

To detach the CRTC associated with the connector, IGT will set the 
associated CRTC_ID to 0 and the associated conn_state->crtc will be NULL.

This is valid as val will be 0 in this case:

https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_atomic_uapi.c#L722

Before this patch, for these cases, we used to call the encoder's 
atomic_check which gets skipped when there is no valid crtc:

https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_atomic_helper.c#L440

But now with connector atomic check, these calls are allowed by the DRM

https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_atomic_helper.c#L712

So questions:

1) Should we add protection in DRM to check if conn_state->crtc is valid 
before calling connector's atomic_check()?

OR

2) Is it incorrect for us to dereference conn->crtc in connector's 
atomic_check as its not guaranteed to be valid.

We cannot fail atomic_check for !crtc, because if we add a !crtc check 
and fail those checks, it bails out these disable commit calls thus 
failing those commits.

> +	if (IS_ERR(crtc_state))
> +		return PTR_ERR(crtc_state);
> +
> +	mode = &crtc_state->mode;
> +
> +	DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
> +		  connector->base.id, mode->name, mode->hdisplay, mode->vdisplay);
> +
> +	if (!conn_state || !conn_state->connector) {
> +		DPU_ERROR("invalid connector state\n");
> +		return -EINVAL;
> +	} else if (conn_state->connector->status != connector_status_connected) {
> +		DPU_ERROR("connector not connected %d\n", conn_state->connector->status);
> +		return -EINVAL;
> +	}
> +
> +	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
> +		return 0;
> +
> +	fb = conn_state->writeback_job->fb;
> +
> +	DPU_DEBUG("[fb_id:%u][fb:%u,%u]\n", fb->base.id, fb->width, fb->height);
> +
> +	if (fb->width != mode->hdisplay) {
> +		DPU_ERROR("invalid fb w=%d, mode w=%d\n", fb->width, mode->hdisplay);
> +		return -EINVAL;
> +	} else if (fb->height != mode->vdisplay) {
> +		DPU_ERROR("invalid fb h=%d, mode h=%d\n", fb->height, mode->vdisplay);
> +		return -EINVAL;
> +	} else if (fb->width > dpu_wb_conn->maxlinewidth) {
> +		DPU_ERROR("invalid fb w=%d, maxlinewidth=%u\n",
> +			  fb->width, dpu_wb_conn->maxlinewidth);
> +		return -EINVAL;
> +	}
> +
> +	return drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
> +}
> +
>   static const struct drm_connector_funcs dpu_wb_conn_funcs = {
>   	.reset = drm_atomic_helper_connector_reset,
>   	.fill_modes = drm_helper_probe_single_connector_modes,
> @@ -59,12 +111,13 @@ static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector *connector,
>   
>   static const struct drm_connector_helper_funcs dpu_wb_conn_helper_funcs = {
>   	.get_modes = dpu_wb_conn_get_modes,
> +	.atomic_check = dpu_wb_conn_atomic_check,
>   	.prepare_writeback_job = dpu_wb_conn_prepare_job,
>   	.cleanup_writeback_job = dpu_wb_conn_cleanup_job,
>   };
>   
>   int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
> -		const u32 *format_list, u32 num_formats)
> +		const u32 *format_list, u32 num_formats, u32 maxlinewidth)
>   {
>   	struct dpu_wb_connector *dpu_wb_conn;
>   	int rc = 0;
> @@ -73,6 +126,8 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
>   	if (!dpu_wb_conn)
>   		return -ENOMEM;
>   
> +	dpu_wb_conn->maxlinewidth = maxlinewidth;
> +
>   	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
>   
>   	/* DPU initializes the encoder and sets it up completely for writeback
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
> index 5a75ea916101..4b11cca8014c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
> @@ -18,6 +18,7 @@
>   struct dpu_wb_connector {
>   	struct drm_writeback_connector base;
>   	struct drm_encoder *wb_enc;
> +	u32 maxlinewidth;
>   };
>   
>   static inline struct dpu_wb_connector *to_dpu_wb_conn(struct drm_writeback_connector *conn)
> @@ -26,6 +27,6 @@ static inline struct dpu_wb_connector *to_dpu_wb_conn(struct drm_writeback_conne
>   }
>   
>   int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
> -		const u32 *format_list, u32 num_formats);
> +		const u32 *format_list, u32 num_formats, u32 maxlinewidth);
>   
>   #endif /*_DPU_WRITEBACK_H */
