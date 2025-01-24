Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8823BA1AF5B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 05:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB04C10E2A7;
	Fri, 24 Jan 2025 04:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cBAV/VFl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CFD10E2A7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 04:19:21 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O3FdnG004662;
 Fri, 24 Jan 2025 04:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LKTPtG6GWE3pwIsWi/KDKSC/EsRSnBdmvKR7q13O0Pk=; b=cBAV/VFlS1gngMxi
 ejb3vpYRFQUXtj28onrWBxLo0Hv8mL0WbWndDfOfIy1CfVkpIj8wfolZ9hFl2xWo
 u4IdEEhcXzVH0iYY4vCzme+888sr0lb6wUxow5W6ogWoGviNgwssP5JC+Yden0HI
 l0LlsXQUixLlsZq7UpwurPDxVvLJljFN9Z7aGjzHzZo/RHAp35bbgZCsEXscFrII
 QVCO0+mHXDh/W6zbhOEdb3SxTgDQsnvYEoT1g+2gtrb4W/1k8sqxIiIs56HV6sMG
 tac4fch/yhIh96Iwm25ZDiE6x4SkMqicH5RQMaEtTjcXog9+7iPwibkMMhkJg8zM
 rwgfPQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c2t483rm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jan 2025 04:19:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O4JBwH022350
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jan 2025 04:19:11 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 Jan
 2025 20:19:08 -0800
Message-ID: <96b94322-7d5c-451a-be76-cd1a9292c903@quicinc.com>
Date: Fri, 24 Jan 2025 09:49:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] misc: fastrpc: Add CRC support using invokeV2
 request
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
References: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
 <20241007084518.3649876-2-quic_ekangupt@quicinc.com>
 <bmg5em2f673vis6wwtjx6ibkhee7d3zocwesgoafsgt5jxbfqn@w73y6gmzbamj>
 <53ce4792-6eca-42ae-b5d7-24d524697344@quicinc.com>
 <fm4wxyu7dv7wzz6szwtz4vyukzxmzajtzqlidaed4hcrabhpe2@eqw6vimhzkjm>
 <0dd43d4f-0399-454b-96fd-2d4f5f36ea14@quicinc.com>
 <drh2ikzku37tblmpkjbcdqjllynb3shsfogljfkhq2vcsej2ga@4ex36yehg2e6>
 <41fb5e93-2d77-48e5-92e0-8e82ee4d27ce@quicinc.com>
 <yjvjq657cfqzfcvusox5ykpyhzsi37certamb4p35eowohwwoz@cjcujhkrt2tx>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <yjvjq657cfqzfcvusox5ykpyhzsi37certamb4p35eowohwwoz@cjcujhkrt2tx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: G9OOk5CA07p5jV_78NelLnmL6cASsSn2
X-Proofpoint-GUID: G9OOk5CA07p5jV_78NelLnmL6cASsSn2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_01,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240028
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




On 1/23/2025 6:03 PM, Dmitry Baryshkov wrote:
> On Thu, Jan 23, 2025 at 05:34:00PM +0530, Ekansh Gupta wrote:
>>
>>
>> On 1/23/2025 4:43 PM, Dmitry Baryshkov wrote:
>>> On Thu, Jan 23, 2025 at 03:19:21PM +0530, Ekansh Gupta wrote:
>>>>
>>>> On 1/23/2025 1:18 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Jan 23, 2025 at 11:16:41AM +0530, Ekansh Gupta wrote:
>>>>>> On 10/7/2024 7:27 PM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Oct 07, 2024 at 02:15:15PM GMT, Ekansh Gupta wrote:
>>>>>>>> InvokeV2 request is intended to support multiple enhanced invoke
>>>>>>>> requests like CRC check, performance counter enablement and polling
>>>>>>>> mode for RPC invocations. CRC check is getting enabled as part of
>>>>>>>> this patch. CRC check for input and output argument helps in ensuring
>>>>>>>> data consistency over a remote call. If user intends to enable CRC
>>>>>>>> check, first local user CRC is calculated at user end and a CRC buffer
>>>>>>>> is passed to DSP to capture remote CRC values. DSP is expected to
>>>>>>>> write to the remote CRC buffer which is then compared at user level
>>>>>>>> with the local CRC values.
>>>>>>> This doesn't explain why this is necessary. Why do you need to checksum
>>>>>>> arguments?
>>>>>> This helps if the user suspects any data inconsistencies in the buffers passed to DSP over
>>>>>> remote call. This is not enabled by default and user can enable it as per their reqirement.
>>>>>> I'll add this information.
>>>>> An inconsistency where? Between the kernel and the DSP? Between the user
>>>>> and the DSP? Does it cover buffer contents or just the addresses?
>>>> Inconsistency between user and DSP. crc_user is calculated at user library before
>>>> making ioctl call and it is compared against the crc data which is filled by DSP and
>>>> copied to user.
>>>> This covers inconsistency in buffer contents.
>>> What is the reason for possible inconsistencies? Is it a debugging
>>> feature?
>> This is a debugging feature. Buffer data corruption might result in inconsistency.
>>>>>>> Also, what if the DSP firmware doesn't support CRC? How should userspace
>>>>>>> know that?
>>>>>> CRC support on DSP is there since long time(>6years).
>>>>> This doesn't give us a lot. Upstream kernel supports fastrpc since
>>>>> MSM8916 and MSM8996. Do those platforms support CRC?
>>>> The metadata buffer as of today also carries space for CRC information:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n877
>>>>
>>>> So this is common across all platforms.
>>>>
>>>> In case CRC is not supported on any older platform, it would result in crc mismatch at user library.
>>>> As of now a warning is getting logged there, I can add the information suggesting the failure might
>>>> also occur if CRC is not supported.
>>> Logs go to /dev/null, they are ignored by users, etc. So either there
>>> should be an actual error being returned by the kernel / library, or it
>>> can be completely ignored and skipped.
>>>
>>> So, do MSM8916 / MSM8996 / SDM845 support CRC? If not, that must be
>>> handled somehow.
>> I see it's supported on SDM845 but not on MSM89##. I'll just send the new patch version for now
>> as CRC mismatch failures are getting ignored.
> Please clearly document which platforms don't support CRC feature, the
> implications and the possible (userspace) impact. E.g. if the kernel
> logs a message for each call with failed CRC case, then this might cause
> a serious slowdown. Likewise a userspace lib might cause a slowdown.
>
> In fact, if CRC is a debugging feature, is it going to be enabled or
> disabled by default?
>
>>>>> And if they do, why do we need the invoke_v2? Can we modify existing
>>>>> code instead?
>>>> invoke_v2 is needed because there is a need to pass user crc pointer over ioctl call which
>>>> cannot be achieved using existing code. Also there are plans to add more features to this
>>>> invoke_v2 request which will carry some information from user.
>>> Is it really extensible without breaking the ABI?
>> I'm planning to keep reserved bits in uapi struct for the same. Do you see any
>> problem with this?
> Please keep Greg's comment in mind - verify that all reserved fields are
> zero.
Yes, I'll be ensuring checks for reserved fields.
>
>>>>>> From user space CRC check failure is
>>>>>> not fatal and is printed as a warning. But if copy of CRC to user fails, it will result in remote
>>>>>> call failure. Should I keep it as fatal considering that ever very old DSP support this or should
>>>>>> I consider the copy failure as non-fatal as userspace is treating this as a warning?
>>>>> warnings can remain unseen for a long time. Consider a GUI app. Nobody
>>>>> is there to view kernel warnings or library output.
>>>> Let me see if this can be done. Are you suggesting that the app will be somewhat tracking
>>>> if there is any crc check mismatch failures?
>>> I suggest returning -EIO to the app.
>> I'll check this.
>>>>>>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>>>>>> ---
>>>>>>>>  drivers/misc/fastrpc.c      | 161 ++++++++++++++++++++++++------------
>>>>>>>>  include/uapi/misc/fastrpc.h |   7 ++
>>>>>>>>  2 files changed, 116 insertions(+), 52 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>>>>>> index 74181b8c386b..8e817a763d1d 100644
>>>>>>>> --- a/drivers/misc/fastrpc.c
>>>>>>>> +++ b/drivers/misc/fastrpc.c
>>>>>>>> @@ -573,13 +573,15 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
>>>>>>>>  
>>>>>>>>  static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>>>>>>>  			struct fastrpc_user *user, u32 kernel, u32 sc,
>>>>>>>> -			struct fastrpc_invoke_args *args)
>>>>>>>> +			struct fastrpc_invoke_v2 *inv2)
>>>>>>>>  {
>>>>>>>>  	struct fastrpc_channel_ctx *cctx = user->cctx;
>>>>>>>>  	struct fastrpc_invoke_ctx *ctx = NULL;
>>>>>>>> +	struct fastrpc_invoke_args *args = NULL;
>>>>>>> Why do you need to init to NULL if you are going to set it two lines
>>>>>>> below?
>>>>>>>
>>>>>>>>  	unsigned long flags;
>>>>>>>>  	int ret;
>>>>>>>>  
>>>>>>>> +	args = (struct fastrpc_invoke_args *)inv2->inv.args;
>>>>>>> Why does it need a typecast?
>>>>>>>
>>>>>>>>  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>>>>>>>>  	if (!ctx)
>>>>>>>>  		return ERR_PTR(-ENOMEM);
>>>>>>>> @@ -611,6 +613,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>>>>>>>  	/* Released in fastrpc_context_put() */
>>>>>>>>  	fastrpc_channel_ctx_get(cctx);
>>>>>>>>  
>>>>>>>> +	ctx->crc = (u32 *)(uintptr_t)inv2->crc;
>>>>>>> Oh, but why? Also is it a user pointer or in-kernel data? If it's a
>>>>>>> user-based pointer, where is the accessiblity check? Why isn't it
>>>>>>> annotated properly?
>>>>>> This is a user pointer where the crc data is expected to be copied. There is no
>>>>>> other access to this pointer from kernel. I'm planning to change the data type
>>>>>> for crc as (void __user*) inside fastrpc_invoke_ctx structure.
>>>>> Yes, please. Also make sure that sparse doesn't add any warnings
>>>>> regarding pointer conversions.
>>>> Ack.
>>>>>>>>  	ctx->sc = sc;
>>>>>>>>  	ctx->retval = -1;
>>>>>>>>  	ctx->pid = current->pid;
>>>>>>>> @@ -1070,6 +1073,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>>>>>>>>  	struct fastrpc_invoke_buf *list;
>>>>>>>>  	struct fastrpc_phy_page *pages;
>>>>>>>>  	u64 *fdlist;
>>>>>>>> +	u32 *crclist;
>>>>>>>>  	int i, inbufs, outbufs, handles;
>>>>>>>>  
>>>>>>>>  	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
>>>>>>>> @@ -1078,6 +1082,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>>>>>>>>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>>>>>>>>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>>>>>>>>  	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
>>>>>>>> +	crclist = (u32 *)(fdlist + FASTRPC_MAX_FDLIST);
>>>>>>> I think we should rewrite this parsing somehow. Is the format of data
>>>>>>> documented somewhere?
>>>>>> fdlist, crclist and poll(planned) are the only pointers that is being used. I'm planning
>>>>>> to store these pointers to ctx structure and directly use it wherever needed. This will
>>>>>> clean-up this unnecessary calculations at multiple places.
>>>>> Please do. Nevertheless, the format also must be documented.
>>>> Ack.
>>>>>>>>  
>>>>>>>>  	for (i = inbufs; i < ctx->nbufs; ++i) {
>>>>>>>>  		if (!ctx->maps[i]) {
>>>>>>>> @@ -1102,6 +1107,12 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>>>>>>>>  			fastrpc_map_put(mmap);
>>>>>>>>  	}
>>>>>>>>  
>>>>>>>> +	if (ctx->crc && crclist && rpra) {
>>>>>>>> +		if (copy_to_user((void __user *)ctx->crc, crclist,
>>>>>>>> +				FASTRPC_MAX_CRCLIST * sizeof(u32)))
>>>>>>> Oh, so it's a user pointer. Then u32* was completely incorrect.
>>>>>>> Also you are copying FASTRPC_MAX_CRCLIST elements. Are all of them
>>>>>>> filled? Or are we leaking some data to userspace?
>>>>>> Yes, right. Planning clean-up in next patch.
>>>>>>
>>>>>> All of FASTRPC_MAX_CRCLIST is filled with crc data by DSP so copying should be fine.
>>>>> Huh? I definitely want to see documentation for function arguments.
>>>> Sure. I'll also modify the metadata layout doc here to add fdlist, CRC and other planned contents.
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n842
>>> This is not a documentation. E.g. I can not write code using that
>>> description. For example, it mentions neither FDLIST nor CRC.
>> I'm planning to add complete documentation for CRC and polling mode in user library project.
>> If I need to add documentation in driver, can you pls suggest what is the right place to add
>> the information?
> Library should be fine. We don't require documenting all hardware in the
> kernel. But the uAPI of the driver should be properly described.
Understood, thanks.

--ekansh
>
>> Thanks for your comments.
>>
>> --ekansh
>>>>>>>> +			return -EFAULT;
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>>  	return 0;
>>>>>>>>  }
>>>>>>>>  

