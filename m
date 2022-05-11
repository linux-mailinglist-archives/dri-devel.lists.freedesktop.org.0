Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F298522816
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 02:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CAB10E3CC;
	Wed, 11 May 2022 00:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC74010E3CC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 00:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652227433; x=1683763433;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZvubhmChOB0UdWqi54/NCESgUwg0bjZLA11k33r/s6M=;
 b=FtcOqngKmW3A0EXfbxUkrBh4Bk4arRSdKkPe9h9gqjm/h5vWMJBC1a8M
 7YJLFJx9HKV/2T7eVsaqTFd2gH+6po6Vwl5ocMtNRaCdQPKn/SK8WN3EA
 Q1A8LqVq6HsIvq00gSsM6Wnqe5IdqDmiAVPfdU5bmirW/O2YyIdnWJJqz s=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 10 May 2022 17:03:52 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 17:03:52 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 10 May 2022 17:03:51 -0700
Received: from [10.38.241.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 10 May
 2022 17:03:48 -0700
Message-ID: <38f0cf5e-2e53-212d-c954-0c26c996ae71@quicinc.com>
Date: Tue, 10 May 2022 17:03:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH] drm/edid: drm_add_modes_noedid() should set lowest
 resolution as preferred
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <20220426132121.RFC.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
 <CAD=FV=XViHtOoQH3fm4yoRcUAkLkf0Wf4zPXUH0Zq5_09tZmjw@mail.gmail.com>
 <874k22lxmh.fsf@intel.com> <8ea03441-b835-f5db-5cc3-85e5330dfe3f@quicinc.com>
 <CAD=FV=UBTEAQD+49xwFM4UdzD2dqQ7WkpNYtO=JRTJwfRWo1Yg@mail.gmail.com>
 <685a547b-175e-68db-a5f6-0e85dacd075a@quicinc.com>
 <CAD=FV=WaY=x8ije6FOsTXBYgOU6j5cCAdZX-pkbAJLYMfhrDqQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAD=FV=WaY=x8ije6FOsTXBYgOU6j5cCAdZX-pkbAJLYMfhrDqQ@mail.gmail.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>, David
 Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug

On 5/10/2022 2:41 PM, Doug Anderson wrote:
> Hi,
> 
> On Tue, May 10, 2022 at 2:33 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Hi Doug
>>
>> On 5/10/2022 1:53 PM, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Fri, May 6, 2022 at 9:33 AM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>> Hi Jani
>>>>
>>>> On 5/6/2022 4:16 AM, Jani Nikula wrote:
>>>>> On Thu, 05 May 2022, Doug Anderson <dianders@chromium.org> wrote:
>>>>>> Ville,
>>>>>>
>>>>>> On Tue, Apr 26, 2022 at 1:21 PM Douglas Anderson <dianders@chromium.org> wrote:
>>>>>>>
>>>>>>> If we're unable to read the EDID for a display because it's corrupt /
>>>>>>> bogus / invalid then we'll add a set of standard modes for the
>>>>>>> display. When userspace looks at these modes it doesn't really have a
>>>>>>> good concept for which mode to pick and it'll likely pick the highest
>>>>>>> resolution one by default. That's probably not ideal because the modes
>>>>>>> were purely guesses on the part of the Linux kernel.
>>>>>>>
>>>>>>> Let's instead set 640x480 as the "preferred" mode when we have no EDID.
>>>>>>>
>>>>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>>>>>> ---
>>>>>>>
>>>>>>>     drivers/gpu/drm/drm_edid.c | 9 +++++++++
>>>>>>>     1 file changed, 9 insertions(+)
>>>>>>
>>>>>> Someone suggested that you might have an opinion on this patch and
>>>>>> another one I posted recently [1]. Do you have any thoughts on it?
>>>>>> Just to be clear: I'm hoping to land _both_ this patch and [1]. If you
>>>>>> don't have an opinion, that's OK too.
>>>>>>
>>>>>> [1] https://lore.kernel.org/r/20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid
>>>>>
>>>>> There are a number of drivers with combos:
>>>>>
>>>>>         drm_add_modes_noedid()
>>>>>         drm_set_preferred_mode()
>>>>>
>>>>> which I think would be affected by the change. Perhaps you should just
>>>>> call drm_set_preferred_mode() in your referenced patch?
>>>
>>> I'm going to do that and I think it works out pretty well. Patch is at:
>>>
>>> https://lore.kernel.org/r/20220510135101.v2.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid
>>>
>>>
>>>> So it seems like many drivers handle the !edid case within their
>>>> respective get_modes() call which probably is because they know the max
>>>> capability of their connector and because they know which mode should be
>>>> set as preferred. But at the same time, perhaps the code below which
>>>> handles the count == 0 case should be changed like below to make sure we
>>>> are within the max_width/height of the connector (to handle the first
>>>> condition)?
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_probe_helper.c
>>>> b/drivers/gpu/drm/drm_probe_helper.c
>>>> index 682359512996..6eb89d90777b 100644
>>>> --- a/drivers/gpu/drm/drm_probe_helper.c
>>>> +++ b/drivers/gpu/drm/drm_probe_helper.c
>>>> @@ -517,7 +517,8 @@ int drm_helper_probe_single_connector_modes(struct
>>>> drm_connector *connector,
>>>>
>>>>            if (count == 0 && (connector->status ==
>>>> connector_status_connected ||
>>>>                               connector->status == connector_status_unknown))
>>>> -               count = drm_add_modes_noedid(connector, 1024, 768);
>>>> +               count = drm_add_modes_noedid(connector,
>>>> connector->dev->mode_config.max_width,
>>>> +                               connector->dev->mode_config.max_height);
>>>>            count += drm_helper_probe_add_cmdline_mode(connector);
>>>>            if (count == 0)
>>>>                    goto prune;
>>>>
>>>>
>>>>> Alternatively, perhaps drm_set_preferred_mode() should erase the
>>>>> previous preferred mode(s) if it finds a matching new preferred mode.
>>>>>
>>>>
>>>> But still yes, even if we change it like above perhaps for other non-DP
>>>> cases its still better to allow individual drivers to pick their
>>>> preferred modes.
>>>>
>>>> If we call drm_set_preferred_mode() in the referenced patch, it will not
>>>> address the no EDID cases because the patch comes into picture when
>>>> there was a EDID with some modes but not with 640x480.
>>>
>>> I'm not sure I understand the above paragraph. I think the "there's an
>>> EDID but no 640x480" is handled by my other patch [1]. Here we're only
>>> worried about the "no EDID" case, right?
>>>
>> Yes, there are two fixes which have been done (OR have to be done).
>>
>> 1) Case when EDID read failed and count of modes was 0.
>>
>> Here the DRM framework was already adding 640x480@60fps. The fix we had
>> to make was making 640x480@60fps as the preferred mode. Which is what
>> your current patch aims at addressing.
>>
>> https://lore.kernel.org/all/20220510135101.v2.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid/
>>
>> So I thought the suggestion which Jani was giving was to call
>> drm_set_preferred_mode() on the referenced patch which was:
>>
>> https://lore.kernel.org/all/20220510131309.v2.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid/
>>
>> So that would not have fixed this case.
>>
>> Perhaps, I misunderstood the patch which was being referenced?
> 
> Ah! I couldn't quite understand what the "referenced patch" meant. I
> assumed that Jani was meaning that we add a call to
> drm_set_preferred_mode() to whatever was calling
> drm_add_modes_noedid().
> 
> 
>> 2) Case where there were other modes, which got filtered out and in the
>> end no modes were left and we had to end up adding 640x480.
>>
>> No need to set the preferred mode in this case as this would have been
>> the only mode in the list ( so becomes preferred by default ).
>>
>> Thats this change
>>
>> https://lore.kernel.org/all/20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid/
>>
>> I agree with combination of these 2 it should work.
> 
> OK, cool. So just to be clear: you're good with both "v2" patches that
> I sent out today and they should fix both use cases, right? ;-)

Yes, I did go through the V2s of both the changes and it should address 
both the use cases.

FWIW, I have acked both of them.

Thanks

Abhinav
> 
> -Doug
