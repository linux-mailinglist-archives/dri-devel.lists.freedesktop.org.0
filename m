Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5FE6A7647
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 22:43:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAB210E346;
	Wed,  1 Mar 2023 21:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EA410E346;
 Wed,  1 Mar 2023 21:43:00 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 321I0C0O025634; Wed, 1 Mar 2023 21:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eNenZj8W5gJnrEqN5a1wLgQcKQ7e4JvieYK/klKgNT0=;
 b=PHXA6Zxj9dsMz7zW9iNgaEJ4bsKvCP1v8sP4zxGlDkBjUQftnqeZUyLbV/gjmU00m1pM
 d2V6m45Oq3dG19QCP8BpF8h2Rr+NYp3lC2kgS4ji/7f//ZGGIXPtBc0z/NI+cdIny42J
 KNo/rCDEQEsaRZ72Q8M5wJXkxlAf0hqIcGkJ35BIaybjuKHisgGQRUQha2JCv46olhjj
 wXUFafmc/IS6XktXwatoLHBlm8+vriGgo5z3u7ycr8/E7/UQ/hXcMmQglcpFR5GqTwNr
 1/mWfkBCRyLbovMJTPruxPpEcRzMSt5dCmjWcue8aP3x8l80Wrj9LhC+FMAgc4z/e3pl zg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p20j2jmwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Mar 2023 21:42:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 321LguXT031811
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 1 Mar 2023 21:42:57 GMT
Received: from [10.110.126.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 1 Mar 2023
 13:42:56 -0800
Message-ID: <866c86bb-fc16-bc78-6c0d-e693bf926241@quicinc.com>
Date: Wed, 1 Mar 2023 13:42:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 1/4] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
 <20230221184256.1436-2-quic_jesszhan@quicinc.com>
 <20230301100331.3altimojtca4zx6m@SoMainline.org>
 <5de60136-4150-dcc7-517f-5d65452c5e1b@quicinc.com>
 <20230301170812.zcu6upwzcfkt4s7c@SoMainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230301170812.zcu6upwzcfkt4s7c@SoMainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: s3aPSPYxKpnco-d-GJvXm3XRz9rArsUd
X-Proofpoint-GUID: s3aPSPYxKpnco-d-GJvXm3XRz9rArsUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_15,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0 mlxscore=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303010172
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/1/2023 9:08 AM, Marijn Suijten wrote:
> On 2023-03-01 08:23:28, Abhinav Kumar wrote:
>>
>> On 3/1/2023 2:03 AM, Marijn Suijten wrote:
>>> On 2023-02-21 10:42:53, Jessica Zhang wrote:
>>>> Currently, DPU will enable TE during prepare_commit(). However, this
>>>> will cause a crash and reboot to sahara when trying to read/write to
>>>> register in get_autorefresh_config(), because the core clock rates
>>>> aren't set at that time.
>>>
>>> Haven't seeen a crash like this on any of my devices (after implementing
>>> INTF TE).  get_autorefresh_config() always reads zero (or 1 for
>>> frame_count) except the first time it is called (autorefresh is left
>>> enabled by our bootloader on SM6125) and triggers the disable codepath.
>>>
>>
>> I feel that the fact that bootloader keeps things on for you is the
>> reason you dont see the issue. With continuoush splash, clocks are kept
>> enabled. We dont have it enabled (confirmed that).
> 
> That is quite likely, we may even have them enabled because of
> simple-framebuffer in DTs; turning those off likely won't have any
> effect for testing this.
> 
> For what it's worth, my SM8150 reads 0 for autorefresh.
> 

the value shouldnt really matter. The fact that you are able to read
that register without crashing like we are means your clocks are on and 
ours arent. Thats what this change is fixing.

> <snip>
> 
>>> Then, for some patch hygiene, starting here:
>>>
>>>> Depends on: "Implement tearcheck support on INTF block" [3]
>>>>
>>>> Changes in V3:
>>>> - Added function prototypes
>>>> - Reordered function definitions to make change more legible
>>>> - Removed prepare_commit() function from dpu_encoder_phys_cmd
>>>>
>>>> Changes in V4:
>>>> - Reworded commit message to be more specific
>>>> - Removed dpu_encoder_phys_cmd_is_ongoing_pptx() prototype
>>>
>>> ... until here: all this info belongs /below the cut/ outside of the
>>> messge that becomes part of the commit when this patch is applied to the
>>> tree.
>>
>> For DRM, I thought we are keeping the change log above the ---- ?
>> Which means its allowed in the commit message.
> 
> I hope not, seems unlikely to have different rules across kernel
> subsystems.  The main point is that this changelog and dependency chain
> isn't of any value when the final patch is applied, regardless of
> whether it is "allowed".
> 

I looked at a recently posted change by Rob and change log is above the ---

https://patchwork.kernel.org/project/dri-devel/patch/20230301185432.3010939-1-robdclark@gmail.com/

So we will follow that.

>>>> [1] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L1109
>>>> [2] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2339
>>>
>>> Please replace these with "permalinks" (to a commit hash): a branch with
>>> line number annotation will fall out of date soon as more patches are
>>> applied that touch these files.
>>>
>>>> [3] https://patchwork.freedesktop.org/series/112332/
>>>
>>> Is this a hard dependency?  It seems this series applies cleanly on
>>> -next and - from a cursory view - should be applicable and testable
>>> without my INTF TE series.  However, Dmitry asked me to move some code
>>> around in review resulting in separate callbacks in the encoder, rather
>>> than having various if(has_intf_te) within those callbacks.  That'll
>>> cause conflicts when I eventually get to respin a v2.
>>>
>>
>> I guess Jessica listed this because without intf_te series there is no
>> crash because hw_pp would be NULL and autorefresh() would return early.
>> So dependency is from the standpoint of when this series is needed and
>> not from compilation point of view.
> 
> That is indeed the question.  I'll leave it to the maintainers to decide
> what order to apply these in, which we should be made aware of before
> submitting v2 so that one of us can resolve the conflicts.
> 

It should be first the intf TE series and then this one. You can go 
ahead and post your v2, we will rebase on top of yours.

> - Marijn
