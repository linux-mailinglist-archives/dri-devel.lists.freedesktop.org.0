Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE1D7469AB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 08:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B041C10E087;
	Tue,  4 Jul 2023 06:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D9A10E087
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 06:28:03 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3645ks02016560; Tue, 4 Jul 2023 06:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wINEpzahP/1iwpugg5asYbKVPWsR5v5phwezEnIpXJs=;
 b=XXBldOV+dWLOGaq9v/zTGWdm0v4ODcGRdPBUd3a8da87FsYnVtVhwQigWCGjAte070Ot
 AcOY4HBT2hoava9pY0E4p4mZBMU6PIZ5cBtykFunR/EiRgQy0ZirWvTI2f/CGTVx2w/K
 wTsL1SjkyIK2OKYVw58rRXCzmdEwu04pmWEGiJqT27uugwLlYPJl+yCa2AQGSzNu0zfy
 bXA+gYASDNusHgCDNfusDWhwP6C14rjNy9C/9OwsBb0/eDOQkq6tOgafvRB9D0xkvWKS
 qjlzvv8IJDzfNE+IAvkL8VFs5kcLTh95mC8Hrb9fX0FKWHaw1J/qTTq2fdBZ7eCjbgvp jQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rky5mhj56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jul 2023 06:27:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3646RvPX005145
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Jul 2023 06:27:57 GMT
Received: from [10.50.61.0] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Mon, 3 Jul 2023
 23:27:54 -0700
Message-ID: <1d79cddc-0afb-08c2-8aac-8f3b7761d210@quicinc.com>
Date: Tue, 4 Jul 2023 11:57:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/5] accel/qaic: tighten bounds checking in
 encode_message()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>
References: <8dc35a68-7257-41ac-9057-7c89b9ad6e18@moroto.mountain>
From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
In-Reply-To: <8dc35a68-7257-41ac-9057-7c89b9ad6e18@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: fEBezq74maBi4AnVZZPLPuke08zAH2E8
X-Proofpoint-GUID: fEBezq74maBi4AnVZZPLPuke08zAH2E8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_03,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 spamscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307040053
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



On 6/21/2023 12:51 PM, Dan Carpenter wrote:
> There are several issues in this code.  The check at the start of the
> loop:
> 
> 	if (user_len >= user_msg->len) {
> 
> This check does not ensure that we have enough space for the trans_hdr
> (8 bytes).  Instead the check needs to be:
> 
> 	if (user_len >= user_msg->len - sizeof(*trans_hdr)) {
> 
> That subtraction is done as an unsigned long we want to avoid
> negatives.  Add a lower bound to the start of the function.
> 
> 	if (user_msg->len < sizeof(*trans_hdr))
> 
> There is a second integer underflow which can happen if
> trans_hdr->len is zero inside the encode_passthrough() function.
> 
> 	memcpy(out_trans->data, in_trans->data, in_trans->hdr.len - sizeof(in_trans->hdr));
> 
> Instead of adding a check to encode_passthrough() it's better to check
> in this central place.  Add that check:
> 
> 	if (trans_hdr->len < sizeof(trans_hdr)
> 
> The final concern is that the "user_len + trans_hdr->len" might have an
> integer overflow bug.  Use size_add() to prevent that.
> 
> -	if (user_len + trans_hdr->len > user_msg->len) {
> +	if (size_add(user_len, trans_hdr->len) > user_msg->len) {
> 
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> This is based on code review and not tested.
> 
>   drivers/accel/qaic/qaic_control.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
> index 5c57f7b4494e..a51b1594dcfa 100644
> --- a/drivers/accel/qaic/qaic_control.c
> +++ b/drivers/accel/qaic/qaic_control.c
> @@ -748,7 +748,8 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
>   	int ret;
>   	int i;
>   
> -	if (!user_msg->count) {
> +	if (!user_msg->count ||
> +	    user_msg->len < sizeof(*trans_hdr)) {
>   		ret = -EINVAL;
>   		goto out;
>   	}
> @@ -765,12 +766,13 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
>   	}
>   
>   	for (i = 0; i < user_msg->count; ++i) {
> -		if (user_len >= user_msg->len) {
> +		if (user_len >= user_msg->len - sizeof(*trans_hdr)) {
If I understand correctly this check is added to verify if we are left 
with trans_hdr size of data. In that case '>' comparison operator should 
be used.

>   			ret = -EINVAL;
>   			break;
>   		}
>   		trans_hdr = (struct qaic_manage_trans_hdr *)(user_msg->data + user_len);
> -		if (user_len + trans_hdr->len > user_msg->len) {
> +		if (trans_hdr->len < sizeof(trans_hdr) ||
> +		    size_add(user_len, trans_hdr->len) > user_msg->len) {
>   			ret = -EINVAL;
>   			break;
>   		}
