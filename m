Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9776E9E75E0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 17:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB8310E402;
	Fri,  6 Dec 2024 16:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="UCp4WBTf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A56510E402
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 16:26:35 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6GMpKq026175;
 Fri, 6 Dec 2024 16:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HEtZXyIuo2ta5bt30TTW9g/r4uKrWQvEWoKZSfyLPxA=; b=UCp4WBTfU8la6H2J
 bpY0geAbqCo8GKsI0fYDOROYUqw+Kvah5phtFOZcMoVxFyBFo42ebDD51DZsHCJG
 8R0uTo1Vrjjt1n+4tsI6YNWnL3GhjkyvnMf/ba4qD6iurSJMSvWXo95oWEM+9BKf
 8+OvAD29HSK9BHUZNYb8uNK+T5z3ILd4QECTbvb/r5MTBu67Uqw6gfsm1AP7hyGc
 08nUENTtLEARBRxYJwxO6ohPOo9TPj2877nCWewWwjv1e+N3rhz/LPqx0j8oLu8E
 Lk6DG8i/1gE5f+byqm8EyO0dIY18HvOGMg7K9i0pEPxFtumU+orvECfqgz5AHX0J
 8I4uzw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43c4r4g08r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2024 16:26:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6GQWOc031271
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Dec 2024 16:26:32 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 08:26:31 -0800
Message-ID: <f094ae61-04a9-8bd9-7b43-72ccdca22d5a@quicinc.com>
Date: Fri, 6 Dec 2024 09:26:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V7 03/10] accel/amdxdna: Support hardware mailbox
Content-Language: en-US
To: Mike Lothian <mike@fireburn.co.uk>, Lizhi Hou <lizhi.hou@amd.com>
References: <CAHbf0-E+Z2O7rW-x+-EKNQ-nLbf=_ohaNzXxE7WD2cj9kFJERQ@mail.gmail.com>
CC: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <CAHbf0-E+Z2O7rW-x+-EKNQ-nLbf=_ohaNzXxE7WD2cj9kFJERQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: YaOHBtywWIMp4LYxrUAIqfcv_Mq3kR2x
X-Proofpoint-ORIG-GUID: YaOHBtywWIMp4LYxrUAIqfcv_Mq3kR2x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxlogscore=958 impostorscore=0 adultscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060124
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

On 12/5/2024 8:44 AM, Mike Lothian wrote:
> Hi
> 
> I needed to add the following to get things compiling for me
> 
> 
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c
> b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index fe684f463b945..79b9801935e71 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -6,6 +6,7 @@
> #include <drm/drm_device.h>
> #include <drm/drm_managed.h>
> #include <linux/bitfield.h>
> +#include <linux/interrupt.h>
> #include <linux/iopoll.h>

Looking at the code, this is valid.  However, I'm not sure why this is 
broken for you and not others.  Do you have any ideas?  How are you 
building this?  Is the tree and/or defconfig unique in some way?

> #define CREATE_TRACE_POINTS
> 
> 
> I also had to rename the firmware in /lib/firmware/amdnpu/1502_00/
> from npu.sbin.1.5.2.380 to npu.sbin
> 
> Cheers
> 
> Mike
> 

