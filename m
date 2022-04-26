Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 005AE50EF3E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 05:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F54310E271;
	Tue, 26 Apr 2022 03:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED1C10E041;
 Tue, 26 Apr 2022 03:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650944136; x=1682480136;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QYonx3ubYaWiggUf41EdorM7lx+Lfx71h1aRc3WYJGk=;
 b=zLXloS+nHVMA0tRV0fwpGhhCXYEYF/XORWZLzU7ae79jdk4O+hme64HL
 6Bzv2DeyJkXWeRSUmlXIj8QYWau6vNi98txqJ5nBWgKrd9cT8GvaK9PBh
 F78S7NY0TeGv7psOwfJZkYQJn+4QmuV6OiEaWicXKfjgIwic+mtrnNSEK Y=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Apr 2022 20:35:34 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 20:35:32 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Apr 2022 20:35:31 -0700
Received: from [10.111.165.107] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 25 Apr
 2022 20:35:28 -0700
Message-ID: <d3d1d0d5-d3e0-0777-5b20-cdf24697742d@quicinc.com>
Date: Mon, 25 Apr 2022 20:35:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: move add fail safe mode to
 dp_connector_get_mode()
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com>
 <3b9588d2-d9f6-c96f-b316-953b56b59bfe@linaro.org>
 <73e2a37e-23db-d614-5f5c-8120f1869158@quicinc.com>
 <CAA8EJprjuzUrfwXodgKmbWxgK6t+bY601E_nS7CHNH_+4Tfn5Q@mail.gmail.com>
 <9b331b16-8d1b-4e74-8fee-d74c4041f8d7@quicinc.com>
 <CAD=FV=VxEnbBypNYSq=iTUTwZUs_v620juSA6gsMW4h2_3HyBQ@mail.gmail.com>
 <9b4ccdef-c98a-b907-c7ee-a92456dc5bba@quicinc.com>
 <CAD=FV=U3MJ1W6CCVW0+Si8ZyAD+_ZBYsL1cT6Y8yhcTvWsCLUQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAD=FV=U3MJ1W6CCVW0+Si8ZyAD+_ZBYsL1cT6Y8yhcTvWsCLUQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Aravind
 Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/25/2022 7:18 PM, Doug Anderson wrote:
> Hi,
> 
> On Mon, Apr 25, 2022 at 6:42 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>>> 2) When there was a valid EDID but no 640x480 mode
>>>>
>>>> This is the equipment specific case and the one even I was a bit
>>>> surprised. There is a DP compliance equipment we have in-house and while
>>>> validation, it was found that in its list of modes , it did not have any
>>>> modes which chromebook supported ( due to 2 lanes ). But my
>>>> understanding was that, all sinks should have atleast 640x480 but
>>>> apparently this one did not have that. So to handle this DP compliance
>>>> equipment behavior, we had to do this.
>>>
>>> That doesn't seem right. If there's a valid EDID and the valid EDID
>>> doesn't contain 640x480, are you _sure_ you're supposed to be adding
>>> 640x480? That doesn't sound right to me. I've got a tiny display in
>>> front of me for testing that only has one mode:
>>>
>>>     #0 800x480 65.68 800 840 888 928 480 493 496 525 32000
>>>
>>
>> As I had wrote, DRM core kicks in only when the count of modes is 0.
>> Here what is happening is the count was not 0 but 640x480 was not
>> present in the EDID. So we had to add it explicitly.
>>
>> Your tiny display is a display port display?
>>
>> I am referring to only display port monitors. If your tiny display is
>> DP, it should have had 640x480 in its list of modes.
> 
> My tiny display is actually a HDMI display hooked up to a HDMI to DP
> (active) adapter.
> 
> ...but this is a legal and common thing to have. I suppose possibly my
> HDMI display is "illegal"?
> 
> OK, so reading through the spec more carefully, I do see that the DP
> spec makes numerous mentions of the fact that DP sinks _must_ support
> 640x480. Even going back to DP 1.4, I see section "5.2.1.2 Video
> Timing Format" says that we must support 640x480. It seems like that's
> _intended_ to be used only if the EDID read fails, though or if we
> somehow have to output video without knowledge of the EDID. It seems
> hard to believe that there's a great reason to assume a display will
> support 640x480 if we have more accurate knowledge.
> 
> In any case, I guess I would still say that adding this mode belongs
> in the DRM core. The core should notice that it's a DP connection
> (bridge->type == DRM_MODE_CONNECTOR_DisplayPort) and that 640x480 was
> left out and it should add it. We should also make sure it's not
> "preferred" and is last in the list so we never accidentally pick it.
> If DP truly says that we should always give the user 640x480 then
> that's true for everyone, not just Qualcomm. We should add it in the
> core. If, later, someone wants to hide this from the UI it would be
> much easier if they only needed to modify one place.
> 

So I debugged with kuogee just now using the DP compliance equipment.
It turns out, the issue is not that 640x480 mode is not present.

The issue is that it is not marked as preferred.

Hence we missed this part during debugging this equipment failure.

We still have to figure out the best way to either mark 640x480 as 
preferred or eliminate other modes during the test-case so that 640x480 
is actually picked by usermode.

Now that being said, the fix still doesn't belong in the framework. It 
has to be in the msm/dp code.

Different vendors handle this failure case differently looks like.

Lets take below snippet from i915 as example.

3361 	if (intel_connector->detect_edid == NULL ||
3362 	    connector->edid_corrupt ||
3363 	    intel_dp->aux.i2c_defer_count > 6) {
3364 		/* Check EDID read for NACKs, DEFERs and corruption
3365 		 * (DP CTS 1.2 Core r1.1)
3366 		 *    4.2.2.4 : Failed EDID read, I2C_NAK
3367 		 *    4.2.2.5 : Failed EDID read, I2C_DEFER
3368 		 *    4.2.2.6 : EDID corruption detected
3369 		 * Use failsafe mode for all cases
3370 		 */
3371 		if (intel_dp->aux.i2c_nack_count > 0 ||
3372 			intel_dp->aux.i2c_defer_count > 0)
3373 			drm_dbg_kms(&i915->drm,
3374 				    "EDID read had %d NACKs, %d DEFERs\n",
3375 				    intel_dp->aux.i2c_nack_count,
3376 				    intel_dp->aux.i2c_defer_count);
3377 		intel_dp->compliance.test_data.edid = INTEL_DP_RESOLUTION_FAILSAFE;

This marks the fail safe mode and IGT test case reads this to set this 
mode and hence the test passes.

We rely on the chromeOS usermode to output pixel data for this test-case 
and not IGT. We use IGT only for video pattern CTS today but this is a 
different test-case which is failing.

ChromeOS usermode will not pick 640x480 unless we mark it as preferred 
or other modes are eliminated.

So we have to come up with the right way for the usermode to pick 640x480.

We will discuss this a bit more and come up with a different change.

> 
>>> So IMO we _shouldn't_ land ${SUBJECT} patch.
>>>
>>> Just for testing, I also tried a hack to make EDID reading fail
>>> (return -EIO in the MSM dp_aux_transfer() function if msg->request <
>>> 8). Before ${SUBJECT} patch I'd see these modes:
>>>
>>>     #0 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000
>>>     #1 800x600 60.32 800 840 968 1056 600 601 605 628 40000
>>>     #2 800x600 56.25 800 824 896 1024 600 601 603 625 36000
>>>     #3 848x480 60.00 848 864 976 1088 480 486 494 517 33750
>>>     #4 640x480 59.94 640 656 752 800 480 490 492 525 25175
>>>
>>> ...and after ${SUBJECT} patch I'd see:
>>>
>>>     #0 640x480 59.94 640 656 752 800 480 490 492 525 25175
>>>     #1 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000
>>>     #2 800x600 60.32 800 840 968 1056 600 601 605 628 40000
>>>     #3 800x600 56.25 800 824 896 1024 600 601 603 625 36000
>>>     #4 848x480 60.00 848 864 976 1088 480 486 494 517 33750
>>>
>>> ...so your patch causes 640x480 to be prioritized. That also doesn't
>>> seem ideal. If it was ideal, the DRM core should have listed 640x480
>>> first.
>>
>> So this is a different display or these modes are coming due to the
>> drm_add_modes_noedid() call because of the EDID read fail right?
> 
> Right, it's from the !edid case.
> 
> -Doug
