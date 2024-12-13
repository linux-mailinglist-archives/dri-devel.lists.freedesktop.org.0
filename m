Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCC09F1255
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 17:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D3E10F08D;
	Fri, 13 Dec 2024 16:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bMpqAfOG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A5310F08D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 16:37:16 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD81scf022370;
 Fri, 13 Dec 2024 16:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EdpZwmiV246JBoUqwzLd4lbwWGEYgXCDIAXZxMge7DE=; b=bMpqAfOGWPBmgbE9
 iyf8qFC5ZFdpfYNdY87uN0qYPG0hvdC7iVO4r/UkX9GgkqreKGtkTUIaUF3RS3i9
 COGx4BzkiNZNN5kORNC3ugp00Zh0eMODZ7aDmbXoop1LF5W72/RhwzgyLwNrnL/N
 FF6o/C/OvyWCtuRDsyjbA0FSSTvpyMM7b2BOeDXLl9bDei3IOWlu14Szp3iRhaPE
 rexnBRzxeN3GM2yGPjlAlczu1QEdh8Ason5bEKcmcjozBkbA+/XUonKYAIx8Yyh6
 CTTGsg7iHJc5o07cgBFOYm4K/ybNC0ym8e7rDH11VXF20gscUIyzuuPAlIPkyE+W
 dWU4Mw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gh271e87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 16:37:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDGbBsK005589
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 16:37:11 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 08:37:10 -0800
Message-ID: <96368cf8-792b-598c-0c82-e6d2f46cfb74@quicinc.com>
Date: Fri, 13 Dec 2024 09:37:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V2 3/8] accel/amdxdna: Add RyzenAI-npu6 support
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>,
 <mario.limonciello@amd.com>, Xiaoming Ren <xiaoming.ren@amd.com>
References: <20241206220001.164049-1-lizhi.hou@amd.com>
 <20241206220001.164049-4-lizhi.hou@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241206220001.164049-4-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: pkU0pjHH5yyIHcWVA9wJi3r_NfJz-CZu
X-Proofpoint-GUID: pkU0pjHH5yyIHcWVA9wJi3r_NfJz-CZu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=712 impostorscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130117
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

On 12/6/2024 2:59 PM, Lizhi Hou wrote:
> Add NPU6 registers and other private configurations.
> 
> Co-developed-by: Xiaoming Ren <xiaoming.ren@amd.com>
> Signed-off-by: Xiaoming Ren <xiaoming.ren@amd.com>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/Makefile    |   3 +-
>   drivers/accel/amdxdna/npu6_regs.c | 121 ++++++++++++++++++++++++++++++

This looks like dead code to me. I would expect somewhere else in the 
driver, dev_npu6_info would be used, but that is not the case.  What am 
I missing?

-Jeff
