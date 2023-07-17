Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE2B756B6E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 20:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102EA10E29F;
	Mon, 17 Jul 2023 18:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B9810E29F;
 Mon, 17 Jul 2023 18:12:47 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36HHq8gF004002; Mon, 17 Jul 2023 18:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=YySO6RxiKbvc5+3font8wRtgIeMZy9EJjS6cQ33CESA=;
 b=U+OiZd4+UWmSj1LFsLjjuIRMrY9cgME2e9SfyoI5zkjdL/vFYweQWljH9bk49seconAJ
 tPkTByqNd7Mq1e59/UfucECGe+KSrdrDtTF5zbkSe+F+XDILZRbYBXA9JOg8Rbn/ltMI
 z4BLA84BrHlrESS6jfC+40c8MemN9jskl/nU2d2lxzFx/IFt3L/2it8ZCGoqWhf3wpYk
 1vgeKXeZj8w2UNW3fLRttt6VgYgegw/j6pX/Mh34GzMneWI8uYMUN7hnJor70ziFkLTK
 eTggO4PkQateNEUQqlEaZFkHSrrdteelmJuaHSCRpMCErYftqjfNAi3qTyBL/BbrO2/u fw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3run1jc8wc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jul 2023 18:12:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36HICfBo023009
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jul 2023 18:12:41 GMT
Received: from [10.110.91.201] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 17 Jul
 2023 11:12:40 -0700
Message-ID: <3318490a-a1c8-f531-6456-3047c11e97e8@quicinc.com>
Date: Mon, 17 Jul 2023 11:12:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 10/11] drm/msm/dpu: move max clock decision to dpu_kms.
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
 <20230712221139.313729-11-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230712221139.313729-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: rydqV-3PTeSA6GWhtFaDI8dVItH_e1Y2
X-Proofpoint-ORIG-GUID: rydqV-3PTeSA6GWhtFaDI8dVItH_e1Y2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_13,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307170166
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



On 7/12/2023 3:11 PM, Dmitry Baryshkov wrote:
> dpu_core_perf should not make decisions on the maximum possible core
> clock rate. Pass the value from dpu_kms_hw_init().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Also mention that with this, you are dropping the now unused core_clk 
handle in the dpu_core_perf.

With that,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
