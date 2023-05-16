Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D466705706
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 21:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5052810E360;
	Tue, 16 May 2023 19:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199F410E360
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 19:24:39 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34GJOaId006175; Tue, 16 May 2023 19:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8vviqZhmlTEEOY5Xhpd6Q0/A7Ui0Wl7KPzyxgmh5lsc=;
 b=WYDQcjGouc1wq/j0YLbugNDu5j1nZ5mVejPI/AZ1jP9jj3i6apdCCgYa8PjC1cbFWbQM
 TMe+7xUipwtrPkbxY9jfMgp353YPo7qQUo1vgJkE0w2wUnf0lBMIQYvNFYdt3QYCihd4
 XRhQuWlRzrXfJwOVfZLzSeITe2zAZ6BTGmEtkqmDXn3dcXtBIwbSJoswi9ypJJroowqU
 PZ+9rQsC0A8O7WQ8u4yxwBAT9DYQ0xm5jvBz5r1XL+jz2aKZter9sQyUnw+Ukpu/ZtHn
 wYw0Crc3LrhhBeApjhFhlb8o6SMvglvL+c8WMieTFun9AlUT+9ktkk4jdHJS3Jz/j7bv dg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qme0m88cj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 19:24:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34GJOYAV001293
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 19:24:34 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 16 May
 2023 12:24:33 -0700
Message-ID: <e31ec9bc-7b18-8711-2b63-b3fb4177abcb@quicinc.com>
Date: Tue, 16 May 2023 13:24:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: silence some uninitialized variable warnings
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <d11ee378-7b06-4b5e-b56f-d66174be1ab3@kili.mountain>
 <2d1fb58f-f98b-ba17-65e9-9ea4b467102a@quicinc.com>
 <d4c73c29-b604-4b0c-92bb-000369b0a5d7@kili.mountain>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <d4c73c29-b604-4b0c-92bb-000369b0a5d7@kili.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 5G8ovkwBvnpcHAJ343cCXZs5G7-5UddB
X-Proofpoint-ORIG-GUID: 5G8ovkwBvnpcHAJ343cCXZs5G7-5UddB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_11,2023-05-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 mlxlogscore=856 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305160163
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/10/2023 10:48 AM, Dan Carpenter wrote:
> On Wed, May 10, 2023 at 08:57:03AM -0600, Jeffrey Hugo wrote:
>> On 5/3/2023 4:41 AM, Dan Carpenter wrote:
>>> Smatch complains that these are not initialized if get_cntl_version()
>>> fails but we still print them in the debug message.  Not the end of
>>> the world, but true enough.  Let's just initialize them to a dummy value
>>> to make the checker happy.
>>>
>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>
>> Thanks for the cleanup.
>>
>> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>
>> Could use a fixes tag
> 
> The fixes tag thing could have gone either way.  It's really minor.
> 
>> and also I'd prefer to maintain the style of sorting
>> the variable declaration lines by line length.  Given the minor nature of
>> these nits, I plan to address them.
> 
> Thanks!

Pushed to drm-misc-fixes

-Jeff
