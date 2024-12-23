Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5B59FAD3E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 11:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3206A10E259;
	Mon, 23 Dec 2024 10:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="d+Vunec3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CF910E259
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 10:42:04 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN5rSO3018255;
 Mon, 23 Dec 2024 10:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kS8mKYR+usUeESbZBNvjVfCO5/7SjHxf1EIEyRFHnUw=; b=d+Vunec3pAI05dFg
 NWoSaUoIdlgzKyl06I8e2OT9E6w6G3p6JVE3Uv4tOAacbSyTmtb0/jocMi1D21Gu
 4ajxQVvTEMVb2ad6//v1UEfvj8gsilyxuR/eMnAZKmyRyDDtBmQagF3fTXJDCKa6
 JZkL4VJFFDajUxArTM9cRIMINIOt/abo07gGk8OsBmw5ZrtqOw/ToC150mrv2/nt
 Qd4iD2BoCiSOk7u/f6qWOsgLnv5MJv6Yir1CueTcp+XMwzznlJtRo3ujGxDBfDDX
 Gr5WpgfhgHg8Y3VWMftSenQ3vrOIBxWzEhdNRVgHWbzmjS/LKaCG/vrCZYmqj5LD
 3pPEPQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q24590gk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Dec 2024 10:41:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNAfwtd020835
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Dec 2024 10:41:58 GMT
Received: from [10.206.105.210] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 02:41:54 -0800
Message-ID: <7b9694ea-a4fc-43bf-b58b-8c479af18140@quicinc.com>
Date: Mon, 23 Dec 2024 16:11:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] misc: fastrpc: Deregister device nodes properly in
 error scenarios
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>, stable
 <stable@kernel.org>
References: <20241223100101.29844-1-quic_anane@quicinc.com>
 <20241223100101.29844-2-quic_anane@quicinc.com>
 <sfkf5wtra5e73a2wiclgrrlyp6urjdl635hxc2ucvv2q7hidzj@lkocd6ibymsg>
Content-Language: en-US
From: Anandu Krishnan E <quic_anane@quicinc.com>
In-Reply-To: <sfkf5wtra5e73a2wiclgrrlyp6urjdl635hxc2ucvv2q7hidzj@lkocd6ibymsg>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 3rRXZiaE627zetXVs1NHaJAXgY-cNbCh
X-Proofpoint-GUID: 3rRXZiaE627zetXVs1NHaJAXgY-cNbCh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxlogscore=839 priorityscore=1501 malwarescore=0 mlxscore=0 spamscore=0
 suspectscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230096
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



On 12/23/2024 3:49 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 23, 2024 at 03:31:00PM +0530, Anandu Krishnan E wrote:
>> During fastrpc_rpmsg_probe, if secure device node registration
>> succeeds but non-secure device node registration fails, the secure
>> device node deregister is not called during error cleanup. Add proper
>> exit paths to ensure proper cleanup in case of error.
>>
>> Fixes: 3abe3ab3cdab ("misc: fastrpc: add secure domain support")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Anandu Krishnan E <quic_anane@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> This triggers checkpatch warning. If it is due to c&p from some internal
> documentation, please fix it too.
Understood. I will fix the checkpatch warning in the next spin.

-Anandu
> 
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 48d08eeb2d20..ff144f0aa337 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -2344,7 +2344,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  
>>  		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
>>  		if (err)
>> -			goto fdev_error;
>> +			goto populate_error;
>>  		break;
>>  	default:
>>  		err = -EINVAL;
>> -- 
>> 2.17.1
>>
> 

