Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FEF73BA3A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 16:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AF110E63F;
	Fri, 23 Jun 2023 14:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E7610E63F;
 Fri, 23 Jun 2023 14:33:45 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35NDd6Lv028366; Fri, 23 Jun 2023 14:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NBK2ikwut+xkO+7cwsrjlW443RlA4CBiPCwlB76Lsx0=;
 b=ARoJZpcSC6CagbpHzBGQXEiudQiX0/8M5/qsqOPfMoTq7+ju8Az2tnWzO381bsJS7mpR
 tzXM0fBRFWTHh8xbGw4vv+eE6mvk8z6NsY8CcI/KxPPatgjBZWF4qB4xlbn/FR4jkcSk
 zNmqEdhOvtm/T6ybpvVOGesPA3SdO+YoTihPtfN3NPrn7f3l3XtDSf2MqBABRdBG7H+S
 dgwXnxBGxD1SRrkNugW+8Z4hq8qkcqUXoSM/2jx7C/rNnbfPUuZsHx0lkxFmIwQVnKhV
 bsXiXtBH47/HdMxYDjf/j13uNQwbTv+bIHiT6WotN+5oTeGNUFKg2iBEsiBidQ6ThCvj yg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rbwvme85y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 14:33:38 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35NEXaWE029462
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 14:33:37 GMT
Received: from [10.110.61.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 23 Jun
 2023 07:33:35 -0700
Message-ID: <f3efef59-1f0f-368e-6d69-f61865c26521@quicinc.com>
Date: Fri, 23 Jun 2023 07:33:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 1/2] drm/msm/dpu: retrieve DSI DSC struct through
 priv->dsi[0]
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1687454686-10340-1-git-send-email-quic_khsieh@quicinc.com>
 <1687454686-10340-2-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpoc+4Hx221Zf0i8yhRxFQ9BhgZ5H5QQ5EvwpAarXFu8Gg@mail.gmail.com>
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpoc+4Hx221Zf0i8yhRxFQ9BhgZ5H5QQ5EvwpAarXFu8Gg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: HyRY2zuL8RWG19B8xMTyS-z7wNKyxSP7
X-Proofpoint-GUID: HyRY2zuL8RWG19B8xMTyS-z7wNKyxSP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_08,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxlogscore=978 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306230131
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/22/2023 11:36 AM, Dmitry Baryshkov wrote:
> On Thu, 22 Jun 2023 at 20:25, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>> Currently struct drm_dsc_config for DSI is populated at display
>> setup during system boot up. This mechanism works fine with
>> embedded display but not for pluggable displays as the
>> struct drm_dsc_config will become stale once external display
>> is unplugged.
>>
> Nit: "In preparation of adding support for DP DSC..."
>
> If you don't mind, I'll append this phrase while applying the patch.
please, thank for your helps.
>
>> Move storing of DSI DSC struct to atomic_enable() so that same
>> mechanism will work for both embedded display and pluggable
>> displays.
>>
>> Changes in v4:
>> -- fix checkpatch.pl warning
>>
>> Changes in v5:
>> -- delete dpu_encoder_get_dsc_config() from atomic_mode_set
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 42 ++++++++++++++++++++---------
>>   1 file changed, 30 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 2e1873d..edc559d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -543,11 +543,24 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>>          return (num_dsc > 0) && (num_dsc > intf_count);
>>   }
>>
>> +static struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
>> +{
>> +       struct msm_drm_private *priv = drm_enc->dev->dev_private;
>> +       struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>> +       int index = dpu_enc->disp_info.h_tile_instance[0];
>> +
>> +       if (dpu_enc->disp_info.intf_type == INTF_DSI)
>> +               return msm_dsi_get_dsc_config(priv->dsi[index]);
>> +
>> +       return NULL;
>> +}
>> +
>>   static struct msm_display_topology dpu_encoder_get_topology(
>>                          struct dpu_encoder_virt *dpu_enc,
>>                          struct dpu_kms *dpu_kms,
>>                          struct drm_display_mode *mode,
>> -                       struct drm_crtc_state *crtc_state)
>> +                       struct drm_crtc_state *crtc_state,
>> +                       struct drm_dsc_config *dsc)
>>   {
>>          struct msm_display_topology topology = {0};
>>          int i, intf_count = 0;
>> @@ -579,7 +592,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
>>
>>          topology.num_intf = intf_count;
>>
>> -       if (dpu_enc->dsc) {
>> +       if (dsc) {
>>                  /*
>>                   * In case of Display Stream Compression (DSC), we would use
>>                   * 2 DSC encoders, 2 layer mixers and 1 interface
>> @@ -605,6 +618,7 @@ static int dpu_encoder_virt_atomic_check(
>>          struct drm_display_mode *adj_mode;
>>          struct msm_display_topology topology;
>>          struct dpu_global_state *global_state;
>> +       struct drm_dsc_config *dsc;
>>          int i = 0;
>>          int ret = 0;
>>
>> @@ -640,7 +654,9 @@ static int dpu_encoder_virt_atomic_check(
>>                  }
>>          }
>>
>> -       topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
>> +       dsc = dpu_encoder_get_dsc_config(drm_enc);
>> +
>> +       topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
>>
>>          /*
>>           * Release and Allocate resources on every modeset
>> @@ -1072,14 +1088,12 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>                  dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
>>                                                  : NULL;
>>
>> -       if (dpu_enc->dsc) {
>> -               num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>> -                                                       drm_enc->base.id, DPU_HW_BLK_DSC,
>> -                                                       hw_dsc, ARRAY_SIZE(hw_dsc));
>> -               for (i = 0; i < num_dsc; i++) {
>> -                       dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
>> -                       dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
>> -               }
>> +       num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>> +                                               drm_enc->base.id, DPU_HW_BLK_DSC,
>> +                                               hw_dsc, ARRAY_SIZE(hw_dsc));
>> +       for (i = 0; i < num_dsc; i++) {
>> +               dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
>> +               dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
>>          }
>>
>>          dpu_enc->dsc_mask = dsc_mask;
>> @@ -1187,6 +1201,8 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>>
>>          dpu_enc = to_dpu_encoder_virt(drm_enc);
>>
>> +       dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
>> +
>>          mutex_lock(&dpu_enc->enc_lock);
>>          cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
>>
>> @@ -2109,8 +2125,10 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>>                                          phys_enc->hw_pp->merge_3d->idx);
>>          }
>>
>> -       if (dpu_enc->dsc)
>> +       if (dpu_enc->dsc) {
>>                  dpu_encoder_unprep_dsc(dpu_enc);
>> +               dpu_enc->dsc = NULL;
>> +       }
>>
>>          intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>>          intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>> --
>> 2.7.4
>>
>
