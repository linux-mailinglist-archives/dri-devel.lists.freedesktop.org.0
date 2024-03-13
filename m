Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE66E87AF16
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 19:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3DF10F1EA;
	Wed, 13 Mar 2024 18:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="jUHSSKEu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6924A10F1EA;
 Wed, 13 Mar 2024 18:17:01 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42DHQSY8032501; Wed, 13 Mar 2024 18:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=v5wjPJyxlyZSgw7QRNfZacYjQP379B5XDAXYyxrHWgs=; b=jU
 HSSKEujd5ST8b01tUiDMG1O7g5X2v+xnubLImtNi7WfDCndpJ5rXjKVhTJ+OmFFE
 3oUCfmRtyIFaMEUymVBNI0axtLJsKfJB/sGvxwFGBwSlYL5CiocXEkYP+TI0j0HW
 cwgAHrwih4tZ2Slt2ONptz25D73MeRycR6yzKt99i3s7YKnv1TIH1TcsDdDvNXYc
 iQ7v3UpLs84C+iPP1ioVWwnuq7kLFrYxY7YV9qcznp5wgQ3DMrdCKoMRE5fbsFXu
 4Ll1QwCIo35W2siD5vYMWjzHjb+3i8gUnxUQpA8R6QnUB2/fFhjYWnKslKlmhVUf
 wpb8qauhpeF2Y/NQsZQQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wu9xas35m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Mar 2024 18:16:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42DIGsBQ004907
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Mar 2024 18:16:55 GMT
Received: from [10.110.70.168] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Mar
 2024 11:16:50 -0700
Message-ID: <2020929f-c9a5-1209-78cb-ca75db44a432@quicinc.com>
Date: Wed, 13 Mar 2024 11:16:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/msm/dp: fix runtime PM leak on connect failure
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, "Bjorn
 Andersson" <quic_bjorande@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
References: <20240313164306.23133-1-johan+linaro@kernel.org>
 <20240313164306.23133-3-johan+linaro@kernel.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240313164306.23133-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: BNNegcXJxongtAGZIx1lIDE54NIYGZW8
X-Proofpoint-GUID: BNNegcXJxongtAGZIx1lIDE54NIYGZW8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_09,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403130138
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



On 3/13/2024 9:43 AM, Johan Hovold wrote:
> Make sure to balance the runtime PM usage counter (and suspend) before
> returning on connect failures (e.g. DPCD read failures after a spurious
> connect event or if link training fails).
> 
> Fixes: 5814b8bf086a ("drm/msm/dp: incorporate pm_runtime framework into DP driver")
> Cc: stable@vger.kernel.org      # 6.8
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
