Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D08770338
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 16:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951D110E0B4;
	Fri,  4 Aug 2023 14:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F65F10E0B4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 14:36:53 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 374EDNad018854; Fri, 4 Aug 2023 14:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=g8m9YHbGVPQa3+rdRgBaIy5Y5YIwzVQr7CMtkHLyfGY=;
 b=b5FxWaI2c0JIcnug6XoXn7RBww4gmGxcDcIsW+cJTWW/PIj1RtdiGbTC5lHwNaAhv6jS
 4d951+ZUYvhPf7Q2EsY7N6t0XpBmm4ROIWctJvClS+M1VXi24dAIv+bd4fDmE4eOsBcQ
 4QaNJUxUiwY112aYev729JOf6VxHb5MLag03CZJMfd2ha2XfJRv9ZR3g4v6q2lW0hOpS
 2B/I2UT11syOmXwOpDbC9ZOvyRlKZvO/84MkDFeQh/mfFZf8DmIvpSYi16m4ZrNuiCNs
 5xerq8gTPysKMvCotmv8VMbbYwtb+stNhNunqKPUZTM6Gpmrg9dM85JItYITRDzYtAN1 2w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s8kfuskx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Aug 2023 14:36:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 374EahUG011615
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 4 Aug 2023 14:36:43 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 4 Aug
 2023 07:36:42 -0700
Message-ID: <b5f456c3-1e2e-8d99-c593-140fa3571ae5@quicinc.com>
Date: Fri, 4 Aug 2023 08:36:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 0/5 v4] accel/qaic: Improve bounds checking in
 encode/decode
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <6e935c70-5bd2-4808-bdd9-d664f892b0b5@moroto.mountain>
 <0919d2f7-dbb3-2e8b-adb7-f836b21e6482@quicinc.com>
 <9af2a1c9-a59a-4f7e-a195-82cf5cbd68c9@kadam.mountain>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <9af2a1c9-a59a-4f7e-a195-82cf5cbd68c9@kadam.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: SwjckkrSEXwVqNZcYJgv8c0aEMlwH-co
X-Proofpoint-ORIG-GUID: SwjckkrSEXwVqNZcYJgv8c0aEMlwH-co
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-04_14,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=821 suspectscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308040130
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
Cc: linux-arm-msm@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/12/2023 12:30 AM, Dan Carpenter wrote:
> On Tue, Jul 11, 2023 at 11:33:25AM -0600, Jeffrey Hugo wrote:
>> On 7/11/2023 2:20 AM, Dan Carpenter wrote:
>>> Fixed in v4: Send the correct [PATCH 1/5] patch.
>>>
>>> Fixed in v3: Redo messed up threading
>>>
>>> Fixed two things in v2:  Include the <linux/overflow.h> file.  Change
>>> the >= in encode and decode to >.
>>>
>>> regards,
>>> dan carpenter
>>
>> Did you intentionally drop tags from previous versions?
> 
> Sorry, I kept messing up the resends.
> 
>>
>> For 1-3, 5
>> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>
>> Looks like 3,5 are reviewed by Pranjal and also good. I see 5 is also
>> reviewed by Dafna.  Expect those to be merged.  1,2 need a review from
>> Pranjal, but I expect all is good and will be merged.
>>
>> I did not see feedback on my question for 4.  Would like your feedback
>> before queuing that one up.
>>
> 
> Sorry, again.  Yeah.  I think you're right.  Could we queue the rest and
> I will resend 4 separately?  I know it's a headache.  If not it's fine,
> I can resend them all.

Resend for #4 is still coming, right?  I just don't want to forget about it.

-Jeff
