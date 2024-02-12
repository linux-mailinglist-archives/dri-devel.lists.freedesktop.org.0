Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1654851D0E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 19:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7861810E59E;
	Mon, 12 Feb 2024 18:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="P7mFXT5+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB16510E59E;
 Mon, 12 Feb 2024 18:43:20 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41CC9FDc025596; Mon, 12 Feb 2024 18:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=2lRD5Dd0AwXbDvgCUJCpzOmZfZq6gZvy4b/lpffqpVA=; b=P7
 mFXT5+10GjyR2KKBKOPtTHERu9WvgTTMj7z6L5fHBuIL/KtLpJSRTOBpRy3FRcrl
 1YpS1jcE6ilTN2t+vrXytVrPK0ekMpUqQXCeqpYYbDuYs9hVTM3hnxLaAMI6zWLP
 MAaFPRuHD0NLmoH0uSRG0NiSw5U5O2UTJMxG5xxopqu8zJcFvsN9jg9/krgp/2nQ
 bzcB1k0p8bDIYZSTUq/fuuNJJtY95V2xilI3CkyCYioni2SUSsdmbKiYCc/unNjG
 Gqz5uQGWQRiEdgBSYFq1IzW+sJU6hHwVmO5s5s5j56+XTKGmWK4l8UraoWNCYOqe
 OzDMxFqpBJXJ1x1J1xhQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w62nwm6du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Feb 2024 18:43:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41CIhGea022680
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Feb 2024 18:43:16 GMT
Received: from [10.71.111.96] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 12 Feb
 2024 10:43:15 -0800
Message-ID: <a48f14ff-611e-e9d6-368b-89578d31b0bb@quicinc.com>
Date: Mon, 12 Feb 2024 10:43:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 17/19] drm/msm/dpu: modify timing engine programming
 for YUV420 over DP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
 <quic_khsieh@quicinc.com>, <marijn.suijten@somainline.org>,
 <neil.armstrong@linaro.org>
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-18-quic_parellan@quicinc.com>
 <CAA8EJprVnNmmpcOpHYOhZvLOGdny2ohqscWyUM8JwT8AGh2tCA@mail.gmail.com>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <CAA8EJprVnNmmpcOpHYOhZvLOGdny2ohqscWyUM8JwT8AGh2tCA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: XaBCVzZtEa6mYeTnr_NisjIIx4mzdHhU
X-Proofpoint-ORIG-GUID: XaBCVzZtEa6mYeTnr_NisjIIx4mzdHhU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_16,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=798 spamscore=0
 adultscore=0 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402120143
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


On 2/10/2024 2:50 AM, Dmitry Baryshkov wrote:
> On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>> Adjust the encoder timing engine setup programming in the case of video
>> mode for YUV420 over DP to accommodate CDM.
>>
>> Changes in v2:
>>          - Move timing engine programming to this patch
>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> index 3f102b2813ca8..fb46d907312a7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> @@ -235,8 +235,9 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>>   {
>>          struct drm_display_mode mode;
>>          struct dpu_hw_intf_timing_params timing_params = { 0 };
>> +       struct dpu_hw_cdm *hw_cdm;
>>          const struct dpu_format *fmt = NULL;
>> -       u32 fmt_fourcc = DRM_FORMAT_RGB888;
>> +       u32 fmt_fourcc;
>>          unsigned long lock_flags;
>>          struct dpu_hw_intf_cfg intf_cfg = { 0 };
>>
>> @@ -255,17 +256,21 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>>          DPU_DEBUG_VIDENC(phys_enc, "enabling mode:\n");
>>          drm_mode_debug_printmodeline(&mode);
>>
>> -       if (phys_enc->split_role != ENC_ROLE_SOLO) {
>> +       fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc);
>> +
>> +       if (phys_enc->split_role != ENC_ROLE_SOLO || fmt_fourcc == DRM_FORMAT_YUV420) {
>>                  mode.hdisplay >>= 1;
>>                  mode.htotal >>= 1;
>>                  mode.hsync_start >>= 1;
>>                  mode.hsync_end >>= 1;
>> +               mode.hskew >>= 1;
> hskew change seems to warrant a separate patch with Fixes for
> 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")


Ack


>
>>                  DPU_DEBUG_VIDENC(phys_enc,
>> -                       "split_role %d, halve horizontal %d %d %d %d\n",
>> +                       "split_role %d, halve horizontal %d %d %d %d %d\n",
>>                          phys_enc->split_role,
>>                          mode.hdisplay, mode.htotal,
>> -                       mode.hsync_start, mode.hsync_end);
>> +                       mode.hsync_start, mode.hsync_end,
>> +                       mode.hskew);
>>          }
>>
>>          drm_mode_to_intf_timing_params(phys_enc, &mode, &timing_params);
>> @@ -273,6 +278,9 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>>          fmt = dpu_get_dpu_format(fmt_fourcc);
>>          DPU_DEBUG_VIDENC(phys_enc, "fmt_fourcc 0x%X\n", fmt_fourcc);
>>
>> +       hw_cdm = phys_enc->hw_cdm;
>> +       if (hw_cdm)
>> +               intf_cfg.cdm = hw_cdm->idx;
> No need for a separate local variable.


Ack


>
>>          intf_cfg.intf = phys_enc->hw_intf->idx;
>>          intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
>>          intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>> --
>> 2.39.2
>>
>
