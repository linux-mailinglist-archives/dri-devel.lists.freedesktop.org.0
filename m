Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC4A7E788A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 05:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC35810E640;
	Fri, 10 Nov 2023 04:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C53610E640
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 04:03:51 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AA411kb014084; Fri, 10 Nov 2023 04:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8vxioZ4l5DdQfe6B+y2aQH551hY/8/PE7aZMrX+d32o=;
 b=Ib92pYHyw96+e0/IjzPw7f+phVkgkKpxFq4jiuhtYtKmWXaPN8GuuG0BqZQtcKkJ9TrI
 fKhjZcbUQjZtKlFQ8BbJtu3VZbW7OxzgDSE+gesLWmzdHULKRvJeROlEYE1/SykSeHPv
 BnyUz2MvBDwJ1Ha0G+wI+X0NVHufjO4OH47m654io3eNg+3GsG4aB7eF/Z5vSHbW77mn
 bd8nveVdLKErbuHmLz8dwjw17J8jNMY/d8hI77wpRuV2KgiSfmCDYH2iTdBFVzQEX1Rv
 HuR7IUb37VKxmfZpD0wCw/ZiMPKpTazq+A2ITVJn1GzY+8bHjHdGrvedpp+Q+Qev5Di2 Rw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u99e90cb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 04:03:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AA43hKY022971
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 04:03:43 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 9 Nov
 2023 20:03:43 -0800
Message-ID: <5a1c5f44-d593-2254-0c95-4828fbc10ad9@quicinc.com>
Date: Thu, 9 Nov 2023 21:03:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/5] accel/ivpu: Do not use irqsave in ivpu_ipc_dispatch
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20231107123514.2218850-1-jacek.lawrynowicz@linux.intel.com>
 <20231107123514.2218850-3-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231107123514.2218850-3-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: WYbQwQaABdigoXSw-sUe4thecy1TkL1h
X-Proofpoint-ORIG-GUID: WYbQwQaABdigoXSw-sUe4thecy1TkL1h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_17,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=402 bulkscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311100033
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/7/2023 5:35 AM, Jacek Lawrynowicz wrote:
> From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> 
> ivpu_ipc_dispatch is always called with irqs disabled. Add lockdep
> assertion and remove unneeded _irqsave/_irqrestore.
> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Missing SOB.

-Jeff
