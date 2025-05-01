Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E2CAA593B
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 03:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B367810E0C0;
	Thu,  1 May 2025 01:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ntVgXX02";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08D110E0C0;
 Thu,  1 May 2025 01:08:11 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UGoKHO012269;
 Thu, 1 May 2025 01:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rfPplkV4+kk+UmnwtmcptadSkNK7L/gXCtp5juv5io4=; b=ntVgXX0261+vbAY8
 DRG7Gln7RsCFcYxzmx9JbUfRIlx4nJjoxyL16fJH5Yi1d6QhgznteXUnzjeaTJRd
 00K9kTCIiI1JQdVgbIy2n5lKxoE6stgzt6Tn66RgI0T07ApE9pWakuYd+1CQUheg
 kH7IjWpOpz1vCmyKFmj9w+9L3xnfHO74yls7D++ePgpbQDDWzAWCO8MEcNFV+RXe
 FiY7/lnM9P2tnYLKACzVOeOmCTVGB034R5QzFm2Q+P6LYAG7CvQVCU6dlpRarFC1
 qWDJE+Q7phmvkyq/4P4gHcIeNUsWK1sbEdD81gMcnm9jj9nCmWU4L2OA4UNV13di
 NHzGUA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u3v0yc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 May 2025 01:07:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54117wbG014451
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 May 2025 01:07:58 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Apr
 2025 18:07:57 -0700
Message-ID: <65ab1bc6-b17a-405d-897b-da17522820dc@quicinc.com>
Date: Wed, 30 Apr 2025 18:07:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/msm/dp: Account for LTTPRs capabilities
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, Dmitry Baryshkov
 <lumag@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <dmitry.baryshkov@oss.qualcomm.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <laurentiu.tudor1@dell.com>, <abel.vesa@linaro.org>,
 <johan@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
References: <20250430001330.265970-1-alex.vinarskis@gmail.com>
 <20250430001330.265970-3-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250430001330.265970-3-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=6812c96f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=p9MYPHDGo_sz-XGRfLYA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: VEArPc4JIx7eiAnMoFNOXZBUPuloPUQu
X-Proofpoint-ORIG-GUID: VEArPc4JIx7eiAnMoFNOXZBUPuloPUQu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDAwNiBTYWx0ZWRfX3CYux2kkANWw
 PB4ZndMlh6Vrz9bjU806nk0aB5edum+H4/qfi32ongLkQE+H93IwSsxlRSm/s2O3uu89ewguofJ
 njSZXw8ABKIQ5HLNsqlGvheKHnNP8s/jOkPVbs0YsAwxdMHWmW44Ho9NRAg8avMJePBAI+uaoCW
 9wYrHmrkS0LTt0C9FA+lvBM24V/8/oTPQc+LPyvnl6gGfElngw44VzkAxJ4ELxd/F7PBiOMYuiz
 8W4aKYERJHwUmTaD3jmfMB6Raeb/3aDrATAGuD3wfSzh/2S+BblV0+mJpv0P3fe4KA744yXmu3P
 2VSany74TxZnQ7ZGWZA4RfXDPkjCofg7CTdAVSbG8CS4Hd0JhlrOHcsgb4VV3xAxnCWie+p5lty
 CmQndizqaaR6Kt2C98w8MMvJMEKwmEPoh1dMXroChXQTZIAksqXUK2yH/0pIPruMofmdvmbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 mlxlogscore=962 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010006
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



On 4/29/2025 5:09 PM, Aleksandrs Vinarskis wrote:
> Take into account LTTPR capabilities when selecting maximum allowed
> link rate, number of data lines.
> 
> Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")
> 
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Rob Clark <robdclark@gmail.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c |  5 ++---
>   drivers/gpu/drm/msm/dp/dp_link.h    |  3 +++
>   drivers/gpu/drm/msm/dp/dp_panel.c   | 12 +++++++++++-
>   3 files changed, 16 insertions(+), 4 deletions(-)
> 

Nice!

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
