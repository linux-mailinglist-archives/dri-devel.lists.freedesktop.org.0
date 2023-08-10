Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C1877882A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 09:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E3910E678;
	Fri, 11 Aug 2023 07:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FA910E0F2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 17:29:14 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37AAnahO006652; Thu, 10 Aug 2023 17:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=F/l6BlD/agwr4WzlaqK8oAo/P00IinCMLAcfDScPG78=;
 b=JQ/eB34wSJTsQ6Q2Zh4+vYhZ/v1fSxp8ecYkC79UoCbAhH7G/WkWZWN/mKMJGSSN/Sp6
 1f0kckeGdzyykAI5Tl5xYhHvl8s8u9DvqM71IKBohIuxNnOeSGVWN3e9BlVWURKZ0Acb
 WQ4K/+yh5wD6WhZzg3DFaCUsYyfnKvEdNykb8GLCCLEx8+W8oOvV1nzGkfJ0Bj9DQOZG
 HgG6kSAQFsKscwQ3f4Wtg4KsY3eEYweegXvrgoPR/ZYNcaC3JUmIGrY52g2xb5gjzrc3
 HZV+slULXt1tU8kgqU03LB2ZdPWt1KBgJP1bvBbQKKy6tZFx08CBJyMxq3tkokuwNctt 0Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3scxfjh0yh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 17:28:51 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37AHSpnr030863
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 17:28:51 GMT
Received: from [10.110.80.161] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 10 Aug
 2023 10:28:50 -0700
Message-ID: <a2442f21-4f53-5229-5317-5c462062e870@quicinc.com>
Date: Thu, 10 Aug 2023 10:28:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Clean up integer overflow checking in
 map_user_pages()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>
References: <24d3348b-25ac-4c1b-b171-9dae7c43e4e0@moroto.mountain>
From: Carl Vanderlip <quic_carlv@quicinc.com>
In-Reply-To: <24d3348b-25ac-4c1b-b171-9dae7c43e4e0@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: GkDu-_woNnk65VpigEGQMAgPdSCs-Q5Z
X-Proofpoint-ORIG-GUID: GkDu-_woNnk65VpigEGQMAgPdSCs-Q5Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_14,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308100150
X-Mailman-Approved-At: Fri, 11 Aug 2023 07:26:19 +0000
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
Cc: linux-arm-msm@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/10/2023 5:23 AM, Dan Carpenter wrote:
> The encode_dma() function has some validation on in_trans->size but it
> would be more clear to move those checks to find_and_map_user_pages().
> 
> The encode_dma() had two checks:
> 
> 	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
> 		return -EINVAL;
> 
> The in_trans->addr variable is the starting address.  The in_trans->size
> variable is the total size of the transfer.  The transfer can occur in
> parts and the resources->xferred_dma_size tracks how many bytes we have
> already transferred.
> 
> This patch introduces a new variable "remaining" which represents the
> amount we want to transfer (in_trans->size) minus the amount we have
> already transferred (resources->xferred_dma_size).
> 
> I have modified the check for if in_trans->size is zero to instead check
> if in_trans->size is less than resources->xferred_dma_size.  If we have
> already transferred more bytes than in_trans->size then there are negative
> bytes remaining which doesn't make sense.  If there are zero bytes
> remaining to be copied, just return success.
> 
> The check in encode_dma() checked that "addr + size" could not overflow
> and barring a driver bug that should work, but it's easier to check if
> we do this in parts.  First check that "in_trans->addr +
> resources->xferred_dma_size" is safe.  Then check that "xfer_start_addr +
> remaining" is safe.
> 
> My final concern was that we are dealing with u64 values but on 32bit
> systems the kmalloc() function will truncate the sizes to 32 bits.  So
> I calculated "total = in_trans->size + offset_in_page(xfer_start_addr);"
> and returned -EINVAL if it were >= SIZE_MAX.  This will not affect 64bit
> systems.
> 
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Looks good to me.

Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
