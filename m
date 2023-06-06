Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C277246CB
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 16:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B304F10E367;
	Tue,  6 Jun 2023 14:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD1B10E367
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 14:51:14 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3569LAgM011231; Tue, 6 Jun 2023 14:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NOL0ZvJjybXkdYE4MXcupZ/G4hMz3/AGHkEgn1pPr4o=;
 b=HwCw9X7Fff9HQs7h1Y19k6x3dLO4cHo3jOca8m12uGtuPG4NI6dWr8zbdqRlJug7ALUw
 nethVzV0te3y1exN5geHDFN2t86Lhts/NePGCRclmpOT3pB/Bxi+vPK/CKKgjlgJwyke
 CUsLjhhvhWUPjxfC/ajiBLgRY+w1E/ejTvsWf3UMr8kAIHJ+tKlVblGJ6EpUUAmXb9Yi
 Yj5n47qSextnFz57myPOATKY9Fc/fUgpnTo4MnbXtmvmKjo8mQ8fi4egLyjioRA1afv7
 33kHeunWd+BlqEbt5TJqRqqYyKNspyOzQ+bcepfjSrFECT+vjSJKQgSZpqfYy0adHHGn GA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r1wgv1921-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jun 2023 14:51:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 356Eor8x022070
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 6 Jun 2023 14:50:53 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 6 Jun 2023
 07:50:53 -0700
Message-ID: <b8f3b911-a883-272c-b2ac-d57e10318f75@quicinc.com>
Date: Tue, 6 Jun 2023 08:50:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/2] accel/ivpu: Do not use mutex_lock_interruptible
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20230525103818.877590-1-stanislaw.gruszka@linux.intel.com>
 <20230525103818.877590-2-stanislaw.gruszka@linux.intel.com>
 <66ccf028-48df-0493-6510-19bd635210a5@quicinc.com>
 <20230606134443.GC324119@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230606134443.GC324119@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: dW47uqI9iFO2Oz4iy5rlTtyhosrXNqXc
X-Proofpoint-GUID: dW47uqI9iFO2Oz4iy5rlTtyhosrXNqXc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_10,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060126
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
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/6/2023 7:44 AM, Stanislaw Gruszka wrote:
> Hi
> 
> On Fri, Jun 02, 2023 at 11:30:31AM -0600, Jeffrey Hugo wrote:
>> On 5/25/2023 4:38 AM, Stanislaw Gruszka wrote:
>>> If we get signal when waiting for the mmu->lock we do not invalidate
>>> current MMU configuration what might result on undefined behavior.
>>
>> "that might result in"
>>
>>> Additionally there is little or no benefit on break waiting for
>>> ipc->lock. In current code base, we keep this lock for short periods.
>>
>> What about error cases?  Nothing where say the hardware can be unresponsive
>> and a process from userspace is blocked?  Without interruptible(), ctrl+c
>> will have no effect.
> 
> I believe we do not have any infinite loops while holding the mutexe's,
> all loops will end with timeout on unresponsive hardware and sooner or
> later SIGINT will be delivered. This time can take quite long on simulated
> environment, but in such case we can just break the simulation.

Ok, then I'm not missing anything.  It does look like all the hardware 
interactions have short timeouts.  Feels odd to me to avoid 
interruptible() in user context, but I don't see anything that is wrong 
based on the code today.

With the commit text spelling fixes,
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
