Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE157539F4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 13:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1BE8825E;
	Fri, 14 Jul 2023 11:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365A98825E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 11:45:25 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36EBbaN0025688; Fri, 14 Jul 2023 11:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Uv3KigAC2SAIcc2zTRfRkNENy8nX7yDJADe2Sea64kE=;
 b=ZrGI1uYLscaZj82ZwG0C5gB0nqH9WUec+w3E4IxbdrSGkZ0upViNlZYzmmUpJgVtRsUT
 6GirA9bvA8yWawixrfuKj0f8hcvDNGIo148yDHg+Z+wp5CQmT5ojEhpi75G/80IzDQAL
 7kkqj01E9w79j+KmfMgPb9Zo9ytJnfAazg4OVjhXtXmPh6pVb0Rp8fxDi2yg3+majTMu
 y+JN3gSPAohsz3rxws5e0U3dWWraxyfSavrrPi7ZrWooc6ipYRLlkp2m0ShhTHXYl9Yx
 7twiHXGyqHfEwPjiOMXr1fq56XEkUSJ9PxW8TSkiQBubbze27PbQAaxXkrmQXz1HmI8N uw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtpu91k70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jul 2023 11:44:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36EBiv36020602
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jul 2023 11:44:57 GMT
Received: from [10.50.55.51] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 14 Jul
 2023 04:44:54 -0700
Message-ID: <77af5fda-e721-6c89-40f5-09acd2c8f63f@quicinc.com>
Date: Fri, 14 Jul 2023 17:14:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/5 v4] accel/qaic: Add consistent integer overflow checks
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>
References: <ZK0Q7IsPkj6WSCcL@moroto>
From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
In-Reply-To: <ZK0Q7IsPkj6WSCcL@moroto>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: kbp7jtJj6i8iPPBKICbxg8aZ5-uVwMRe
X-Proofpoint-ORIG-GUID: kbp7jtJj6i8iPPBKICbxg8aZ5-uVwMRe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_06,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307140105
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
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/11/2023 1:51 PM, Dan Carpenter wrote:
> The encode_dma() function has integer overflow checks.  The
> encode_passthrough(), encode_activate() and encode_status() functions
> did not.  I added integer overflow checking everywhere.  I also
> updated the integer overflow checking in encode_dma() to use size_add()
> so everything is consistent.
> 
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: no change
> 
>   drivers/accel/qaic/qaic_control.c | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
> index 752b67aff777..23680f5f1902 100644
> --- a/drivers/accel/qaic/qaic_control.c
> +++ b/drivers/accel/qaic/qaic_control.c
> @@ -367,7 +367,7 @@ static int encode_passthrough(struct qaic_device *qdev, void *trans, struct wrap
>   	if (in_trans->hdr.len % 8 != 0)
>   		return -EINVAL;
>   
> -	if (msg_hdr_len + in_trans->hdr.len > QAIC_MANAGE_EXT_MSG_LENGTH)
> +	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_EXT_MSG_LENGTH)
>   		return -ENOSPC;
>   
>   	trans_wrapper = add_wrapper(wrappers,
> @@ -558,12 +558,10 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
>   	msg = &wrapper->msg;
>   	msg_hdr_len = le32_to_cpu(msg->hdr.len);
>   
> -	if (msg_hdr_len > (UINT_MAX - QAIC_MANAGE_EXT_MSG_LENGTH))
> -		return -EINVAL;
> -
>   	/* There should be enough space to hold at least one ASP entry. */
> -	if (msg_hdr_len + sizeof(*out_trans) + sizeof(struct wire_addr_size_pair) >
> -	    QAIC_MANAGE_EXT_MSG_LENGTH)
> +	if (size_add(msg_hdr_len,
> +		     sizeof(*out_trans) + sizeof(struct wire_addr_size_pair)) >

Can we have the entire size_add() on same line?

> +		     QAIC_MANAGE_EXT_MSG_LENGTH)
>   		return -ENOMEM;
>   
>   	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
> @@ -635,7 +633,7 @@ static int encode_activate(struct qaic_device *qdev, void *trans, struct wrapper
>   	msg = &wrapper->msg;
>   	msg_hdr_len = le32_to_cpu(msg->hdr.len);
>   
> -	if (msg_hdr_len + sizeof(*out_trans) > QAIC_MANAGE_MAX_MSG_LENGTH)
> +	if (size_add(msg_hdr_len, sizeof(*out_trans)) > QAIC_MANAGE_MAX_MSG_LENGTH)
>   		return -ENOSPC;
>   
>   	if (!in_trans->queue_size)
> @@ -719,7 +717,7 @@ static int encode_status(struct qaic_device *qdev, void *trans, struct wrapper_l
>   	msg = &wrapper->msg;
>   	msg_hdr_len = le32_to_cpu(msg->hdr.len);
>   
> -	if (msg_hdr_len + in_trans->hdr.len > QAIC_MANAGE_MAX_MSG_LENGTH)
> +	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_MAX_MSG_LENGTH)
>   		return -ENOSPC;
>   
>   	trans_wrapper = add_wrapper(wrappers, sizeof(*trans_wrapper));

Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
