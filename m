Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C2174B692
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 20:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D811210E5D8;
	Fri,  7 Jul 2023 18:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD83010E5D8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 18:43:54 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 367Ghkql009593; Fri, 7 Jul 2023 18:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SN1qG1nqPCYrqBjxg4K4N2AWv9J0C1GCs96MdPJGCxM=;
 b=c8ofNyDGfPUERVysZjbByliN6PHGm+Pk3mrwKjZgPetinlpEUBVzicxyxzwUewk5pmP0
 Su5DcpByT6CVswEXQ2rgukNJvT3zCYY1eQmCGuxKpOt20rnjdSOGm12QxwvTLIbZg2G1
 byDT9HLp6HswmpM9gsnei7LkjNEcIikcwF938u2Orh3RUYIaR7HF78dKMM3Tmh4ki9UJ
 gqXpd0RKgx3uIUakoF6v88WwXpUSyUcsepHwkgDUdLHnIap8/SQhqAprpg1O0lG+lZc6
 Tu5VejT5YNy6BDV207vnGbnqO3LcvZ0vPfz0VrWjLwAV2vsVRnkwFgEvinlvKB5NASro sg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rpgud16w9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jul 2023 18:43:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 367IhkNC019495
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 7 Jul 2023 18:43:46 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 7 Jul
 2023 11:43:46 -0700
Message-ID: <6a8fcacf-648d-2d35-76bc-0c7609709295@quicinc.com>
Date: Fri, 7 Jul 2023 12:43:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/5] accel/qaic: tighten bounds checking in
 decode_message()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <e94567c5-0478-4bdf-84fc-5709df0b3392@moroto.mountain>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <e94567c5-0478-4bdf-84fc-5709df0b3392@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: soAb2CFwcMtW4COLg6mivQTswsG4SBqo
X-Proofpoint-GUID: soAb2CFwcMtW4COLg6mivQTswsG4SBqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307070171
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
 Carl Vanderlip <quic_carlv@quicinc.com>, Jacek
 Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/21/2023 1:21 AM, Dan Carpenter wrote:
> Copy the bounds checking from encode_message() to decode_message().
> 
> This patch addresses the following concerns.  Ensure that there is
> enough space for at least one header so that we don't have a negative
> size later.
> 
> 	if (msg_hdr_len < sizeof(*trans_hdr))
> 
> Ensure that we have enough space to read the next header from the
> msg->data.
> 
> 	if (msg_len >= msg_hdr_len - sizeof(*trans_hdr))
> 		return -EINVAL;
> 
> Check that the trans_hdr->len is not below the minimum size:
> 
> 	if (hdr_len < sizeof(*trans_hdr))
> 
> This minimum check ensures that we don't corrupt memory in
> decode_passthrough() when we do.
> 
> 	memcpy(out_trans->data, in_trans->data, len - sizeof(in_trans->hdr));
> 
> And finally, use size_add() to prevent an integer overflow:
> 
> 	if (size_add(msg_len, hdr_len) > msg_hdr_len)
> 
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/accel/qaic/qaic_control.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
> index a51b1594dcfa..78f6c3d6380d 100644
> --- a/drivers/accel/qaic/qaic_control.c
> +++ b/drivers/accel/qaic/qaic_control.c
> @@ -955,15 +955,23 @@ static int decode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
>   	int ret;
>   	int i;
>   
> -	if (msg_hdr_len > QAIC_MANAGE_MAX_MSG_LENGTH)
> +	if (msg_hdr_len < sizeof(*trans_hdr) ||

How I view this - does the specified message length contain at-least one 
transaction for us to decode?

Seems ok at first glance.

However, the header length is not just the length of the payload, but 
also the header itself.  So sizeof(*trans_hdr) should be added to 
sizeof(struct wire_msg_hdr).  Otherwise msg_hdr_len could be 64 (just 
the size of wire_msg_hdr) which is more than sizeof(*trans_hdr) but 
still means we don't have a transaction to decode.

> +	    msg_hdr_len > QAIC_MANAGE_MAX_MSG_LENGTH)
>   		return -EINVAL;
>   
>   	user_msg->len = 0;
>   	user_msg->count = le32_to_cpu(msg->hdr.count);
>   
>   	for (i = 0; i < user_msg->count; ++i) {
> +		u32 hdr_len;
> +
> +		if (msg_len >= msg_hdr_len - sizeof(*trans_hdr))
> +			return -EINVAL;
> +
>   		trans_hdr = (struct wire_trans_hdr *)(msg->data + msg_len);
> -		if (msg_len + le32_to_cpu(trans_hdr->len) > msg_hdr_len)
> +		hdr_len = le32_to_cpu(trans_hdr->len);
> +		if (hdr_len < sizeof(*trans_hdr) ||
> +		    size_add(msg_len, hdr_len) > msg_hdr_len)
>   			return -EINVAL;
>   
>   		switch (le32_to_cpu(trans_hdr->type)) {

