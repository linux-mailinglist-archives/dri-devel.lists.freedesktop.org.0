Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6992270D0BE
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 03:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD8E10E3BC;
	Tue, 23 May 2023 01:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AC810E3B5;
 Tue, 23 May 2023 01:58:33 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34N1L5rZ024454; Tue, 23 May 2023 01:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=F7k0r7ooUcNHrrRJkHyJR7M/jJqeN9SiEeFGrBLd0Qw=;
 b=hYGXBlNeUZJVTknl4zwREEZ0VXpTjdH3SohT5qWBPtYxe7PR5+kXShsa1CmYeX7HKLiv
 sVvVtXTq48Rkof4xD1zBDUYgSGNpjAOvtGZA7PPDolEF0r86iSvxhMXu8sB0mjbeQnNh
 GRFUPeDYf/h3CAPXz4WU3JNM7Z5xSuwZauwA2ZNk3IQd519YYQQv1wE8POKwbRE2XqBd
 9TXbR/k8eTmJx/BXJK4s4aAseXVgAVjxrM3c2PYG+q/ez6YbD0wHaUXykWbEJua864Ix
 /34/g1iJrSSzqOaLPSsgPu9bLDMhUwRhXWZW00x+L5BhNtXEvTEiR/sQRnbCDyb1UB3U nA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qre8p0j5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 01:58:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34N1wRCV019212
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 01:58:27 GMT
Received: from [10.110.65.90] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 22 May
 2023 18:58:27 -0700
Message-ID: <557a8aee-37b9-5654-c82c-97206576ab44@quicinc.com>
Date: Mon, 22 May 2023 18:58:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH v2 0/7] drm/msm/dpu: simplify DPU encoder init
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: k-PDFeoTWndqsZVVuu8NB_zWmoHCtuqq
X-Proofpoint-GUID: k-PDFeoTWndqsZVVuu8NB_zWmoHCtuqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_18,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305230014
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/18/2023 7:38 PM, Dmitry Baryshkov wrote:
> Rework dpu_encoder initialization code, simplifying calling sequences
> and separating common init parts.
> 
> Changes since v1:
> - Withdrawn two pathes for a later consideration
> - Changed dpu_encoder_phys_init() to return void (Abhinav)
> - Added small simplifications of dpu_encoder_phys_cmd_init() and
>    dpu_encoder_phys_wb_init()
> 

I had previously given these comments on the cover letter of v1, so 
giving it again.

Please mention that your series was made on top of 
https://patchwork.freedesktop.org/series/116530/.

Figured it out when I tried to apply it to my branch to test.

I had tested v1, and between v1 and v2 i only see very trivial change, 
so i think its okay to retain:

Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280

> Dmitry Baryshkov (7):
>    drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
>    drm/msm/dpu: separate common function to init physical encoder
>    drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
>    drm/msm/dpu: inline dpu_encoder_get_wb()
>    drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
>    drm/msm/dpu: drop temp variable from dpu_encoder_phys_cmd_init()
>    drm/msm/dpu: simplify dpu_encoder_phys_wb_init()
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 178 ++++++++----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  14 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  15 +-
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  35 ++--
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  19 +-
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  35 +---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  87 ++++-----
>   7 files changed, 140 insertions(+), 243 deletions(-)
> 
