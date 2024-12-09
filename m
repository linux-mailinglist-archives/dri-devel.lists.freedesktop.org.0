Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FF99EA129
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 22:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355C010E580;
	Mon,  9 Dec 2024 21:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Hzg1ITNO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5896A10E580;
 Mon,  9 Dec 2024 21:20:41 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9E6kJf006931;
 Mon, 9 Dec 2024 21:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v2Y87M/J9lL5Bbeo1HnbMICKqhv73XiTi1hKWjXVSTY=; b=Hzg1ITNOrBhuBPMV
 vrXzKPFsdehkHWoo3o+nlgaiciXO1gG6OKnQka5hif6X3Ha8yPBVJouGbHAdPJm7
 YmbQIdiCuXqMYBS1a5ZVEB5H4MLEVgZJwsCl7GewAqaGyAyQv6Ec6MmxU3sul56H
 dfOxkiGQ27SaMxWSorUN1jh3Y6cPdK80TrVj7Ga5oY8z1h2Euyz2UAq9nXsz8hZP
 TufMBrHA+jNisH6tB0GF1j88UZYu5zAnbyKgIBulKCQDkipn+J/YKMbr5xLPaPP/
 TDAi28iUrymbF6C4qvlI49Z1+xuRWRcG2zoLvSmnBYnZAnYb9pfq7fQRsqCoAvG6
 ehCcmQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e21bh673-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2024 21:20:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9LKb82003099
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Dec 2024 21:20:37 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 13:20:34 -0800
Message-ID: <8e39a34a-5997-458b-adec-5984ea324d76@quicinc.com>
Date: Mon, 9 Dec 2024 13:20:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: filter out too wide modes if no 3dmux is
 present
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241209-no_3dmux-v2-1-fcad057eb92e@quicinc.com>
 <jzbqtrhiebtb6oveg35b4cdu57epqattu5lqhtfhbzctomzhrl@vnl3vklpnvd3>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <jzbqtrhiebtb6oveg35b4cdu57epqattu5lqhtfhbzctomzhrl@vnl3vklpnvd3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: u07kGPF8S1lgQPs5KPN9S92ge0P_oN4-
X-Proofpoint-ORIG-GUID: u07kGPF8S1lgQPs5KPN9S92ge0P_oN4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 mlxlogscore=796 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090165
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



On 12/9/2024 1:05 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 09, 2024 at 12:15:57PM -0800, Abhinav Kumar wrote:
>> On chipsets such as QCS615, there is no 3dmux present. In such
>> a case, a layer exceeding the max_mixer_width cannot be split,
>> hence cannot be supported.
>>
>> Filter out the modes which exceed the max_mixer_width when there
>> is no 3dmux present. Also, add a check in the dpu_crtc_atomic_check()
>> to return failure for such modes.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>> Note: this was only compile tested, so its pending validation on QCS615
>> ---
>> Changes in v2:
>> - replace MODE_BAD with MODE_BAD_HVALUE to indicate the failure better
>> - Link to v1: https://lore.kernel.org/r/20241206-no_3dmux-v1-1-72ad2677a323@quicinc.com
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 9f6ffd344693ecfb633095772a31ada5613345dc..87d76f388bef48c880ae70ddcdb76ccb0336ad32 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -732,6 +732,13 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
>>   	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>>   	int i;
>>   
>> +	/* if we cannot merge 2 LMs (no 3d mux) better to fail earlier
>> +	 * before even checking the width after the split
>> +	 */
>> +	if (!dpu_kms->catalog->caps->has_3d_merge
>> +	    && adj_mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
> 
> Excuse me that I didn't notice that earlier. && should go to the
> previous line, not to the next line.
> 

Thanks for catching. My bad, I forgot the --strict while running 
checkpatch. That had also reported this. Fixed this in v3.

>> +		return -E2BIG;
>> +
>>   	for (i = 0; i < cstate->num_mixers; i++) {
>>   		struct drm_rect *r = &cstate->lm_bounds[i];
>>   		r->x1 = crtc_split_width * i;
>> @@ -1251,6 +1258,12 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>>   {
>>   	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>>   
>> +	/* if there is no 3d_mux block we cannot merge LMs so we cannot
>> +	 * split the large layer into 2 LMs, filter out such modes
>> +	 */
>> +	if (!dpu_kms->catalog->caps->has_3d_merge
>> +	    && mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
>> +		return MODE_BAD_HVALUE;
>>   	/*
>>   	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
>>   	 */
>>
>> ---
>> base-commit: af2ea8ab7a546b430726183458da0a173d331272
>> change-id: 20241206-no_3dmux-521a55ea0669
>>
>> Best regards,
>> -- 
>> Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
> 
