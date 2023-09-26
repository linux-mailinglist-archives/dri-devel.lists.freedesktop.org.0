Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB577AF018
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 17:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D505810E3FA;
	Tue, 26 Sep 2023 15:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289DF10E3FA
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 15:56:50 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38QD59RT023355; Tue, 26 Sep 2023 15:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0Sn3CD3PjF3XMHvEG0+BBAdVG46lB0stFqOyeJtQpUs=;
 b=cSD6Cjs8sBKKA+p7g3Rw2B6fXEIGDhmPBCf8cd3mVGdwIymt/YaX8L2gDs8NrIF7RZD8
 9wZFKQdm7oIpafAF1V1y4a9CIsoy9RjZ1xJJjeWz8qU3yKSky6b1ZDDN0ffxHW4luF6t
 afuUaWo8BWDDI8t+28bYQVjsR7UsSOsJNmoXfswnRSwJ5DXTgZkD3Id83EEWYJ6ogsxR
 jY+xzzdaX02jvese4qscfjWjR5+3L+pengL5W2cd+eLjdmCgUI85yAEA8cI0C78ojKrq
 DPdMm3bPq3G19SThKtKGhlYw8iL90qkNibDqOm8SzMRGWDMsKTGT24ApgFzu8bLHXAE/ +w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tbmwwswpm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 15:56:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38QFukKx030261
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 15:56:46 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 26 Sep
 2023 08:56:45 -0700
Message-ID: <f55cb1c3-3132-eb7a-60aa-5278b876eaeb@quicinc.com>
Date: Tue, 26 Sep 2023 09:56:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 6/6] accel/ivpu: Use cached buffers for FW loading
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230925121137.872158-1-stanislaw.gruszka@linux.intel.com>
 <20230925121137.872158-7-stanislaw.gruszka@linux.intel.com>
 <20230926120943.GD846747@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230926120943.GD846747@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _TRsD5wgOHFaWepiEFw4jQYZdnWnbJqM
X-Proofpoint-ORIG-GUID: _TRsD5wgOHFaWepiEFw4jQYZdnWnbJqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_13,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=854 spamscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309260140
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/26/2023 6:09 AM, Stanislaw Gruszka wrote:
> From: Karol Wachowski <karol.wachowski@linux.intel.com>
> 
> Create buffers with cache coherency on the CPU side (write-back) while
> disabling snooping on the VPU side. These buffers require an explicit
> cache flush after each CPU-side modification.
> 
> Configuring pages as write-combined may introduce significant delays,
> potentially taking hundreds of milliseconds for 64 MB buffers.
> 
> Added internal DRM_IVPU_BO_NOSNOOP mask which disables snooping on the
> VPU side. Allocate FW runtime memory buffer (64 MB) as cached with
> snooping-disabled.
> 
> This fixes random long FW loading times and boot params memory
> corruption on warmboot (due to missed wmb).
> 
> Fixes: 02d5b0aacd05 ("accel/ivpu: Implement firmware parsing and booting")
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
