Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F5676F470
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 23:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D4F10E115;
	Thu,  3 Aug 2023 21:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74B310E115;
 Thu,  3 Aug 2023 21:06:31 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 373KkVbY008015; Thu, 3 Aug 2023 21:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7XYGNJwUP2VKmFtxs1N0kzZeF4GKJrwRRHMePG6EE0g=;
 b=ENWgF92CUgi//ntsT7FWSoB2+AfAhHOb5aLlu/LYQyDwxw2fBjTmUI3Xs+4CVWRc2USh
 qoQ118t09dZ8ZSbhcFoGSoqbrdEecDow16hQoRTQNuZqMJO0SAFIU/bfxEck7XmznUUQ
 RMh6g4T55VFT3ZHHg76hwa4wclwNNx+0TiG0PAdp7uUf3bhQDxx00HM9vy9xs7q5XNY4
 6YTMjo2Qpdr4l9MykWOJ25HGajHsPRySGjxlOPo9TxdB3airrKOADDrSxfCJkv4TQ4rz
 /ntm9y6E9kOSTYXfkqCLO3Bu3Ktk1QrN96gmyubJafcFluhYpsfiVayHJOdMXHlr2ztj KA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s8kfx0152-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Aug 2023 21:06:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 373L6OQx003927
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 3 Aug 2023 21:06:24 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 3 Aug
 2023 14:06:23 -0700
Message-ID: <f3bb8699-2e4d-f9b2-0dff-267b058bc24b@quicinc.com>
Date: Thu, 3 Aug 2023 14:06:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/mdp5: Don't leak some plane state
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
References: <20230803204521.928582-1-daniel.vetter@ffwll.ch>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230803204521.928582-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: -NaBc_DQYG0YuEtkkwDHacXM-jtGJ6qm
X-Proofpoint-GUID: -NaBc_DQYG0YuEtkkwDHacXM-jtGJ6qm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_22,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 malwarescore=0 mlxscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308030189
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
Cc: linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, freedreno@lists.freedesktop.org,
 dorum@noisolation.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/3/2023 1:45 PM, Daniel Vetter wrote:
> Apparently no one noticed that mdp5 plane states leak like a sieve
> ever since we introduced plane_state->commit refcount a few years ago
> in 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too
> early by tracking commits, v3.")
> 
> Fix it by using the right helpers.
> 
> Fixes: 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too early by tracking commits, v3.")
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Reported-and-tested-by: dorum@noisolation.com
> Cc: dorum@noisolation.com
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

