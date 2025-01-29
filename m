Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2740AA21776
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 06:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8D010E0B6;
	Wed, 29 Jan 2025 05:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VQiKF+Ab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C502210E0B6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 05:43:16 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T2hGZT021051;
 Wed, 29 Jan 2025 05:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MluhHGnAAyIhuJOeIvVp+VrtgGP6P/eiVV8c2vS8Kfk=; b=VQiKF+AbjJ7ubL8l
 JMBkogNSvEAOT+kvMyPpIfyb7Yzlqm4+vOfw49iX99zR8ehZiL+vl9xrV0/XUck5
 rEllZ+v+5f/GAl4bIzhtTxjfyqHHS9hApObkRfcIarqoJ5lI+2DaoFagXgHcFE/J
 FHfJYXgIx/YZNmFzKFPsd4HNcpVebRTiwMwpQGZ3BZ6l8hkPusmIlN8X0ZTnz0qy
 F0KXiqw1sPVLRJlf5vBtnrBvXmNBY0Fxstq3GrLYEdBa+f1FlY/4KuSe4hSXQJhV
 M0lm9bskHCiWX6DKAi+5M8Di+m+d/RbQzBu3osW6sKPs3SlYEUwOeRGyJIWq8yAF
 H6wCXg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f7xfgkr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 05:43:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T5hB7L013730
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 05:43:11 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 Jan
 2025 21:43:08 -0800
Message-ID: <08b469b8-2339-4fde-9472-fcaadbb4ed87@quicinc.com>
Date: Wed, 29 Jan 2025 11:13:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] misc: fastrpc: Modify context id mask to support
 polling mode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-6-quic_ekangupt@quicinc.com>
 <im7gi5ib7wnihu3ff4a2erqctne2pm2zf3wl4qmuejz4dfhf7e@z5au6vnm5por>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <im7gi5ib7wnihu3ff4a2erqctne2pm2zf3wl4qmuejz4dfhf7e@z5au6vnm5por>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: xTgp9aCGfXEQaNAtw6CIm52bhGquG61u
X-Proofpoint-GUID: xTgp9aCGfXEQaNAtw6CIm52bhGquG61u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501290045
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




On 1/29/2025 5:00 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 27, 2025 at 10:12:39AM +0530, Ekansh Gupta wrote:
>> DSP needs last 4 bits of context id to be 0 for polling mode to be
>> supported as setting of last 8 is intended for async mode(not yet
>> supported on upstream driver) and setting these bits restrics
>> writing to poll memory from DSP. Modify context id mask to ensure
>> polling mode is supported.
> Shouldn't this commit come before the previous one?

Yes, I'll change the order in next series.

Thanks for reviewing the changes.

--ekansh

>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 257a741af115..ef56c793c564 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -40,7 +40,7 @@
>>  #define FASTRPC_INIT_HANDLE	1
>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>>  #define FASTRPC_MAX_STATIC_HANDLE (20)
>> -#define FASTRPC_CTXID_MASK (0xFF0)
>> +#define FASTRPC_CTXID_MASK (0xFF0000)
>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>>  #define INIT_FILE_NAMELEN_MAX (128)
>>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>> @@ -524,7 +524,7 @@ static void fastrpc_context_free(struct kref *ref)
>>  		fastrpc_buf_free(ctx->buf);
>>  
>>  	spin_lock_irqsave(&cctx->lock, flags);
>> -	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
>> +	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 16);
>>  	spin_unlock_irqrestore(&cctx->lock, flags);
>>  
>>  	kfree(ctx->maps);
>> @@ -664,7 +664,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>  		spin_unlock_irqrestore(&cctx->lock, flags);
>>  		goto err_idr;
>>  	}
>> -	ctx->ctxid = ret << 4;
>> +	ctx->ctxid = ret << 16;
>>  	spin_unlock_irqrestore(&cctx->lock, flags);
>>  
>>  	kref_init(&ctx->refcount);
>> @@ -2675,7 +2675,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>>  	if (len < sizeof(*rsp))
>>  		return -EINVAL;
>>  
>> -	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
>> +	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 16);
>>  
>>  	spin_lock_irqsave(&cctx->lock, flags);
>>  	ctx = idr_find(&cctx->ctx_idr, ctxid);
>> -- 
>> 2.34.1
>>

