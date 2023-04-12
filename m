Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4C86E001E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 22:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C439C10E97A;
	Wed, 12 Apr 2023 20:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F61A10E974;
 Wed, 12 Apr 2023 20:48:20 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33CGZes6004739; Wed, 12 Apr 2023 20:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=M0AD91B5lmmGKZiHC7qIp+1fk71sCcaaYSOVAZdRbr8=;
 b=YsjqYohzqOLan9Ql9Pd9q2GWGHtNa6klM2ptrx2V9FU7mc4AS0NWxSmARpRzXCO7gZey
 pEg5qIj/Xex3vSbW0b2sFbM4ru4hVu6xvJfKFY/DAeXS3GJDCkjEV6Qf98/FGXmKLwJH
 qdZIDHGrxaP77scSyXs6zkxGnu/RFarj1E7X3FFmyAcuCuAPsOagYkyNXMzDVBOZEUZw
 NVT/zX1zqYFyPqWUmCzcK6bypu8D6duftX3tDvXyoRob/vcGaT1HQ662FxzceHy5A9qW
 oo4SB6UAwGSGlnt9vllavpFltM1LEu3yooc6imaUVMiDUmwu/bNCNJQzY5Fow0kPLoiK 8w== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pwqenst61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 20:48:17 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33CKmGF2025914
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 20:48:16 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 12 Apr
 2023 13:48:16 -0700
Message-ID: <cb4b256d-8105-df40-7ff9-d6dceba949be@quicinc.com>
Date: Wed, 12 Apr 2023 13:48:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [Freedreno] [PATCH v5 1/8] drm/msm/dsi: use new helpers for DSC
 setup
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v5-1-0108401d7886@quicinc.com>
 <e0ff8203-8fdb-4833-92cf-447ccb823f8f@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <e0ff8203-8fdb-4833-92cf-447ccb823f8f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: kMi35gN8CsCme6bJW9W5ZLnpjC_17YBZ
X-Proofpoint-ORIG-GUID: kMi35gN8CsCme6bJW9W5ZLnpjC_17YBZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_11,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120176
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/12/2023 12:10 PM, Dmitry Baryshkov wrote:
> On 12/04/2023 22:09, Jessica Zhang wrote:
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Use new DRM DSC helpers to setup DSI DSC configuration. The
>> initial_scale_value needs to be adjusted according to the standard, but
>> this is a separate change.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Since you are resending this patch, you should also include your S-o-b tag.

Hi Dmitry,

Acked.

Thanks,

Jessica Zhang

> 
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 61 
>> +++++---------------------------------
>>   1 file changed, 8 insertions(+), 53 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 961689a255c4..74d38f90398a 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -1731,28 +1731,9 @@ static int dsi_host_parse_lane_data(struct 
>> msm_dsi_host *msm_host,
>>       return -EINVAL;
>>   }
>> -static u32 dsi_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
>> -    0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54, 0x62,
>> -    0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
>> -};
>> -
>> -/* only 8bpc, 8bpp added */
>> -static char min_qp[DSC_NUM_BUF_RANGES] = {
>> -    0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 13
>> -};
>> -
>> -static char max_qp[DSC_NUM_BUF_RANGES] = {
>> -    4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 11, 12, 13, 13, 15
>> -};
>> -
>> -static char bpg_offset[DSC_NUM_BUF_RANGES] = {
>> -    2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
>> -};
>> -
>>   static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, 
>> struct drm_dsc_config *dsc)
>>   {
>> -    int i;
>> -    u16 bpp = dsc->bits_per_pixel >> 4;
>> +    int ret;
>>       if (dsc->bits_per_pixel & 0xf) {
>>           DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support 
>> fractional bits_per_pixel\n");
>> @@ -1764,49 +1745,23 @@ static int dsi_populate_dsc_params(struct 
>> msm_dsi_host *msm_host, struct drm_dsc
>>           return -EOPNOTSUPP;
>>       }
>> -    dsc->rc_model_size = 8192;
>> -    dsc->first_line_bpg_offset = 12;
>> -    dsc->rc_edge_factor = 6;
>> -    dsc->rc_tgt_offset_high = 3;
>> -    dsc->rc_tgt_offset_low = 3;
>>       dsc->simple_422 = 0;
>>       dsc->convert_rgb = 1;
>>       dsc->vbr_enable = 0;
>> -    /* handle only bpp = bpc = 8 */
>> -    for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++)
>> -        dsc->rc_buf_thresh[i] = dsi_dsc_rc_buf_thresh[i];
>> +    drm_dsc_set_const_params(dsc);
>> +    drm_dsc_set_rc_buf_thresh(dsc);
>> -    for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
>> -        dsc->rc_range_params[i].range_min_qp = min_qp[i];
>> -        dsc->rc_range_params[i].range_max_qp = max_qp[i];
>> -        /*
>> -         * Range BPG Offset contains two's-complement signed values 
>> that fill
>> -         * 8 bits, yet the registers and DCS PPS field are only 6 
>> bits wide.
>> -         */
>> -        dsc->rc_range_params[i].range_bpg_offset = bpg_offset[i] & 
>> DSC_RANGE_BPG_OFFSET_MASK;
>> +    /* handle only bpp = bpc = 8, pre-SCR panels */
>> +    ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
>> +    if (ret) {
>> +        DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC 
>> parameters\n");
>> +        return ret;
>>       }
>> -    dsc->initial_offset = 6144;        /* Not bpp 12 */
>> -    if (bpp != 8)
>> -        dsc->initial_offset = 2048;    /* bpp = 12 */
>> -
>> -    if (dsc->bits_per_component <= 10)
>> -        dsc->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
>> -    else
>> -        dsc->mux_word_size = DSC_MUX_WORD_SIZE_12_BPC;
>> -
>> -    dsc->initial_xmit_delay = 512;
>>       dsc->initial_scale_value = 32;
>> -    dsc->first_line_bpg_offset = 12;
>>       dsc->line_buf_depth = dsc->bits_per_component + 1;
>> -    /* bpc 8 */
>> -    dsc->flatness_min_qp = 3;
>> -    dsc->flatness_max_qp = 12;
>> -    dsc->rc_quant_incr_limit0 = 11;
>> -    dsc->rc_quant_incr_limit1 = 11;
>> -
>>       return drm_dsc_compute_rc_parameters(dsc);
>>   }
>>
> 
> -- 
> With best wishes
> Dmitry
> 
