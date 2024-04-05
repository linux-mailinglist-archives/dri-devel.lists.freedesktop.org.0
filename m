Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3F389A0D0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 17:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A90810EAC0;
	Fri,  5 Apr 2024 15:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="N9uJc2+f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547EA112DAB
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 15:17:06 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 435ETQpG015686; Fri, 5 Apr 2024 15:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=257TzLra1WorO4agCjkMrLPpVxuRWnoz7SjEi14wZyM=; b=N9
 uJc2+fsJVUS06KLeD8zhEf6BjcRI3fC4zq4KoRcZGFJ1afthiEPpDV1AI2mMmLyl
 ezlI6Jy2G9aepDJBW9YIa3oGXhDR9XaoHynDes7CbcT3j8B66U3tEKIe0RyfV883
 KLoEtWT1Zqf2gT0MnxrYORoGtK8vycD/dNEbSZ8IXpBIUF+Na84Ju58iBGDrmds9
 RBiik8njbRCuR/D5uCaVncgAnNFvcYaP/f3nL7h8XrPpUa1CGzlnnM6y0BaZj2Y2
 9XgqHi5kHJWLYNN1JK3cmYSr0QsjJ88ADU1nIgoZO3motqbVnEos/6hAEaboDMny
 AQ2c3dD/xcrIc7MLqB9A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xafpkrkqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2024 15:17:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435FH2kD003087
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 Apr 2024 15:17:02 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 5 Apr 2024
 08:17:02 -0700
Message-ID: <4bfe603e-c0a9-8bfa-eda3-026613d974de@quicinc.com>
Date: Fri, 5 Apr 2024 09:16:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/8] accel/ivpu: Check return code of ipc->lock init
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, "Wachowski, Karol" <karol.wachowski@intel.com>,
 <stable@vger.kernel.org>
References: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
 <20240402104929.941186-2-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240402104929.941186-2-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: r1LODWVDRryLxl3R0HXnurSBJd4yl6B9
X-Proofpoint-ORIG-GUID: r1LODWVDRryLxl3R0HXnurSBJd4yl6B9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_16,2024-04-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxlogscore=953 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404050110
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

On 4/2/2024 4:49 AM, Jacek Lawrynowicz wrote:
> From: "Wachowski, Karol" <karol.wachowski@intel.com>
> 
> Return value of drmm_mutex_init(ipc->lock) was unchecked.
> 
> Fixes: 5d7422cfb498 ("accel/ivpu: Add IPC driver and JSM messages")
> Cc: <stable@vger.kernel.org> # v6.3+
> Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
