Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7694B6DFE36
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 20:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D37010E926;
	Wed, 12 Apr 2023 18:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EDE10E926;
 Wed, 12 Apr 2023 18:59:50 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33CI7IWr024906; Wed, 12 Apr 2023 18:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=TaIn1GO7ajcT9IGQ63Uw2sjmE7ififai7+zoeqqWTB8=;
 b=RfUC+iK/JuzzFrxEq/0bGXd+hj3YGMWz82z1acUhcG/9VF/Hvp2GeoAf3aGyvbQASzwn
 t1Dh9WjPFPT715oodoN2M7xO5PRdR0kPbutZKetj9Z4dO4wti0ASrL9EGaH8teDzAUzw
 iGm5SiMz0VGDpn1o6nNPlfSHx27V6hzx42ZYRG10fssnrLjhats0wmqMayQoAEJIWvpR
 YFDptS6/tZ3wBaBgl47orOuvLe7n74M6Z4eeUdfRBbYyRebYq62Rh88SI0MEYw0t4NCT
 99Wp2+v7TVuyUu4s6NysT11bQpcRoUvTTDVU4nnDGWz+90zJ0SHc3CFHbe5iCSov/wJe 0g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pwj7wj6tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 18:59:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33CIxjXr025167
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 18:59:45 GMT
Received: from [10.110.73.215] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 12 Apr
 2023 11:59:44 -0700
Message-ID: <74c5da6d-d103-a9c8-33ce-84f44b3962ed@quicinc.com>
Date: Wed, 12 Apr 2023 11:59:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: add DSC range checking during
 resource reservation
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <1681247380-1607-1-git-send-email-quic_khsieh@quicinc.com>
 <qvgbm3wimai3jytnikbcixipvwqn2uywqpg4mn6mjh5atergfx@wa4edsrp7y22>
 <96416911-bca3-b007-b036-1c4463e83aaa@quicinc.com>
 <24c5aa23-9b3c-787c-10aa-e9d5ad91512b@linaro.org>
 <49479b93-b364-d882-7a77-08223a94ed36@quicinc.com>
 <tczt5alqbadkodgorqm4pljpqkn5bc4efpxiy3em7bgu7gqaka@3cdszu4k6rhk>
 <8310d7ce-7ac0-05a6-b95a-c18a498f7644@quicinc.com>
 <szwu75yxcfxeyvfvrsyuoc3jeoaylydwtlzm3cevmpr3zpmfpo@wrdgbf3w3de2>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <szwu75yxcfxeyvfvrsyuoc3jeoaylydwtlzm3cevmpr3zpmfpo@wrdgbf3w3de2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ODjyePmGtkuD9C71SPfBGhBmPRtGvuii
X-Proofpoint-ORIG-GUID: ODjyePmGtkuD9C71SPfBGhBmPRtGvuii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_10,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=875 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120164
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
Cc: quic_sbillaka@quicinc.com, sean@poorly.run, andersson@kernel.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, vkoul@kernel.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 swboyd@chromium.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/12/2023 11:50 AM, Marijn Suijten wrote:
> On 2023-04-12 10:48:18, Abhinav Kumar wrote:
> [..]
>>> The only way to trigger this newly introduced range check is by omitting
>>> the DSC_x constants and manually writing e.g. an out-of-range value 10
>>> here, or setting DSC_NONE.  This is only allowed for interfaces.
>>>
>>
>> Correct, its just working on an implicit understanding that the indices
>> in the catalog
> 
> .. this sentence appears to be incomplete: what did you want to say? ..
> 

Its complete.

"Correct, its just working on an implicit understanding that the indices 
in the catalog which might still be right stick to the RM limits.

Thats why this is not bad to have."

>> which might still be right stick to the RM limits.
>>
>> Thats why this is not bad to have.
> 
> What do you mean by "RM limits"?  We have constants in the kernel that
> both define the maximum number of blocks in these arrays and a
> predefined set of ids that block can have.  These are all used in
> constant structs in the catalog, so there's nothing "software" or
> SoC-specific limiting about this (except what is available in the
> arrays).
> 

WB_MAX, DSC_MAX, LM_MAX etc are RM limits not catalog limits.

For example, LM_MAX is 8 but in the future if could have a HW which has 
10 LMs. That time if LM_MAX is not increased, its just a SW number.

Catalog on the other hand, can still list 10 LMs but with the catch that 
it uses the indices from the rm. So its just an implicit understanding 
here that catalog uses indices from RM.

Nothing prevents someone from manually adding an entry and forgetting to 
update the *_MAX in the RM.

Although, yes we will catch that in reviews.

> [..]
>> I think kuogee just added this to keep it consistent with other checks
>> present in the RM. So I didnt see any harm with that.
> 
> Yep, that's the only reason
> 
>> If he did see an issue, i will let him report that here.
> 
> If so an out-of-bounds constant was hardcoded in dpu_hw_catalog.c.
> 
>> Otherwise, I dont want to spend more time discussing this bounds check
>> when other blocks already have it.
> 
> I'll whip up a patch to clear out the extraneous lookup (assuming there
> is no other reason/dependency for it to be there...) and can follow that
> up with removing these range checks of known-good values in `const
> struct` fields.
> 

Lets see what you have in mind. As I said, I am not too obsessed with 
this patch. So i dont want to spend more time convincing why it should 
be there.

> - Marijn
