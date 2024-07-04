Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7405A926F65
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 08:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12FA10E0AD;
	Thu,  4 Jul 2024 06:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YNv5xrie";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB83310E07F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 06:17:33 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 463Ecuo8026743;
 Thu, 4 Jul 2024 06:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YRoJDgkC/RuzkxWq4UL4dbtiu1Fo6d8QWUUORggBoaI=; b=YNv5xriekJb2IzlT
 AGVU2ANIGZPDY0YZv1JjyJ3BI+CZTTOkc5C5aFCLGWWeAgtifHxpKPWwR8xpKts5
 qd1DHQhIMELl3Qc3cnKFJYDUf5znk95WOTcT2dIMZSXQb/hWbqzyyFT1cZswEnPY
 tOLsSJ89RfZtvnHwJTr0Qb/S96GEIPC9Awuw5v+oVwhudHeh07FX6nqD5dzu5kLg
 TYg/UKpqoIQtYYTCzpJfhNqpC0piFl0qY1CATqivX31Eci7vAFFmQD2LhhznmVdQ
 4dXF0ipfRPGPt+xAc2W2Flxv06CVHXTGgucJ18n3OBXQUFs1cXnE1COSpH7vfgaI
 y7f8RQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 404yjhtut7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jul 2024 06:17:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4646HRev027397
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 4 Jul 2024 06:17:27 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 23:17:25 -0700
Message-ID: <c4a184cb-46d5-49cc-ad42-3d5d7828f06b@quicinc.com>
Date: Thu, 4 Jul 2024 11:47:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: Add support for multiple PD from one
 process
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <arnd@arndb.de>
References: <20240703065200.1438145-1-quic_ekangupt@quicinc.com>
 <2024070353-giggly-stardom-7b6d@gregkh>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <2024070353-giggly-stardom-7b6d@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cjN4FQlW-huqPXPLG3vIq5D10b8zYCdx
X-Proofpoint-ORIG-GUID: cjN4FQlW-huqPXPLG3vIq5D10b8zYCdx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_18,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407040044
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



On 7/3/2024 4:09 PM, Greg KH wrote:
> On Wed, Jul 03, 2024 at 12:22:00PM +0530, Ekansh Gupta wrote:
>> @@ -268,6 +272,7 @@ struct fastrpc_channel_ctx {
>>  	struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
>>  	spinlock_t lock;
>>  	struct idr ctx_idr;
>> +	struct ida dsp_pgid_ida;
> You have an idr and an ida?  Why two different types for the same
> driver?
Using ida for this because for this I just need to allocate and manage unique IDs
without any associated data. So this looks more space efficient that idr.
Should I keep it uniform for a driver?
>
>>  	struct list_head users;
>>  	struct kref refcount;
>>  	/* Flag if dsp attributes are cached */
>> @@ -299,6 +304,7 @@ struct fastrpc_user {
>>  	struct fastrpc_buf *init_mem;
>>  
>>  	int tgid;
>> +	int dsp_pgid;
> Are you sure this fits in an int?
I think this should be fine for IDs in rage of 1000-1064.
>
>> +static int fastrpc_pgid_alloc(struct fastrpc_channel_ctx *cctx)
>> +{
>> +	int ret = -1;
> No need to initialize this.
I'll update this.
>
>> +
>> +	/* allocate unique id between MIN_FRPC_PGID and MAX_FRPC_PGID */
>> +	ret = ida_alloc_range(&cctx->dsp_pgid_ida, MIN_FRPC_PGID,
>> +					MAX_FRPC_PGID, GFP_ATOMIC);
>> +	if (ret < 0)
>> +		return -1;
> Why is -1 a specific value here?  Return a real error please.
> Or return 0 if that's not allowed.
Sure, will fix this in next spin.
>
> v
>> +
>> +	return ret;
>> +}
>> +
>>  static int fastrpc_device_open(struct inode *inode, struct file *filp)
>>  {
>>  	struct fastrpc_channel_ctx *cctx;
>> @@ -1582,6 +1605,12 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>>  	fl->cctx = cctx;
>>  	fl->is_secure_dev = fdevice->secure;
>>  
>> +	fl->dsp_pgid = fastrpc_pgid_alloc(cctx);
>> +	if (fl->dsp_pgid == -1) {
>> +		dev_dbg(&cctx->rpdev->dev, "too many fastrpc clients, max %u allowed\n", MAX_DSP_PD);
>> +		return -EUSERS;
> Why -EUSERS?
This should be -EBUSY, I'll correct this.
>
> And you obviously did not test this as you just leaked memory :(
My bad, I ran basic fastrpc tests and the working of this use case. Sorry for the miss.

--Ekansh
>
> thanks,
>
> greg k-h

