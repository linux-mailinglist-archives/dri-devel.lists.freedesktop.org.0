Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976B5861FE6
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 23:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D69210E117;
	Fri, 23 Feb 2024 22:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Nulq0hYu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B69310E117
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 22:38:18 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41NMY2HJ023402; Fri, 23 Feb 2024 22:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:references:cc:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=J46BJAXfpllB88/E0IwkFqoWI3dmnzmmD8LlpP0L3o8=; b=Nu
 lq0hYuLT4c34CgZHTde6YxYl37zYEQFxu4PrC/yei7lCNzNRmnrDWMlO/iNU789c
 bXLS1uCZdnd+fN3yx3uWOm0cf67nstFMXGLDffLAU2mu406tGnrcHWaS3ifzuySl
 eLyoCx/zPxWELN/wmjXaY8V/XsZ6SHM6EbociSPhcz+ORTLtOjy5FOXdoCIlEanR
 9iW9O/QrgpzvhQrViuDeptUZIfj4fjnS4kC+Z6nE5TWDzhOR9WiMmJTvLsiK3LA2
 MFInpoIkzpKhIaMsh6iwDg5OYOYyjzh5Fqv0IQ9rR6pkAutpK/ZvM9fACBxkTwc2
 tSFUJPoipJuQ/fTGKrCw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wf3gm02tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 22:38:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41NMcBtG030812
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 22:38:11 GMT
Received: from [10.110.73.113] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 23 Feb
 2024 14:38:11 -0800
Message-ID: <1eb926a6-3467-aaf4-2bc0-8d9756516d9c@quicinc.com>
Date: Fri, 23 Feb 2024 14:38:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] accel/habanalabs/gaudi2: use single function to
 compare FW versions
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20240220160129.909714-1-ogabbay@kernel.org>
CC: Ohad Sharabi <osharabi@habana.ai>
From: Carl Vanderlip <quic_carlv@quicinc.com>
In-Reply-To: <20240220160129.909714-1-ogabbay@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 52C1PbaEr4JUDsBhIa0e1QkFvnkNeUYb
X-Proofpoint-GUID: 52C1PbaEr4JUDsBhIa0e1QkFvnkNeUYb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-23_06,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230162
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

On 2/20/2024 8:01 AM, Oded Gabbay wrote:> From: Ohad Sharabi 
<osharabi@habana.ai>
 >
 > Currently, the code contains 2 types of FW version comparison functions:
 > - hl_is_fw_sw_ver_[below/equal_or_greater]()
 > - gaudi2 specific function of the type
 >    gaudi2_is_fw_ver_[below/above]x_y_z()
 >
 > Moreover, some functions use the inner FW version which should be only
 > stage during development but not version dependencies.
 >
 > Finally, some tests are done to deprecated FW version to which LKD
 > should hold no compatibility.
 >
 > This commit aligns all APIs to a single function that just compares the
 > version and return an integers indicator (similar in some way to
 > strcmp()).
 >
 > In addition, this generic function now considers also the sub-minor FW
 > version and also remove dead code resulting in deprecated FW versions
 > compatibility.
 >
 > Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
 > Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
 > Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
 > ---
 >   drivers/accel/habanalabs/common/firmware_if.c | 25 ++++++++
 >   drivers/accel/habanalabs/common/habanalabs.h  | 20 +------
 >   drivers/accel/habanalabs/gaudi2/gaudi2.c      | 57 +++----------------
 >   3 files changed, 34 insertions(+), 68 deletions(-)
 >
...
 > diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c 
b/drivers/accel/habanalabs/gaudi2/gaudi2.c
 > index 1f061209ae21..4a0917aa4dd7 100644
 > --- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
 > +++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
 > @@ -2601,6 +2601,8 @@ static int gaudi2_set_fixed_properties(struct 
hl_device *hdev)
 >
 >   	prop->hbw_flush_reg = mmPCIE_WRAP_SPECIAL_GLBL_SPARE_0;
 >
 > +	prop->supports_advanced_cpucp_rc = true;
 > +
 >   	return 0;
 >
 >   free_qprops:
 > @@ -3308,8 +3310,6 @@ static int gaudi2_late_init(struct hl_device *hdev)
 >   	struct gaudi2_device *gaudi2 = hdev->asic_specific;
 >   	int rc;
 >
 > -	hdev->asic_prop.supports_advanced_cpucp_rc = true;
 > -
 >   	rc = hl_fw_send_pci_access_msg(hdev, CPUCP_PACKET_ENABLE_PCI_ACCESS,
 >   					gaudi2->virt_msix_db_dma_addr);
 >   	if (rc) {

Is this change in support of the others in this patch? Feels like this 
should be more than one patch (adding new version_cmp, removing old checks).

-Carl V.
