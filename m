Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714AC800076
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 01:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D9510E7A1;
	Fri,  1 Dec 2023 00:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7E910E07A;
 Fri,  1 Dec 2023 00:45:36 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AUNPPG4008774; Fri, 1 Dec 2023 00:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=q2j5esPb16Qm1SQeGYN2u5lLfs7OVmpQAPEFRVX9gXQ=;
 b=WpDLp+a/mwOY/1j+hS4unOA/Uimn4mimn8/zWSXKnhZFdADAjBvffbjfjp9RLLjlyoQM
 cTHg6zt1BOTlaQOMZPLoES8PhKWSqmdQJu8CwrES8Y3GUh3IhttTR8pkLI3lLt+VZvvo
 cpgNzvTN/iJcg5RY1BJdmP6gJUXAAoccrOqwg4uNB3V0ouscPB3VZtKFCRRp7J8Yo7mk
 +gAnkBCm9lfRE4YAx5BIpC7zs5DcTj9mgVIcsyeBxmuhg6hPe8ityrV1RG0+vEo3KU13
 XZwqsOPmeO4YR8qYdzEZIjxH+tFOZ/3Cm4yNLGb91czNVunEVYpSCgfgwQJCMkXjxJDK Rg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upjdqb01e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 00:45:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B10jSEv011158
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 00:45:28 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 30 Nov
 2023 16:45:27 -0800
Message-ID: <bb4d24c7-71d4-25ce-886f-81bc77adf67c@quicinc.com>
Date: Thu, 30 Nov 2023 16:45:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 13/16] drm/msm/dpu: reserve cdm blocks for writeback in
 case of YUV output
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-14-quic_abhinavk@quicinc.com>
 <CAA8EJpr=BJFuyeerO=6G9cz80vtCNsassXskZ+7uC4cSvDBeAw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpr=BJFuyeerO=6G9cz80vtCNsassXskZ+7uC4cSvDBeAw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dPc8K0vqW-aMpWJIqgCo2jrE4JuKkAvL
X-Proofpoint-ORIG-GUID: dPc8K0vqW-aMpWJIqgCo2jrE4JuKkAvL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_25,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=713 lowpriorityscore=0
 clxscore=1015 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010004
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/30/2023 5:23 PM, Dmitry Baryshkov wrote:
> On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Reserve CDM blocks for writeback if the format of the output fb
>> is YUV. At the moment, the reservation is done only for writeback
>> but can easily be extended by relaxing the checks once other
>> interfaces are ready to output YUV.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 35 ++++++++++++++++++++-
>>   1 file changed, 34 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 1b1e07292a9e..7a3d179bdfba 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -16,6 +16,7 @@
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_file.h>
>>   #include <drm/drm_probe_helper.h>
>> +#include <drm/drm_framebuffer.h>
>>
>>   #include "msm_drv.h"
>>   #include "dpu_kms.h"
>> @@ -615,9 +616,11 @@ static int dpu_encoder_virt_atomic_check(
>>          struct drm_display_mode *adj_mode;
>>          struct msm_display_topology topology;
>>          struct dpu_global_state *global_state;
>> +       struct drm_framebuffer *fb;
>>          struct drm_dsc_config *dsc;
>>          int i = 0;
>>          int ret = 0;
>> +       bool needs_cdm = false;
>>
>>          if (!drm_enc || !crtc_state || !conn_state) {
>>                  DPU_ERROR("invalid arg(s), drm_enc %d, crtc/conn state %d/%d\n",
>> @@ -655,6 +658,22 @@ static int dpu_encoder_virt_atomic_check(
>>
>>          topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
>>
>> +       /*
>> +        * Use CDM only for writeback at the moment as other interfaces cannot handle it.
>> +        * if writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
>> +        * earlier.
>> +        */
>> +       if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
>> +               fb = conn_state->writeback_job->fb;
>> +
>> +               if (fb && DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))))
>> +                       needs_cdm = true;
>> +               if (needs_cdm && !dpu_enc->cur_master->hw_cdm)
>> +                       crtc_state->mode_changed = true;
>> +               else if (!needs_cdm && dpu_enc->cur_master->hw_cdm)
>> +                       crtc_state->mode_changed = true;
>> +       }
> 
> What would be the (estimated) check for DP?
> 

Originally we were planning a lot more but now we are going to start 
with the mode being drm_mode_is_420_only and use CDM for that.

>> +
>>          /*
>>           * Release and Allocate resources on every modeset
>>           * Dont allocate when active is false.
>> @@ -664,7 +683,7 @@ static int dpu_encoder_virt_atomic_check(
>>
>>                  if (!crtc_state->active_changed || crtc_state->enable)
>>                          ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>> -                                       drm_enc, crtc_state, topology, false);
>> +                                       drm_enc, crtc_state, topology, needs_cdm);
>>          }
>>
>>          trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
>> @@ -1126,6 +1145,20 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>
>>          dpu_enc->dsc_mask = dsc_mask;
>>
>> +       if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
>> +               struct dpu_hw_blk *hw_cdm = NULL;
>> +               struct drm_framebuffer *fb;
>> +
>> +               fb = conn_state->writeback_job->fb;
>> +
>> +               if (fb && DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb)))) {
> 
> You can drop all fb-related conditions here. If we have CDM, we know
> that we asked for it. If we do not, it's because we do not need it.
> 

hmmm .... let me do some testing with this and if it works I will make 
this change as well. Thanks.

>> +                       dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>> +                                                     drm_enc->base.id, DPU_HW_BLK_CDM,
>> +                                                     &hw_cdm, 1);
>> +               }
>> +               dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
>> +       }
>> +
>>          cstate = to_dpu_crtc_state(crtc_state);
>>
>>          for (i = 0; i < num_lm; i++) {
>> --
>> 2.40.1
>>
> 
> 
