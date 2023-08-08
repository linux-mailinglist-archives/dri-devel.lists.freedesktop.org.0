Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 476EE773568
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 02:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57D010E06B;
	Tue,  8 Aug 2023 00:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8480110E06B;
 Tue,  8 Aug 2023 00:33:59 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3780WrEq014902; Tue, 8 Aug 2023 00:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WMFAHO81Ehu/mXvWjylWdRrhxiHNUS08a5q96AhxYYE=;
 b=MEwMN5X8DzBgOkeQR9nMWVE3cMPFPrubMsYiijj46txV3cXrcj2/VBOEhmHqlOmAjxOa
 0Usoe/5rB/zMk6srNxQ0XLn8t8dMIj72fTxuo3QSp2xR+qhV7NDLRhIr3iwghgkP9apE
 h+JDRNcxzV/ege8vKmZYR2kwEVhu5tytm1syguOeZxtioJDREq4Ka1GELaoS3yoYBSGo
 dkJSKGp+Fi/WA1NBhH5lfo67CW92GifeIR0xiUISCNSe2NKswCjkpUr2BB4DQZfP+hzN
 loJRYWl6epRx8YJdtFPf/lxGE5RD4f0wC5Ple1te/HS8eiab8a4+u+n62L1fg23I6Cq6 3w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sax18sp06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Aug 2023 00:33:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3780XhLt022254
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 8 Aug 2023 00:33:43 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 7 Aug
 2023 17:33:42 -0700
Message-ID: <9a2e3ab2-a95f-3dee-b89c-aa69ffd9387e@quicinc.com>
Date: Mon, 7 Aug 2023 17:33:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dpu: move writeback's
 atomic_check to dpu_writeback.c
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230519023011.3837868-1-dmitry.baryshkov@linaro.org>
 <20230519023011.3837868-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230519023011.3837868-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hxdK-WwxXfS0xJ2psYBZvdCNNmsnLAJZ
X-Proofpoint-ORIG-GUID: hxdK-WwxXfS0xJ2psYBZvdCNNmsnLAJZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_27,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308080003
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/18/2023 7:30 PM, Dmitry Baryshkov wrote:
> dpu_encoder_phys_wb is the only user of encoder's atomic_check callback.
> Move corresponding checks to drm_writeback_connector's implementation
> and drop the dpu_encoder_phys_wb_atomic_check() function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

I dont think this is correct even though I can make writeback work with 
these. The issue is that, in the recent changes which I was holding back 
posting till I reviewed this, I use the API 
drm_atomic_helper_check_wb_encoder_state() to check the supported 
formats in writeback (something which should have been present from the 
beginning).

It seems incorrect to call this from the connector's atomic_check.

And I checked the writeback job validation across other vendor drivers 
and the validation seems to be in encoder's atomic_check and not the 
connector's.

I dont want to break that pattern for MSM alone.

>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 54 ------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 57 ++++++++++++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  3 +-
>   4 files changed, 60 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index e14646c0501c..e73d5284eb2a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -225,59 +225,6 @@ static void dpu_encoder_phys_wb_setup_cdp(struct dpu_encoder_phys *phys_enc)
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
> -	return 0;
> -}
> -
> -
>   /**
>    * _dpu_encoder_phys_wb_update_flush - flush hardware update
>    * @phys_enc:	Pointer to physical encoder
> @@ -652,7 +599,6 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
>   	ops->enable = dpu_encoder_phys_wb_enable;
>   	ops->disable = dpu_encoder_phys_wb_disable;
>   	ops->destroy = dpu_encoder_phys_wb_destroy;
> -	ops->atomic_check = dpu_encoder_phys_wb_atomic_check;
>   	ops->wait_for_commit_done = dpu_encoder_phys_wb_wait_for_commit_done;
>   	ops->prepare_for_kickoff = dpu_encoder_phys_wb_prepare_for_kickoff;
>   	ops->handle_post_kickoff = dpu_encoder_phys_wb_handle_post_kickoff;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 10bd0fd4ff48..78b8e7fc1de8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -661,8 +661,8 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
>   		return PTR_ERR(encoder);
>   	}
>   
> -	rc = dpu_writeback_init(dev, encoder, wb_formats,
> -			n_formats);
> +	rc = dpu_writeback_init(dev, encoder, wb_formats, n_formats,
> +				dpu_rm_get_wb(&dpu_kms->rm, info.h_tile_instance[0])->caps->maxlinewidth);
>   	if (rc) {
>   		DPU_ERROR("dpu_writeback_init, rc = %d\n", rc);
>   		drm_encoder_cleanup(encoder);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> index 2a5a68366582..7f345a5c8be3 100644
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
> +	return 0;
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
