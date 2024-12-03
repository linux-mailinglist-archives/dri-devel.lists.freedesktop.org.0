Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1229E2C35
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 20:42:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FC310E288;
	Tue,  3 Dec 2024 19:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YAJe7iUt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA2C10E288;
 Tue,  3 Dec 2024 19:42:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3Gi0Mu027853;
 Tue, 3 Dec 2024 19:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9EPMgjVNLChb8n92Kc2ub47qgMBtVTWQlZoZbDBRsJs=; b=YAJe7iUtIyJ/+L2f
 tjUYspVQTeKXRpZMXI6qVoJGQdOCn8CigFsag6A4bjGhneu05KggD7zNiSqpLnpc
 Wt2J5JSEWgQ/JJ4gpv0NfRDkYQ6lxSCq6lIasYucfdwxQBjfS9LkzQkUvkugf5e3
 5Q3+qsnd5iVz/6nUUxazTd0J/mAovvtvFtZXez5GvdkoEBVwKfocIAwgqnEtfre2
 3eE1aATImGoVhMqsl1ywtcvVl/qyMtmCGio7WzAmJUq+s/N2wwNJBt1RnH2aILPE
 //KGLEvRnxPRWVAC3cZzKm6eFd8zVCAE+DqQtSofdoxKWBul6rxnxtPTfcWlO23R
 tJ9Kuw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vcej41h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2024 19:42:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B3JgiIA008499
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 3 Dec 2024 19:42:44 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 11:42:43 -0800
Message-ID: <f8bb9597-c5b3-4dbf-a65e-7bd17cd3ffc5@quicinc.com>
Date: Tue, 3 Dec 2024 11:42:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/msm/dp: Fix and utilize TPG with a debugfs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
 <lpkhftx62hbnrftzoy6zprhvir7dffz5ynwo3kr5j5obc3dcle@73ljnmpdt7ts>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <lpkhftx62hbnrftzoy6zprhvir7dffz5ynwo3kr5j5obc3dcle@73ljnmpdt7ts>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: uWTxjPu4I4L3dZ9LsX6b3pNVeN4PKqB9
X-Proofpoint-ORIG-GUID: uWTxjPu4I4L3dZ9LsX6b3pNVeN4PKqB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxlogscore=832 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030163
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



On 12/3/2024 6:31 AM, Dmitry Baryshkov wrote:
> On Mon, Dec 02, 2024 at 12:41:57PM -0800, Abhinav Kumar wrote:
>> DP Test Patten Generator is a very useful tool to debug issues such
>> as blank screen or corruption seen on the DP monitor by isolating it
>> to whether the corruption is coming from further upstream such as DPU
>> OR from the DP controller and below. It was noted in [1] that this API
>> is unused. Rather than dropping the API, it should be fixed and used.
>>
>> Hence, this series fixes the DP Test Patten Generator API and also utilizes
>> it by adding a debugfs for it.
>>
>> [1] : https://patchwork.freedesktop.org/patch/623508/?series=141074&rev=1
> 
> I'd prefer for this to be rebased on top of [2]. The series has been
> posted a month ago.
> 
> [2] https://patchwork.freedesktop.org/series/141074/
> 

Well, the review of that series which tried dropping the tpg led to this 
one really.

I will review that one within a couple of days. Lets first agree on that 
series before deciding to rebase.

>>
>> To: Rob Clark <robdclark@gmail.com>
>> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> To: Sean Paul <sean@poorly.run>
>> To: Marijn Suijten <marijn.suijten@somainline.org>
>> To: David Airlie <airlied@gmail.com>
>> To: Simona Vetter <simona@ffwll.ch>
>> To: Stephen Boyd <swboyd@chromium.org>
>> To: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: freedreno@lists.freedesktop.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>> Abhinav Kumar (3):
>>        drm/msm/dp: account for widebus in msm_dp_catalog_panel_tpg_enable()
>>        drm/msm/dp: do not touch the MMSS_DP_INTF_CONFIG for tpg
>>        drm/msm/dp: add a debugfs node for using tpg
>>
>>   drivers/gpu/drm/msm/dp/dp_catalog.c | 15 +++++++--
>>   drivers/gpu/drm/msm/dp/dp_debug.c   | 61 +++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
>>   3 files changed, 76 insertions(+), 2 deletions(-)
>> ---
>> base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
>> change-id: 20241202-tpg-3f7543c036ac
>>
>> Best regards,
>> -- 
>> Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
> 
