Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5496D68B4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 18:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EA110E700;
	Tue,  4 Apr 2023 16:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA8C10E700
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 16:26:26 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 334FNKZs014288; Tue, 4 Apr 2023 16:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=HLEONN4jNKpTOTsuE1gL6uUS3IeY2elNWl9Z3hjMfV8=;
 b=A5y+UiawM5FWEYBl3qLsT08Fj2jADmr013SjIgfcZXyt9RP28e4wQ64z1b/wRSq+rmiC
 TFYyyJ05jQDdWhKkyOV6kyCfflkM7lcMW4WbXNhb7Wjt2IGBVcdLPIbJ+lgy4HFO/SPp
 2isrId+xgL+1H1d8FP80GZtWGAWUAWVtDZzCHjhqO0NUET6Fs7Wb0p5J/McwI64yTa8k
 Q/G8zJ21K1Hu6KRIi1xB5N8mAgmV/DrsdpYHHz5E1hHExkMqXhs6b53jh2Ii+Grydo1f
 fO7xmvZNn3oFwTCvsvHEjyskVS45ZDwsSpjDM57YEmrjct4HAHfA2t8UUk+Mk7EEAghY CQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prpg205am-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Apr 2023 16:26:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 334GQNue017125
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Apr 2023 16:26:23 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 4 Apr 2023
 09:26:22 -0700
Message-ID: <b2b5f9e3-f9a8-cd9e-7439-b8b5569af7e6@quicinc.com>
Date: Tue, 4 Apr 2023 10:26:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/2] accel/ivpu: Add dma fence to command buffers only
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230331113603.2802515-1-stanislaw.gruszka@linux.intel.com>
 <20230331113603.2802515-2-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230331113603.2802515-2-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RGmIvLM8Fevmq4O3IlQ7XrkmDfqewM2Z
X-Proofpoint-ORIG-GUID: RGmIvLM8Fevmq4O3IlQ7XrkmDfqewM2Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_08,2023-04-04_04,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040152
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

On 3/31/2023 5:36 AM, Stanislaw Gruszka wrote:
> From: Karol Wachowski <karol.wachowski@linux.intel.com>
> 
> Currently job->done_fence is added to every BO handle within a job. If job
> handle (command buffer) is shared between multiple submits, KMD will add
> the fence in each of them. Then bo_wait_ioctl() executed on command buffer
> will exit only when all jobs containing that handle are done.
> 
> This creates deadlock scenario for user mode driver in case when job handle
> is added as dependency of another job, because bo_wait_ioctl() of first job
> will wait until second job finishes, and second job can not finish before
> first one.
> 
> Having fences added only to job buffer handle allows user space to execute
> bo_wait_ioctl() on the job even if it's handle is submitted with other job.
> 
> Fixes: cd7272215c44 ("accel/ivpu: Add command buffer submission logic")
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
