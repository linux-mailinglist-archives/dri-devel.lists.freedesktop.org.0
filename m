Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1A24F884B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 22:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0613E10ED16;
	Thu,  7 Apr 2022 20:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F12810E7F6;
 Thu,  7 Apr 2022 20:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649362275; x=1680898275;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6YMixsEVwFVkNKmr3eeWBAfpfNcjRCyqzyw6myiN/Vg=;
 b=o9RPlFOsRekwsWeL7ERJ1FbTuSW92LyzwvtphY9qhp6is8KV2WI7+5PE
 57aAUuTaPVU8ohumM2JapxWVomfBbRcSzeahTlMQzuOaj2N3uOnpv0Bzq
 HCREM6Lxm6uOLgKOl3uO6b4KntxL4exWGt6XAmx+oRPynDm0rdEU0c+Zc Y=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Apr 2022 13:11:13 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 13:11:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 7 Apr 2022 13:11:12 -0700
Received: from [10.111.161.146] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 7 Apr 2022
 13:11:08 -0700
Message-ID: <c4f086ce-c56f-f7c9-4092-7f2432330d50@quicinc.com>
Date: Thu, 7 Apr 2022 13:11:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>, "Sankeerth Billakanti (QUIC)"
 <quic_sbillaka@quicinc.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com>
 <392b933f-760c-3c81-1040-c514045df3da@linaro.org>
 <CAD=FV=W4PYK-t607yjRbfjDjjEZX0KdgHDRukw_vSH8E8EDH6w@mail.gmail.com>
 <CAA8EJppt9XONbgtKfmHmN+==QNqiVJeb8GKJFdZm=yyY-tgmHQ@mail.gmail.com>
 <CAD=FV=U5-sTDLYdkeJWLAOG-0wgxR49VxtwUyUO7z2PuibLGsg@mail.gmail.com>
 <CAA8EJppgfYgQjG8A4LsR-1wmBj3Ku3eO8cKfAYhxjWXL7e3eHg@mail.gmail.com>
 <CAD=FV=V=a1CnT8fqTJR40WoS3BaDQ3xZ=HnHVHqZh=MEmVUZBA@mail.gmail.com>
 <3e5fa57f-d636-879a-b98f-77323d07c156@linaro.org>
 <CAD=FV=Uibu-kZyix7K4_WVc-+C8xpzTqU4WFy7O=6sukMZrX5g@mail.gmail.com>
 <MW4PR02MB7186245772DAC3E04FA8D1C0E1E69@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAD=FV=Wk3U7_bVdiCPp8iQ4bcCA_Botemu4pwHeRtgBa3Xk6KQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAD=FV=Wk3U7_bVdiCPp8iQ4bcCA_Botemu4pwHeRtgBa3Xk6KQ@mail.gmail.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Aravind
 Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug and Dmitry

Sorry, but I caught up on this email just now.

Some comments below.

Thanks

Abhinav
On 4/7/2022 10:07 AM, Doug Anderson wrote:
> Hi,
> 
> On Thu, Apr 7, 2022 at 7:19 AM Sankeerth Billakanti (QUIC)
> <quic_sbillaka@quicinc.com> wrote:
>>
>> Hi Dmitry and Doug,
>>
>>> Hi,
>>>
>>> On Tue, Apr 5, 2022 at 10:36 AM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> On 05/04/2022 20:02, Doug Anderson wrote:
>>>>> Hi,
>>>>>
>>>>> On Tue, Apr 5, 2022 at 5:54 AM Dmitry Baryshkov
>>>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>>>> 3. For DP and eDP HPD means something a little different.
>>>>>>> Essentially there are two concepts: a) is a display physically
>>>>>>> connected and b) is the display powered up and ready. For DP, the
>>>>>>> two are really tied together. From the kernel's point of view you
>>>>>>> never "power down" a DP display and you can't detect that it's
>>>>>>> physically connected until it's ready. Said another way, on you
>>>>>>> tie "is a display there" to the HPD line and the moment a display
>>>>>>> is there it's ready for you to do AUX transfers. For eDP, in the
>>>>>>> lowest power state of a display it _won't_ assert its "HPD"
>>>>>>> signal. However, it's still physically present. For eDP you simply
>>>>>>> have to _assume_ it's present without any actual proof since you
>>>>>>> can't get proof until you power it up. Thus for eDP, you report
>>>>>>> that the display is there as soon as we're asked. We can't _talk_
>>>>>>> to the display yet, though. So in get_modes() we need to be able
>>>>>>> to power the display on enough to talk over the AUX channel to it.
>>>>>>> As part of this, we wait for the signal named "HPD" which really means
>>> "panel finished powering on" in this context.
>>>>>>>
>>>>>>> NOTE: for aux transfer, we don't have the _display_ pipe and
>>>>>>> clocks running. We only have enough stuff running to do the AUX
>>> transfer.
>>>>>>> We're not clocking out pixels. We haven't fully powered on the
>>>>>>> display. The AUX transfer is designed to be something that can be
>>>>>>> done early _before_ you turn on the display.
>>>>>>>
>>>>>>>
>>>>>>> OK, so basically that was a longwinded way of saying: yes, we
>>>>>>> could avoid the AUX transfer in probe, but we can't wait all the
>>>>>>> way to enable. We have to be able to transfer in get_modes(). If
>>>>>>> you think that's helpful I think it'd be a pretty easy patch to
>>>>>>> write even if it would look a tad bit awkward IMO. Let me know if
>>>>>>> you want me to post it up.
>>>>>>
>>>>>> I think it would be a good idea. At least it will allow us to
>>>>>> judge, which is the more correct way.
>>>>>
>>>>> I'm still happy to prototype this, but the more I think about it the
>>>>> more it feels like a workaround for the Qualcomm driver. The eDP
>>>>> panel driver is actually given a pointer to the AUX bus at probe
>>>>> time. It's really weird to say that we can't do a transfer on it
>>>>> yet... As you said, this is a little sideband bus. It should be able
>>>>> to be used without all the full blown infra of the rest of the driver.
>>>>
>>>> Yes, I have that feeling too. However I also have a feeling that just
>>>> powering up the PHY before the bus probe is ... a hack. There are no
>>>> obvious stopgaps for the driver not to power it down later.
>>>

Lets go back to why we need to power up the PHY before the bus probe.

We need to power up PHY before bus probe because panel-eDP tries to read 
the EDID in probe() for the panel_id. Not get_modes().

So doug, I didnt follow your comment that panel-eDP only does EDID read 
in get_modes()

	panel_id = drm_edid_get_panel_id(panel->ddc);
	if (!panel_id) {
		dev_err(dev, "Couldn't identify panel via EDID\n");
		ret = -EIO;
		goto exit;
	}

If we do not need this part, we really dont need to power up the PHY 
before the probe(). The hack which dmitry was referring to.

So this is boiling down to why or how panel-eDP was originally designed.

>>> This is why I think we need to move to Runtime PM to manage this. Basically:
>>>
>>> 1. When an AUX transfer happens, you grab a PM runtime reference that
>>> _that_ powers up the PHY.

This will not be trivial and needs to be scoped out as sankeerth said 
but if the above is the only concern, why do we need to do this? There 
seems to be an explanation why we are doing this and its not a hack.

How would Dmitry's rework address this? We need some RFC to conclude on 
that first.

>>>
>>> 2. At the end of the AUX transfer function, you do a "put_autosuspend".
>>>
>>> Then it becomes not a hack, right?
>>>
>>>
>>
>> pm runtime ops needs to be implemented for both eDP and DP. This change
>> take good amount of planning and code changes as it affects DP also.
>>
>> Because this patch series consist of basic eDP changes for SC7280 bootup,
>> shall we take this pm_runtime implementation in subsequent patch series?
> 
> Dmitry is the real decision maker here, but in my opinion it would be
> OK to get something landed first that worked OK and wasn't taking us
> too far in the wrong direction and then we could get a follow up patch
> to move to pm_runtime.

I would say the discussion changed into a direction of implementing 
pm-runtime because the current patch series does what it takes to adhere 
to panel-eDP's design along with aux bus requirements of PHY needing to 
be on.

So doug, to answer your questions here:

"So I guess the net result is maybe we should just keep it where it is.
Long term I'd be interested in knowing if there's a reason why we
can't structure the driver so that AUX transfers can happen with less
intertwining with the rest of the code, but that can happen later. I
would expect that you'd basically just need clocks and regulators on
and maybe your PHY on."

Yes PHY needs to be absolutely on and configured before aux transfers.

If we want to change that up to stop reading the panel_id in the panel 
probe() and do it later, perhaps some of the changes done here are not 
needed.

It only seems reasonable that we first prototype that in a separate 
patch even a RFC perhaps and take this further as these set of changes 
are needed for basic display functionality on sc7280 chromebooks.

Let us know what are the concerns with doing it in a follow up change.

Thanks

Abhinav
