Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F372D85000A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 23:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9585A10ECB2;
	Fri,  9 Feb 2024 22:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="TdhtEpqe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE61910ECAA;
 Fri,  9 Feb 2024 22:34:12 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 419JuNWQ031033; Fri, 9 Feb 2024 22:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=8aYcf0/lEWQpUtSVosm8sdwIEHo2Cg6uI32YoDhsPUg=; b=Td
 htEpqezVmZvQQ1tlb6hCl7Uf62arY/830PVCwYDGSR1lY3/BHMRyseprSAGubzow
 VD64PJ6LSHFi7VkE4lX8+GxGsCFQonz+flUj87sKPeeQXuWK17nXYNPbj1Hftj/H
 gp62dvo1tlC4kaICM3DVw5lC9lYM1xSfBqujqrR8xoepumuRHnP+EYTRnH7WmaTn
 bDx/boO2k7JXUQFd3xUG2fttNnw1fIOr0x9a7ompt4Z9nG8a8QSj+lD8b8VdRJOb
 7tZyDW6WK6DP7W47u63/k/6woyWbtdMIGS1gxsmvjfcQigzV1+pZ9lFsZjMRSxwS
 jhyac7EdrXBb42fWQfnw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5m1596h6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Feb 2024 22:34:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 419MY4rv021929
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Feb 2024 22:34:04 GMT
Received: from [10.110.104.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 14:34:03 -0800
Message-ID: <b4637aa9-5b07-6b9e-b47b-c9822ce18063@quicinc.com>
Date: Fri, 9 Feb 2024 14:34:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RESEND 4/5] drm/msm/mdp5: migrate SMP dumping to using
 atomic_print_state
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>
References: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
 <20231203000532.1290480-5-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231203000532.1290480-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: d03bkIbx6nY7ZNBJpoaO31G7rRF-g2ag
X-Proofpoint-ORIG-GUID: d03bkIbx6nY7ZNBJpoaO31G7rRF-g2ag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_18,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=695 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402090165
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



On 12/2/2023 4:05 PM, Dmitry Baryshkov wrote:
> The Shared Memory Pool (SMP) state is a part of the MDP5's private
> object state. Use existing infrastructure, atomic_print_state()
> callback, to dump SMP state (which also makes it included into
> debugfs/dri/N/state). This allows us to drop the custom debugfs file
> too.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c |  2 --
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 46 ++++++------------------
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c | 12 ++-----
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h |  4 ++-
>   4 files changed, 15 insertions(+), 49 deletions(-)
> 

Nice cleanup !

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
