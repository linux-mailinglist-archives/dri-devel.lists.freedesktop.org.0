Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F91FA2B6BA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 00:50:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D3410E9B1;
	Thu,  6 Feb 2025 23:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="R8ltG564";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B1110E0B0;
 Thu,  6 Feb 2025 23:50:03 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516LpOeN016821;
 Thu, 6 Feb 2025 23:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NiordE/s0euCUZ6Ltf92B+aT43Ccp14BRhTbVyEftas=; b=R8ltG564Hmw/ZM3L
 IxsqE+ta/4yhD2jIRApbxYN1jjJTsMQ5XBR8JHiqpSlROyOEoDXvGOmUcZ7ma2ri
 cZ0+/4Yqtw+c7iHy//qlsPzB/e18g6izcDiGcqQzhO7D5BCSDpSAaP90ZdJoMJcP
 jBk5JZI2e5u0aMjx+NMXN4qva/Boa7DGQciFwx9/lAYZgCL57aP75rrgU+ezaBY+
 LybLyxnfNiSqUi+daORXX68MNFJHAKmQFW4uaLcm9mlDkAysnwnUSdwbc7zrG8Sy
 tp0wUWdENkYmnccRJU9pczOhXYPUXRSuYgIqDlMd+nQvPSI5zrrUdBOfhpon6dDa
 C+dFsw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mtsa1x7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Feb 2025 23:49:55 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 516NnsR2013498
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 6 Feb 2025 23:49:54 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Feb 2025
 15:49:53 -0800
Message-ID: <16986655-0c51-49ac-8088-6548317be7e6@quicinc.com>
Date: Thu, 6 Feb 2025 15:49:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/14] drm/msm/dpu: move resource allocation to CRTC
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>, <quic_ebharadw@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
 <20250128-concurrent-wb-v5-2-6464ca5360df@quicinc.com>
 <34zk3jbcjlbux7737t2ve3xcwbt2uxsalbqih6os4ykqeklyfa@phy4izanhn3d>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <34zk3jbcjlbux7737t2ve3xcwbt2uxsalbqih6os4ykqeklyfa@phy4izanhn3d>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: bKS3qhzkE6s_pjuKdb4ld8bcC3pMiXr9
X-Proofpoint-ORIG-GUID: bKS3qhzkE6s_pjuKdb4ld8bcC3pMiXr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_07,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 adultscore=0 bulkscore=0 mlxlogscore=971
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060185
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/29/2025 2:04 PM, Dmitry Baryshkov wrote:
> On Tue, Jan 28, 2025 at 07:20:34PM -0800, Jessica Zhang wrote:
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> All resource allocation is centered around the LMs. Then other blocks
>> (except DSCs) are allocated basing on the LMs that was selected, and LM
>> powers up the CRTC rather than the encoder.
>>
>> Moreover if at some point the driver supports encoder cloning,
>> allocating resources from the encoder will be incorrect, as all clones
>> will have different encoder IDs, while LMs are to be shared by these
>> encoders.
>>
>> In addition, move mode_changed() to dpu_crtc as encoder no longer has
>> access to topology information
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>
>> ---
>> Changes in v5:
>> - Reordered to prevent breaking CI and upon partial applciation
>> - Moved mode_changed() from dpu_encoder to dpu_crtc
>> - Dropped dpu_encoder_needs_dsc_merge() refactor to clean up commit
>> - In dpu_encoder_update_topology(), grab DSC config using dpu_encoder
>>    helper as dpu_encoder->dsc hasn't been set yet
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  79 +++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |   2 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 174 +++++++++-------------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  11 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  19 +--
>>   5 files changed, 144 insertions(+), 141 deletions(-)
>>
> 
>> -/**
>> - * dpu_encoder_virt_check_mode_changed: check if full modeset is required
>> - * @drm_enc:    Pointer to drm encoder structure
>> - * @crtc_state:	Corresponding CRTC state to be checked
>> - * @conn_state: Corresponding Connector's state to be checked
>> - *
>> - * Check if the changes in the object properties demand full mode set.
>> - */
>> -int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
>> -					struct drm_crtc_state *crtc_state,
>> -					struct drm_connector_state *conn_state)
>> +bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state)
>>   {
>> +	struct drm_connector *connector;
>> +	struct drm_connector_state *conn_state;
>> +	struct drm_framebuffer *fb;
>>   	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>> -	struct msm_display_topology topology;
>> -
>> -	DPU_DEBUG_ENC(dpu_enc, "\n");
>> -
>> -	/* Using mode instead of adjusted_mode as it wasn't computed yet */
>> -	topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode, crtc_state, conn_state);
>> -
>> -	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
>> -		crtc_state->mode_changed = true;
>> -	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
>> -		crtc_state->mode_changed = true;
>> -
>> -	return 0;
>> -}
>> -
>> -static int dpu_encoder_virt_atomic_check(
>> -		struct drm_encoder *drm_enc,
>> -		struct drm_crtc_state *crtc_state,
>> -		struct drm_connector_state *conn_state)
>> -{
>> -	struct dpu_encoder_virt *dpu_enc;
>> -	struct msm_drm_private *priv;
>> -	struct dpu_kms *dpu_kms;
>> -	struct drm_display_mode *adj_mode;
>> -	struct msm_display_topology topology;
>> -	struct dpu_global_state *global_state;
>> -	int ret = 0;
>> -
>> -	if (!drm_enc || !crtc_state || !conn_state) {
>> -		DPU_ERROR("invalid arg(s), drm_enc %d, crtc/conn state %d/%d\n",
>> -				drm_enc != NULL, crtc_state != NULL, conn_state != NULL);
>> -		return -EINVAL;
>> -	}
>> -
>> -	dpu_enc = to_dpu_encoder_virt(drm_enc);
>> -	DPU_DEBUG_ENC(dpu_enc, "\n");
>> -
>> -	priv = drm_enc->dev->dev_private;
>> -	dpu_kms = to_dpu_kms(priv->kms);
>> -	adj_mode = &crtc_state->adjusted_mode;
>> -	global_state = dpu_kms_get_global_state(crtc_state->state);
>> -	if (IS_ERR(global_state))
>> -		return PTR_ERR(global_state);
>>   
>> -	trace_dpu_enc_atomic_check(DRMID(drm_enc));
>> +	if (!drm_enc || !state)
>> +		return false;
>>   
>> -	topology = dpu_encoder_get_topology(dpu_enc, adj_mode, crtc_state, conn_state);
>> +	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
>> +	if (!connector)
>> +		return false;
>>   
>> -	/*
>> -	 * Release and Allocate resources on every modeset
>> -	 */
>> -	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>> -		dpu_rm_release(global_state, drm_enc);
>> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
>>   
>> -		if (crtc_state->enable)
>> -			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>> -					drm_enc, crtc_state, &topology);
>> +	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
>> +		fb = conn_state->writeback_job->fb;
>> +		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb))) {
>> +			if (!dpu_enc->cur_master->hw_cdm)
>> +				return true;
>> +		} else {
>> +			if (dpu_enc->cur_master->hw_cdm)
>> +				return true;
>> +		}
> 
> Nit: this is duplicating a part of the dpu_encoder_update_topology(). It
> would be nice to have a comment here. If there is no need for a new
> versoion, I can probably write something when applying.

Sure, I can add a note that we need to duplicate these checks in 
*_needs_modeset() since topology info is not stored in the encoder or crtc

Thanks,

Jessica Zhang

> 
>>   	}
>>   
>> -	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
>> -
>> -	return ret;
>> +	return false;
>>   }
>>   
>>   static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>> @@ -2612,7 +2545,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>>   	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
>>   	.atomic_disable = dpu_encoder_virt_atomic_disable,
>>   	.atomic_enable = dpu_encoder_virt_atomic_enable,
>> -	.atomic_check = dpu_encoder_virt_atomic_check,
>>   };
>>   
>>   static const struct drm_encoder_funcs dpu_encoder_funcs = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> index da133ee4701a329f566f6f9a7255f2f6d050f891..b0ac10ebd02c2b63e6f6f9010a22cdace931cf3b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> @@ -80,6 +80,13 @@ int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos);
>>   
>>   bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc);
>>   
>> +void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
>> +				 struct msm_display_topology *topology,
>> +				 struct drm_atomic_state *state,
>> +				 const struct drm_display_mode *adj_mode);
>> +
>> +bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state);
>> +
>>   void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
>>   		struct drm_writeback_job *job);
>>   
>> @@ -88,8 +95,4 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
>>   
>>   bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
>>   
>> -int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
>> -					struct drm_crtc_state *crtc_state,
>> -					struct drm_connector_state *conn_state);
>> -
>>   #endif /* __DPU_ENCODER_H__ */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 5ce06e25990cb70284d3c3f04ac1e1e1bed6142a..c6b3b2e147b4c61ec93db4a9f01d5a288d2b9eb2 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -449,24 +449,11 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
>>   static int dpu_kms_check_mode_changed(struct msm_kms *kms, struct drm_atomic_state *state)
>>   {
>>   	struct drm_crtc_state *new_crtc_state;
>> -	struct drm_connector *connector;
>> -	struct drm_connector_state *new_conn_state;
>> +	struct drm_crtc *crtc;
>>   	int i;
>>   
>> -	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
>> -		struct drm_encoder *encoder;
>> -
>> -		WARN_ON(!!new_conn_state->best_encoder != !!new_conn_state->crtc);
>> -
>> -		if (!new_conn_state->crtc || !new_conn_state->best_encoder)
>> -			continue;
>> -
>> -		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
>> -
>> -		encoder = new_conn_state->best_encoder;
>> -
>> -		dpu_encoder_virt_check_mode_changed(encoder, new_crtc_state, new_conn_state);
>> -	}
>> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
>> +		dpu_crtc_check_mode_changed(new_crtc_state);
>>   
>>   	return 0;
>>   }
>>
>> -- 
>> 2.34.1
>>
> 
> -- 
> With best wishes
> Dmitry

