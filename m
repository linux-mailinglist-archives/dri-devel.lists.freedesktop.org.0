Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 885F4517A31
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 00:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043F810E657;
	Mon,  2 May 2022 22:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F77310E6E5;
 Mon,  2 May 2022 22:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651531775; x=1683067775;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Y2wn3flT+tFdrnHrZ+pTxgWJaDMdWSAtJwHSKiL20DU=;
 b=bnC5H99nn08eWGs9NDPoSIk/m6W0pwNQrEX7C7cn7wo3x118etU+o8sx
 TXSEyNmlkHJvOWnCPK7nIX9lVukcrluprjIOVOFJe30GMT1bGFGRwROzo
 AuppHMwggiXpsYHFyUU2iMWAFcXo3pXe33dWDd2VKp0n9oflh3O1LbMRa 8=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 02 May 2022 15:49:35 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 15:49:18 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 2 May 2022 15:49:18 -0700
Received: from [10.110.10.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 2 May 2022
 15:49:17 -0700
Message-ID: <9e982cdb-3c83-519b-2803-e308da7bc9b2@quicinc.com>
Date: Mon, 2 May 2022 15:49:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 5/5] drm/msm/dp: Implement hpd_notify()
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20220502165316.4167199-1-bjorn.andersson@linaro.org>
 <20220502165316.4167199-6-bjorn.andersson@linaro.org>
 <672e7dac-fe3b-591f-6837-3ce06a0b44c2@quicinc.com> <YnBbNO31bwNUoRQL@ripper>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <YnBbNO31bwNUoRQL@ripper>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/2/2022 3:29 PM, Bjorn Andersson wrote:
> On Mon 02 May 13:59 PDT 2022, Kuogee Hsieh wrote:
>
>> On 5/2/2022 9:53 AM, Bjorn Andersson wrote:
>>> The Qualcomm DisplayPort driver contains traces of the necessary
>>> plumbing to hook up USB HPD, in the form of the dp_hpd module and the
>>> dp_usbpd_cb struct. Use this as basis for implementing the
>>> hpd_notify() callback, by amending the dp_hpd module with the
>>> missing logic.
>>>
>>> Overall the solution is similar to what's done downstream, but upstream
>>> all the code to disect the HPD notification lives on the calling side of
>>> drm_connector_oob_hotplug_event().
>>>
>>> drm_connector_oob_hotplug_event() performs the lookup of the
>>> drm_connector based on fwnode, hence the need to assign the fwnode in
>>> dp_drm_connector_init().
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> ---
>>>
>>> Changes since v3:
>>> - Implements hpd_notify instead of oob_hotplug_event
>>> - Rebased on new cleanup patch from Dmitry
>>> - Set hpd_state to ST_MAINLINK_READY when dp_display_usbpd_configure() succeeds
>>>
>>>    drivers/gpu/drm/msm/dp/dp_display.c | 26 ++++++++++++++++++++++++++
>>>    drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>>    drivers/gpu/drm/msm/dp/dp_drm.c     |  3 +++
>>>    drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
>>>    4 files changed, 32 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>> index b447446d75e9..080294ac6144 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>> @@ -83,6 +83,8 @@ struct dp_display_private {
>>>    	bool hpd_irq_on;
>>>    	bool audio_supported;
>>> +	bool connected;
>>> +
>>>    	struct drm_device *drm_dev;
>>>    	struct platform_device *pdev;
>>>    	struct dentry *root;
>>> @@ -1271,6 +1273,7 @@ static int dp_display_probe(struct platform_device *pdev)
>>>    	if (!desc)
>>>    		return -EINVAL;
>>> +	dp->dp_display.dev = &pdev->dev;
>>>    	dp->pdev = pdev;
>>>    	dp->name = "drm_dp";
>>>    	dp->dp_display.connector_type = desc->connector_type;
>>> @@ -1760,3 +1763,26 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>>>    	dp_display->dp_mode.h_active_low =
>>>    		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
>>>    }
>>> +
>>> +void dp_bridge_hpd_notify(struct drm_bridge *bridge,
>>> +			  enum drm_connector_status status)
>>> +{
>>> +	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
>>> +	struct msm_dp *dp = dp_bridge->dp_display;
>>> +	struct dp_display_private *dp_display = container_of(dp, struct dp_display_private, dp_display);
>>> +	int ret;
>>> +
>>> +	drm_dbg_dp(dp_display->drm_dev, "status: %d connected: %d\n", status, dp_display->connected);
>>> +
>>> +	if (!dp_display->connected && status == connector_status_connected) {
>>> +		dp_display->connected = true;
>>> +		ret = dp_display_usbpd_configure(dp_display);
>>> +		if (!ret)
>>> +			dp_display->hpd_state = ST_MAINLINK_READY;
>>> +	} else if (status != connector_status_connected) {
>>> +		dp_display->connected = false;
>>> +		dp_display_notify_disconnect(dp_display);
>>> +	} else {
>>> +		dp_display_usbpd_attention(dp_display);
>>> +	}
>>> +}
>> I would assume dp_bridge_hpd_notify() will server same purpose as
>> dp_display_irq_handler() if hpd_notification is enabled.
>>
> I agree with this statement.
>
>> In that case, should dp_bridge_hpd_notify() add
>> EV_HPD_PLUG_INT/EV_IRQ_HPD_INT/EV_HPD_UNPLUG_INT
>>
> I tried this originally, but couldn't get it to work and expected that
> as the downstream driver doesn't do this, there was some good reason for
> me not to do it either.
>
>> into event q to kick off corresponding
>> dp_hpd_plug_handle()/dp_irq_hpd_handle()/dp_hpd_unplug_handle()?
>>
> But since then the driver has been cleaned up significantly, so I
> decided to give it a test again.
> Unfortunately it still doesn't work, but now it's easier to trace.
>
> Replacing the 3 cases with relevant calls to dp_add_event() results in
> us inserting a EV_HPD_UNPLUG_INT event really early, before things has
> been brought up. This will result in dp_hpd_unplug_handle() trying to
> disable the dp_catalog_hpd_config_intr(), which will crash as the
> hardware isn't yet clocked up.
>
> Further more, this points out the main difference between the normal HPD
> code and the USB HPD code; dp_catalog_hpd_config_intr() will enable the
> plug/unplug interrupts, which it shouldn't do for USB-controlled.
>
>
> So it seems we need two code paths after all.
>
>> By the way, I am going to test this patch out.
>>
>> Any patches I have to pull in before apply this serial patches?
>>
> The patches applies on Dmitry's msm-next-staging, which I've merged on
> top of linux-next together with a number of pending patches to get the
> DPU up on SM8350 and a pmic_glink driver which I'm about to post.
>
> But to validate that it doesn't affect your non-USB case, Dmitry's
> branch should be sufficient.
>
> Thanks,
> Bjorn

Hi Bjorn,

Which release image you had flashed?

I have ChromeOS-test-R100-14526.69.0-trogdor.tar flashed.

1) Is this will work?

2) how about EC? do I need to upgrade EC image?

Thanks,

kuogee


>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>>> index 4f9fe4d7610b..2d2614bc5a14 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>>> @@ -11,6 +11,7 @@
>>>    #include "disp/msm_disp_snapshot.h"
>>>    struct msm_dp {
>>> +	struct device *dev;
>>>    	struct drm_device *drm_dev;
>>>    	struct device *codec_dev;
>>>    	struct drm_bridge *bridge;
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
>>> index 62d58b9c4647..821cfd37b1fb 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
>>> @@ -68,6 +68,7 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
>>>    	.mode_valid   = dp_bridge_mode_valid,
>>>    	.get_modes    = dp_bridge_get_modes,
>>>    	.detect       = dp_bridge_detect,
>>> +	.hpd_notify   = dp_bridge_hpd_notify,
>>>    };
>>>    struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
>>> @@ -138,6 +139,8 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
>>>    	if (IS_ERR(connector))
>>>    		return connector;
>>> +	connector->fwnode = fwnode_handle_get(dev_fwnode(dp_display->dev));
>>> +
>>>    	drm_connector_attach_encoder(connector, dp_display->encoder);
>>>    	return connector;
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
>>> index f4b1ed1e24f7..3b7480a86844 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
>>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
>>> @@ -32,5 +32,7 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
>>>    void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>>>    			const struct drm_display_mode *mode,
>>>    			const struct drm_display_mode *adjusted_mode);
>>> +void dp_bridge_hpd_notify(struct drm_bridge *bridge,
>>> +			  enum drm_connector_status status);
>>>    #endif /* _DP_DRM_H_ */
