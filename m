Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1621A753F7A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 18:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B272C10E0E5;
	Fri, 14 Jul 2023 16:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E606410E8B3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 16:06:05 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36E9jM1e028508; Fri, 14 Jul 2023 16:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=9LXsKxTvbI2mN+iX3g7ICLgdCPAhMSotGPf8YCZ35ZU=;
 b=H4QfIMfnx+QBlSHCr7SaoJgAarfk4oisfm8giQNtjtTyGLOuUpIrOZrWc0WVTArSpPo8
 dSqRsuclDg5DmUY8JmVFmRlHYmo99PQJVQCBZV9rMk8FZSuJ9yTvYGNfPW1jeIodrmh6
 8Q/5IrfGfeyIDgQ/9Cc0Q3llQX/xe8FiuqMOJPHN/aW3fINBgdkla2UPQmgq7jLz53/o
 DQilna78Eiv3JwNnksAsveykpeh1RHHVyj5AIj3W4LwG9j9pe0d4Su5CkdBNy2XKw7Xq
 1mYYx8uj9BkDlqxYZxX9M6COxlP6CCKf2jx6gX1OfO7KlJ6osAz5X05VQ8guX2OMqrqH bQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtpuht3w9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jul 2023 16:05:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36EG5sVJ030419
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jul 2023 16:05:54 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 14 Jul
 2023 09:05:53 -0700
Message-ID: <5c2001cc-16d2-9a67-0fa4-3e689f474a6b@quicinc.com>
Date: Fri, 14 Jul 2023 10:05:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/5 v4] accel/qaic: tighten bounds checking in
 decode_message()
Content-Language: en-US
To: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>, Dan Carpenter
 <dan.carpenter@linaro.org>
References: <ZK0Q5nbLyDO7kJa+@moroto>
 <aa6e5330-1d61-35cf-89c5-93ba0cb7a6e9@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <aa6e5330-1d61-35cf-89c5-93ba0cb7a6e9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 9Jb4FXpXA3FxIFt1f7LJRpxB4eFnfRyZ
X-Proofpoint-ORIG-GUID: 9Jb4FXpXA3FxIFt1f7LJRpxB4eFnfRyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_07,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 mlxlogscore=739 spamscore=0 malwarescore=0 bulkscore=0
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
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/14/2023 5:42 AM, Pranjal Ramajor Asha Kanojiya wrote:
> 
> 
> On 7/11/2023 1:50 PM, Dan Carpenter wrote:
>> Copy the bounds checking from encode_message() to decode_message().
>>
>> This patch addresses the following concerns.  Ensure that there is
>> enough space for at least one header so that we don't have a negative
>> size later.
>>
>>     if (msg_hdr_len < sizeof(*trans_hdr))
>>
>> Ensure that we have enough space to read the next header from the
>> msg->data.
>>
>>     if (msg_len > msg_hdr_len - sizeof(*trans_hdr))
>>         return -EINVAL;
>>
>> Check that the trans_hdr->len is not below the minimum size:
>>
>>     if (hdr_len < sizeof(*trans_hdr))
>>
>> This minimum check ensures that we don't corrupt memory in
>> decode_passthrough() when we do.
>>
>>     memcpy(out_trans->data, in_trans->data, len - sizeof(in_trans->hdr));
>>
>> And finally, use size_add() to prevent an integer overflow:
>>
>>     if (size_add(msg_len, hdr_len) > msg_hdr_len)
>>
>> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Pushed to drm-misc-fixes

-Jeff
