Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C6374B64A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 20:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3302F88FAE;
	Fri,  7 Jul 2023 18:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E860310E04A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 18:30:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 367HAXvn001099; Fri, 7 Jul 2023 18:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=uynua5IMvm3BXmI3r+i+p/fuPgkUU5VGY3yOgvtkMe0=;
 b=PqdWt4RekLH0y7swQwJkPmaC2GmwGj4V7yxMT7LovwZtTvLzScSNS+KplhuRLabXIEg6
 D2Q7EW31jBSEb6O20g/wuMT7CrMQjtriWLls1Y+P66AZTensl6tIPcArzNT4TWO6BJw3
 1d5TzUh09j99UklI5yJq2Ki0i+kOWKsGw7FX2TWklXFdzihFEsPHAb0Y2skg7CQU4RFc
 xAs58IacLhAc8qjwI5huB5IxmsBYAM49SFgPGCLyjlF2Ij9OAtzjKSw4q8h//+lyNXL/
 677c+2t/kxFS9s3YlpKp5Lo2T+qjKVgu+nkERgWXydqRjaS9Sk+ZyLu/lIJcwUccuJX5 5Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rp8a6294b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jul 2023 18:29:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 367ITq09026301
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 7 Jul 2023 18:29:52 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 7 Jul
 2023 11:29:51 -0700
Message-ID: <66dbfac3-5f3d-d1e8-0498-4fbff53d207f@quicinc.com>
Date: Fri, 7 Jul 2023 12:29:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/5] accel/qaic: tighten bounds checking in
 encode_message()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, Pranjal Ramajor Asha Kanojiya
 <quic_pkanojiy@quicinc.com>
References: <8dc35a68-7257-41ac-9057-7c89b9ad6e18@moroto.mountain>
 <1d79cddc-0afb-08c2-8aac-8f3b7761d210@quicinc.com>
 <fb5f0a0c-c46f-4eec-bfcc-50b4be44c0a7@kadam.mountain>
 <eadc6f73-0fbf-80a0-cd1f-84f7fd51f6d7@quicinc.com>
 <b1f8ccdf-144a-4156-af13-9d5731c5ab83@kadam.mountain>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <b1f8ccdf-144a-4156-af13-9d5731c5ab83@kadam.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 6CbfjZ-6hHe2M6NO7CmV5aVtR1usKu4x
X-Proofpoint-GUID: 6CbfjZ-6hHe2M6NO7CmV5aVtR1usKu4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 clxscore=1011 phishscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 impostorscore=0 mlxscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/4/2023 3:58 AM, Dan Carpenter wrote:
> On Tue, Jul 04, 2023 at 03:18:26PM +0530, Pranjal Ramajor Asha Kanojiya wrote:
>>
>>
>> On 7/4/2023 2:08 PM, Dan Carpenter wrote:
>>> On Tue, Jul 04, 2023 at 11:57:51AM +0530, Pranjal Ramajor Asha Kanojiya wrote:
>>>>> diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
>>>>> index 5c57f7b4494e..a51b1594dcfa 100644
>>>>> --- a/drivers/accel/qaic/qaic_control.c
>>>>> +++ b/drivers/accel/qaic/qaic_control.c
>>>>> @@ -748,7 +748,8 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
>>>>>     	int ret;
>>>>>     	int i;
>>>>> -	if (!user_msg->count) {
>>>>> +	if (!user_msg->count ||
>>>>> +	    user_msg->len < sizeof(*trans_hdr)) {
>>>>>     		ret = -EINVAL;
>>>>>     		goto out;
>>>>>     	}
>>>>> @@ -765,12 +766,13 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
>>>>>     	}
>>>>>     	for (i = 0; i < user_msg->count; ++i) {
>>>>> -		if (user_len >= user_msg->len) {
>>>>> +		if (user_len >= user_msg->len - sizeof(*trans_hdr)) {
>>>> If I understand correctly this check is added to verify if we are left with
>>>> trans_hdr size of data. In that case '>' comparison operator should be used.
>>>
>>> That was there in the original code and I thought about changing it but
>>> I don't like changing things which aren't necessary and == is also
>>> invalid so I decided to leave it.
>>>
>> I see, I understand your concern about not changing unnecessary things but
>> '>=' is incorrect for reason mentioned above. We need to change that to '>'
> 
> Oh, yes.  You're right.  I will need to resend.

For the next revision, please add #include <overflow.h>
I believe the size_add() use that you propose is the first need of that 
file, and while it may be implicitly included from something we do 
include, I prefer to have explicit includes.

Otherwise I don't see anything else to add.
