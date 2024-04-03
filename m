Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ADA897972
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 21:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9642711212B;
	Wed,  3 Apr 2024 19:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Ira3qAVc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C64811212B;
 Wed,  3 Apr 2024 19:59:00 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 433Jful9017706; Wed, 3 Apr 2024 19:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=RAjJygrtnz3IafcFIvbNaEGp82M8DXE306CM7uWs/q4=; b=Ir
 a3qAVcmK5WVcgb7TPsSQwFoYLuTbKmPZ1mugKalpGvJ5IGopV5gagHDPQKTPfC3N
 gBkDJwhwYeFhKrB/5aGk23EHMms8wM9dAP/St61RwuF+In4RilJGGEtl5MhEMLSp
 MJsVjCpXBsu97oj+5tr2Y1OLwZ3UHXqM7dGKBpLKVwi3neCym9XPW9OrIcaOY/Qd
 OfyJxuSEFMRl1mpo68g4OFJtOIysGnSkAIUBc8US0mO1iEjsK8CpbtH0LBUAES+F
 rsBBlUCQ5LwzH8xCjPlY7fSWY1O7tf4v4nGo40m3T+LbMmoCK4HeY910sAwNd5of
 5r+BpMgGMlts1IkdMUqg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x9077j41w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Apr 2024 19:58:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 433JwqkP016847
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Apr 2024 19:58:52 GMT
Received: from [10.110.9.99] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 3 Apr 2024
 12:58:50 -0700
Message-ID: <2f509949-7e7e-cbf6-c1d0-f25971c2d890@quicinc.com>
Date: Wed, 3 Apr 2024 12:58:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] phy/qcom-qmp-combo: propagate correct return value at
 phy_power_on()
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, <abel.vesa@linaro.org>,
 <agross@kernel.org>, <airlied@gmail.com>, <andersson@kernel.org>,
 <daniel@ffwll.ch>, <dianders@chromium.org>,
 <dmitry.baryshkov@linaro.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>
CC: <quic_jesszhan@quicinc.com>, <quic_sbillaka@quicinc.com>,
 <marijn.suijten@somainline.org>, <freedreno@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1711741835-10044-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n50Z2pDGH+ncjQq-huDsn9jdN=1SfaaU+qw229nZpUVCDw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n50Z2pDGH+ncjQq-huDsn9jdN=1SfaaU+qw229nZpUVCDw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: HzB9bFC3XVmDy2SfH_Qjw6dY9raEAm1I
X-Proofpoint-ORIG-GUID: HzB9bFC3XVmDy2SfH_Qjw6dY9raEAm1I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_20,2024-04-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404030133
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



On 4/3/2024 12:51 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2024-03-29 12:50:35)
>> Currently qmp_combo_dp_power_on() always return 0 in regardless of
>> return value of cfg->configure_dp_phy(). This patch propagate
>> return value of cfg->configure_dp_phy() all the way back to caller.
> 
> Is this found via code inspection or because the phy is failing to power
> on sometimes? I ask because I'm looking at a DP bug on Trogdor with
> chromeos' v6.6 based kernel and wondering if this is related.
> 

No, we actually hit an issue. This issue was originally reported as a 
link training issue while bringing up DP on x1e80100.

While debugging that we noticed that we should not have even proceeded 
to link training because the PLL was not getting locked and it was 
failing silently since there are no other error prints (and hence the 
second part of the patch to improve the error logs), and we do not 
return any error code from this driver, we could not catch the PLL 
unlocked issue.

> Also, is the call to phy_power_on() going to be checked in
> the DP driver?
> 
>   $ git grep -n phy_power_on -- drivers/gpu/drm/msm/dp/
>   drivers/gpu/drm/msm/dp/dp_ctrl.c:1453:  phy_power_on(phy);

Yes, this is a good point. We should also post the patch to add the 
error checking in DP driver to fail if phy_power_on fails.
