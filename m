Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82842753F6E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 18:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E3810E0E7;
	Fri, 14 Jul 2023 16:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8227510E0E7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 16:02:50 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36ECBGFn009535; Fri, 14 Jul 2023 16:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ARDC8b208So03WCyLILljaM4pNxF9LTaUqV36KJV0QQ=;
 b=kT/RRIZWUcAHvKjxhHRZUhci1G1qN8ICPfFySW/y5tTpPKNgudqC8r47HrOeYODGHPxP
 ouKuLW7KoGSnubQwzXrLZv+RphHzuLTXgBLFZrdCU7FOtOYjvzVFoWIUMXL5/wxjwXAm
 p2F33AbVt9TrjezN9IPn7ADQ/3MaDsaFEQ/lFyCf8orS18jOS4McU6RUVBLHEAlg77Vf
 UcgDGiEL0pNYAzhviRXUGnf3NLmoalJ3zpEeig+Dp//VLQXwQirSKEMv3pg4RX8PFgYj
 uXfsEDc4SdLs/BsJZS/kY3z6Ye7JtI9Aulnh02JrakXdMgT4UmU9JC9AgpTgKOtBjx6R Bg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtpuht3ev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jul 2023 16:02:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36EG2WAn024410
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jul 2023 16:02:32 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 14 Jul
 2023 09:02:31 -0700
Message-ID: <51f205ad-eceb-d664-272f-d80cba828f21@quicinc.com>
Date: Fri, 14 Jul 2023 10:02:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/5 v4] accel/qaic: tighten bounds checking in
 encode_message()
Content-Language: en-US
To: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>, Dan Carpenter
 <dan.carpenter@linaro.org>
References: <9a0cb0c1-a974-4f10-bc8d-94437983639a@moroto.mountain>
 <fdc49063-f90c-88d8-49bb-83f9da7c703a@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <fdc49063-f90c-88d8-49bb-83f9da7c703a@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BZZOwy2uZOhHnZCYPG3Xtd_Or2hzX-5n
X-Proofpoint-ORIG-GUID: BZZOwy2uZOhHnZCYPG3Xtd_Or2hzX-5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_07,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 mlxlogscore=778 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307140146
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
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/14/2023 5:41 AM, Pranjal Ramajor Asha Kanojiya wrote:
> 
> 
> On 7/11/2023 1:50 PM, Dan Carpenter wrote:
>> There are several issues in this code.  The check at the start of the
>> loop:
>>
>>     if (user_len >= user_msg->len) {
>>
>> This check does not ensure that we have enough space for the trans_hdr
>> (8 bytes).  Instead the check needs to be:
>>
>>     if (user_len > user_msg->len - sizeof(*trans_hdr)) {
>>
>> That subtraction is done as an unsigned long we want to avoid
>> negatives.  Add a lower bound to the start of the function.
>>
>>     if (user_msg->len < sizeof(*trans_hdr))
>>
>> There is a second integer underflow which can happen if
>> trans_hdr->len is zero inside the encode_passthrough() function.
>>
>>     memcpy(out_trans->data, in_trans->data, in_trans->hdr.len - 
>> sizeof(in_trans->hdr));
>>
>> Instead of adding a check to encode_passthrough() it's better to check
>> in this central place.  Add that check:
>>
>>     if (trans_hdr->len < sizeof(trans_hdr)
>>
>> The final concern is that the "user_len + trans_hdr->len" might have an
>> integer overflow bug.  Use size_add() to prevent that.
>>
>> -    if (user_len + trans_hdr->len > user_msg->len) {
>> +    if (size_add(user_len, trans_hdr->len) > user_msg->len) {
>>
>> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 

Applied to drm-misc-fixes

-Jeff
