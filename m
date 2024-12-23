Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBA39FAD1E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 11:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5C410E48A;
	Mon, 23 Dec 2024 10:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="PNrGiAlt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F43A10E48A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 10:30:25 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN9Si5M007922;
 Mon, 23 Dec 2024 10:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jVOjdSbEjB5SPyb/jIw3Vcq/sAgx6qjeQaelRJANPRg=; b=PNrGiAltyu5FGx3D
 Czz8Nkg6n+lnXnc/5xpxZSpV4ZXr6eGuvcmHJpyZ7ZHSiRlj8v13p5kUvoVhz6Yw
 QG/EqWGR6fo1P800LaLuPuIuadg+E5LrlnMPU06cGCO3MTNi9NxmktTrdXIZvI1E
 gwXhSmZ9nZYbTFORRXRLW1KDWTt36jVFI75AvTYG5s7sz2ZgB5iFJ5cSgOBosqkv
 pkQcQ6jpBCBAtobY8hA+937ljyYCslVSaTrQzbjJVAIgVLCAZdCtS7ousFQTCslm
 XIHKZEo/il0q5IvsCNjJ8V4mjpOnLcoX4uknFZLjAeHdgWJ72Q0mSfKxiwzrHYDF
 JhDI0Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43nk1m0unp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Dec 2024 10:30:13 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNAUCZ6018442
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Dec 2024 10:30:12 GMT
Received: from [10.206.105.210] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 02:30:09 -0800
Message-ID: <77018932-14b0-4371-8f80-e2701cbb052c@quicinc.com>
Date: Mon, 23 Dec 2024 16:00:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] misc: fastrpc: Deregister device nodes properly in
 error scenarios
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <arnd@arndb.de>, stable <stable@kernel.org>
References: <20241223100101.29844-1-quic_anane@quicinc.com>
 <20241223100101.29844-2-quic_anane@quicinc.com>
 <2024122343-java-exposure-bf50@gregkh>
Content-Language: en-US
From: Anandu Krishnan E <quic_anane@quicinc.com>
In-Reply-To: <2024122343-java-exposure-bf50@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xwwjqyOxUh2Z34SIa6KXgNQx0AxS3SjQ
X-Proofpoint-ORIG-GUID: xwwjqyOxUh2Z34SIa6KXgNQx0AxS3SjQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=483 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230094
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



On 12/23/2024 3:40 PM, Greg KH wrote:
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
> Shouldn't this be a stand-alone patch, not part of a series, if you wish
> to have it included in 6.14-final?
> 
> thanks,
> 
> greg k-h

Sure, I will send this change as a stand-alone patch in the next spin,
so that it can be included in 6.14-final.

Thanks 
Anandu



