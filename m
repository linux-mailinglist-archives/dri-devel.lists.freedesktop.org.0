Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 940397AB4AA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 17:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637CE10E692;
	Fri, 22 Sep 2023 15:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D4D10E68F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 15:20:54 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38MErxMX000668; Fri, 22 Sep 2023 15:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lH0T4XuOSJjuKxKTnUL4v28TMoiGSv3+diKV9gpU1lA=;
 b=ITXa9llEsHGLdGX8pNyzAtF3sLAi/BMsJdMibRX2bX1L9RDN+a5wCs9ZE2SIFxhkhT7P
 FkbDj39kDmfyMykCHs2LENcV3idbA/JZ/PctNzOLs13/erz8IbD0f1qRvVoT00QNBZCA
 xJ6VMmQ2z98kF1D9APGUhoZZmeIwxjyKP92ttsWxySfc3DdkaUPzEH1qX6ekBVPd6c+Y
 WDV00RmySVlOvjKtrjfGJBCVAe+ht15c/oW6gryIP7S4rZghJj1MIpXpRJ6+9T9BS7h/
 HrMrTwANTZQD7tskTiRWz2rzEmNwtm9/Zv4ay54081J/H32CWEFGr/DBD0so7tXEnsFz Dw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t9a3e8g5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 15:20:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38MFKoV2002122
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 15:20:50 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 08:20:49 -0700
Message-ID: <37dfc549-e309-8c6b-148d-cf8ade50da57@quicinc.com>
Date: Fri, 22 Sep 2023 09:20:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC 1/4] accel/ivpu: Allocate vpu_addr in gem->open() callback
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20230901164842.178654-1-stanislaw.gruszka@linux.intel.com>
 <20230901164842.178654-2-stanislaw.gruszka@linux.intel.com>
 <62e3769d-b747-9258-c330-97c034ea52ec@quicinc.com>
 <20230919092459.GA563961@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230919092459.GA563961@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: W2-obS6vFMSSQUBId4dETm7PoBASGLV-
X-Proofpoint-GUID: W2-obS6vFMSSQUBId4dETm7PoBASGLV-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_13,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309220132
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/19/2023 3:24 AM, Stanislaw Gruszka wrote:
> On Mon, Sep 11, 2023 at 09:19:03AM -0600, Jeffrey Hugo wrote:
>> On 9/1/2023 10:48 AM, Stanislaw Gruszka wrote:
>>> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>>
>>> gem->open() is called during handle creation for a gem object.
>>> It is called during prime import and in BO_CREATE ioctl.
>>
>> I feel like the "why" is missing.  This appears to start to explain how
>> gem->open() might be useful for the driver, but does not seem to complete
>> explaining the connection to the driver.  From the code changes, it looks
>> like using gem->open() simplifies the code by allocating the vpu_addr in one
>> place for all BOs.  If that is the goal, I feel that it should be mentioned
>> here.
> 
> I'm going to change to:
> 
> Use gem->open() callback to simplify the code and prepare for gem_shmem
> conversion. It is called during handle creation for a gem object - during
> prime import and in BO_CREATE ioctl. Hence can be used for vpu_addr
> allocation. On the way remove unused bo->user_ptr field.

Seems good to me.

With that
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
