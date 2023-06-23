Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B787A73BEF3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 21:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6F610E69D;
	Fri, 23 Jun 2023 19:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A618010E69D;
 Fri, 23 Jun 2023 19:37:40 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35NE611m000863; Fri, 23 Jun 2023 19:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=apHmtOLXp59Bjg7qSJ2SYrLUguLUr6MvFtEmC0HWrJU=;
 b=ib+0Yvja8sWCY+AonGGOJhBN4Ok1oWbnEgiI9h1YatLwDTxx+X2dbeffO/09wRnjc0jS
 dlKyrowf10c1tiIq7ttUEJUIxsxir8cWN6ECVyt73ixl4xdXRTbMMrawV1QmqAXCd+Pn
 8U342Xusw8S59okwqHXd4kGUSqgSbX+coE+w8PVVN6/CkGQnpvvbsXgWev8HbC5BmQR+
 IqT2s/xe51Q/J4p3MWbqOZW+rIgk/4IquqWgMNCXW7QCG/qioljA2vw0k6Qu96cNC3j/
 5C5sD07KbOb7eLYMojQwLRTM78OYrNXoiTd7t9VhAyZVA3JwQP3jjjOmPiy/b9kLFqwE 0g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rdcuurt9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 19:37:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35NJbU7m002152
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 19:37:30 GMT
Received: from [10.110.61.170] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 23 Jun
 2023 12:37:29 -0700
Message-ID: <c22f165a-cc5b-2be1-fed9-420f68dbd8b7@quicinc.com>
Date: Fri, 23 Jun 2023 12:37:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix DSC 1.2 block lengths
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230623013731.1088007-1-dmitry.baryshkov@linaro.org>
 <6b74cb1f-3128-4ebd-8ff9-33cc025d957b@quicinc.com>
 <mwxs3rvemvdizqtsfa7pxms5prgrdq2lue6lvkt2f23nehzhwr@uawaxv5jsnmh>
 <ad1cf803-729f-5ef5-a6cf-667ecde0b282@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ad1cf803-729f-5ef5-a6cf-667ecde0b282@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: XdMRR8IO6oCaFTtiJprD53BoF9GLZY64
X-Proofpoint-ORIG-GUID: XdMRR8IO6oCaFTtiJprD53BoF9GLZY64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_11,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=888
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306230176
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/23/2023 4:37 AM, Dmitry Baryshkov wrote:
> On 23/06/2023 09:54, Marijn Suijten wrote:
>> On 2023-06-22 22:47:04, Abhinav Kumar wrote:
>>> On 6/22/2023 6:37 PM, Dmitry Baryshkov wrote:
>>>> All DSC_BLK_1_2 declarations incorrectly pass 0x29c as the block 
>>>> length.
>>>> This includes the common block itself, enc subblocks and some empty
>>>> space around. Change that to pass 0x4 instead, the length of common
>>>> register block itself.
>>>>
>>>> Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for 
>>>> relevant chipsets")
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> There is no need of a fixes tag for this.
>>>
>>> This is not a bug but was intentional.
>>>
>>> Till we added sub-block parsing support we had to dump the whole block.
>>>
>>> And hence I would suggest this change should be merged after the
>>> sub-block parsing change otherwise we wont have full register dumps 
>>> for DSC.
>>
>> This was indeed intentional, we discussed it in [1].
>>
>> In fact I asked to make it 0xf00 + 0x10 or 0xf80 + 0x10 to also cover
>> the CTL registers, but that change didn't make it through.  0x29c is an
>> arbitrary number that I have no clue what it was based on.
> 
> This should have been NAKed. or at least TODOed.
> 

Its is not an arbitrary number. Thats an incorrect comment.

Its 4 more than the encoder's last offset which is 0x298 + 0x4 = 0x29c.

There was nothing to NAK or TODO here.

>>
>> [1]: 
>> https://lore.kernel.org/linux-arm-msm/y2whfntyo2rbrg3taazjdw5sijle6k6swzl4uutcxm6tmuayh4@uxdur74uasua/
>>
>> - Marijn
> 
