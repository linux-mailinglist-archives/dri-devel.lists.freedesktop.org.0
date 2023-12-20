Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 636C081A6B6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 19:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65BD10E232;
	Wed, 20 Dec 2023 18:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858D410E232
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 18:11:29 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BKGfWdD002281; Wed, 20 Dec 2023 18:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=7yjZbxahUeHJe1eKok92aXvJFOE+c4tDzBNuroHUX6U=; b=j8
 CHwQpvZsoyh0ahbhFainTPWI5Ba/cpID2FE6urjDbztjB9S2N3MOGLpbf7OyQWGr
 PI271ocdW44qmZ42mmqrHZFJwF5qpbgCZucX/AZC1klP3jr3rmtUCM/maHdJcbvY
 1ibKz5iXJVW2P/Peqv9lHzEJ4EJhgw3WIUgk5bKR7JDNnxHTcOncXOmA0CbG/nro
 NcYDaeeIzp/7VymttMnxV32C3YzZGwcNqZeM9klKDMjz0RqAxqPN14JqizpemxDB
 pEx4MQG+q2/u15hLR3jG1XcQtM8HqrQz+fv5YyvZWpJ6w6nDjf5j26kn4Sc/j+Zx
 6xUFDfMUgkHRaar7UmJA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v3tnw1un2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Dec 2023 18:11:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BKIBNR5021144
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Dec 2023 18:11:23 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 20 Dec
 2023 10:11:22 -0800
Message-ID: <56c3da8f-4be0-21dc-1d8b-8611c6ceaeb1@quicinc.com>
Date: Wed, 20 Dec 2023 11:11:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 6/7] accel/qaic: Leverage DRM managed APIs to release
 resources
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
 <20231208163457.1295993-7-quic_jhugo@quicinc.com>
 <9c314cf9-0291-2879-9a78-80cf97ca4ce6@quicinc.com>
 <dddc3acc-fe15-4d0c-b9f7-5cc475534498@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <dddc3acc-fe15-4d0c-b9f7-5cc475534498@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: c-q2YnksTa9eT11-6dBZzUVbzj5pSpeX
X-Proofpoint-ORIG-GUID: c-q2YnksTa9eT11-6dBZzUVbzj5pSpeX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=823 lowpriorityscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312200129
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/20/2023 12:02 AM, Jacek Lawrynowicz wrote:
> On 15.12.2023 19:06, Jeffrey Hugo wrote:
>> On 12/8/2023 9:34 AM, Jeffrey Hugo wrote:
>>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>>
>>> Offload the balancing of init and destroy calls to DRM managed APIs.
>>> mutex destroy for ->cntl_mutex is not called during device release and
>>> destroy workqueue is not called in error path of create_qdev(). So, use
>>> DRM managed APIs to manage the release of resources and avoid such
>>> problems.
>>>
>>> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>
>> Jacek, I saw a review from you for 1-5, and 7 but not this patch (6). Did I miss something?
> 
> Sorry, I was out of office for a couple days and I wasn't able to finish the review.
> 
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> 

No problem.  I thought maybe I had an issue on my end.  I appreciate the 
reviews.  Hopefully your out of office was enjoyable.

Happy Holidays.

-Jeff
