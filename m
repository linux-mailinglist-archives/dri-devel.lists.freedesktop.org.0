Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF1279AA9C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 19:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E653910E1BB;
	Mon, 11 Sep 2023 17:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD9E10E1B1;
 Mon, 11 Sep 2023 17:46:49 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38BGL1X7022836; Mon, 11 Sep 2023 17:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tUtEZn658uuIEeAhGleeCRrPIUW33MXT85cB6oBl1xI=;
 b=YETj3TqMbpOUXf3Y3E7lTuIRCRN4SK5hIrRMo+PCyV35rZN72/nECoETX9r6LyMBlFg9
 NAKOBychCnKT0jQkHJYb4gpN9C6QoLQ19RMeBYvK7EDPNlOQn2Op5fOllobtFCiKfD8O
 AsAibdNSa9yE/08erSfKD8/zAyoADYEQsFtgtl1BvBT6Y/hYYaEgV8ep+I+LTtLJPiVi
 jCvsEIHXvSFUNMOjvnNBK/iGVxRqUgI+dxAv37HtaD/AcgkU53I4suvvycoh8qCCLUe+
 WYaX7tpb1YD8J5fYhR53iggl7lpCIajsh34Yyuto8Rg5jTQZbjtO3BmenQ+Tj9q4cSri dw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t22hygsuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Sep 2023 17:46:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BHkSMr030743
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Sep 2023 17:46:28 GMT
Received: from [10.71.110.104] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 11 Sep
 2023 10:46:24 -0700
Message-ID: <f4e0d437-bb11-2590-30d1-4feab703306f@quicinc.com>
Date: Mon, 11 Sep 2023 10:46:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/msm/dpu: try multirect based on mdp clock limits
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230908185427.29026-1-quic_abhinavk@quicinc.com>
 <20230908185427.29026-2-quic_abhinavk@quicinc.com>
 <CAA8EJppj+JTA8iZ6+Ui8JkD-kP54YKObRDK2_Oh+Wpn4XjU-4Q@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppj+JTA8iZ6+Ui8JkD-kP54YKObRDK2_Oh+Wpn4XjU-4Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 1aNjUn8nbCt_cfxS5iTozcgbxSTDex57
X-Proofpoint-GUID: 1aNjUn8nbCt_cfxS5iTozcgbxSTDex57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_13,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxlogscore=742 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309110162
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
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean
 Paul <sean@poorly.run>, nespera@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/8/2023 4:30 PM, Dmitry Baryshkov wrote:
> On Fri, 8 Sept 2023 at 21:55, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> It's certainly possible that for large resolutions a single DPU SSPP
>> cannot process the image without exceeding the MDP clock limits but
>> it can still process it in multirect mode because the source rectangles
>> will get divided and can fall within the MDP clock limits.
>>
>> If the SSPP cannot process the image even in multirect mode, then it
>> will be rejected in dpu_plane_atomic_check_pipe().
>>
>> Hence try using multirect for resolutions which cannot be processed
>> by a single SSPP without exceeding the MDP clock limits.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index 62dd9f9b4dce..85072328cd53 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -792,6 +792,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>>                                                                                   plane);
>>          int ret = 0, min_scale;
>>          struct dpu_plane *pdpu = to_dpu_plane(plane);
>> +       struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>>          struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
>>          struct dpu_sw_pipe *pipe = &pstate->pipe;
>>          struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
>> @@ -860,7 +861,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>>
>>          max_linewidth = pdpu->catalog->caps->max_linewidth;
>>
>> -       if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
>> +       if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
>> +            _dpu_plane_calc_clk(&crtc_state->mode, pipe_cfg) > kms->perf.max_core_clk_rate) {
> 
> First, I think this should be an adjusted_mode too. And this probably
> needs some more attention in the next few lines of code, since .e.g
> the UBWC case also needs to be adjusted.
> 

Ack, will change this to adjusted_mode as well

Yes, need to update UBWC check like below, thanks for catching it.

@@ -869,7 +878,7 @@ static int dpu_plane_atomic_check(struct drm_plane 
*plane,
                  * full width is more than max_linewidth, thus each rect is
                  * wider than allowed.
                  */
-               if (DPU_FORMAT_IS_UBWC(fmt)) {
+               if (DPU_FORMAT_IS_UBWC(fmt) && 
drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
                         DPU_DEBUG_PLANE(pdpu, "invalid src " 
DRM_RECT_FMT " line:%u, tiled format\n",
 
DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
                         return -E2BIG;

>>                  /*
>>                   * In parallel multirect case only the half of the usual width
>>                   * is supported for tiled formats. If we are here, we know that
>> --
>> 2.40.1
>>
> 
> 
