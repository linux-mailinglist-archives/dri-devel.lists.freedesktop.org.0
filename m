Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E2DABC4E1
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790C210E330;
	Mon, 19 May 2025 16:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cwtgEw+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D4510E31E;
 Mon, 19 May 2025 16:49:48 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J98DuI029025;
 Mon, 19 May 2025 16:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oZ4KJU6pMiFKqlXmXnMZZy0gJKEw8GKPjiTifWRBlKQ=; b=cwtgEw+0C1wCpSM1
 O0NPxRbe/5FnA1aq8ZaHytCEo/h0BmFtL46NGIFIBCTbLTsDlK0laUCetS2c5bXg
 +I7bkiABA75pDEqgARdjiAubUxAxNsHD0BamKuTSbc2apmSFrIyxmp9NTejuL+0Z
 E6GlMHFjVXDw+TIJsnE1qVYhWmXSHqctPkzHeQhp+QgpsapB+qgcfaupDXe+ACRL
 fVB4bxkut+71STLsLNQ7eJkNCSbkHqIITv3BX/VUwvio29xd1VrrT3YAIN1JIux8
 5VygBj6fcgF1CASORfnzGnClvTZx0p/4QBCWo6gNA0d7AVtv/an912v9yoSc5XMe
 vudhBQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4w327-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 May 2025 16:49:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54JGnc0t016671
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 May 2025 16:49:38 GMT
Received: from [10.110.123.42] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 19 May
 2025 09:49:35 -0700
Message-ID: <b4dace94-afa1-4910-b77d-20de08b5a6b9@quicinc.com>
Date: Mon, 19 May 2025 09:49:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/24] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
CC: Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek
 <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Rob Clark
 <robdclark@chromium.org>, <linux-clk@vger.kernel.org>, Srinivas Kandagatla
 <srini@kernel.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
 <ygd6givaigkmypmaufpeidkqauoujcndm2xemi5pm5zue6ou7j@zonusie3tuap>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ygd6givaigkmypmaufpeidkqauoujcndm2xemi5pm5zue6ou7j@zonusie3tuap>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b6123 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=RYIdb7-JugdFDdxw8Q4A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kGf-vTGCYjKfVf56vLkVOy0PBWSSLkJH
X-Proofpoint-GUID: kGf-vTGCYjKfVf56vLkVOy0PBWSSLkJH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1NiBTYWx0ZWRfX/0kBB49Fvegz
 1zbigi/xjTdccxjGw+n0Gh6hkTgxxT9EG5xce8Cjuuk1Y6HkFUmCDDJ9mr/AHS49oFRckBrpfB1
 jxwrwBpQBVlZKE1Lk2oWFsBS3IwATCEgV8q6DdHJbyA1jAdYR0XA2AmauXqCFmZmfTC2tcy2je1
 rX1aLCAG366e51T1NRLKDJiZo+R4A2TBUO5U56BULMmfVP0zCAwYTbx3F+22cKQrR9TR6nuacWZ
 WZ5ds3wfP9lnpQqKQMKIGaDU3TxwoPLyR5HKM6//D6/QseDYB6XioyVdxnb2+d3zrS9PKypkgq1
 TQZ/oqb1OyxS8jM4gHefCaTGgWGgLAxyZleak5HPcN2Z6oA+cO4LxEY189M0grOsTpddyJODdBX
 sv97YTZNtySb9XWmUoAiHexdkhG1EyW5F1Rini0/o1auIHjiBdGJjd+6ZBje57in83Ic7OxY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190156
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



On 5/5/2025 5:24 AM, Dmitry Baryshkov wrote:
> On Wed, Apr 30, 2025 at 03:00:51PM +0200, Krzysztof Kozlowski wrote:
>> v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
>> differences and new implementations of setup_alpha_out(),
>> setup_border_color() and setup_blend_config().
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Changes in v4:
>> 1. Lowercase hex, use spaces for define indentation
>> 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
>>
>> Changes in v3:
>> 1. New patch, split from previous big DPU v12.0.
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 19 ++++---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
>>   2 files changed, 94 insertions(+), 9 deletions(-)
>>
>> @@ -175,12 +246,19 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
>>   	c->idx = cfg->id;
>>   	c->cap = cfg;
>>   	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
>> -	if (mdss_ver->core_major_ver >= 4)
>> +	if (mdss_ver->core_major_ver >= 12)
>> +		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha_v12;
>> +	else if (mdss_ver->core_major_ver >= 4)
>>   		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
>>   	else
>>   		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
>> -	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
>> -	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
>> +	if (mdss_ver->core_major_ver < 12) {
>> +		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
>> +		c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
>> +	} else {
>> +		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3_v12;
>> +		c->ops.setup_border_color = dpu_hw_lm_setup_border_color_v12;
>> +	}
> 
> I tried picking up these patches, and choked on this one. This heavility
> depends on the DPU fetures bits rework patchset (mentioned in the cover
> letter, it's fine), but granted the lack of the reviews / updates on
> that patchset I can neither apply this patch (and its dependencies) nor
> steer Krzysztof away from basing on that patchset (this patch provides a
> perfect example of why that series is useful and correct).
> 
> Abhinav, could you please continue reviewing that patch series?
> 

I think we could have continued this series on top of the current 
feature bits model and I thought we were doing that based on 
#linux-arm-msm chats in Feb between you and me. Not sure what happened 
there.

Regarding the review, myself and Jessica have discussed this last week 
and Jessica will take over the review of that series and please work 
with addressing the comments provided there by her.
