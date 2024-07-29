Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1026F93FD7C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 20:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EB910E476;
	Mon, 29 Jul 2024 18:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pLGzTvLV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC2710E477;
 Mon, 29 Jul 2024 18:39:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TAFwn3027258;
 Mon, 29 Jul 2024 18:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eWE57PADrMUHeCMcSP39AUqkKwW/yy1cFIXe7CXKmho=; b=pLGzTvLVMehdxIUm
 tbcozS4GLomYBynDs6FlLieJ7ztIuV0/cDb7bS6t8kIsZurLK+vzI2YSrE5UqJoH
 TXcBZfujnMpFbbCh9kpGJVZPBbkfPShDeqPco0Ffbcpuv8PtQ6EzseyjN5hkOUEl
 feLX7UnWx7/QjilcKKA4TdwOer91To6S2rDhE6Py+Mh1sASoA7G9g889RiECB3Bv
 6xMRgBhBONHsXYnKMbjPgUT8ETAALZhKDSFOLtm+1FQQhqJatXLtD5QMtK5B4C6V
 qkfo0bjlR3gnXWo2Xon5ntDY4Vx0XLE5Nx7NTPNte8hT81P60M+/4BOFbGghSBww
 jLsDew==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40msne51hb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jul 2024 18:38:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46TIcSZ9020586
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jul 2024 18:38:28 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 11:38:27 -0700
Message-ID: <5f2983ea-d694-44c3-8231-78c0de6db856@quicinc.com>
Date: Mon, 29 Jul 2024 11:38:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: fix the max supported bpp logic
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>, "Sean
 Paul" <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Guenter Roeck <groeck@chromium.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Vara Reddy <quic_varar@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, <dri-devel@lists.freedesktop.org>,
 <quic_jesszhan@quicinc.com>, <neil.armstrong@linaro.org>,
 <abel.vesa@linaro.org>, <quic_khsieh@quicinc.com>,
 Rob Clark <robdclark@chromium.org>, "Chandan
 Uddaraju" <chandanu@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240725220320.130916-1-quic_abhinavk@quicinc.com>
 <CAA8EJpoYqHnG_=jt6Lo6v7a7h3CdF66bKqRf63RCmvqHWb4kFQ@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoYqHnG_=jt6Lo6v7a7h3CdF66bKqRf63RCmvqHWb4kFQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Uqb9sr00ouQSmW-KP5PjCLILbb0NXce4
X-Proofpoint-ORIG-GUID: Uqb9sr00ouQSmW-KP5PjCLILbb0NXce4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_16,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290126
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



On 7/27/2024 5:51 AM, Dmitry Baryshkov wrote:
> On Fri, 26 Jul 2024 at 01:04, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Currently the DP driver hard-codes the max supported bpp to 30.
>> This is incorrect because the number of lanes and max data rate
>> supported by the lanes need to be taken into account.
>>
>> Replace the hardcoded limit with the appropriate math which accounts
>> for the accurate number of lanes and max data rate.
>>
>> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_panel.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index a916b5f3b317..56ce5e4008f8 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -397,6 +397,7 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
>>   {
>>          struct drm_display_mode *drm_mode;
>>          struct dp_panel_private *panel;
>> +       u32 max_supported_bpp;
>>
>>          drm_mode = &dp_panel->dp_mode.drm_mode;
>>
>> @@ -423,8 +424,10 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
>>                                  drm_mode->clock);
>>          drm_dbg_dp(panel->drm_dev, "bpp = %d\n", dp_panel->dp_mode.bpp);
>>
>> -       dp_panel->dp_mode.bpp = max_t(u32, 18,
>> -                               min_t(u32, dp_panel->dp_mode.bpp, 30));
>> +       max_supported_bpp = dp_panel_get_mode_bpp(dp_panel, dp_panel->dp_mode.bpp,
>> +                                                 dp_panel->dp_mode.drm_mode.clock);
>> +       dp_panel->dp_mode.bpp = max_t(u32, 18, max_supported_bpp);
> 
> I think that in mode_valid() the driver should filter out modes that
> result in BPP being less than 18. Then the max_t can be dropped
> completely.
> 

With Stephen's suggested change, dp_panel_get_supported_bpp() will not 
return anything below min_supported_bpp which is 18 so we can absorb 
that part and drop the max_t part here.

> Nevertheless this indeed fixes an issue with the screen corruption,
> this is great!
> 
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8350-HDK
> 

Thanks for reporting and testing this. I need to give you Reported-by 
credits as well.

>> +
>>          drm_dbg_dp(panel->drm_dev, "updated bpp = %d\n",
>>                                  dp_panel->dp_mode.bpp);
>>
>> --
>> 2.44.0
>>
> 
> 
