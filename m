Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48157EB458
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 17:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E7A10E45E;
	Tue, 14 Nov 2023 16:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6ED210E45E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 16:03:45 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AEERGwv013886; Tue, 14 Nov 2023 16:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=mBhJ/ZmMtyg37tj6+hqMrY0TJ1/iMQFw5zerVuPD/fk=;
 b=mNHJm7XQqqYBJOy52ghFdD13a/H1LMtyVuTtcgVw5+zCHSYG6H7iHF7cV4BD+Gb4HleX
 n2+EFjWFcmzIvRdf0bu3bcC4qhG7lqDPab+dop83korcp3TzFsWPtTWQR4bGvdHREBjb
 e0bmvPGOndbCgR7YQIvUWvNNnqeyK2+nTyLhtC8/CUnN4R2uhSnTuAbHBOLaTQLnVKxc
 YWt/6JqjF6dMvr8kuj3c1tCOF8m3Ey7DNKFQ1+BJHiNmELCNcOcdxf/5b7Fogy60FkX/
 7OT6MGpu9QHuFZKTXowrKK9M63KIQRcRW+l5B89PwGGKp2dKfot1RBPQ5I92Z+3UxvzC 2A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ucanq08a8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Nov 2023 16:03:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AEG36WF010412
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Nov 2023 16:03:06 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 14 Nov
 2023 08:03:05 -0800
Message-ID: <e5ce0994-6698-3ade-4553-76d456fe9110@quicinc.com>
Date: Tue, 14 Nov 2023 09:03:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/2] drm: Add DRM-managed alloc_workqueue() and
 alloc_ordered_workqueue()
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, <daniel@ffwll.ch>
References: <20230118032413.6496-1-jiasheng@iscas.ac.cn>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230118032413.6496-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: yvKzGOeKPCG0UHc-pSXyneF3cJcvhjKv
X-Proofpoint-ORIG-GUID: yvKzGOeKPCG0UHc-pSXyneF3cJcvhjKv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_16,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 malwarescore=0 mlxlogscore=824 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311140122
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mripard@kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/17/2023 8:24 PM, Jiasheng Jiang wrote:
>> On Tue, Jan 10, 2023 at 11:24:47PM +0800, Jiasheng Jiang wrote:
>>> Add drmm_alloc_workqueue() and drmm_alloc_ordered_workqueue(), the helpers
>>> that provide managed workqueue cleanup. The workqueue will be destroyed
>>> with the final reference of the DRM device.
>>>
>>> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
>>
>> Yeah I think this looks nice.
>>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> I'm assuming driver maintainers will pick this up, if not please holler.
>>
>> Also the threading seems broken, it's not a patch series. The b4 tool or
>> git send-email (of all the patches of the entire series at once, not each
>> individually) should get this right.
>>
>> Unfortunately I did't find the right link in the kernel docs, or at least
>> they're not as detailed as I hoped.
>>
>> Also your previous submission had iirc a bunch more patches, do you plan
>> to include them all in the next patch set?
> 
> I have found that some previous patches have already been applied.
> Need I just convert alloc*workqueue into drmm_alloc*workqueue and remove
> the destroy_workqueue?
> Or need I convert all the alloc*workqueue in the DRM?
> 
> Thanks,
> Jiang

Unless I'm missing something, I don't see that this ever got applied.  I 
have a use for this interface in the qaic driver.

Jiang, are you planning on posting a v2?

-Jeff
