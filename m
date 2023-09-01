Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB1E78FF84
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 16:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489C510E803;
	Fri,  1 Sep 2023 14:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21D910E803
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 14:54:26 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3818UooT024484; Fri, 1 Sep 2023 14:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ZMK7Fu7jzfsUlnRSMcQJDpCQYPaalmBxUAwtNNEpNQA=;
 b=OK7FSgML72cA9+N1HtnG2ZFNRTwBg4rXCo3JoJw/mB+z4ODb505Wp4a3s8r/K26L0NJt
 wpR1h0Cc62y3LW/QxbzDAbPWhjcvpus0UeAUyBDoiTsmhrnvw/39BR3hnKdn8TDjEMis
 98RJD721JXRpFnprxhTRfFnIegRv/oIWARtpt6j+pzZzatzHUCwnXf/FdKqxbe6bhfbL
 tYSxq/2xBwl7q8PK/8Vv9I5CONsbxTXMBWEIf3AK1sLRz6ZtW50ifRzmSP3CyIsP4CrZ
 sTVfj3T19gL3QxF+1E9S1AfaFgIUrSUP2EC7//p9wIk5QaPfln+1JwFUEzmUdFWY4Owv og== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3suc22h16f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Sep 2023 14:54:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 381EsLO3009009
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Sep 2023 14:54:21 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 1 Sep
 2023 07:54:21 -0700
Message-ID: <0f5fceba-cb08-08a8-c39d-0c8be1bcd37a@quicinc.com>
Date: Fri, 1 Sep 2023 08:54:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 04/11] accel/ivpu: Add information about context on
 failure
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230901094957.168898-1-stanislaw.gruszka@linux.intel.com>
 <20230901094957.168898-5-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230901094957.168898-5-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2yZjaBw12zYtOwpDjK5lcytuEc8lvqSI
X-Proofpoint-ORIG-GUID: 2yZjaBw12zYtOwpDjK5lcytuEc8lvqSI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_13,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309010140
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

On 9/1/2023 3:49 AM, Stanislaw Gruszka wrote:
> Add additional ctx number to error messages on mmu context
> initialization failures.

Looking at this for the first time, the "why" doesn't seem obvious. 
Based on my understanding, I suggest -

"Identify the mmu context that failed to initialize in the error 
messages. This allows the error to be correlated with a specific user 
during debug."

If you have a different idea for the wording, go for it.

I think I can safely assume this will be resolved.
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

> 
> Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_mmu_context.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
> index 8914e34fb54f..5b48983c7cf8 100644
> --- a/drivers/accel/ivpu/ivpu_mmu_context.c
> +++ b/drivers/accel/ivpu/ivpu_mmu_context.c
> @@ -490,13 +490,13 @@ int ivpu_mmu_user_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context
>   
>   	ret = ivpu_mmu_context_init(vdev, ctx, ctx_id);
>   	if (ret) {
> -		ivpu_err(vdev, "Failed to initialize context: %d\n", ret);
> +		ivpu_err(vdev, "Failed to initialize context %u: %d\n", ctx_id, ret);
>   		return ret;
>   	}
>   
>   	ret = ivpu_mmu_set_pgtable(vdev, ctx_id, &ctx->pgtable);
>   	if (ret) {
> -		ivpu_err(vdev, "Failed to set page table: %d\n", ret);
> +		ivpu_err(vdev, "Failed to set page table for context %u: %d\n", ctx_id, ret);
>   		goto err_context_fini;
>   	}
>   

