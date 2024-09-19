Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3357397C450
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 08:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B299510E22B;
	Thu, 19 Sep 2024 06:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="JB0n8yFk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D1F10E22B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 06:30:51 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48IJI7tY012612;
 Thu, 19 Sep 2024 06:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2CMh2NDjOinI+rhXcFElY+FQUwnwc3oYqXqP3e8yjhE=; b=JB0n8yFkCU6TMunz
 A/7o6G2jKTvQXt9zCVmhb1Szuhk2sA9kDLGqwg7O7+f/n9YBuqyWYojZXA1WHFEu
 w2DebHoSeyX94WZRAYHjBwjPi6d61NgwP3AFCSI+u/Mv5+KjWPjEc+DEwZnzDmhg
 MZ5R5ISm/2nFhvwu3BElmTEnlp7L8DOJ9JjjVCX9Gf+mNhENgi52sRPG7vxQQCl6
 GtgQv3aL2Ctgmj8cMe2uanvUC2swOJMe+0fqWhm5oKirFsGx9OuZu65xceF41UMY
 OKyDw5N9fXx3HppudXT9ka+b8zB7QM1qVKqGtubirZdAOyxzeyVa/YoaLXMwWu+e
 7ukJQA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gd4ade-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2024 06:30:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48J6UdlK027082
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2024 06:30:39 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Sep
 2024 23:30:35 -0700
Message-ID: <27ed94a1-eb60-43b1-b181-2b8270015a37@quicinc.com>
Date: Thu, 19 Sep 2024 12:00:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] misc: fastrpc: Skip reference for DMA handles
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>, stable
 <stable@kernel.org>
References: <20240822105933.2644945-1-quic_ekangupt@quicinc.com>
 <20240822105933.2644945-4-quic_ekangupt@quicinc.com>
 <7q7rar7ssvzlkol46e5e4yecgt6n4b4oqueam4ywlxjeasx2dl@oydthy337t6i>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <7q7rar7ssvzlkol46e5e4yecgt6n4b4oqueam4ywlxjeasx2dl@oydthy337t6i>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: sFzpdocpkrE2omDSeZ2UUeT0-RqyU-dm
X-Proofpoint-GUID: sFzpdocpkrE2omDSeZ2UUeT0-RqyU-dm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409190040
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



On 8/30/2024 3:03 PM, Dmitry Baryshkov wrote:
> On Thu, Aug 22, 2024 at 04:29:33PM GMT, Ekansh Gupta wrote:
>> If multiple dma handles are passed with same fd over a remote call
>> the kernel driver takes a reference and expects that put for the
>> map will be called as many times to free the map.
>> But DSP only
>> updates the fd one time in the fd list when the DSP refcount
>> goes to zero
> I'm sorry, I couldn't understand this phrase. Could you plese clarify
> what do you mean here?
DMA handle are buffers passed to DSP which are only unmapped when DSP updated
the buffer fd in fdlist.
fdlist implementation: misc: fastrpc: Add fdlist implementation - kernel/git/next/linux-next.git - The linux-next integration testing tree <https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=8f6c1d8c4f0cc316b0456788fff8373554d1d99d>

A remote call payload carries both input/output buffers and dma handles. The lifetime
of input/output buffer is a remote call which means that any buffer allocated or mapped
for a remote call will be freed or unmapped when the remote call is completing. Whereas,
dma handles can get freed over some other remote call whenever the DSP will update
fdlist. So if a remote call passed multiple dma handles with same fd to DSP, on driver, ref
count will be incremented, but DSP can update fdlist only 1 time for the same fd as DSP also
has a ref counting happening for the dma handle and fdlist is updated when the DSP ref
count goes to 0. In this case, the map will not get freed even though it is no longer in use.
>
>> and hence kernel make put call only once for the
>> fd. This can cause SMMU fault issue as the same fd can be used
>> in future for some other call.
>>
>> Fixes: 35a82b87135d ("misc: fastrpc: Add dma handle implementation")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c | 13 ++++++++-----
>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index ebe828770a8d..ad56e918e1f8 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -755,7 +755,7 @@ static const struct dma_buf_ops fastrpc_dma_buf_ops = {
>>  
>>  static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>>  				u64 va, u64 len, u32 attr,
>> -				struct fastrpc_map **ppmap)
>> +				struct fastrpc_map **ppmap, bool take_ref)
>>  {
>>  	struct fastrpc_session_ctx *sess = fl->sctx;
>>  	struct fastrpc_map *map = NULL;
>> @@ -763,7 +763,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>>  	struct scatterlist *sgl = NULL;
>>  	int err = 0, sgl_index = 0;
>>  
>> -	if (!fastrpc_map_lookup(fl, fd, va, len, ppmap, true))
>> +	if (!fastrpc_map_lookup(fl, fd, va, len, ppmap, take_ref))
>>  		return 0;
>>  
>>  	map = kzalloc(sizeof(*map), GFP_KERNEL);
>> @@ -917,14 +917,17 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
>>  	int i, err;
>>  
>>  	for (i = 0; i < ctx->nscalars; ++i) {
>> +		bool take_ref = true;
>>  
>>  		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1 ||
>>  		    ctx->args[i].length == 0)
>>  			continue;
>>  
>> +		if (i >= ctx->nbufs)
>> +			take_ref = false;
> Please clarify too.
nbufs -> total input/output buffers
nscalars -> nbufs + dma handles
So here, avoiding ref increment for dma handles.
>
>>  		err = fastrpc_map_create(ctx->fl, ctx->args[i].fd,
>>  				(u64)ctx->args[i].ptr, ctx->args[i].length,
>> -				ctx->args[i].attr, &ctx->maps[i]);
>> +				ctx->args[i].attr, &ctx->maps[i], take_ref);
>>  		if (err) {
>>  			dev_err(dev, "Error Creating map %d\n", err);
>>  			return -EINVAL;
>> @@ -1417,7 +1420,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>  
>>  	if (init.filelen && init.filefd) {
>>  		err = fastrpc_map_create(fl, init.filefd, init.file,
>> -				init.filelen, 0, &map);
>> +				init.filelen, 0, &map, true);
>>  		if (err)
>>  			goto err;
>>  	}
>> @@ -2040,7 +2043,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>>  
>>  	/* create SMMU mapping */
>>  	err = fastrpc_map_create(fl, req.fd, req.vaddrin, req.length,
>> -			0, &map);
>> +			0, &map, true);
>>  	if (err) {
>>  		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
>>  		return err;
>> -- 
>> 2.34.1
>>

