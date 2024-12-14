Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D9B9F20C1
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 21:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1473B10E2B6;
	Sat, 14 Dec 2024 20:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="p5yrRaiP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13B410E2B6;
 Sat, 14 Dec 2024 20:53:16 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BEHxq08004633;
 Sat, 14 Dec 2024 20:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +0j2WPR1fgo4kDMEwCIvzm1eEJihjRw6FoiPxikWkPY=; b=p5yrRaiPExlbbw0s
 fR6wIbECBHIlpjZPMs3e9F0rfVHXgeRbVs8CTVtFywJwQS4zzmdNYlgh/i/EF9ow
 CVYS5ZSgX2HVS6X8i5pMRtqTVKitqfFxLuoUc6ztjCGqGXm3VWV1WqjQsYvdMiZN
 8WICMTY+Ldth6ozm5PloKvqTbZAF5Pp61qwIAzlsDHNcsOH9l8dYU9cre1gDMliF
 90m9G5MXL0fR5SRvKLED0nAC5jzkg4zFXwWSQr35cm8OsUbOyPK6wPN5C9DcQCtC
 uAaEWKyGcEiFpHj23uFf0NXBt6njolaKDIdSNnkGNmmP0SXtolWXlBhTJOjx9yEa
 IEPinw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43h30ks0xt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Dec 2024 20:53:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BEKrB4C030904
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Dec 2024 20:53:11 GMT
Received: from [10.110.102.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 14 Dec
 2024 12:53:09 -0800
Message-ID: <459e59b1-1212-4a93-89cd-f5a2e062543e@quicinc.com>
Date: Sat, 14 Dec 2024 12:53:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] drm/msm/dp: pull I/O data out of
 msm_dp_catalog_private()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paloma Arellano <quic_parellan@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-4-0b1c65e7dba3@linaro.org>
 <c5090fcc-d7ec-4d49-aa21-8d1aa7f6a1c7@quicinc.com>
 <CAA8EJppOjAjFVUFSEXJMbJ4aV_MvzpeTuKDkL7P+t_Mw47YECw@mail.gmail.com>
 <5cb7b1b1-5596-4704-bd01-beaadf8bba51@quicinc.com>
 <CAA8EJppyNceC+t-2MKqq1QhCj2cYb+jprc++cFEen8Cqhhbo0w@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppyNceC+t-2MKqq1QhCj2cYb+jprc++cFEen8Cqhhbo0w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: iNfxBK57fisQLbS1oURPlszvC3Pb7C_c
X-Proofpoint-ORIG-GUID: iNfxBK57fisQLbS1oURPlszvC3Pb7C_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412140171
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

On 12/12/2024 3:09 PM, Dmitry Baryshkov wrote:
> On Thu, 12 Dec 2024 at 21:15, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 12/12/2024 12:52 AM, Dmitry Baryshkov wrote:
>>> On Thu, 12 Dec 2024 at 04:59, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
>>>>> Having I/O regions inside a msm_dp_catalog_private() results in extra
>>>>> layers of one-line wrappers for accessing the data. Move I/O region base
>>>>> and size to the globally visible struct msm_dp_catalog.
>>>>>
>>>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>     drivers/gpu/drm/msm/dp/dp_catalog.c | 457 +++++++++++++++---------------------
>>>>>     drivers/gpu/drm/msm/dp/dp_catalog.h |  12 +
>>>>>     2 files changed, 197 insertions(+), 272 deletions(-)
>>>>>
>>>>
>>>>
>>>> Fundamentally, the whole point of catalog was that it needs to be the
>>>> only place where we want to access the registers. Thats how this really
>>>> started.
>>>>
>>>> This pre-dates my time with the DP driver but as I understand thats what
>>>> it was for.
>>>>
>>>> Basically separating out the logical abstraction vs actual register writes .
>>>>
>>>> If there are hardware sequence differences within the controller reset
>>>> OR any other register offsets which moved around, catalog should have
>>>> been able to absorb it without that spilling over to all the layers.
>>>>
>>>> So for example, if we call dp_ctrl_reset() --> ctrl->catalog->reset_ctrl()
>>>>
>>>> Then the reset_ctrl op of the catalog should manage any controller
>>>> version differences within the reset sequence.
>>>
>>> The problem is that the register-level writes are usually not the best
>>> abstraction. So, instead of designing the code around dp_catalog I'd
>>> prefer to see actual hw / programming changes first.
>>>
>>
>> So thats the issue here. If we did end up with registers and sequences
>> different for controller versions, the ctrl layer was expected to just
>> call a reset() op for example similar to the DPU example you gave. And
>> as you rightly noted, the dpu_hw_xxx files only expose the ops based on
>> version and the upper layers were supposed to just call into the ops
>> without knowing the register level details. Thats pretty much what
>> dp_ctrl tried to do here. We did not want to expose all the register
>> defines in those layers. This series is doing exactly opposite of that.
> 
> We don't have the issue up to now, even though we support DP
> controllers since SDM845 up to SM8650 and X1E80100. The SDE driver has
> v200 vs v420 catalog files for PHY programming, the rest of the
> functions are common. So, for me it looks like a preparation for the
> imaginary case that didn't come to existence up to now.
> So, yes. I want to get rid of extra useless indirection and I want to
> expose register sequences in those layers.
> 

Yes because PHY programming is managed in the PHY driver today and does 
not go through catalog whereas in SDE driver it does, I do not have any 
other concrete example to give you which exists in the current code 
where sequence changes across chipset variants for DP controller and 
since I certainly cannot discuss how things can evolve moving forward, 
as usual, I have to accept it as one of those things which is not used 
today. So yes, I guess the register sequencing point changing across 
chipset variants, does not have a good example which I can really share.

But exposing register sequences within the same file, I am not too sure 
about that. For example, you can take a look at 
dp_catalog_panel_config_hdr in the SDE code OR even 
msm_dp_catalog_panel_enable_vsc_sdp in the current upstream code. Why 
should this entire sequence be exposed to the dp_panel layer?

For smaller functions which are one-liners the redirection seems 
redundant but when the sequence is bigger like in the examples I gave, 
the logical Vs register sequence separation grows. Thats where the 
dp_catalog came from.


>>
>>>>
>>>> We do not use or have catalog ops today so it looks redundant as we just
>>>> call the dp_catalog APIs directly but that was really the intention.
>>>>
>>>> Another reason which was behind this split but not applicable to current
>>>> upstream driver is that the AUX is part of the PHY driver in upstream
>>>> but in downstream, that remains a part of catalog and as we know the AUX
>>>> component keeps changing with chipsets especially the settings. That was
>>>> the reason of keeping catalog separate and the only place which should
>>>> deal with registers and not the entire DP driver.
>>>>
>>>> The second point seems not applicable to this driver but first point
>>>> still is. I do admit there is re-direction like ctrl->catalog
>>>> instead of just writing it within dp_ctrl itself but the redirection was
>>>> only because ctrl layers were not really meant to deal with the register
>>>> programming. So for example, now with patch 7 of this series every
>>>> register being written to i exposed in dp_ctrl.c and likewise for other
>>>> files. That seems unnecessary. Because if we do end up with some
>>>> variants which need separate registers written, then we will now have to
>>>> end up touching every file as opposed to only touching dp_catalog.
>>>
>>> Yes. I think that it's a bonus, not a problem. We end up touching the
>>> files that are actually changed, so we see what is happening. Quite
>>> frequently register changes are paired with the functionality changes.
>>>
>>
>> Not exactly. Why should dp_ctrl really know that some register offset or
>> some block shift happened for example. It only needs to know when to
>> reset the hardware and not how. Thats the separation getting broken with
>> this.
> 
> Yes. And I'm removing that separation very intentionally. If one is
> looking for AUX programming, they should be looking into dp_aux only,
> not dp_aux & dp_catalog. Likewise all audio code should be in
> dp_audio. By using dp_catalog we ended up with a very very very bad
> abstraction of msm_dp_catalog_audio_get_header() /
> msm_dp_catalog_audio_set_header() / enum
> msm_dp_catalog_audio_sdp_type. Just because reads & writes should go
> through the catalog.

No, I think this is where there is some correction needed. the 
get_header() / set_header() was done not because all writes need to go 
through catalog but because the audio headers were thought to be written 
only one header at a time and we had thought that read-modify-write had 
to be done to preserve the bytes. And when we have to do only one header 
at a time and because two headers map to one register, catalog had to 
end up managing an audio_map. Now, after checking where it came from as 
I commented on that patch, this requirement was not a functional one but 
was just trying to preserve the pre-silicon validation scripts sequence, 
this part of it can be dropped. So no need of get_header() / 
set_header() and an audio_map. Now all registers going through catalog 
is another thing which we are still discussing here.

> For dp_panel likewise there is no need to look into some other source
> file to follow the register sequences. It can all be contained within
> dp_panel.c, helping one to understand the code.
> 

> Last, but not least. Code complexity. dp_catalog.c consists of 1340
> lines, covering different submodules. It is hard to follow it in this
> way.
> 

Its just a question of spreading up the functions all over, not reducing 
code complexity. So yes, it reduces the file size of dp_catalog whereas 
increases that of others. Code complexity impact due to that is subjective.

>>
>>> For example (a very simple and dumb one), when designing code around
>>> dp_catalog you ended up adding separate _p1 handlers.
>>> Doing that from the data source point of view demands adding a stream_id param.
>>>
>>
>> I have not checked your comment on that series here but if your concern
> 
> This is really a bad cadence. I have provided most of the feedback
> almost a week ago.
> 

Yes, was a very tight week trying to enable upstream developers to land 
their platforms such as QCS615 by fixing platform specific dpu things 
and had the fixes cycle this week too so as a result my own feature took 
a bit of a hit this week :(

>> is stream_id should not be stored in the catalog but just passed, thats
>> fine, we can change it. stream_id as a param is needed anyway because
>> the register programming layer needs to know which offset to use. This
>> series is not mitigating that fact.
> 
> No, my concern was that you have been adding separate _p1() functions
> which are a duplicate of _p0() counterparts. When one looks at the
> dp_catalog.c it is logical: there are two different register areas, so
> there are two distinct sets of functions. If one starts looking from
> the dp_panel point of view, it's obvious that there should be a single
> msm_dp_write_stream() function which accepts stream_id and then
> multiplexes it to go to p0 or p1.
> 

Your multiplexing suggestion of adding a msm_dp_read_pn/msm_dp_write_pn 
by passing a stream_id can be done even with current dp_catalog intact 
as it will help reduce storing the stream_id in the dp_catalog. So its a 
valid suggestion and can be implemented even in the current code and not 
tied to the fact that register writing is done in dp_catalog or dp_panel.

>>
>>> In the DPU driver we also have version-related conditionals in the HW
>>> modules rather than pushing all data access to dpu_hw_catalog.c &
>>> counterparts.
>>
>> The dpu_hw_catalog.c and the dp_catalog.c are not the right files to
>> compare with each other. dp_catalog.c should be compared with
>> dpu_hw_xxx.c and as you noted, DPU version dependencies are handled in
>> those files only and not all over the files like what this series is doing.
> 
> Not really. dpu_encoder_phys_cmd_init() checks for the core_major_ver.
> Let me see if other files check for the version under the hood.
> 

Well, thats because only cmd mode panel cares about TE. No other files 
from what I checked.

> Also as you wrote, there are multiple dpu_hw_xxx.c files, each
> handling register issues on its own. We don't have a single file which
> keeps all such differences in one place.
> 

Thats because of the way the registers are laid our in the SW interface 
document aligns nicely with the file split we have in the DPU even when 
the first DPU post happened.

But I still dont think its a fair comparison.

If you really had to go deeper into this thought, then even dp_reg.h 
should be broken down into smaller headers because the offsets in 
dpu_hw_*** files are relevant only to those files but after this change 
all DP files must include dp_reg.h even though they will not be using 
all of the offsets. Since current code was already doing that, which it 
didnt have to as dp_Catalog was the only one writing all registers, this 
went unnoticed.


> Last, but not least, in the DPU driver there are actual differences
> between generations, which require different code paths. In the DP
> driver there are none.
> 
>>
>>> I think it's better to make DP driver reflect DPU rather than keeping
>>> a separate wrapper for no particular reason (note, DPU has hardware
>>> abstractions, but on a block level, not on a register level).
>>>
>>
>> Thats the issue here. DPU hardware blocks are arranged according to the
>> sub-blocks both in the software interface document and hence the code
>> matches it file-by-file. DP registers are grouped by clock domains and
>> the file separation we have today does not match that anyway. Hence
>> grouping link registers writes or pixel clock register writes into
>> dp_ctrl is also not correct that way. Let catalog handle that separation
>> internally which it already does.
> 
> I'd say, dp_panel, dp_audio and dp_link are already pretty
> self-contained. I was hoping to look at dp_display vs dp_drm later on,
> once the HPD issue gets resolved. Only dp_ctrl is not that logical
> from my point of view.
> 
