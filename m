Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C921A2E72A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 10:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA06110E070;
	Mon, 10 Feb 2025 09:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NDBKaEm1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F318110E070
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 09:05:58 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519MT7D8028239;
 Mon, 10 Feb 2025 09:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4w9NfthMBwEcRekiAvRsUrp4oCMwhq6AuwL24E80vlQ=; b=NDBKaEm1lXMQDp4b
 7XqSHn35ANnA4KLZz5J0y6TbmP19WJW6X4wXd5E+qguR2RyKNtkdWFxnom9j/npO
 rzrPFL4DY74UykyfEbH0AGibTeAwiUwM64gfyI0jDcxc0oyLoPY9EIapCVm0Qngm
 sUK51OikUBQMsQWSFi+LxXzlCwUWyi7Wqq1mGQvX9Zutc0cKCAK1D9Io7nKQhZ71
 m0bYxwrsfPZbv6uMBkpN72SqieCvu2U6CSWKDudQ/5TN0BCdzqJLuYp8RqFYNks1
 w+w2IIgwKu7NH3gn7/xMZWHm1qGH8y07bV9ofMOCZGENOluboanVb9Z5wS1ohr/m
 03Niag==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dxkt0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2025 09:05:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51A95rIF017711
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2025 09:05:53 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 01:05:50 -0800
Message-ID: <053dd6d6-9ca2-4723-8c21-da4093f00e03@quicinc.com>
Date: Mon, 10 Feb 2025 14:35:47 +0530
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
 <08b469b8-2339-4fde-9472-fcaadbb4ed87@quicinc.com>
 <jeixk4dmk53ubnujop3sp2lc6jffugjmzndmmqmyuft7uquibt@s2h2dgj7yj7h>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <jeixk4dmk53ubnujop3sp2lc6jffugjmzndmmqmyuft7uquibt@s2h2dgj7yj7h>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6WC4wc8GZpK5xRxVYR34dXDyx3cdaxJk
X-Proofpoint-ORIG-GUID: 6WC4wc8GZpK5xRxVYR34dXDyx3cdaxJk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100076
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




On 1/29/2025 4:53 PM, Dmitry Baryshkov wrote:
> On Wed, Jan 29, 2025 at 11:13:05AM +0530, Ekansh Gupta wrote:
>>
>>
>> On 1/29/2025 5:00 AM, Dmitry Baryshkov wrote:
>>> On Mon, Jan 27, 2025 at 10:12:39AM +0530, Ekansh Gupta wrote:
>>>> DSP needs last 4 bits of context id to be 0 for polling mode to be
>>>> supported as setting of last 8 is intended for async mode(not yet
>>>> supported on upstream driver) and setting these bits restrics
>>>> writing to poll memory from DSP. Modify context id mask to ensure
>>>> polling mode is supported.
>>> Shouldn't this commit come before the previous one?
>> Yes, I'll change the order in next series.
>>
>> Thanks for reviewing the changes.
> Please consider asking somebody for the internal review before sending
> patches. This should help you to catch such mistakes.
>
> Next, I keep on asking for a sensible userspace and testing suite. No,
> existing fastrpc doesn't pass that criteria. We have discussed that, but
> I see no changes in the development. The PR that you've linked in the
> cover letter contains a single commit, covering documentation, new
> IOCTL, CRC support, poll mode support, etc. What if the discussion ends
> up accepting the CRC support but declining the polling mode? Or vice
> versa, accepting poll mode but declining the CRC support? There is no
> easy way for us to review userspace impact, corresponding changes, etc.

We are working with our Legal team to push HexagonSDK publicly , that  will
have sample apps for all features supported by upstream driver and can be used
for testing.

I'll break down the PR to multiple meaningful commits based on the features
that are getting added.

>
> Last, but not least: I want to bring up Sima's response in one of the
> earlier discussions ([1]): "Yeah, if fastrpc just keeps growing the
> story will completely different."
>
> You are adding new IOCTL and new ivocation API. That totally sounds
> like "keeps growing", which returns us back to the uAPI question,
> drm_accel.h and the rest of the questions on the userspace, compiler,
> etc.
>
> [1] https://lore.kernel.org/dri-devel/Znk87-xCx8f3fIUL@phenom.ffwll.local/

Currently, we are upstreaming the features supported on DSP for publicly
available platforms. No features for future platforms are planned for FastRPC
driver.

We are also looking in having the driver under drivers/accel for any new features
that are planned in future platforms.

--ekansh

>
>
>> --ekansh
>>
>>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>> ---
>>>>  drivers/misc/fastrpc.c | 8 ++++----
>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index 257a741af115..ef56c793c564 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -40,7 +40,7 @@
>>>>  #define FASTRPC_INIT_HANDLE	1
>>>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>>>>  #define FASTRPC_MAX_STATIC_HANDLE (20)
>>>> -#define FASTRPC_CTXID_MASK (0xFF0)
>>>> +#define FASTRPC_CTXID_MASK (0xFF0000)
>>>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>>>>  #define INIT_FILE_NAMELEN_MAX (128)
>>>>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>>>> @@ -524,7 +524,7 @@ static void fastrpc_context_free(struct kref *ref)
>>>>  		fastrpc_buf_free(ctx->buf);
>>>>  
>>>>  	spin_lock_irqsave(&cctx->lock, flags);
>>>> -	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
>>>> +	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 16);
>>>>  	spin_unlock_irqrestore(&cctx->lock, flags);
>>>>  
>>>>  	kfree(ctx->maps);
>>>> @@ -664,7 +664,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>>>  		spin_unlock_irqrestore(&cctx->lock, flags);
>>>>  		goto err_idr;
>>>>  	}
>>>> -	ctx->ctxid = ret << 4;
>>>> +	ctx->ctxid = ret << 16;
>>>>  	spin_unlock_irqrestore(&cctx->lock, flags);
>>>>  
>>>>  	kref_init(&ctx->refcount);
>>>> @@ -2675,7 +2675,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>>>>  	if (len < sizeof(*rsp))
>>>>  		return -EINVAL;
>>>>  
>>>> -	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
>>>> +	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 16);
>>>>  
>>>>  	spin_lock_irqsave(&cctx->lock, flags);
>>>>  	ctx = idr_find(&cctx->ctx_idr, ctxid);
>>>> -- 
>>>> 2.34.1
>>>>

