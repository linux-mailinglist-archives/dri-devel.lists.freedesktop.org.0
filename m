Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64157FC076
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 18:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8626B10E08B;
	Tue, 28 Nov 2023 17:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE7910E08B;
 Tue, 28 Nov 2023 17:43:03 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ASHUGC3014049; Tue, 28 Nov 2023 17:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=b/cVlRF/WxN1lPuFMmDlspdw8SFU+pBUIfULsoUv1SU=;
 b=NP39tZhvjgS1sLZplIDAWA/yvfb0llnc71T8r22REfgvR5lEh3milAfyDKgTSMTxe5zD
 fCyhcFaMXT2v1b5C1AH2CEGbfdhVB707rZvdYpU8QQTD7XhUXhZpcQpNTaeMrb46et6d
 AEYNwLYMFOnpk4Oh28lSTNylignnjrpxZ7NJQeahj14RwgHX1GuN/lETkAe/TA1s95iI
 aaRFL0iiALU0GVg1oXlJcX3dtyWYw64cOsEEBo4EumyRtaGAd8tzCwCRo4YDF0LAtsUp
 IGOLhgV8zJigdfZFhVVmSPMaBNENu4Pk9pRLU847xtcGdy3iVpsO87+B6+OBxAojm/PU AQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ungru8wmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Nov 2023 17:42:59 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ASHgwDh007333
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Nov 2023 17:42:58 GMT
Received: from [10.71.111.96] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 28 Nov
 2023 09:42:58 -0800
Message-ID: <cf850520-0906-0291-fd21-be8cd687bcde@quicinc.com>
Date: Tue, 28 Nov 2023 09:42:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/msm/dpu: Capture dpu snapshot when frame_done_timer
 timeouts
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231128011122.14711-1-quic_parellan@quicinc.com>
 <CAA8EJpprP7mQLm47d07AtNRjLtpQCSAw5PuXjwGXNO2rXVUPZw@mail.gmail.com>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <CAA8EJpprP7mQLm47d07AtNRjLtpQCSAw5PuXjwGXNO2rXVUPZw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jAaFZnu0kmzc0cUgNUhlm6zCfRKhytFO
X-Proofpoint-ORIG-GUID: jAaFZnu0kmzc0cUgNUhlm6zCfRKhytFO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_19,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280141
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/27/2023 5:48 PM, Dmitry Baryshkov wrote:
> On Tue, 28 Nov 2023 at 03:12, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>> Trigger a devcoredump to dump dpu registers and capture the drm atomic
>> state when the frame_done_timer timeouts.
>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 1cf7ff6caff4..5cf7594feb5a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -191,6 +191,7 @@ struct dpu_encoder_virt {
>>          void *crtc_frame_event_cb_data;
>>
>>          atomic_t frame_done_timeout_ms;
>> +       atomic_t frame_done_timeout_cnt;
>>          struct timer_list frame_done_timer;
>>
>>          struct msm_display_info disp_info;
>> @@ -1204,6 +1205,8 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>>
>>          dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
>>
>> +       atomic_set(&dpu_enc->frame_done_timeout_cnt, 0);
>> +
>>          if (disp_info->intf_type == INTF_DP)
>>                  dpu_enc->wide_bus_en = msm_dp_wide_bus_available(priv->dp[index]);
>>          else if (disp_info->intf_type == INTF_DSI)
>> @@ -2115,11 +2118,12 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
>>          for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>>                  struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>>
>> -               seq_printf(s, "intf:%d  wb:%d  vsync:%8d     underrun:%8d    ",
>> +               seq_printf(s, "intf:%d  wb:%d  vsync:%8d     underrun:%8d    frame_done_cnt:%d",
>>                                  phys->hw_intf ? phys->hw_intf->idx - INTF_0 : -1,
>>                                  phys->hw_wb ? phys->hw_wb->idx - WB_0 : -1,
>>                                  atomic_read(&phys->vsync_cnt),
>> -                               atomic_read(&phys->underrun_cnt));
>> +                               atomic_read(&phys->underrun_cnt),
>> +                               atomic_read(&dpu_enc->frame_done_timeout_cnt));
>>
>>                  seq_printf(s, "mode: %s\n", dpu_encoder_helper_get_intf_type(phys->intf_mode));
>>          }
>> @@ -2341,6 +2345,10 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
>>
>>          DPU_ERROR_ENC(dpu_enc, "frame done timeout\n");
>>
>> +       atomic_inc(&dpu_enc->frame_done_timeout_cnt);
>> +       if (atomic_read(&dpu_enc->frame_done_timeout_cnt) == 1)
>> +               msm_disp_snapshot_state(drm_enc->dev);
> atomic_inc_and_test(), please

Hi Dmitry,

We only want to create a snapshot for the first instance in which the 
timer timeouts. atomic_int_and_test() increments the value and then 
returns whether it has a value of zero or not. FWIW I think I should 
change it to 'atomic_add_return(1, &dpu_enc->frame_done_timeout_cnt)' so 
that we can check only when this value equals one.

Thank you,

Paloma

>
>> +
>>          event = DPU_ENCODER_FRAME_EVENT_ERROR;
>>          trace_dpu_enc_frame_done_timeout(DRMID(drm_enc), event);
>>          dpu_enc->crtc_frame_event_cb(dpu_enc->crtc_frame_event_cb_data, event);
>> @@ -2392,6 +2400,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>>                  goto fail;
>>
>>          atomic_set(&dpu_enc->frame_done_timeout_ms, 0);
>> +       atomic_set(&dpu_enc->frame_done_timeout_cnt, 0);
>>          timer_setup(&dpu_enc->frame_done_timer,
>>                          dpu_encoder_frame_done_timeout, 0);
>>
>> --
>> 2.41.0
>>
>
