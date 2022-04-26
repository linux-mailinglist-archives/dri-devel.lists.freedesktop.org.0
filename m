Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B4351055B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 19:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218D110E747;
	Tue, 26 Apr 2022 17:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A91D10E44B;
 Tue, 26 Apr 2022 17:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650993889; x=1682529889;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pM2pNDb9XXLCoU6p5PR8bObm2xrxOjY0WylhuWrw5aI=;
 b=V0qP8D/o/NPUgzlYrafGkYJks/jWm9mBmhOva1I3ol6Nw+xzKxVPqhMl
 dwJiyYk04wDQVsWr1LGAj6t/nBew4YIq9lMqm0rVeO+LCdTPtUWmjOxmt
 3zALBCuArBfMkqa2G/tfDFO7/DyeTNgoXF7cDTCnxOxIOWXIPgfJWG2E2 o=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Apr 2022 10:24:48 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:24:48 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 10:24:48 -0700
Received: from [10.111.160.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 26 Apr
 2022 10:24:44 -0700
Message-ID: <4b80821e-aa09-bb3d-92f5-7174781a5533@quicinc.com>
Date: Tue, 26 Apr 2022 10:24:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: move add fail safe mode to
 dp_connector_get_mode()
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com>
 <3b9588d2-d9f6-c96f-b316-953b56b59bfe@linaro.org>
 <73e2a37e-23db-d614-5f5c-8120f1869158@quicinc.com>
 <CAA8EJprjuzUrfwXodgKmbWxgK6t+bY601E_nS7CHNH_+4Tfn5Q@mail.gmail.com>
 <9b331b16-8d1b-4e74-8fee-d74c4041f8d7@quicinc.com>
 <CAD=FV=VxEnbBypNYSq=iTUTwZUs_v620juSA6gsMW4h2_3HyBQ@mail.gmail.com>
 <9b4ccdef-c98a-b907-c7ee-a92456dc5bba@quicinc.com>
 <CAD=FV=U3MJ1W6CCVW0+Si8ZyAD+_ZBYsL1cT6Y8yhcTvWsCLUQ@mail.gmail.com>
 <d3d1d0d5-d3e0-0777-5b20-cdf24697742d@quicinc.com>
 <CAD=FV=W2WPdiY2zq6JC_-10kOqzDuiUYQOdYbyRyw2k-fbXFXQ@mail.gmail.com>
 <eaedbc40-f8cb-aaf8-f335-ef48e3cf82cc@quicinc.com>
 <87a921db-c4bb-eb43-96c5-0bdb757c7df9@linaro.org>
 <CAD=FV=XNWCLxEcGdDOarsY5j7wQDcPP__VsMhpe_G4N1kL-gHg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAD=FV=XNWCLxEcGdDOarsY5j7wQDcPP__VsMhpe_G4N1kL-gHg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Sean Paul <sean@poorly.run>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, "Aravind
 Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/26/2022 10:11 AM, Doug Anderson wrote:
> Hi,
> 
> On Tue, Apr 26, 2022 at 10:01 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 26/04/2022 18:37, Abhinav Kumar wrote:
>>> Hi Doug
>>>
>>> On 4/26/2022 8:20 AM, Doug Anderson wrote:
>>>> Hi,
>>>>
>>>> On Mon, Apr 25, 2022 at 8:35 PM Abhinav Kumar
>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>
>>>>> On 4/25/2022 7:18 PM, Doug Anderson wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On Mon, Apr 25, 2022 at 6:42 PM Abhinav Kumar
>>>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>>>
>>>>>>>>> 2) When there was a valid EDID but no 640x480 mode
>>>>>>>>>
>>>>>>>>> This is the equipment specific case and the one even I was a bit
>>>>>>>>> surprised. There is a DP compliance equipment we have in-house
>>>>>>>>> and while
>>>>>>>>> validation, it was found that in its list of modes , it did not
>>>>>>>>> have any
>>>>>>>>> modes which chromebook supported ( due to 2 lanes ). But my
>>>>>>>>> understanding was that, all sinks should have atleast 640x480 but
>>>>>>>>> apparently this one did not have that. So to handle this DP
>>>>>>>>> compliance
>>>>>>>>> equipment behavior, we had to do this.
>>>>>>>>
>>>>>>>> That doesn't seem right. If there's a valid EDID and the valid EDID
>>>>>>>> doesn't contain 640x480, are you _sure_ you're supposed to be adding
>>>>>>>> 640x480? That doesn't sound right to me. I've got a tiny display in
>>>>>>>> front of me for testing that only has one mode:
>>>>>>>>
>>>>>>>>       #0 800x480 65.68 800 840 888 928 480 493 496 525 32000
>>>>>>>>
>>>>>>>
>>>>>>> As I had wrote, DRM core kicks in only when the count of modes is 0.
>>>>>>> Here what is happening is the count was not 0 but 640x480 was not
>>>>>>> present in the EDID. So we had to add it explicitly.
>>>>>>>
>>>>>>> Your tiny display is a display port display?
>>>>>>>
>>>>>>> I am referring to only display port monitors. If your tiny display is
>>>>>>> DP, it should have had 640x480 in its list of modes.
>>>>>>
>>>>>> My tiny display is actually a HDMI display hooked up to a HDMI to DP
>>>>>> (active) adapter.
>>>>>>
>>>>>> ...but this is a legal and common thing to have. I suppose possibly my
>>>>>> HDMI display is "illegal"?
>>>>>>
>>>>>> OK, so reading through the spec more carefully, I do see that the DP
>>>>>> spec makes numerous mentions of the fact that DP sinks _must_ support
>>>>>> 640x480. Even going back to DP 1.4, I see section "5.2.1.2 Video
>>>>>> Timing Format" says that we must support 640x480. It seems like that's
>>>>>> _intended_ to be used only if the EDID read fails, though or if we
>>>>>> somehow have to output video without knowledge of the EDID. It seems
>>>>>> hard to believe that there's a great reason to assume a display will
>>>>>> support 640x480 if we have more accurate knowledge.
>>>>>>
>>>>>> In any case, I guess I would still say that adding this mode belongs
>>>>>> in the DRM core. The core should notice that it's a DP connection
>>>>>> (bridge->type == DRM_MODE_CONNECTOR_DisplayPort) and that 640x480 was
>>>>>> left out and it should add it. We should also make sure it's not
>>>>>> "preferred" and is last in the list so we never accidentally pick it.
>>>>>> If DP truly says that we should always give the user 640x480 then
>>>>>> that's true for everyone, not just Qualcomm. We should add it in the
>>>>>> core. If, later, someone wants to hide this from the UI it would be
>>>>>> much easier if they only needed to modify one place.
>>>>>>
>>>>>
>>>>> So I debugged with kuogee just now using the DP compliance equipment.
>>>>> It turns out, the issue is not that 640x480 mode is not present.
>>>>>
>>>>> The issue is that it is not marked as preferred.
>>>>>
>>>>> Hence we missed this part during debugging this equipment failure.
>>>>>
>>>>> We still have to figure out the best way to either mark 640x480 as
>>>>> preferred or eliminate other modes during the test-case so that 640x480
>>>>> is actually picked by usermode.
>>>>>
>>>>> Now that being said, the fix still doesn't belong in the framework. It
>>>>> has to be in the msm/dp code.
>>>>>
>>>>> Different vendors handle this failure case differently looks like.
>>>>>
>>>>> Lets take below snippet from i915 as example.
>>>>>
>>>>> 3361    if (intel_connector->detect_edid == NULL ||
>>>>> 3362        connector->edid_corrupt ||
>>>>> 3363        intel_dp->aux.i2c_defer_count > 6) {
>>>>> 3364            /* Check EDID read for NACKs, DEFERs and corruption
>>>>> 3365             * (DP CTS 1.2 Core r1.1)
>>>>> 3366             *    4.2.2.4 : Failed EDID read, I2C_NAK
>>>>> 3367             *    4.2.2.5 : Failed EDID read, I2C_DEFER
>>>>> 3368             *    4.2.2.6 : EDID corruption detected
>>>>> 3369             * Use failsafe mode for all cases
>>>>> 3370             */
>>>>> 3371            if (intel_dp->aux.i2c_nack_count > 0 ||
>>>>> 3372                    intel_dp->aux.i2c_defer_count > 0)
>>>>> 3373                    drm_dbg_kms(&i915->drm,
>>>>> 3374                                "EDID read had %d NACKs, %d
>>>>> DEFERs\n",
>>>>> 3375                                intel_dp->aux.i2c_nack_count,
>>>>> 3376                                intel_dp->aux.i2c_defer_count);
>>>>> 3377            intel_dp->compliance.test_data.edid =
>>>>> INTEL_DP_RESOLUTION_FAILSAFE;
>>>>
>>>
>>> The reason I pointed to this code is to give an example of how other
>>> drivers handle this test-case.
>>>
>>> We added this patch for 4.2.2.1 and 4.2.2.6 EDID test cases.
>>>
>>> The challenge here as found out from our discussion here was to mark a
>>> particular mode as preferred so that the Chrome usermode can pick it.
>>>
>>> Now whats happening with that there was always a possibility of two
>>> modes being marked as preferred due to this and so-on.
>>>
>>> We had a pretty long discussion last night and thought of all possible
>>> solutions but all of them look like a hack to us in the driver because
>>> we end up breaking other things due to this.
>>>
>>> So we decided that driver is not the place to handle this test case.
>>> Since we do have IGT support for chromebooks, we will handle both these
>>> test cases there as other vendors do the same way and it works.
>>>
>>>
>>>> Just because Intel DRM has its own solution for something doesn't mean
>>>> everyone else should copy them and implement their own solution. Up
>>>> until recently DP AUX backlights were baked into different DRM
>>>> drivers. A recent effort was made to pull it out. I think the Intel
>>>> DRM code was the "first one" to the party and it wasn't clear how
>>>> things should be broken up to share with other drivers, so mostly it
>>>> did everything itself, but that's not the long term answer.
>>>>
>>>> I'm not saying that we need to block your change on a full re-design
>>>> or anything, but I'm just saying that:
>>>>
>>>> * You're trying to implement a generic DP rule, not something specific
>>>> to Qualcomm hardware. That implies that, if possible, it shouldn't be
>>>> in a Qualcomm driver.
>>>>
>>>> * It doesn't seem like it would be terrible to handle this in the core.
>>>>
>>>>
>>>>> This marks the fail safe mode and IGT test case reads this to set this
>>>>> mode and hence the test passes.
>>>>>
>>>>> We rely on the chromeOS usermode to output pixel data for this test-case
>>>>> and not IGT. We use IGT only for video pattern CTS today but this is a
>>>>> different test-case which is failing.
>>>>>
>>>>> ChromeOS usermode will not pick 640x480 unless we mark it as preferred
>>>>> or other modes are eliminated.
>>>>>
>>>>> So we have to come up with the right way for the usermode to pick
>>>>> 640x480.
>>>>>
>>>>> We will discuss this a bit more and come up with a different change.
>>>>
>>>> Can you provide the exact EDID from the failing test case? Maybe that
>>>> will help shed some light on what's going on. I looked at the original
>>>> commit and it just referred to 4.2.2.1, which I assume is "EDID Read
>>>> upon HPD Plug Event", but that doesn't give details that seem relevant
>>>> to the discussion here.
>>>
>>> Yes so it is 4.2.2.1 and 4.2.2.6.
>>>
>>> That alone wont give the full picture.
>>>
>>> So its a combination of things.
>>>
>>> While running the test, the test equipment published only one mode.
>>> But we could not support that mode because of 2 lanes.
>>> Equipment did not add 640x480 to the list of modes.
>>> DRM fwk will also not add it because count_modes is not 0 ( there was
>>> one mode ).
>>> So we ended up making these changes.
>>
>> I think a proper solution might be to rewrite
>> drm_helper_probe_single_connector_modes() in the following way:
>> - call get_modes()
>> - validate the result
>> - prune invalid
>>
>> - if the number of modes is 0, call drm_add_override_edid_modes()
>> - validate the result
>> - prune invalid
>>
>> - if the number of modes is still 0, call drm_add_modes_noedid()
>> - validate the result
>> - prune invalid
>>
>> [A separate change might happen here after all the checks: if the number
>> of modes is still 0 and if it is a DP, enforce adding 640x480 even w/o
>> validation. But generally I feel that this shouldn't be necessary
>> because the previous step should have added it.]
>>
>> This way we can be sure that all modes are validated, but still to do
>> our best to add something supported to the list of modes.
> 
> I'm partway through implementing / testing something similar to this.
> ;-) My logic is slightly different than yours, though. In the very
> least I'm not convinced that we want to add the higher resolution
> modes (like 1024x768) if all the modes fail to validate. The DP spec
> only claims 640x480 is always supported. The higher resolution modes
> are for when the EDID fails to read I think. Similarly I'm not
> convinced that we should do pruning before deciding on
> drm_add_override_edid_modes().

Doug, we will certainly evaluate it once you post it.

Thanks

Abhinav


> 
> -Doug
