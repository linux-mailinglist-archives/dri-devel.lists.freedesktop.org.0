Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEC16E2DB6
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 01:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD3A10EEC9;
	Fri, 14 Apr 2023 23:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7031710E224;
 Fri, 14 Apr 2023 23:52:02 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33ENptmX011152; Fri, 14 Apr 2023 23:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jHvAxjkdL/HjWOyVkv+jOZ+uyiOMVqkZtrZjxFJDsMI=;
 b=Xe9iIcAssZ6zEHMU3av53ux9RcThmIpf0m4Pfad9oOa8BVLIJdVbWb/VvLcYoitm4g0u
 vBcAR3dvzQ1TyFWEKrdzMWou9zQm28V8HQM0R4NB73CyjT+LkFdy6habgKVG8yy4Ya7J
 hTu/+COLVBler97rak68KQSW8/IDAcYJPSDhqqcLn0Nxj6DVIL+Y5RPV9iLPjgts/9Bm
 o++UlFK+MaF0h3lKUlm2uiTSaKXp993zAP+x/tasHGIpNliHCWyNzv9Z+wJFfMUEDAjX
 e+NfEf+O3UyjgeiRWec7AXFUUWKItngH9W5Q/Uuxbu9Vqo9dEbgocnNjAvyUur24OPPg sQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3py4ghsh0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Apr 2023 23:51:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33ENpsim007919
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Apr 2023 23:51:54 GMT
Received: from [10.110.73.215] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 14 Apr
 2023 16:51:52 -0700
Message-ID: <8c3a210a-200b-eb1d-e39a-8aad15d790f4@quicinc.com>
Date: Fri, 14 Apr 2023 16:51:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: always program dsc active bits
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <1681247095-1201-1-git-send-email-quic_khsieh@quicinc.com>
 <z7wj2lcgcdxsqh7ylhec3ig6o4p6q37zqvpzoxp4bd4vid2z2n@ubsgt3ebqrwr>
 <83f9a438-52c5-83f3-1767-92d16518d8f0@quicinc.com>
 <feedv4isliterjtwyicqfarwuvzhtov3jkmvjcwqvt7itkyh7y@e2jq5t6r3lxc>
 <e78e576a-2a04-e7ca-f6c4-701d508541ad@quicinc.com>
 <mfzi535qsjtcznwdvgb7qyzk25rcsrkwozah6ji4thqsj73n3m@asybxllomisg>
 <049697ba-d997-62c0-6e21-ffb287ac3100@quicinc.com>
 <6s42sutrd2c6tme46t6tchd6y6wonmpwokseqqz2frkrfext7v@vnv44tzwyva4>
 <82bf6167-d621-1a4e-86f0-7a8567347722@quicinc.com>
 <2e6dwt74oyy7rroxyus6ebfbylbbtinsi7bccpqazjm64owiv4@gfs52kkq47c3>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <2e6dwt74oyy7rroxyus6ebfbylbbtinsi7bccpqazjm64owiv4@gfs52kkq47c3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: PZLiaLD6EH7fWozWA3HtMZB7Tg6axn4-
X-Proofpoint-ORIG-GUID: PZLiaLD6EH7fWozWA3HtMZB7Tg6axn4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_15,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304140210
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
Cc: sean@poorly.run, vkoul@kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, andersson@kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/14/2023 4:11 PM, Marijn Suijten wrote:
> On 2023-04-14 10:57:45, Abhinav Kumar wrote:
>> On 4/14/2023 10:34 AM, Marijn Suijten wrote:
>>> On 2023-04-14 08:48:43, Abhinav Kumar wrote:
>>>> On 4/14/2023 12:35 AM, Marijn Suijten wrote:
>>>>> On 2023-04-12 10:33:15, Abhinav Kumar wrote:
>>>>> [..]
>>>>>>> What happens if a device boots without DSC panel connected?  Will
>>>>>>> CTL_DSC_FLUSH be zero and not (unnecessarily, I assume) flush any of the
>>>>>>> DSC blocks?  Or could this flush uninitialized state to the block?
>>>>>>
>>>>>> If we bootup without DSC panel connected, the kernel's cfg->dsc will be
>>>>>> 0 and default register value of CTL_DSC_FLUSH will be 0 so it wont flush
>>>>>> any DSC blocks.
>>>>>
>>>>> Ack, that makes sense.  However, if I connect a DSC panel, then
>>>>> disconnect it (now the register should be non-zero, but cfg->dsc will be
>>>>> zero), and then replug a non-DSC panel multiple times, it'll get flushed
>>>>> every time because we never clear CTL_DSC_FLUSH after that?
>>>>
>>>> If we remove it after kernel starts, that issue is there even today
>>>> without that change because DSI is not a hot-pluggable display so a
>>>> teardown wont happen when you plug out the panel. How will cfg->dsc be 0
>>>> then? In that case, its not a valid test as there was no indication to
>>>> DRM that display was disconnected so we cannot tear it down.
>>>
>>> The patch description itself describes hot-pluggable displays, which I
>>> believe is the upcoming DSC support for DP?  You ask how cfg->dsc can
>>> become zero, but this is **exactly** what the patch description
>>> describes, and what this patch is removing the `if` for.  If we are not
>>> allowed to discuss that scenario because it is not currently supported,
>>> neither should we allow to apply this patch.
>>>
>>> With that in mind, can you re-answer the question?
>>
>> I didnt follow what needs to be re-answered.
>>
>> This patch is being sent in preparation of the DSC over DP support. This
>> does not handle non-hotpluggable displays.
> 
> Good, because my question is specifically about *hotpluggable*
> displays/panels like the upcoming DSC support for DP.  After all there
> would be no point in me suggesting to connect and disconnect
> non-hotpluggable displays and expect something sensible to happen,
> wouldn't it?  Allow me to copy-paste the question again for convenience,
> with some minor wording changes:
> 
> 	However, if I connect a DSC DP display, then disconnect it (now the
> 	register should be non-zero, but cfg->dsc will be zero), and then
> 	connect and reconnect a non-DSC DP display multiple times, it'll get
> 	flushed every time because we never clear CTL_DSC_FLUSH after that?
> 
> And the missing part is: would multiple flushes be harmful in this case?

Well, you kept asking about "DSC panel" , that made me think you were 
asking about a non-hotpluggable MIPI DSI DSC panel and not DP DSC 
monitor. On many boards, panels can be removed/connected back to their 
daughter card. The term "panel" confused me a bit.

Now answering your question.

Yes, it will get flushed once every hotplug thats not too bad but 
importantly DSC wont be active as CTL_DSC_ACTIVE will be set to 0 so it 
wont cause any issue.


>> I do not think dynamic switch
>> between DSC and non-DSC of non-hotpluggable displays needs to be
>> discussed here as its not handled at all with or without this patch.
>>
>> We wanted to get early reviews on the patch. If you want this patch to
>> be absorbed when rest of DSC over DP lands, I have no concerns with
>> that. I wont pick this up for fixes and we will land this together with
>> the rest of DP over DSC.
> 
> I don't mind when and where this lands, just want to have the semantics
> clear around persisting the value of CTL_DSC_FLUSh in the register.
> 
> Regardless, this patch doesn't sound like a fix but a workaround until
> reset_intf_cfg() is fixed to be called at the right point, and extended
> to clear CTL_DSC_ACTIVE and flush the DSCs.  Perhaps it shouldn't have a
> Fixes: tag for that reason, as you intend to reinstate this
> if (cfg->dsc) condition when that is done?
> 

Its certainly fixing the use-case of DSC to non-DSC switching. So it is 
a fix.

But yes not the best fix possible. We have to improve it by moving this 
to reset_intf_cfg() as I already committed to.


> - Marijn
