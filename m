Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3065197C430
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 08:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD7710E1BE;
	Thu, 19 Sep 2024 06:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nWeFlgUz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7687510E1BE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 06:16:00 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48ILsfGj024970;
 Thu, 19 Sep 2024 06:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nyLignwGaBNl7DbOm7oGS+yG+hh1ov/FTm5EjjkcP9g=; b=nWeFlgUzoir8PKEq
 lQxFmwNQtqpSS7Y2BJslPmYdChyS+gdbJwLqiJUHdA9xu8J2rgzUTkakuU2kRkM0
 FKuW0vSJK+cUMGLZ9HPQAqLmssMNupPXin6pRhwmhIw1SvJMujC4DtM4RxDVp8Rx
 /hNrlfkmzrqKGKkuWu9myKmMaK6tw0d1s0AVOVpYSH+dhGSUU/OzaHunGtEtrlSo
 EJfSWMuKOUgHAms29ho8fiqptghVzWNVJVwreaeW6mDHS3J7mq9w3VcInO01Z338
 ynijlBl2IBfAFCMLf5xhkBQWjqHa4dHAlYtk/gl9UL8Zp6KZCCCAm/1X2yqgErAd
 JAeoPw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hhc8us-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2024 06:15:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48J6Fpw8002931
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2024 06:15:51 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Sep
 2024 23:15:48 -0700
Message-ID: <e9c354d2-7b26-4573-a415-b2b82ac1291b@quicinc.com>
Date: Thu, 19 Sep 2024 11:45:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] misc: fastrpc: Fix fastrpc_map_lookup operation
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>, stable
 <stable@kernel.org>
References: <20240822105933.2644945-1-quic_ekangupt@quicinc.com>
 <20240822105933.2644945-3-quic_ekangupt@quicinc.com>
 <qeoclfg7inqwdzbxl35wsu6z7xecbc77albmnbge3h3hfr5uph@wxl5vfjfs35u>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <qeoclfg7inqwdzbxl35wsu6z7xecbc77albmnbge3h3hfr5uph@wxl5vfjfs35u>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: qC8Ip5djNBYZGrxQHkd4xUusddFkLz7e
X-Proofpoint-ORIG-GUID: qC8Ip5djNBYZGrxQHkd4xUusddFkLz7e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 mlxlogscore=999 mlxscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409190038
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



On 8/30/2024 3:01 PM, Dmitry Baryshkov wrote:
> On Thu, Aug 22, 2024 at 04:29:32PM GMT, Ekansh Gupta wrote:
>> Fastrpc driver creates maps for user allocated fd buffers. Before
>> creating a new map, the map list is checked for any already existing
>> maps using map fd. Checking with just map fd is not sufficient as the
>> user can pass offsetted buffer with less size when the map is created
>> and then a larger size the next time which could result in memory
>> issues. Check for user passed VA and length also when looking up for
>> the map.
>>
>> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c | 24 +++++++++++++++---------
>>  1 file changed, 15 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index bcfb8ce1a0e3..ebe828770a8d 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -362,7 +362,8 @@ static int fastrpc_map_get(struct fastrpc_map *map)
>>  
>>  
>>  static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>> -			    struct fastrpc_map **ppmap, bool take_ref)
>> +			    u64 va, u64 len, struct fastrpc_map **ppmap,
>> +				bool take_ref)
> Please use consistent alignment between the lines.
Ack.
>>  {
>>  	struct fastrpc_session_ctx *sess = fl->sctx;
>>  	struct fastrpc_map *map = NULL;
>> @@ -370,7 +371,8 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>>  
>>  	spin_lock(&fl->lock);
>>  	list_for_each_entry(map, &fl->maps, node) {
>> -		if (map->fd != fd)
>> +		if (map->fd != fd || va < (u64)map->va ||
>> +			va + len > (u64)map->va + map->size)
>>  			continue;
>>  
>>  		if (take_ref) {
>> @@ -752,7 +754,8 @@ static const struct dma_buf_ops fastrpc_dma_buf_ops = {
>>  };
>>  
>>  static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>> -			      u64 len, u32 attr, struct fastrpc_map **ppmap)
>> +				u64 va, u64 len, u32 attr,
>> +				struct fastrpc_map **ppmap)
>>  {
>>  	struct fastrpc_session_ctx *sess = fl->sctx;
>>  	struct fastrpc_map *map = NULL;
>> @@ -760,7 +763,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>>  	struct scatterlist *sgl = NULL;
>>  	int err = 0, sgl_index = 0;
>>  
>> -	if (!fastrpc_map_lookup(fl, fd, ppmap, true))
>> +	if (!fastrpc_map_lookup(fl, fd, va, len, ppmap, true))
>>  		return 0;
>>  
>>  	map = kzalloc(sizeof(*map), GFP_KERNEL);
>> @@ -807,7 +810,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>>  		err = -EINVAL;
>>  		goto map_err;
>>  	}
>> -	map->va = sg_virt(map->table->sgl);
>> +	map->va = (void *)(uintptr_t)va;
> This looks unrelated
Will be dropping this.
>
>>  	map->len = len;
>>  
>>  	if (attr & FASTRPC_ATTR_SECUREMAP) {
>> @@ -920,7 +923,8 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
>>  			continue;
>>  
>>  		err = fastrpc_map_create(ctx->fl, ctx->args[i].fd,
>> -			 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
>> +				(u64)ctx->args[i].ptr, ctx->args[i].length,
>> +				ctx->args[i].attr, &ctx->maps[i]);
>>  		if (err) {
>>  			dev_err(dev, "Error Creating map %d\n", err);
>>  			return -EINVAL;
>> @@ -1106,7 +1110,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>>  	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
>>  		if (!fdlist[i])
>>  			break;
>> -		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap, false))
>> +		if (!fastrpc_map_lookup(fl, (int)fdlist[i], 0, 0, &mmap, false))
> Isn't this going to always return false?
Yes, I'll correct this.
>
>>  			fastrpc_map_put(mmap);
>>  	}
>>  
>> @@ -1412,7 +1416,8 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>  	fl->pd = USER_PD;
>>  
>>  	if (init.filelen && init.filefd) {
>> -		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map);
>> +		err = fastrpc_map_create(fl, init.filefd, init.file,
>> +				init.filelen, 0, &map);
>>  		if (err)
>>  			goto err;
>>  	}
>> @@ -2034,7 +2039,8 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>>  		return -EFAULT;
>>  
>>  	/* create SMMU mapping */
>> -	err = fastrpc_map_create(fl, req.fd, req.length, 0, &map);
>> +	err = fastrpc_map_create(fl, req.fd, req.vaddrin, req.length,
>> +			0, &map);
>>  	if (err) {
>>  		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
>>  		return err;
>> -- 
>> 2.34.1
>>

