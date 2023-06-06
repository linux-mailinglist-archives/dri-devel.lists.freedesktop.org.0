Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A87C724E1F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD2110E3B5;
	Tue,  6 Jun 2023 20:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FEE10E00D;
 Tue,  6 Jun 2023 20:27:37 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 356JMmSp029905; Tue, 6 Jun 2023 20:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cFd1H5CzAzRPW3VocmtdJifsDwbMigFaCl9ukT47ExY=;
 b=n2GtH3v9/Yt1PxRvhp2Cf2mVKSraAHiQZTNKRKT7XR1B+O0R2FfC3TjBzMd/4itkouVV
 d3zSgjwnKqhS+LIr2A63fY8i9DHsKpatYrIgwzz60fjPQLFBmK3sNE2rhZepYYJIPR6H
 87NvT7qq5ayEUKZbTPa71CoMhXknAJghnZrm7A2Tix/Yme20wZ+j6vsRrcwrK++9btr0
 M/p2XcEZlnwFARC4RiCBu5HszOO5VNUVn+qLoNgNTqcltQAJCNoXJHY/LquYkOxNmBeP
 1l+hsBXuTE6VOroqn72T1xrmdDXsEpm6KYZuzJ3to2g5qxv9NTHIwnNa43taSnudkFfi dA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r2a9u8669-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jun 2023 20:27:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 356KRWFH024382
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 6 Jun 2023 20:27:32 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 6 Jun 2023
 13:27:30 -0700
Message-ID: <2d96100f-4dab-58a2-3455-6d599284deba@quicinc.com>
Date: Tue, 6 Jun 2023 13:27:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [RFC PATCH v2 09/13] drm/msm/dpu: move pstate->pipe
 initialization to dpu_plane_atomic_check
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-10-dmitry.baryshkov@linaro.org>
 <4af411bf-290c-0818-bdf2-878b2da15146@quicinc.com>
 <f010d346-fdbe-62b9-c403-4928b2e929fc@quicinc.com>
 <CAA8EJprOQdotGKv914khFuhC1UGLLwLp0nngPBORYtbCXJ5Nfg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprOQdotGKv914khFuhC1UGLLwLp0nngPBORYtbCXJ5Nfg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: C79ux-a5JrXoc1bEl3_KJ35IICXl_oxc
X-Proofpoint-GUID: C79ux-a5JrXoc1bEl3_KJ35IICXl_oxc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_15,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306060173
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/24/2023 6:40 PM, Dmitry Baryshkov wrote:
> On Thu, 25 May 2023 at 02:04, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 5/24/2023 3:46 PM, Abhinav Kumar wrote:
>>>
>>>
>>> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
>>>> In preparation to virtualized planes support, move pstate->pipe
>>>> initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
>>>> case of virtual planes the plane's pipe will not be known up to the
>>>> point of atomic_check() callback.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>
>>> Will legacy paths be broken with this? So lets say there is no
>>> atomic_check we will not have a valid sspp anymore.
>>
>> I think it should still work, even if goes through the modeset crtc, it
>> should still call drm_atomic_commit() internally which should have the
>> call to atomic_check, once you confirm this , i can ack this particular
>> change.
> 
> Can you please describe the scenario you have in mind? If I got you
> correctly, you were asking about the non-commit IOCTLs. Because of the
> atomic helpers being used (e.g. drm_atomic_helper_set_config()), they
> will also result in a call to drm_atomic_commit(), which invokes
> drm_atomic_check_only().
> 

Yes, that was pretty much the scenario I was referring to, thanks for 
confirming.

