Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0252805F73
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 21:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5BC10E606;
	Tue,  5 Dec 2023 20:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B364210E604;
 Tue,  5 Dec 2023 20:30:13 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B5KCEBT003019; Tue, 5 Dec 2023 20:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1HsgzgVzv8cENBgYjON7cIK996BxV0NnGUdVp/jzGyQ=;
 b=DgEKPg6TOeyK4otHW5ZSUmyKrmBWmFOQAL9qADpHiu8wxFw60/+FULMGZDbNaCEiNbe8
 eC3yctrmdyH+DIyeLNmSoBGG4SvDswX+E3tDT7/yVCe1EymbHOb1ofv2IgiQpztsx8p+
 C4Ef4CVaqP+Gb6dkwJ8I5j968GXmh2KtkN98FUt4P/cElz0doam4QCmPsC6415o9eS5q
 /5gz0Ul6a2ByBlRj1tA9bZhVWhMgJjQF7MKaEc9N6QByX5pz7ysw17DHLTUJ5LRq9JfR
 HPLdG9juyrTefvfq6m4PS9STBSeQkQ4CuQx9dxa/IvFFNntS3YaolctxLMyL1bxUtFw/ FQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utanm819e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Dec 2023 20:30:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B5KU6t4002430
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 5 Dec 2023 20:30:06 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Dec
 2023 12:30:03 -0800
Message-ID: <684b467c-a4f2-9c8d-b81c-0a21cefdb422@quicinc.com>
Date: Tue, 5 Dec 2023 12:30:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/msm/dpu: correct clk bit for WB2 block
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20231203002437.1291595-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231203002437.1291595-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2eWoeBxUfE7j5cJwZj93uiiuuV50C8Z6
X-Proofpoint-ORIG-GUID: 2eWoeBxUfE7j5cJwZj93uiiuuV50C8Z6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-05_16,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=633 clxscore=1015 malwarescore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312050161
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/2/2023 4:24 PM, Dmitry Baryshkov wrote:
> On sc7280 there are two clk bits for WB2: vbif_cli and clk_ctrl. While
> programming the VBIF params of WB, the driver should be toggling the
> former bit, while the sc7180_mdp, sc7280_mdp and sm8250_mdp structs
> list the latter one.
> 
> Correct that to ensure proper programming sequence for WB2 on these
> platforms.
> 
> Fixes: 255f056181ac ("drm/msm/dpu: sc7180: add missing WB2 clock control")
> Fixes: 3ce166380567 ("drm/msm/dpu: add writeback support for sc7280")
> Fixes: 53324b99bd7b ("drm/msm/dpu: add writeback blocks to the sm8250 DPU catalog")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Changes since v1:
>   - Fixed the bits for all three platforms supporting WB (Abhinav)
> 
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 

LGTM now.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
