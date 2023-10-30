Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A94CD7DC0D9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 20:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B154410E364;
	Mon, 30 Oct 2023 19:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C1010E364;
 Mon, 30 Oct 2023 19:57:26 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39UJs8tE029354; Mon, 30 Oct 2023 19:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=rnPCZtvi2G7GplK5DWmZXzW0VWYl5ynMvVdrPkeyFsQ=;
 b=gM4bdKVQ8brBlx3m7zHplBbO1vM97Zj5i+qPy4E08i04z6Hrm9ICuko2co154mK0GEhA
 +G9NkzeKu0Pbt6hpFffg4BQhUVh38OxAsoZpI7krlBc6svSOKY+w803R3Kf0b6njVFAZ
 5pkPRnsCEV6C3xGI9FrqG5GA5Y5js5Y/2STBBAU+TKVNKNwDvi/3TsBsrdJOi73dc93s
 2KUxFfkU0l+XdRXHMHLmNCRSL90ukjw+3A+xBxMMGTSbmxJGSHjnBf7WFXMu1CTITjY+
 lRtcxv6BQn0OiXNDZSCLqAOu41Sc9Jas5RwI8cSOS44rt0yUuAa+W7gnr006jcaLn0JI 8A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u2dey0xp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 19:57:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39UJvJ4a001328
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 19:57:19 GMT
Received: from [10.110.97.66] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 30 Oct
 2023 12:57:18 -0700
Message-ID: <0dcd6251-32a3-a176-7068-52174ddc614c@quicinc.com>
Date: Mon, 30 Oct 2023 12:57:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 08/10] drm/msm/dpu: rewrite scaler and CSC presense
 checks
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
 <20231006131450.2436688-9-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231006131450.2436688-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: OO2KTtBYygB60CzNBpe214nX0xusUE6a
X-Proofpoint-GUID: OO2KTtBYygB60CzNBpe214nX0xusUE6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=709
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2310240000 definitions=main-2310300157
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



On 10/6/2023 6:14 AM, Dmitry Baryshkov wrote:
> In order to check whether the SSPP block has scaler and CSC subblocks
> the funcion dpu_plane_atomic_check_pipe() uses macros which enumerate
> all possible scaler and CSC features. Replace those checks with the
> scaler and CSC subblock length checks in order to be able to drop those
> two macros.
> 

funcion ---> function

> Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 15 ---------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 ++--
>   2 files changed, 2 insertions(+), 17 deletions(-)
> 

Rest LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

