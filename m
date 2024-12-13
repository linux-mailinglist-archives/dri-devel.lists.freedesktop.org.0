Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0BF9F1330
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 18:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6675610F0A5;
	Fri, 13 Dec 2024 17:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="l0hxUDtU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8450010F0A5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 17:07:08 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDAPf5u024170;
 Fri, 13 Dec 2024 17:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 alFXy0ty0D/1n6X6CFmkqO3ZMBSqiEh8oPNESPe1Fzk=; b=l0hxUDtUe54+4VzD
 uP38gEAYcGCJs0bVgiaC4tqnwFAAHdXFvu7w04xvmhR15/tMtj2/yp2ciGt+kxFE
 7A1ale/LnVoxq/KQwcRopGieCiD+/oExysyFOZy8g0tZo/F3hdvka0fyqKiRuhRf
 2dGQXudogcF7AL/I5KC92kXcGG/ElczgV/rTN7jJkYyoRVPT7ZmIoWvVMmFGHPv2
 M0Rzaxup0eL2hm7OnsN/X6LIWdJVMvUdekSBMx1mGqz+30D1CLohPAtL5ZjBsm6o
 6JYzF+5JbuM+6Xo5OMXzOIk+4KJyhoKzZTXYkl+gwMPRxBCGm6EkEN0+Xga0a2ud
 XBlkwA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd40q2m4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 17:07:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDH71f8004926
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 17:07:01 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 09:07:01 -0800
Message-ID: <828570ae-1ff6-4bef-4bb8-51da9237e63e@quicinc.com>
Date: Fri, 13 Dec 2024 10:07:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/2] accel/amdxdna: use modern PM helpers
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Min Ma <min.ma@amd.com>, Lizhi Hou
 <lizhi.hou@amd.com>, Oded Gabbay <ogabbay@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Narendra Gutta
 <VenkataNarendraKumar.Gutta@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241213090259.68492-1-arnd@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241213090259.68492-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 66rOj-dLyLPuJviDA4kCT2ERzYfke_Qb
X-Proofpoint-ORIG-GUID: 66rOj-dLyLPuJviDA4kCT2ERzYfke_Qb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130121
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

On 12/13/2024 2:02 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The old SET_SYSTEM_SLEEP_PM_OPS and SET_RUNTIME_PM_OPS macros cause a build
> warning when CONFIG_PM is disabled:
> 
> drivers/accel/amdxdna/amdxdna_pci_drv.c:343:12: error: 'amdxdna_pmops_resume' defined but not used [-Werror=unused-function]
>    343 | static int amdxdna_pmops_resume(struct device *dev)
>        |            ^~~~~~~~~~~~~~~~~~~~
> drivers/accel/amdxdna/amdxdna_pci_drv.c:328:12: error: 'amdxdna_pmops_suspend' defined but not used [-Werror=unused-function]
>    328 | static int amdxdna_pmops_suspend(struct device *dev)
>        |            ^~~~~~~~~~~~~~~~~~~~~
> 
> Change these to the modern replacements.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks sane to me.

Lizhi, can you verify that this works as expected for you?  I'd hate to 
accidentally break something.

-Jeff

