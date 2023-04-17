Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7356E43E3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 11:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E112110E3BB;
	Mon, 17 Apr 2023 09:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2200810E3BB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 09:30:01 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC630DE6;
 Mon, 17 Apr 2023 11:29:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1681723794;
 bh=xv12JksdaegOf7QOwz8FUnWhzC8wp5oJvMWrctaPj6M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EThsE+0RNedHent1+k9F+jJCIzBT1IcR8us4mABoC5eUwz2e4OXih4E5Insp3pidI
 GCsV+NWDhR2dsUmMU2KPt8/K9en2OK3Byqxdlv9NeNbNWOyuJkuiOXOfBr3WqtIfBn
 NNhcIMtzbIBETtyvqsb8AIL+a0tSI/NldQam2gaY=
Message-ID: <a0ea62a8-d319-a06f-52f8-d383dec0f9fc@ideasonboard.com>
Date: Mon, 17 Apr 2023 12:29:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/2] drm: bridge: cdns-mhdp8546: Add support for no-hpd
Content-Language: en-US
To: Jayesh Choudhary <j-choudhary@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230405142440.191939-1-j-choudhary@ti.com>
 <20230405142440.191939-3-j-choudhary@ti.com>
 <20230406015207.GO9915@pendragon.ideasonboard.com>
 <83e146a8-0ba6-d49f-cfa8-68ca7f45bcfe@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <83e146a8-0ba6-d49f-cfa8-68ca7f45bcfe@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org, r-ravikumar@ti.com,
 rfoss@kernel.org, a-bhatia1@ti.com, javierm@redhat.com,
 jernej.skrabec@gmail.com, sjakhade@cadence.com, devicetree@vger.kernel.org,
 tzimmermann@suse.de, jonas@kwiboo.se, jani.nikula@intel.com,
 robh+dt@kernel.org, neil.armstrong@linaro.org, yamonkar@cadence.com,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/04/2023 18:10, Jayesh Choudhary wrote:
> 
> 
> On 06/04/23 07:22, Laurent Pinchart wrote:
>> Hi Jayesh,
>>
>> Thank you for the patch.
>>
>> On Wed, Apr 05, 2023 at 07:54:40PM +0530, Jayesh Choudhary wrote:
>>> From: Rahul T R <r-ravikumar@ti.com>
>>>
>>> In J721S2 EVMs DP0 hpd is not connected to correct
>>> hpd pin on SOC, to handle such cases, Add support for
>>> "no-hpd" property in the device tree node to disable
>>> hpd
>>
>> s/hpd/hpd./
>>
>> You can also reflow the commit message to 72 columns.
> 
> Okay. Thanks for the suggestion. Will do.
> 
>>
>>> Also change the log level for dpcd read failuers to
>>> debug, since framework retries 32 times for each read
>>
>> s/read/read./
>>
>> Doesn't this apply to writes as well ?
> 
> Based on message request, we went into the conditional that uses
> read. So just changing the log-level for dpcd read was enough to
> get rid of the debug logs.
> 
>>
>>> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>>> ---
>>>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 37 ++++++++++++++++---
>>>   .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  1 +
>>>   2 files changed, 33 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c 
>>> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>> index f6822dfa3805..e177794b069d 100644
>>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>> @@ -54,6 +54,8 @@
>>>   #include "cdns-mhdp8546-hdcp.h"
>>>   #include "cdns-mhdp8546-j721e.h"
>>> +static int cdns_mhdp_update_link_status(struct cdns_mhdp_device *mhdp);
>>> +
>>>   static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
>>>   {
>>>       int ret, empty;
>>> @@ -749,7 +751,7 @@ static int cdns_mhdp_fw_activate(const struct 
>>> firmware *fw,
>>>        * MHDP_HW_STOPPED happens only due to driver removal when
>>>        * bridge should already be detached.
>>>        */
>>> -    if (mhdp->bridge_attached)
>>> +    if (mhdp->bridge_attached && !mhdp->no_hpd)
>>>           writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
>>>                  mhdp->regs + CDNS_APB_INT_MASK);
>>> @@ -845,7 +847,7 @@ static ssize_t cdns_mhdp_transfer(struct 
>>> drm_dp_aux *aux,
>>>           ret = cdns_mhdp_dpcd_read(mhdp, msg->address,
>>>                         msg->buffer, msg->size);
>>>           if (ret) {
>>> -            dev_err(mhdp->dev,
>>> +            dev_dbg(mhdp->dev,
>>>                   "Failed to read DPCD addr %u\n",
>>>                   msg->address);

I don't much like this change. Now the write and read paths have 
different log level. This also affects the with-hpd case. And it "hides" 
error prints for "real" errors.

Now, I think it's a valid question whether this function should use 
dev_dbg rather than dev_err (both write and read cases), as dev_err may 
be a bit spammy, and this might perhaps be user triggerable.

If the DP transfer is used for polling I think there should be specific 
handling for that case here. Before the driver polls with DP transfer, 
set a flag, and then in this function skip logging altogether. I don't 
think you want to spam the debug log with DPCD errors either.

>>> @@ -1738,6 +1740,19 @@ static int cdns_mhdp_attach(struct drm_bridge 
>>> *bridge,
>>>       spin_unlock(&mhdp->start_lock);
>>> +    if (mhdp->no_hpd) {
>>> +        ret = wait_event_timeout(mhdp->fw_load_wq,
>>> +                     mhdp->hw_state == MHDP_HW_READY,
>>> +                     msecs_to_jiffies(100));
>>> +        if (ret == 0) {
>>> +            dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n",
>>> +                __func__);
>>> +            return -ETIMEDOUT;
>>> +        }
>>> +
>>> +        cdns_mhdp_update_link_status(mhdp);
>>> +        return 0;
>>> +    }
>>
>> Missing blank line.
>>
>> It's not clear to me while you need to wait for the state to change to
>> MHDP_HW_READY in the no_hpd case. This should be explained in the commit
>> message.

I presume it's because both the firmware loading and bridge attach 
happens asynchronously. With HPD the driver acts only on the interrupt, 
which is enabled only after both have happened. Here the driver waits in 
the attach until everything is ready, and then probes the DP.

But it does feel hacky.

>>>       /* Enable SW event interrupts */
>>>       if (hw_ready)
>>>           writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
>>> @@ -2256,7 +2271,16 @@ static int cdns_mhdp_update_link_status(struct 
>>> cdns_mhdp_device *mhdp)
>>>       mutex_lock(&mhdp->link_mutex);
>>> -    mhdp->plugged = cdns_mhdp_detect_hpd(mhdp, &hpd_pulse);
>>> +    if (mhdp->no_hpd) {
>>> +        ret = drm_dp_dpcd_read_link_status(&mhdp->aux, status);
>>> +        hpd_pulse = false;
>>> +        if (ret < 0)
>>> +            mhdp->plugged = false;
>>> +        else
>>> +            mhdp->plugged = true;
>>
>> I think there's an issue with how the driver uses mhdp->plugged. In the
>> no_hpd case, you try to detect if a display is connected by reading the
>> link status at attach time, and then never update mhdp->plugged. This
>> means that if no display is connected at that point, functions like
>> cdns_mhdp_get_edid() will always fail, even if a display gets plugged
>> later. As the goal of this series is (as far as I understand) support
>> systems where the HPD signal could be connected to a SoC GPIO instead of
>> the bridge, I don't think this is good enough.
> 
> In the driver, I see that this is the only call which changes 
> mhdp->plugged. Do you have any suggestions on how to work on this?
> Polling the value of drm_dp_dpdc_read_link_status does not seem like a
> clean way.
> Here by doing this, we are settling for few functionalities of display.

I think it depends a bit on what you want to support. The HW sounds 
quite broken, as HPD is rather important feature of DP. Did you check 
the DP spec if it has any guidelines on how to handle no HPD case?

You could perhaps say that you only support eDP without HPD on this HW. 
Then the broken HPD doesn't matter.

If you want to support normal DP, I think you have to do some kind of 
polling to make the DP somewhat usable, or a manual detect in certain 
strategic places (probe time, get_edid, get_modes, perhaps?).

Is there anything in the PHY that could inform that something has been 
connected? I remember some HDMI PHYs can tell if something is connected 
to the pins. It's not HPD, but could be used to filter away other, 
slower, polling. Or maybe the mdhp has something to help here.

Also, if you do polling, I don't think you need to go via the 
drm_dp_dpcd_read_link_status. You could first just use 
cdns_mhdp_dpcd_read directly, and if that succeeds, then proceed getting 
more info from the monitor.

  Tomi

