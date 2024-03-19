Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3348804C4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 19:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F0B10F51F;
	Tue, 19 Mar 2024 18:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="AMcAT6xn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FDC10FC47
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 18:26:36 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42JHGW9j022546; Tue, 19 Mar 2024 18:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=alFmAYsZPbw5JddF5k6AkS4utotPRXvAreu9oVdJA68=; b=AM
 cAT6xnIj1d3A7tcfptxf5jLcAEkS9UDhUC++rdcYEbO0ROH/FHVTwx9ZpVhAvSih
 o3VTmwlFRmUVHCR8kbe0iE18LCuIntUQTeXde1bRVn6yz8kDcC8zBWo2BKOsgY2X
 MSXd8vwsaHhxcxThhrmIXUVuBH4L2Bt3HeazwFgiydfuchXR1uSpEInciZBV1WEq
 54jq2gZqjWc/RkW4yRzMIZJuAzB1Axhfcs4d/hQQe6GXiMix7iw70q1mK89d2yq4
 iUW7G8/jhZYwB+UPFOP5xRQBj5bVku+ldlpTsa9jUuQGRvmqJrn+mE+Qy7FrlgmL
 uEJ/DGrhvzgRkWCH4LHQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wye5n8bjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Mar 2024 18:26:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42JIQPTA032329
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Mar 2024 18:26:25 GMT
Received: from [10.110.10.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 19 Mar
 2024 11:26:21 -0700
Message-ID: <b9e1a57d-0bdd-45f4-f589-792f8ea82835@quicinc.com>
Date: Tue, 19 Mar 2024 11:26:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/dp: Clarify that wait_hpd_asserted() is not optional
 for panels
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: <linux-tegra@vger.kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding
 <thierry.reding@gmail.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Imre Deak <imre.deak@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maxime Ripard <mripard@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240319111432.1.I521dad0693cc24fe4dd14cba0c7048d94f5b6b41@changeid>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240319111432.1.I521dad0693cc24fe4dd14cba0c7048d94f5b6b41@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: l2PEpOBPlSb-BRXUAn949UeppIZTCmv2
X-Proofpoint-ORIG-GUID: l2PEpOBPlSb-BRXUAn949UeppIZTCmv2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_08,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1011 mlxlogscore=999 mlxscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403190140
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



On 3/19/2024 11:14 AM, Douglas Anderson wrote:
> In response to my patch removing the "wait for HPD" logic at the
> beginning of the MSM DP transfer() callback [1], we had some debate
> about what the "This is an optional function" meant in the
> documentation of the wait_hpd_asserted() callback. Let's clarify.
> 
> As talked about in the MSM DP patch [1], before wait_hpd_asserted()
> was introduced there was no great way for panel drivers to wait for
> HPD in the case that the "built-in" HPD signal was used. Panel drivers
> could only wait for HPD if a GPIO was used. At the time, we ended up
> just saying that if we were using the "built-in" HPD signal that DP
> AUX controllers needed to wait for HPD themselves at the beginning of
> their transfer() callback. The fact that the wait for HPD at the
> beginning of transfer() was awkward/problematic was the whole reason
> wait_hpd_asserted() was added.
> 
> Let's make it obvious that if a DP AUX controller implements
> wait_hpd_asserted() that they don't need a loop waiting for HPD at the
> start of their transfer() function. We'll still allow DP controllers
> to work the old way but mark it as deprecated.
> 
> [1] https://lore.kernel.org/r/20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I would consider changing the docs to say that implementing
> wait_hpd_asserted() is actually _required_ for any DP controllers that
> want to support eDP panels parented on the DP AUX bus. The issue is
> that one DP controller (tegra/dpaux.c, found by looking for those that
> include display/drm_dp_aux_bus.h) does populate the DP AUX bus but
> doesn't implement wait_hpd_asserted(). I'm actually not sure how/if
> this work on tegra since I also don't see any delay loop for HPD in
> tegra's transfer() callback. For now, I've left wait_hpd_asserted() as
> optional and described the old/deprecated way things used to work
> before wait_hpd_asserted().
> 
>   include/drm/display/drm_dp_helper.h | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 

Thanks for the change,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
