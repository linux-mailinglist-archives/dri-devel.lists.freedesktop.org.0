Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B6699D797
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 21:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCFB10E4BD;
	Mon, 14 Oct 2024 19:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cRdgRODf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA8A10E4B8;
 Mon, 14 Oct 2024 19:40:03 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EB92Yf018340;
 Mon, 14 Oct 2024 19:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Awl4z4MGhITyUFRVeT3/YC6IRZPD4SDnGGUgmfXsRPI=; b=cRdgRODfBR0JFcil
 2pjEElr7LnDW53Au4U6uKtVKRp/NxDAxyhS0IU66WSOqqy2/PQM5xt7nTeti3l9p
 +RXxmjene+0VvXQxcKX9e7HNcoVfG7TyRqZLhl6rNpfvmJatmrS6ehEkiHNqPBRA
 mnE7qE5d2lF9a5h4lBq8yzL67touwd7sdSNpvRGfi7oBxcZPb31ZWB9lfQ2YaVqb
 BJ2jhxtoUMs8MeGuy2I0R2q6iLXoC/P8ZiQfSHl5kXb0kKJPRtPKXJkQ32Np8qss
 18OwOob+zocZsxXfu2vybYJDziqzkjk8Er5BrWFucskxpW2gv24ysnkbbl3xnxZt
 pACtHg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427gpxndx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2024 19:39:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49EJduQF026953
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2024 19:39:56 GMT
Received: from [10.110.109.95] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Oct
 2024 12:39:55 -0700
Message-ID: <37d53ab8-e9d8-4fe1-89fd-dfc5fd551771@quicinc.com>
Date: Mon, 14 Oct 2024 12:39:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/msm/dsi: improve/fix dsc pclk calculation
To: Jonathan Marek <jonathan@marek.ca>, <freedreno@lists.freedesktop.org>
CC: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 "open list:DRM DRIVER for Qualcomm display
 hardware" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER for Qualcomm
 display hardware" <dri-devel@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>
References: <20241007050157.26855-1-jonathan@marek.ca>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241007050157.26855-1-jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Uqu6iplxeBK2bCeos95vSYOQJ1_gUMVo
X-Proofpoint-ORIG-GUID: Uqu6iplxeBK2bCeos95vSYOQJ1_gUMVo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 malwarescore=0 mlxlogscore=633 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410140139
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



On 10/6/2024 10:01 PM, Jonathan Marek wrote:
> drm_mode_vrefresh() can introduce a large rounding error, avoid it.
> 
> Fixes: 7c9e4a554d4a ("drm/msm/dsi: Reduce pclk rate for compression")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
