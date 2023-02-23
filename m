Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E16326A12AD
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 23:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1567E10E009;
	Thu, 23 Feb 2023 22:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC8910E009;
 Thu, 23 Feb 2023 22:15:39 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31NG4jhp022013; Thu, 23 Feb 2023 22:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1pFZeZfJvlIZL3EptwVRHAcGp6VDFYkGsbbhE4f3RKA=;
 b=BmLUzRx8EGlSUGlmDMgwAucE765+npELkyTZzEFz8TrgCBhFbKiBvjllukQFbOrEO063
 pZ9kUyYrkxHlmFQzE6od1tw62npPQxoCLRXukbEgHA4mW5PEX8Wn33rWWTbKr9UXAM5g
 AypQi681Hd21JKpLcxM+ZUcHWvtaPhBldYvfB4IiOYHpRTyC/wtyjdDZOZWP0Al9DQfY
 6J41EjaxqNdZxQJNfYtNygtTKs0DkmYj7aU3iPp829sqPG9ng8O8r/kU3dbrVISdG3as
 sKYfOOE+ZJZuIbiW5Nh4/i1Q3Xm4wdIbugf2yhlAtjBRmEvYorQin1SJZ3CTqlCMaIM2 9A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nwy8m2smd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 22:15:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31NMFRPa004604
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 22:15:27 GMT
Received: from [10.110.22.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 23 Feb
 2023 14:15:26 -0800
Message-ID: <85891a0c-b351-56e8-1de1-f69bf7983d26@quicinc.com>
Date: Thu, 23 Feb 2023 14:15:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: fix stack smashing in
 dpu_hw_ctl_setup_blendstage
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230223095708.3688148-1-dmitry.baryshkov@linaro.org>
 <0daf8821-a228-1180-358b-4e50f36ca4b0@quicinc.com>
 <CAA8EJpqz-XhpEgSLTsS_ddo95y7nYmTvgop4Hj845PLbwHGmnw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqz-XhpEgSLTsS_ddo95y7nYmTvgop4Hj845PLbwHGmnw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7gxqQVTuBD40XZaRnnF54rVnQ-ROn8Lf
X-Proofpoint-ORIG-GUID: 7gxqQVTuBD40XZaRnnF54rVnQ-ROn8Lf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_13,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302230184
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
Cc: Amit Pundir <amit.pundir@linaro.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/23/2023 2:08 PM, Dmitry Baryshkov wrote:
> Hi Abhinav,
> 
> On Thu, 23 Feb 2023 at 21:17, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Hi Dmitry
>>
>> On 2/23/2023 1:57 AM, Dmitry Baryshkov wrote:
>>> The rewritten dpu_hw_ctl_setup_blendstage() can lightly smash the stack
>>> when setting the SSPP_NONE pipe. However it was unnoticed until the
>>> kernel was tested under AOSP (with some kind of stack protection/check).
>>>
>>> This fixes the following backtrace:
>>>
>>> Unexpected kernel BRK exception at EL1
>>> Internal error: BRK handler: 00000000f20003e8 [#1] PREEMPT SMP
>>> Hardware name: Thundercomm Dragonboard 845c (DT)
>>> pstate: a0400005 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>> pc : dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
>>> lr : _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
>>> sp : ffffffc00bdcb720
>>> x29: ffffffc00bdcb720 x28: ffffff8085debac0 x27: 0000000000000002
>>> x26: ffffffd74af18320 x25: ffffff8083af75a0 x24: ffffffc00bdcb878
>>> x23: 0000000000000001 x22: 0000000000000000 x21: ffffff8085a70000
>>> x20: ffffff8083012dc0 x19: 0000000000000001 x18: 0000000000000000
>>> x17: 000000040044ffff x16: 045000f4b5593519 x15: 0000000000000000
>>> x14: 000000000000000b x13: 0000000000000001 x12: 0000000000000000
>>> x11: 0000000000000001 x10: ffffffc00bdcb764 x9 : ffffffd74af06a08
>>> x8 : 0000000000000001 x7 : 0000000000000001 x6 : 0000000000000000
>>> x5 : ffffffc00bdcb878 x4 : 0000000000000002 x3 : ffffffffffffffff
>>> x2 : ffffffc00bdcb878 x1 : 0000000000000000 x0 : 0000000000000002
>>> Call trace:
>>>    dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
>>>    _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
>>>    dpu_crtc_atomic_begin+0xd8/0x22c [msm]
>>>    drm_atomic_helper_commit_planes+0x80/0x208 [drm_kms_helper]
>>>    msm_atomic_commit_tail+0x134/0x6f0 [msm]
>>>    commit_tail+0xa4/0x1a4 [drm_kms_helper]
>>>    drm_atomic_helper_commit+0x170/0x184 [drm_kms_helper]
>>>    drm_atomic_commit+0xac/0xe8
>>>    drm_mode_atomic_ioctl+0xbf0/0xdac
>>>    drm_ioctl_kernel+0xc4/0x178
>>>    drm_ioctl+0x2c8/0x608
>>>    __arm64_sys_ioctl+0xa8/0xec
>>>    invoke_syscall+0x44/0x104
>>>    el0_svc_common.constprop.0+0x44/0xec
>>>    do_el0_svc+0x38/0x98
>>>    el0_svc+0x2c/0xb4
>>>    el0t_64_sync_handler+0xb8/0xbc
>>>    el0t_64_sync+0x1a0/0x1a4
>>> Code: 52800016 52800017 52800018 17ffffc7 (d4207d00)
>>>
>>> Fixes: 4488f71f6373 ("drm/msm/dpu: simplify blend configuration")
>>> Reported-by: Amit Pundir <amit.pundir@linaro.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 4 +++-
>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> index b88a2f3724e6..6c53ea560ffa 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> @@ -446,7 +446,9 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>>>                         * CTL_LAYER has 3-bit field (and extra bits in EXT register),
>>>                         * all EXT registers has 4-bit fields.
>>>                         */
>>> -                     if (cfg->idx == 0) {
>>> +                     if (cfg->idx == -1) {
>>> +                             continue;
>>> +                     } else if (cfg->idx == 0) {
>>>                                mixercfg[0] |= mix << cfg->shift;
>>>                                mixercfg[1] |= ext << cfg->ext_shift;
>>>                        } else {
>>
>> Since I had not reviewed the change which introduced this, had a question.
>>
>> The issue here is because the shift and ext_shift are -1 for NONE and
>> hence the shift causes overflow?
>>
>> If that was the issue shouldnt we protect all such cases?
> 
> This change protects all the cases.
> 
>> So lets say we use SSPP_RGB0, the multirect_index for it will always be
>> -1 as it doesnt support smartDMA. What prevents the same issue from
>> hitting in that case? Because you are only checking for idx and not the
>> shifts.
> 
> Because for the RGB0 / rect-2 the cfg->idx will also be -1 (and
> shift/ext_shift will be 0).
> 
> 

Thanks for confirming, I have understood it now, LGTM

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Will pick this up for -fixes
