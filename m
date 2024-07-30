Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F46941F1E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 19:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFCF10E572;
	Tue, 30 Jul 2024 17:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="I/WKhAUx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70DA10E571;
 Tue, 30 Jul 2024 17:58:18 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UHvgHN030534;
 Tue, 30 Jul 2024 17:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i3zIHuBSrqmdngqmaB2D8Qm7MvBmeypkC15fgCfN9gk=; b=I/WKhAUxaVTywhvd
 Y3JLrZ0uRbDqJD7smtwj6qwwNihnHeq/dQo3f4AVfC5Wf7w8VVWKCTpsWaWwokTP
 RAA3BM1sakDpnWdLCitV8Mlk+TjUyffrE5M+g+cW7J38kYpzBWpWMYmmhhVczKyn
 1E21aZTadwiWI/dB/vu66k8/o0t2FTDwbLpMAAHCA8zelC8WvCJ2w6grX0wONxw/
 BFRf/GaKcBv8mQHogTNMKnrsh44t1uwm5Gs8ZDtNrQ1JQyggDPzx0KFvl/rznEVL
 hucEbGlQkT+vRmG8u+kplQWaPg7MXkQk1NeCV2GS7onsbgwzWoS3LlkE/Kw23Col
 20xrvA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mt68rcbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2024 17:58:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46UHwCYq025157
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2024 17:58:12 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Jul
 2024 10:58:11 -0700
Message-ID: <cecfbed5-aec1-439b-a866-4eebcd3bd421@quicinc.com>
Date: Tue, 30 Jul 2024 10:58:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: fix the max supported bpp logic
To: Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 "David Airlie" <airlied@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Guenter Roeck <groeck@chromium.org>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Vara Reddy <quic_varar@quicinc.com>, <freedreno@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
 <neil.armstrong@linaro.org>, <abel.vesa@linaro.org>,
 <quic_khsieh@quicinc.com>, Rob Clark <robdclark@chromium.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240725220320.130916-1-quic_abhinavk@quicinc.com>
 <CAE-0n50mBEX98HH+5BurM-uRyzrxcPXFJ7yLg__hFJHfYjm67Q@mail.gmail.com>
 <8fa86c0c-183b-4787-9525-38dfe6bcecc6@quicinc.com>
 <CAE-0n537mpOMkVWrXGSpjU8cHZtUZXFfdG1YTfevu2SRo1hPTQ@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n537mpOMkVWrXGSpjU8cHZtUZXFfdG1YTfevu2SRo1hPTQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ErS6-3DdwiciUDQ3xRLHRPJw_DHd-uI7
X-Proofpoint-GUID: ErS6-3DdwiciUDQ3xRLHRPJw_DHd-uI7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_14,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=986 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300123
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



On 7/29/2024 1:08 PM, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2024-07-29 11:28:35)
>>
>> Thanks for the feedback.
>>
>> Your change looks valid. We can use this and drop the max_t usage.
>>
>> Let me push this with your Suggested-by credits.
> 
> You can take my
> 
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> and either squash it in or make a follow-up.

Done, I have squashed it into this.

I have also re-tested and since the logic is the same, I have retained 
Dmitry's Tested-by
