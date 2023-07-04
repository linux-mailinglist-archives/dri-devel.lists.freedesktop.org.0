Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B447469B6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 08:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E988A10E0EA;
	Tue,  4 Jul 2023 06:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E005010E0EA
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 06:31:13 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3645MYhS023580; Tue, 4 Jul 2023 06:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eukOO0ow72gkf4CQmTDf7nHjwlc05mM9/uj2+KQomrI=;
 b=fLo2RF/RroYIQH8uu1K/D2r9QZr0Q8qZPt6zKHY1GXcB66dqV506TXR98XaglLJh0kSI
 Jmhm+vJJ2kasaAatluNYwe6WTCU9izhFo/b7obEJhdt5/jw1vht7KYlQ+P+xJR3OW3eW
 5jdoNO5qLVuWkDOPRgpwz4Ccse2eVAEQR4zPeuHBweIy67RXuWf2iHBow6spGHYSSrM0
 yvdliqHJkmc/vHrgS6NWVfdYJmJrSxI29v9qgjsYp6GX8IIJr8S0/q+KrLim+8891Fxx
 6C9NIiKmyN4hXblHGPcY0ZyDW48nLo5zdalfUNBAn1rlueZ8usmvBavrIQ+w9CCfBnLY ng== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rm0061exr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jul 2023 06:31:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3646UTGC000829
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Jul 2023 06:30:29 GMT
Received: from [10.50.61.0] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Mon, 3 Jul 2023
 23:30:26 -0700
Message-ID: <bba6c01f-6902-e5ef-3d76-474d262e3e1d@quicinc.com>
Date: Tue, 4 Jul 2023 12:00:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/5] accel/qaic: tighten bounds checking in
 decode_message()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>
References: <e94567c5-0478-4bdf-84fc-5709df0b3392@moroto.mountain>
From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
In-Reply-To: <e94567c5-0478-4bdf-84fc-5709df0b3392@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: YPRP2kGLPG3MwLqLPd7G5Jj7W2PCxyMd
X-Proofpoint-GUID: YPRP2kGLPG3MwLqLPd7G5Jj7W2PCxyMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_03,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307040054
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
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/21/2023 12:51 PM, Dan Carpenter wrote:
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
If I understand correctly this check is added to verify if we are left 
with trans_hdr size of data. In that case '>' comparison operator should 
be used.
> +
>   		trans_hdr = (struct wire_trans_hdr *)(msg->data + msg_len);
> -		if (msg_len + le32_to_cpu(trans_hdr->len) > msg_hdr_len)
> +		hdr_len = le32_to_cpu(trans_hdr->len);
> +		if (hdr_len < sizeof(*trans_hdr) ||
> +		    size_add(msg_len, hdr_len) > msg_hdr_len)
>   			return -EINVAL;
>   
>   		switch (le32_to_cpu(trans_hdr->type)) {
