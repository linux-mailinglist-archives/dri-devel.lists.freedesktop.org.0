Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B7EA24290
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 19:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73A210E40B;
	Fri, 31 Jan 2025 18:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Q5lpvZwy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D385210E41C
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 18:29:33 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VDL5Xd020683;
 Fri, 31 Jan 2025 18:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BmQfPCtsiPiVdQMaiDQ54r+5hhpCU2+hgfWKN7wcXgE=; b=Q5lpvZwyaI8dQTBo
 vWCoee3EdyTamymI0/o2Em6QXH/6bbxROy6auNdzDoQmR9IiwMFJvry7rv0HLNbN
 V/YDN+HKR248H6pi+0u9B/r5ZLRuQorPm1cOnVnqaWyFa4svvHpGP2SNuQHML7ls
 KI38M9xbS3B2ICB/zOjQD/HedFCY905MXJkJar/pnAS3W28cHAQApBy/el9ykzE4
 zD4mWZZ3w8iiZo0mbkgghB+7O0vzwsOLsPTcMLvIxKUX6PyhMKR0Eb4C7SI4NpCz
 wrX6eXMNcTH78dmfkad1pkULpbCjFIQ5unR0Op+AuyRBP5TumWRI7SNY4qqQogy7
 mY9B8Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gyapgqa0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 18:29:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50VITVQd013735
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 18:29:31 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 Jan
 2025 10:29:31 -0800
Message-ID: <4b7b91f0-29b1-d406-f25a-bd63e27f4a2a@quicinc.com>
Date: Fri, 31 Jan 2025 11:29:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 3/3] accel/ivpu: Fix error handling in recovery/reset
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <maciej.falkowski@linux.intel.com>,
 <stable@vger.kernel.org>
References: <20250129124009.1039982-1-jacek.lawrynowicz@linux.intel.com>
 <20250129124009.1039982-4-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250129124009.1039982-4-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wZdFQTeZ43r0fURrR2q2CrRuUmhFLn40
X-Proofpoint-ORIG-GUID: wZdFQTeZ43r0fURrR2q2CrRuUmhFLn40
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=890 bulkscore=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310139
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

On 1/29/2025 5:40 AM, Jacek Lawrynowicz wrote:
> Disable runtime PM for the duration of reset/recovery so it is possible
> to set the correct runtime PM state depending on the outcome of the
> `ivpu_resume()`. Don’t suspend or reset the HW if the NPU is suspended
> when the reset/recovery is requested. Also, move common reset/recovery
> code to separate functions for better code readability.
> 
> Fixes: 27d19268cf39 ("accel/ivpu: Improve recovery and reset support")
> Cc: <stable@vger.kernel.org> # v6.8+
> Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
