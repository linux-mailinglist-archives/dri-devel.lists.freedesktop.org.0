Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE688957CAF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 07:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8A910E4AE;
	Tue, 20 Aug 2024 05:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="UIWOYDOa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25D510E4AE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 05:18:13 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K1pNYk005015;
 Tue, 20 Aug 2024 05:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UXpVLZ4CufVhK3zP+2QQqiisBVB75MRuFmQHpYQPifs=; b=UIWOYDOaZ9yq7iAv
 nVxDcFj9eM3qfeMFjMf6vF9C7AbLDcaGAY8aSh1vKzxWspAIwqR0oM3SbA9cwpWZ
 Hm1EVF79HLriYDizw1OdRuDt3rcF+YUA/oI+4y3KRj25pTAfJSwrIqvGfAz1uHkf
 I1STYNkul3IQacAcAFsQ8BvrkCzg80xXD1ZnZJ9rPEDb5Vfj19YakLmTU0z99yTf
 iLR1LhVEfsRXJ1r72Zb9W2MwgZGXVT19YNyy9XuNYLL52Xn5mGjmzlBRio491P9C
 xsdDO6ekBVXgww+KGDIqBiz13OPqCQbfC/H1xkpOM389ms1DjB2Es4V3cB4gXZuf
 wrMchQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412k6gee86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Aug 2024 05:18:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47K5I8aO023680
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Aug 2024 05:18:08 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 19 Aug
 2024 22:18:05 -0700
Message-ID: <a0b522f5-8d70-4659-be00-d37bfbc39994@quicinc.com>
Date: Tue, 20 Aug 2024 10:48:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misc: fastrpc: Add support for multiple PD from one
 process
To: Caleb Connolly <caleb.connolly@linaro.org>,
 <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
References: <20240808104228.839629-1-quic_ekangupt@quicinc.com>
 <ed270718-63ef-4484-9856-0ff488e01b98@linaro.org>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <ed270718-63ef-4484-9856-0ff488e01b98@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: g7ghUSx1stifz5pic6qG1LntI4Cl21bL
X-Proofpoint-GUID: g7ghUSx1stifz5pic6qG1LntI4Cl21bL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200038
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



On 8/19/2024 4:35 PM, Caleb Connolly wrote:
> Hi Ekansh,
>
> On 08/08/2024 12:42, Ekansh Gupta wrote:
>> Memory intensive applications(which requires more tha 4GB) that wants
>> to offload tasks to DSP might have to split the tasks to multiple
>> user PD to make the resources available.
>>
>> For every call to DSP, fastrpc driver passes the process tgid which
>> works as an identifier for the DSP to enqueue the tasks to specific PD.
>> With current design, if any process opens device node more than once
>> and makes PD init request, same tgid will be passed to DSP which will
>> be considered a bad request and this will result in failure as the same
>> identifier cannot be used for multiple DSP PD.
>>
>> Assign and pass a client ID to DSP which would be assigned during device
>> open and will be dependent on the index of session allocated for the PD.
>> This will allow the same process to open the device more than once and
>> spawn multiple dynamic PD for ease of processing.
>
> A test tool to validate this fix and prevent it regressing in the future would be a good addition here.
Thanks for reviewing the change, Caleb.

This is more of a feature than a bug fix as it just adding support to spawn multiple user PDs from
single process. Test cases for this feature was added to the recent versions of Hexagon SDK.

--Ekansh
>>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>> Changes in v2:
>>    - Reformatted commit text.
>>    - Moved from ida to idr.
>>    - Changed dsp_pgid data type.
>>    - Resolved memory leak.
>> Changes in v3:
>>    - Modified commit text.
>>    - Removed idr implementation.
>>    - Using session index for client id.
>>
>>   drivers/misc/fastrpc.c | 30 ++++++++++++++++--------------
>>   1 file changed, 16 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index a7a2bcedb37e..0ce1eedcb2c3 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -38,6 +38,7 @@
>>   #define FASTRPC_INIT_HANDLE    1
>>   #define FASTRPC_DSP_UTILITIES_HANDLE    2
>>   #define FASTRPC_CTXID_MASK (0xFF0)
>> +#define FASTRPC_CLIENTID_MASK (16)
>>   #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>>   #define INIT_FILE_NAMELEN_MAX (128)
>>   #define FASTRPC_DEVICE_NAME    "fastrpc"
>> @@ -298,7 +299,7 @@ struct fastrpc_user {
>>       struct fastrpc_session_ctx *sctx;
>>       struct fastrpc_buf *init_mem;
>>   -    int tgid;
>> +    int client_id;
>>       int pd;
>>       bool is_secure_dev;
>>       /* Lock for lists */
>> @@ -613,7 +614,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>       ctx->sc = sc;
>>       ctx->retval = -1;
>>       ctx->pid = current->pid;
>> -    ctx->tgid = user->tgid;
>> +    ctx->tgid = user->client_id;
>>       ctx->cctx = cctx;
>>       init_completion(&ctx->work);
>>       INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
>> @@ -1111,7 +1112,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>>       int ret;
>>         cctx = fl->cctx;
>> -    msg->pid = fl->tgid;
>> +    msg->pid = fl->client_id;
>>       msg->tid = current->pid;
>>         if (kernel)
>> @@ -1294,7 +1295,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>           }
>>       }
>>   -    inbuf.pgid = fl->tgid;
>> +    inbuf.pgid = fl->client_id;
>>       inbuf.namelen = init.namelen;
>>       inbuf.pageslen = 0;
>>       fl->pd = USER_PD;
>> @@ -1396,7 +1397,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>           goto err;
>>       }
>>   -    inbuf.pgid = fl->tgid;
>> +    inbuf.pgid = fl->client_id;
>>       inbuf.namelen = strlen(current->comm) + 1;
>>       inbuf.filelen = init.filelen;
>>       inbuf.pageslen = 1;
>> @@ -1470,8 +1471,9 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>   }
>>     static struct fastrpc_session_ctx *fastrpc_session_alloc(
>> -                    struct fastrpc_channel_ctx *cctx)
>> +                    struct fastrpc_user *fl)
>>   {
>> +    struct fastrpc_channel_ctx *cctx = fl->cctx;
>>       struct fastrpc_session_ctx *session = NULL;
>>       unsigned long flags;
>>       int i;
>> @@ -1481,6 +1483,7 @@ static struct fastrpc_session_ctx *fastrpc_session_alloc(
>>           if (!cctx->session[i].used && cctx->session[i].valid) {
>>               cctx->session[i].used = true;
>>               session = &cctx->session[i];
>> +            fl->client_id = FASTRPC_CLIENTID_MASK | i;
>>               break;
>>           }
>>       }
>> @@ -1505,7 +1508,7 @@ static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
>>       int tgid = 0;
>>       u32 sc;
>>   -    tgid = fl->tgid;
>> +    tgid = fl->client_id;
>>       args[0].ptr = (u64)(uintptr_t) &tgid;
>>       args[0].length = sizeof(tgid);
>>       args[0].fd = -1;
>> @@ -1580,11 +1583,10 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>>       INIT_LIST_HEAD(&fl->maps);
>>       INIT_LIST_HEAD(&fl->mmaps);
>>       INIT_LIST_HEAD(&fl->user);
>> -    fl->tgid = current->tgid;
>>       fl->cctx = cctx;
>>       fl->is_secure_dev = fdevice->secure;
>>   -    fl->sctx = fastrpc_session_alloc(cctx);
>> +    fl->sctx = fastrpc_session_alloc(fl);
>>       if (!fl->sctx) {
>>           dev_err(&cctx->rpdev->dev, "No session available\n");
>>           mutex_destroy(&fl->mutex);
>> @@ -1648,7 +1650,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>>   static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>>   {
>>       struct fastrpc_invoke_args args[1];
>> -    int tgid = fl->tgid;
>> +    int tgid = fl->client_id;
>>       u32 sc;
>>         args[0].ptr = (u64)(uintptr_t) &tgid;
>> @@ -1804,7 +1806,7 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>>       int err;
>>       u32 sc;
>>   -    req_msg.pgid = fl->tgid;
>> +    req_msg.pgid = fl->client_id;
>>       req_msg.size = buf->size;
>>       req_msg.vaddr = buf->raddr;
>>   @@ -1890,7 +1892,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>           return err;
>>       }
>>   -    req_msg.pgid = fl->tgid;
>> +    req_msg.pgid = fl->client_id;
>>       req_msg.flags = req.flags;
>>       req_msg.vaddr = req.vaddrin;
>>       req_msg.num = sizeof(pages);
>> @@ -1980,7 +1982,7 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
>>           return -EINVAL;
>>       }
>>   -    req_msg.pgid = fl->tgid;
>> +    req_msg.pgid = fl->client_id;
>>       req_msg.len = map->len;
>>       req_msg.vaddrin = map->raddr;
>>       req_msg.fd = map->fd;
>> @@ -2033,7 +2035,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>>           return err;
>>       }
>>   -    req_msg.pgid = fl->tgid;
>> +    req_msg.pgid = fl->client_id;
>>       req_msg.fd = req.fd;
>>       req_msg.offset = req.offset;
>>       req_msg.vaddrin = req.vaddrin;
>

