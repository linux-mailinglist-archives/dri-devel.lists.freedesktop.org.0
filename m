Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF7F9DC2BF
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 12:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29DC10E1ED;
	Fri, 29 Nov 2024 11:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="N17PuwrQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03D110E1ED
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 11:23:06 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATAFLOk003154;
 Fri, 29 Nov 2024 11:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 upsY0EPNIr6gt4kIzgkAEMRHahTuyjFtzcxQkRDoriY=; b=N17PuwrQ5tAz8trV
 X40NoxbkynF6miVPvTlO1ZMhNF1T+ZijUuW7aSkaaKMD/CPH+h1TYZP8MeldsCiQ
 pvShzR1AXNwvYXyDbrRms3AyhTgxLwznXbFJeeS+II24tweC7Nn0yljBW3792o7H
 7j570zaqrERTsXG/p/GZNSnJDE4OmNwceNRIIh+zOIUTAoNszS3EJouxpVkj/d7o
 ZvKEjNF4zXF0xR/ZRxl6ENQTxigbnA2nbozWZIK1Rw9ccAr+9myGjkdss1sPAK25
 aJHUC/AX1A+tiJG03RsVDwYUG82+VXlLLSg5AmPTA9OwYwz2WMBE7BnulBSuwUmR
 thy3Tw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437bpv85nx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 11:23:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ATBN2D8014659
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 11:23:02 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 29 Nov
 2024 03:22:59 -0800
Message-ID: <d9289a55-9732-4ce6-bff4-741df752b9b1@quicinc.com>
Date: Fri, 29 Nov 2024 16:52:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] misc: fastrpc: Add support for multiple PD from
 one process
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
References: <20241121084713.2599904-1-quic_ekangupt@quicinc.com>
 <20241121084713.2599904-2-quic_ekangupt@quicinc.com>
 <kq7vgfvzqhkq6kzu2zg7vr2ya5tp3igrhnqjaztwqkarh35hsf@xylvm4b4r6bu>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <kq7vgfvzqhkq6kzu2zg7vr2ya5tp3igrhnqjaztwqkarh35hsf@xylvm4b4r6bu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: OzScbKxp6-bJfWTCVfOhJzAT4dBO1K92
X-Proofpoint-GUID: OzScbKxp6-bJfWTCVfOhJzAT4dBO1K92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290092
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



On 11/22/2024 3:51 AM, Dmitry Baryshkov wrote:
> On Thu, Nov 21, 2024 at 02:17:12PM +0530, Ekansh Gupta wrote:
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
>>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c | 30 ++++++++++++++++--------------
>>  1 file changed, 16 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 74181b8c386b..08f223c95c33 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -39,6 +39,7 @@
>>  #define FASTRPC_INIT_HANDLE	1
>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>>  #define FASTRPC_CTXID_MASK (0xFF0)
>> +#define FASTRPC_CLIENTID_MASK GENMASK(4, 4)
> GENMASK(4,4) is just BIT(4), isn't it?
>
>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>>  #define INIT_FILE_NAMELEN_MAX (128)
>>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>> @@ -299,7 +300,7 @@ struct fastrpc_user {
>>  	struct fastrpc_session_ctx *sctx;
>>  	struct fastrpc_buf *init_mem;
>>  
>> -	int tgid;
>> +	int client_id;
>>  	int pd;
>>  	bool is_secure_dev;
>>  	/* Lock for lists */
>> @@ -614,7 +615,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>  	ctx->sc = sc;
>>  	ctx->retval = -1;
>>  	ctx->pid = current->pid;
>> -	ctx->tgid = user->tgid;
>> +	ctx->tgid = user->client_id;
>>  	ctx->cctx = cctx;
>>  	init_completion(&ctx->work);
>>  	INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
>> @@ -1115,7 +1116,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>>  	int ret;
>>  
>>  	cctx = fl->cctx;
>> -	msg->pid = fl->tgid;
>> +	msg->pid = fl->client_id;
>>  	msg->tid = current->pid;
>>  
>>  	if (kernel)
>> @@ -1293,7 +1294,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  		}
>>  	}
>>  
>> -	inbuf.pgid = fl->tgid;
>> +	inbuf.pgid = fl->client_id;
>>  	inbuf.namelen = init.namelen;
>>  	inbuf.pageslen = 0;
>>  	fl->pd = USER_PD;
>> @@ -1395,7 +1396,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>  		goto err;
>>  	}
>>  
>> -	inbuf.pgid = fl->tgid;
>> +	inbuf.pgid = fl->client_id;
>>  	inbuf.namelen = strlen(current->comm) + 1;
>>  	inbuf.filelen = init.filelen;
>>  	inbuf.pageslen = 1;
>> @@ -1469,8 +1470,9 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>  }
>>  
>>  static struct fastrpc_session_ctx *fastrpc_session_alloc(
>> -					struct fastrpc_channel_ctx *cctx)
>> +					struct fastrpc_user *fl)
>>  {
>> +	struct fastrpc_channel_ctx *cctx = fl->cctx;
>>  	struct fastrpc_session_ctx *session = NULL;
>>  	unsigned long flags;
>>  	int i;
>> @@ -1480,6 +1482,7 @@ static struct fastrpc_session_ctx *fastrpc_session_alloc(
>>  		if (!cctx->session[i].used && cctx->session[i].valid) {
>>  			cctx->session[i].used = true;
>>  			session = &cctx->session[i];
>> +			fl->client_id = FASTRPC_CLIENTID_MASK | i;
> So, it's not a mask, but a flag. Why is it necessary at all? Can you
> just pass i? Or i+1?
This also works as I just need to pass a non-zero unique identifier to DSP. I'll update this
in the next patch.

Thanks for reviewing.

--ekansh
>
>>  			break;
>>  		}
>>  	}
>> @@ -1504,7 +1507,7 @@ static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
>>  	int tgid = 0;
>>  	u32 sc;
>>  
>> -	tgid = fl->tgid;
>> +	tgid = fl->client_id;
>>  	args[0].ptr = (u64)(uintptr_t) &tgid;
>>  	args[0].length = sizeof(tgid);
>>  	args[0].fd = -1;
>> @@ -1579,11 +1582,10 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>>  	INIT_LIST_HEAD(&fl->maps);
>>  	INIT_LIST_HEAD(&fl->mmaps);
>>  	INIT_LIST_HEAD(&fl->user);
>> -	fl->tgid = current->tgid;
>>  	fl->cctx = cctx;
>>  	fl->is_secure_dev = fdevice->secure;
>>  
>> -	fl->sctx = fastrpc_session_alloc(cctx);
>> +	fl->sctx = fastrpc_session_alloc(fl);
>>  	if (!fl->sctx) {
>>  		dev_err(&cctx->rpdev->dev, "No session available\n");
>>  		mutex_destroy(&fl->mutex);
>> @@ -1647,7 +1649,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>>  static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>>  {
>>  	struct fastrpc_invoke_args args[1];
>> -	int tgid = fl->tgid;
>> +	int tgid = fl->client_id;
>>  	u32 sc;
>>  
>>  	args[0].ptr = (u64)(uintptr_t) &tgid;
>> @@ -1803,7 +1805,7 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>>  	int err;
>>  	u32 sc;
>>  
>> -	req_msg.pgid = fl->tgid;
>> +	req_msg.pgid = fl->client_id;
>>  	req_msg.size = buf->size;
>>  	req_msg.vaddr = buf->raddr;
>>  
>> @@ -1889,7 +1891,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>  		return err;
>>  	}
>>  
>> -	req_msg.pgid = fl->tgid;
>> +	req_msg.pgid = fl->client_id;
>>  	req_msg.flags = req.flags;
>>  	req_msg.vaddr = req.vaddrin;
>>  	req_msg.num = sizeof(pages);
>> @@ -1978,7 +1980,7 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
>>  		return -EINVAL;
>>  	}
>>  
>> -	req_msg.pgid = fl->tgid;
>> +	req_msg.pgid = fl->client_id;
>>  	req_msg.len = map->len;
>>  	req_msg.vaddrin = map->raddr;
>>  	req_msg.fd = map->fd;
>> @@ -2031,7 +2033,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>>  		return err;
>>  	}
>>  
>> -	req_msg.pgid = fl->tgid;
>> +	req_msg.pgid = fl->client_id;
>>  	req_msg.fd = req.fd;
>>  	req_msg.offset = req.offset;
>>  	req_msg.vaddrin = req.vaddrin;
>> -- 
>> 2.34.1
>>

