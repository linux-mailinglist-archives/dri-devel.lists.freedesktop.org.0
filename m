Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD640731C61
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 17:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DEF10E512;
	Thu, 15 Jun 2023 15:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7056A10E512
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 15:23:15 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35F99SZ9021244; Thu, 15 Jun 2023 15:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lXDkh9Ioj/i7AsHQRhCycsHoCHLy67EWMphr83ltGGI=;
 b=RdCwfsYjnF9UiZ4GTkB9hwF5RXvAze7t4zsH/5jnRTw2pxilvUETCOy37abS6JiCY06o
 tb8fJFoL4SfulhFSnSTorWCyKa7LiEUO3BHdWylfovmsZYDqSjw0ZOUcElFTLpv5PIyY
 KWsoIte2cjyeM6RwHt0ash5rbDmxSuhQYyPzFmiUYd2kFFuNKRI+wIKt6KIzw1xuXKQu
 SvvZoCaablB9NFyBARLw6chgFx/dVRSzp2zwuS/Yf/zHGKCyVT6cIpIjm5EoxqL0GiMe
 P9pr8VMmP5wnjn2kbsDjN6Kt4yx8FcLFn25pHRC0HdudaCum1VbCqRmu0RepI+MVWFLf Tw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r7u8c9hsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jun 2023 15:23:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35FFN8Zs002629
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jun 2023 15:23:08 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 15 Jun
 2023 08:23:07 -0700
Message-ID: <af6fb581-42c7-2619-82ce-8bd590ec629e@quicinc.com>
Date: Thu, 15 Jun 2023 09:23:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Call DRM helper function to destroy prime GEM
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <sukrut.bellary@linux.com>, <sumit.semwal@linaro.org>
References: <20230614161528.11710-1-quic_jhugo@quicinc.com>
 <87ce15c9-670e-f270-94b7-580b0a54f59f@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <87ce15c9-670e-f270-94b7-580b0a54f59f@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: hUxM7iksB7MhaGd6cTFMcjdglreF6WMh
X-Proofpoint-GUID: hUxM7iksB7MhaGd6cTFMcjdglreF6WMh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_11,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=868 malwarescore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150134
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
Cc: linux-arm-msm@vger.kernel.org, ogabbay@kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/15/2023 1:05 AM, Christian König wrote:
> 
> 
> Am 14.06.23 um 18:15 schrieb Jeffrey Hugo:
>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>
>> smatch warning:
>>     drivers/accel/qaic/qaic_data.c:620 qaic_free_object() error:
>>         dereferencing freed memory 'obj->import_attach'
>>
>> obj->import_attach is detached and freed using dma_buf_detach().
>> But used after free to decrease the dmabuf ref count using
>> dma_buf_put().
>>
>> drm_prime_gem_destroy() handles this issue and performs the proper clean
>> up instead of open coding it in the driver.
>>
>> Fixes: ff13be830333 ("accel/qaic: Add datapath")
>> Reported-by: Sukrut Bellary <sukrut.bellary@linux.com>
>> Closes: 
>> https://lore.kernel.org/all/20230610021200.377452-1-sukrut.bellary@linux.com/ 
>>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Thanks for the guidance and review!
