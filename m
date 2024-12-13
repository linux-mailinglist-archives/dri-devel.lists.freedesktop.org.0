Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8389F144E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 18:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503AF10E004;
	Fri, 13 Dec 2024 17:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NUfCMD0u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A8C10E004
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 17:49:19 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDA4Fqo013312;
 Fri, 13 Dec 2024 17:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ccRf4dxInKCR5rNbOCB41Uabbf0x6GfGWKiNui3GNwI=; b=NUfCMD0us/HlmYC5
 PqXS/7Y2iwulGbk/skX7BqORRQUuEBTyxY60AJnU/QZ+N1FylpZ1/AA8ztu/oa40
 xvLI0TEVvUIcNpCZZWdjvfvtbEZ2PYGPRs+zcz8oik6ckDaFukcspz0nUDZZZHuk
 yh3x54bIbUWaUrQA2v24CLRLhhmlhL2Dw4fIqf8hC8aQ5mo+qIMsNrXJbKwkBWqy
 u/Brfm/G+121R3x8C6UKQzUP2B3+n32wWjW5dIgWVANVRjgRroTL7xZ5oUjX08cJ
 VuI+heQfdiS7wmtKVKAgOEVQ4ciXAZMvTy4Hs3qsCX4wgGVLiD7EvXo4mgHwCcsM
 qw8bKw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjudh7nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 17:49:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDHnALZ006411
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 17:49:10 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 09:49:09 -0800
Message-ID: <6d4267db-922d-8c01-f76a-6b796422c24d@quicinc.com>
Date: Fri, 13 Dec 2024 10:49:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/2] accel/amdxdna: use modern PM helpers
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, Arnd Bergmann <arnd@kernel.org>, Min Ma
 <min.ma@amd.com>, Oded Gabbay <ogabbay@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Narendra Gutta
 <VenkataNarendraKumar.Gutta@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241213090259.68492-1-arnd@kernel.org>
 <828570ae-1ff6-4bef-4bb8-51da9237e63e@quicinc.com>
 <e3d9dcd1-70bf-5656-e1a9-749c5a08a20b@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <e3d9dcd1-70bf-5656-e1a9-749c5a08a20b@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6jCgDqWcFVztfgp_9hxU2UYqs-18Qxvr
X-Proofpoint-ORIG-GUID: 6jCgDqWcFVztfgp_9hxU2UYqs-18Qxvr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130125
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

On 12/13/2024 10:41 AM, Lizhi Hou wrote:
> 
> On 12/13/24 09:07, Jeffrey Hugo wrote:
>> On 12/13/2024 2:02 AM, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> The old SET_SYSTEM_SLEEP_PM_OPS and SET_RUNTIME_PM_OPS macros cause a 
>>> build
>>> warning when CONFIG_PM is disabled:
>>>
>>> drivers/accel/amdxdna/amdxdna_pci_drv.c:343:12: error: 
>>> 'amdxdna_pmops_resume' defined but not used [-Werror=unused-function]
>>>    343 | static int amdxdna_pmops_resume(struct device *dev)
>>>        |            ^~~~~~~~~~~~~~~~~~~~
>>> drivers/accel/amdxdna/amdxdna_pci_drv.c:328:12: error: 
>>> 'amdxdna_pmops_suspend' defined but not used [-Werror=unused-function]
>>>    328 | static int amdxdna_pmops_suspend(struct device *dev)
>>>        |            ^~~~~~~~~~~~~~~~~~~~~
>>>
>>> Change these to the modern replacements.
>>>
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>
>> Looks sane to me.
>>
>> Lizhi, can you verify that this works as expected for you?  I'd hate 
>> to accidentally break something.
> 
> Verified suspend/resume. It works fine.

Excellent.  Would you like to give a reviewed-by and/or a tested-by?

-Jeff

