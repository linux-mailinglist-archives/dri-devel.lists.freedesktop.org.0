Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C13B746DF3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 11:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45AA10E0D2;
	Tue,  4 Jul 2023 09:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFA010E0D2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 09:48:38 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3646tegw016317; Tue, 4 Jul 2023 09:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=kaIoEgXQSLvNdWP2temQuhEV+SjQM9OvqCBa6vyMnIw=;
 b=AFJpJThmciJsZrMAXer6Pm2JMR6uNUnViN/vTsFdqvQb/GZYIjHFmmEdeBYGpLU8d1C/
 NUc6Gbs/q++i9rXOgxA3gvowE2Urtx4Oc9Nmmn8Gg6/Pqy97ffGWtwhiLKTkEcN4VvIR
 jbTLKgGEvOQKSV/+QdZTx4YQQbniwars9eLpvIkzJC90ubFnSvwzQTFZ35ZIq7vNCTbT
 mUiKL8eeuZMSdGsY3vxg9a2CcdVR9Nc+f9lvrD34/YHONbf55OpWsA0zAp9Vj1GrgPp4
 cpY7JdSHI03owKcqWwp+P/0qCdUirpVnR5sUubkQIt6RVqod3XHiHN1uW4znRsMBDgZ1 CA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rksyctqp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jul 2023 09:48:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3649mWNQ027033
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Jul 2023 09:48:32 GMT
Received: from [10.50.61.0] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Tue, 4 Jul 2023
 02:48:29 -0700
Message-ID: <eadc6f73-0fbf-80a0-cd1f-84f7fd51f6d7@quicinc.com>
Date: Tue, 4 Jul 2023 15:18:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/5] accel/qaic: tighten bounds checking in
 encode_message()
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <8dc35a68-7257-41ac-9057-7c89b9ad6e18@moroto.mountain>
 <1d79cddc-0afb-08c2-8aac-8f3b7761d210@quicinc.com>
 <fb5f0a0c-c46f-4eec-bfcc-50b4be44c0a7@kadam.mountain>
Content-Language: en-US
From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
In-Reply-To: <fb5f0a0c-c46f-4eec-bfcc-50b4be44c0a7@kadam.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: JugXe-HSqS3SWQtnIGt8bEj-dC1RkrL2
X-Proofpoint-ORIG-GUID: JugXe-HSqS3SWQtnIGt8bEj-dC1RkrL2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_05,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307040080
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Oded Gabbay <ogabbay@kernel.org>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/4/2023 2:08 PM, Dan Carpenter wrote:
> On Tue, Jul 04, 2023 at 11:57:51AM +0530, Pranjal Ramajor Asha Kanojiya wrote:
>>> diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
>>> index 5c57f7b4494e..a51b1594dcfa 100644
>>> --- a/drivers/accel/qaic/qaic_control.c
>>> +++ b/drivers/accel/qaic/qaic_control.c
>>> @@ -748,7 +748,8 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
>>>    	int ret;
>>>    	int i;
>>> -	if (!user_msg->count) {
>>> +	if (!user_msg->count ||
>>> +	    user_msg->len < sizeof(*trans_hdr)) {
>>>    		ret = -EINVAL;
>>>    		goto out;
>>>    	}
>>> @@ -765,12 +766,13 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
>>>    	}
>>>    	for (i = 0; i < user_msg->count; ++i) {
>>> -		if (user_len >= user_msg->len) {
>>> +		if (user_len >= user_msg->len - sizeof(*trans_hdr)) {
>> If I understand correctly this check is added to verify if we are left with
>> trans_hdr size of data. In that case '>' comparison operator should be used.
> 
> That was there in the original code and I thought about changing it but
> I don't like changing things which aren't necessary and == is also
> invalid so I decided to leave it.
> 
I see, I understand your concern about not changing unnecessary things 
but '>=' is incorrect for reason mentioned above. We need to change that 
to '>'
>>
>>>    			ret = -EINVAL;
>>>    			break;
>>>    		}
>>>    		trans_hdr = (struct qaic_manage_trans_hdr *)(user_msg->data + user_len);
>>> -		if (user_len + trans_hdr->len > user_msg->len) {
>>> +		if (trans_hdr->len < sizeof(trans_hdr) ||
>>> +		    size_add(user_len, trans_hdr->len) > user_msg->len) {
> 
> If we change to > then the == will be caught by this check.  So it
> doesn't affect runtime either way.
> 
I fail to see that.

Lets run an example:
user_len is 0
user_msg->len is 8
sizeof(*trans_hdr) is 8
trans_hdr->len is 8

Above instance is correct and should be processed without error.

So user_len > user_msg->len - sizeof(*trans_hdr) translates to
(0 > 8 - 8)
(0 > 0)
false (No error)
.
.
.
trans_hdr->len < sizeof(trans_hdr) ||
size_add(user_len, trans_hdr->len) > user_msg->len, translates to
8 < 8 || size_add(0, 8) > 8
false || 8 > 8
false || false
false (No error)

Am I missing anything?

> regards,
> dan carpenter
> 
