Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3722A91BCB6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 12:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA0510E0EB;
	Fri, 28 Jun 2024 10:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="J5gJS2xn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAF110E0EB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 10:37:45 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45S8OfII018773;
 Fri, 28 Jun 2024 10:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DlPUXp8dLcbfDhjBjw3JFvDx9lmgfYyz36/sytTKrhU=; b=J5gJS2xnztj+p4fP
 GbvfkYGl6HQqCE5I5Nyh3UjdDRhcWepZXIsWDsDGCF4b/f54+GmYx+npgbHW2/47
 W6RxrDbdbFBggMQ9PP3VC3wNLQvvBFpkTDCOvq9ToPVHsrAf8cFzsXaypSCwfoiQ
 62RTUtVDqi0Wg4gVngAjS0nyiFQiAmOAhhJ1511X4pAE7bp20HZoqUjR0L8QVCJ6
 NHXrwsX+NseA/kLDTuKbdm0jGo9Cx616JRFfI0iwClyC2C7/1Ppb4pCJ//QJOMOr
 eJa5VIuJXjyJBmJLQUACD+xUzVweIeOV3PZtKqxiLoXZxbNIoFplkWH9EdSBY6jj
 Sr6AXg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400f90pn7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2024 10:37:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45SAbcYN021415
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2024 10:37:38 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Jun
 2024 03:37:35 -0700
Message-ID: <4b90154d-2f03-48bc-95d7-6aa0aa57e9c9@quicinc.com>
Date: Fri, 28 Jun 2024 16:07:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: Remove user PD initmem size check
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <arnd@arndb.de>, stable <stable@kernel.org>
References: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>
 <2024062716-lumpish-both-24df@gregkh>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <2024062716-lumpish-both-24df@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 8UZvoPyiYelljn-IOd95I2BYfDwJ60s2
X-Proofpoint-GUID: 8UZvoPyiYelljn-IOd95I2BYfDwJ60s2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_06,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280079
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



On 6/27/2024 4:50 PM, Greg KH wrote:
> On Thu, Jun 27, 2024 at 11:35:18AM +0530, Ekansh Gupta wrote:
>> For user PD initialization, initmem is allocated and sent to DSP for
>> initial memory requirements like shell loading. This size is passed
>> by user space and is checked against a max size. For unsigned PD
>> offloading, more than 2MB size could be passed by user which would
>> result in PD initialization failure. Remove the user PD initmem size
>> check and allow buffer allocation for user passed size. Any additional
>> memory sent to DSP during PD init is used as the PD heap.
>>
>> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>> Changes in v2:
>>   - Modified commit text.
>>   - Removed size check instead of updating max file size.
>>
>>  drivers/misc/fastrpc.c | 5 -----
>>  1 file changed, 5 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 5204fda51da3..9d064deeac89 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1389,11 +1389,6 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>  		goto err;
>>  	}
>>  
>> -	if (init.filelen > INIT_FILELEN_MAX) {
>> -		err = -EINVAL;
>> -		goto err;
>> -	}
>> -
>>  	inbuf.pgid = fl->tgid;
>>  	inbuf.namelen = strlen(current->comm) + 1;
>>  	inbuf.filelen = init.filelen;
> This feels really wrong as now there is no way to bounds-check the
> buffer size at all, so userspace can do "bad things" like go over the
> defined buffer size limit which you are expecting, right?
>
> So how is this actually correct?  If you want larger sizes, then
> increase the INIT_FILELEN_MAX value.
The reason for removing this check is that I don't know how much memory can
any user process ask for DSP PD initialization. There are some cases where huge
memory requirement can come. As for the expectation, any memory allocated here
will get completely added to DSP PD. I understand your concern but can you please
suggest any way I can have some bound-check to handle this also(requirement more
than 5MB)? The memory is allocated using SMMU context banks which is uniquely
assigned to process so the max allocation can go upto 4GB per process as per my
understanding.
> thanks,
>
> greg k-h

