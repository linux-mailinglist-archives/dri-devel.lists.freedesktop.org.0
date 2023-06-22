Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC05573959C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 04:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9941910E366;
	Thu, 22 Jun 2023 02:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B9110E366
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 02:53:48 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35M2aBNT007094; Thu, 22 Jun 2023 02:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ldYepX8jKIyJFGSxDPjdZyCIZll72alhZGIxLxkAGN0=;
 b=Iszjj0wbM6up4z2W3al4IScBR8Ogpl54vi0EZxwnJK7MaHtUa3xTQ4D+GE6LZ2BziDfp
 KHK8CNaPJ/MdhtQaMPvIIzBTS0dDvXQ7ocKhQq9GLRhfdwKzDfbhM9Nzd1VXDx3HNoai
 f2lhd7jZq5rdWcLIzCxK8mJozlzM1aZO7pXK+N2o3fxrlAVYEI4YoTl+MeQvBKpg1kNG
 qmrKk0aKfDXlocqQtOtqx6EjTwMetzh+wZ6WAD3Xddal6dUDNqQl/accMh8oikTOBcGs
 cWIBL6i97QLlP2HW3byta+Jp9o3VLu+jMwh0TJYQ28lDQA3s8JhWA28GKK7CUOzlO1WX CQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rbvr1j8hn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jun 2023 02:53:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35M2rgMo024703
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jun 2023 02:53:42 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 21 Jun
 2023 19:53:41 -0700
Message-ID: <26a1858f-d428-a2ac-9ddd-115ba2d8becc@quicinc.com>
Date: Wed, 21 Jun 2023 20:53:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 0/5] accel/qaic: Improve bounds checking in encode/decode
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <af83549b-ccb4-4a8d-b036-9359eba9d39f@moroto.mountain>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <af83549b-ccb4-4a8d-b036-9359eba9d39f@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7dnmcz4J2lFzqWFWEc99eA77B2y3-OI8
X-Proofpoint-ORIG-GUID: 7dnmcz4J2lFzqWFWEc99eA77B2y3-OI8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_14,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxlogscore=864 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306220021
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

On 6/21/2023 1:21 AM, Dan Carpenter wrote:
> (I think this is the first cover letter I have ever written).
> 
> These patches are based on review and not from testing.

Thank you for your review.  I look forward to reading your patches and 
learning from them.

Did you use any kind of tooling?  If there is something we can add to 
our flow to bring up the quality, I would like to consider it.

Tooling or no, the control path is not a trivial part of the driver to 
dip your toes in, and it seems like you really dug deep.  I find that 
impressive.

> I found it quite complicated to track the buffer sizes.  What happens
> is the qaic_manage() gets a buffer user_msg->data[] which has
> user_msg->len bytes.  The qaic_manage() calls qaic_manage_msg_xfer()
> which encodes the user's message.
> 
> Then we get a response and we decode the response back into
> user_msg->data[], but we don't check that it is overflowed.  We instead
> copy seem to check against msg_hdr_len (which would prevent a read
> overflow).  At the end user_msg->len gets set to the number of bytes
> that we copied to the buffer.
> 
> I'm coming to this code brand new, it's the first time I have seen it.
> So I don't really understand.  There is an element of trust in
> msg_hdr_len but then at other times we check it for integer overflows
> which indicates deep distrust.

Overall, we are taking a message from userspace and transforming it into 
something the firmware on the device can consume.  Then we get a 
response back from the firmware, and transform that back into something 
userspace can consume.  From the driver perspective, neither the 
firmware nor userspace is really trusted.  msg_hdr_len is something that 
the driver calculates and maintains, but is updated with untrusted values.

I can see where that could be confusing.  I look forward to looking at 
what you've found, and hopefully making the code better.

> What I'm saying is that there may be more issues in this code.  But also
> that I don't really understand it so please review carefully.
> 
> The patch that I'm least sure of is 4/5:
> 
> [PATCH 4/5] accel/qaic: move and expand integer overflow checks for
>   map_user_pages()
> 
> regards,
> dan carpenter

