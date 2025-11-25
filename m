Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44581C83151
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 03:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61EB710E289;
	Tue, 25 Nov 2025 02:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="APsyQcaE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49225.qiye.163.com (mail-m49225.qiye.163.com
 [45.254.49.225])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784C010E289
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 02:23:09 +0000 (UTC)
Received: from [172.16.12.51] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2ac234cab;
 Tue, 25 Nov 2025 10:23:04 +0800 (GMT+08:00)
Message-ID: <c9cb7b79-37c8-4fef-97a6-7d6b8898f9c4@rock-chips.com>
Date: Tue, 25 Nov 2025 10:23:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/11] usb: typec: Add notifier functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chaoyi Chen <kernel@airkyi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251120022343.250-1-kernel@airkyi.com>
 <20251120022343.250-2-kernel@airkyi.com>
 <2025112102-laurel-mulch-58e4@gregkh>
 <462ad1bd-7eec-4f26-b383-96b049e14559@rock-chips.com>
 <2025112402-unopposed-polio-e6e9@gregkh>
 <a80483de-518d-45d5-b46a-9b70cca5b236@rock-chips.com>
 <2025112448-brush-porcupine-c851@gregkh>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <2025112448-brush-porcupine-c851@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ab8d257a503abkunm85208c3c48921c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0hCTVZNQk1CS0tLSU8dTE1WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
 9VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=APsyQcaE+WXuz1ZfmEJ+WZ6W93w9m9gj8aanG9iA1pAa04/ZZ4qUlxWMSBF/y1Kuz0hn22w2GY3XxUdKA4pZgY7iBuHd1G2GGJZ+egD8kodC8sOEYhMBPvftnWjlHJCq2jJ1MeEE5yxsfan4/EAAC32D22P3AEqDF+ZCmqn80RI=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=WyU3dF+cmW7YqGT8mV3RtcRJh2bg16/Cu/kc8VrUlCE=;
 h=date:mime-version:subject:message-id:from;
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

On 11/25/2025 12:33 AM, Greg Kroah-Hartman wrote:
> On Mon, Nov 24, 2025 at 04:05:53PM +0800, Chaoyi Chen wrote:
>> Hi Greg,
>>
>> On 11/24/2025 3:10 PM, Greg Kroah-Hartman wrote:
>>
>>> On Mon, Nov 24, 2025 at 09:40:03AM +0800, Chaoyi Chen wrote:
>>>> Hi Greg,
>>>>
>>>> On 11/21/2025 10:07 PM, Greg Kroah-Hartman wrote:
>>>>> On Thu, Nov 20, 2025 at 10:23:33AM +0800, Chaoyi Chen wrote:
>>>>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>>>
>>>>>> Some other part of kernel may want to know the event of typec bus.
>>>>> Be specific, WHAT part of the kernel will need to know this?
>>>> For now, it is DRM.
>>> Then say this.
>> Okay, please refer to the discussion below.
>>
>>>>> And why a new notifier, why not just use the existing notifiers that you
>>>>> already have?  And what is this going to be used for?
>>>> We have discussed this before, but the current bus notifier cannot achieve the expected notification [0].
>>>>
>>>> [0] https://lore.kernel.org/all/aPsuLREPS_FEV3DS@kuha.fi.intel.com/
>>> Then you need to document the heck out of this in the changelog text.
>>> But I'm still not quite understanding why the bus notifier does not work
>>> here, as you only want this information if the usb device is bound to
>>> the bus there, you do not want to know this if it did not complete.
>>>
>>> That thread says you want this not "too late", but why?  What is the
>>> problem there, and how will you handle your code getting loaded after
>>> the typec code is loaded?  Notifier callbacks don't work for that
>>> situation, right?
>> In fact, the typec_register_altmode() function generates two
>> registered events. The first one is the registered event of the port
>> device, and the second one is the registered event of the partner
>> device. The second one event only occurs after a Type-C device is
>> inserted.
>> The bus notifier event does not actually take effect for the port
>> device, because it only sets the bus for the partner device:
>>
>>      /* The partners are bind to drivers */
>>      if (is_typec_partner(parent))
>>          alt->adev.dev.bus = &typec_bus;
> Setting the bus is correct, then it needs to be registered with the
> driver core so the bus link shows up (and a driver is bound to it.)
> That is when the bus notifier can happen, right?
Yes, this is valid for the partner device. But for the port device, since the bus is not specified here, the corresponding bus notifier will not take effect.

>
>> I hope it's not too late. In fact, the notifier here will notify DRM to establish a bridge chain.
> What is a "bridge chain"?
In DRM, the bridge chain is often used to describe the chain connection relationship
of the output of multi level display conversion chips. The bridge chain we are referring to here
is actually a chain  structure formed by connecting various devices using a simple transparent bridge [0].

For example, the schematic diagram of a bridge chain is as follows:

DP controller bridge -> DP PHY bridge -> onnn,nb7vpq904m retimer bridge -> fsa4480 analog audio switch bridge -> fusb302 HPD bridge

Here, apart from the DP controller bridge, the rest are transparent DRM bridges, which are used solely to
describe the link relationships between various devices.


[0] https://patchwork.freedesktop.org/patch/msgid/20231203114333.1305826-2-dmitry.baryshkov@linaro.org
>
>> The downstream DP controller driver hopes to obtain the fwnode of the last-level Type-C device
>> through this bridge chain to create a DRM connector. And when a device is inserted,
>> drivers/usb/typec/altmodes/displayport.c can notify the HPD (Hot Plug Detect) event.
> But aren't you just the driver for the "partner device"?
>
> If not, why isn't a real device being created that you then bind to,
> what "fake" type of thing are you attempting to do here that would
> require you to do this out-of-band?
The HPD event is pass by drm_connector_oob_hotplug_event(), which does not use the device in Type-C.
This function will find the corresponding DRM connector device, and the lookup of the DRM connector is
done through the fwnode.

And the partner device and the port device have the same fwnode.

>
>> If relying on the second event, the bridge chain may never be established, and the operations of the DP driver will be
>> always deferred. Furthermore, other parts of the display controller driver will also be deferred accordingly.
> What operations?  What exactly is delayed?  You should not be touching a
> device before you have it on your bus, right?
To complete the HPD operation, it is necessary to create a drm connector device that
has the appropriate fwnode. This operation will be carried out by the DP controller driver.

As you can see, since it cross multiple devices, we need to set the fwnode to the last device fusb302.
This requires relying on the bridge chain. We can register bridges for multiple devices and then connect
them to form a chain. The connection process is completed through drm_bridge_attach().

A brief example of the process of establishing a bridge chain is as follows, starting from the last bridge:

step1: fusb302 HPD bridge
step2: fsa4480 analog audio switch bridge -> fusb302 HPD bridge
step3: onnn,nb7vpq904m retimer bridge -> fsa4480 analog audio switch bridge -> fusb302 HPD bridge
step4: DP PHY bridge -> onnn,nb7vpq904m retimer bridge -> fsa4480 analog audio switch bridge -> fusb302 HPD bridge
step5: DP controller bridge -> DP PHY bridge -> onnn,nb7vpq904m retimer bridge -> fsa4480 analog audio switch bridge -> fusb302 HPD bridge

Step 1 is the most crucial, because essentially, regardless of whether we use notifiers or not, what we ultimately want to achieve is to create an HPD bridge.
The DP controller needs to wait for the subsequent bridge chain to be established because it needs to know the connection relationships of the devices.

The question now is when to create the HPD bridge, during the registration of the port device or during the registration of the partner device.
If it's the latter, then the delay occurs here.

And I don't think I'm touching the Type-C device here. I'm just using the bridge chain to get a suitable fwnode and create a suitable DRM connector device.
The subsequent Type-C HPD events will be on the DRM connector device.

This solution is somewhat complex, and I apologize once again for any confusion caused earlier.

>
>>>>> Notifiers are a pain, and should almost never be added.  Use real
>>>>> function calls instead.
>>>> In v6, I used direct function calls, but had to switch to notifiers because couldn't resolve the dependencies between DRM and Type-C [1]. Do you have any good ideas? Thank you.
>>> Only allow this DRM code to be built if typec code is enabled, do NOT
>>> use a select, use a depends in the drm code.
>> Sorry, I didn't get your point. Does this mean that the current notifiers approach still needs to be changed to direct function calls?
> If you somehow convince me that the existing bus notifiers will not
> work, yes :)
>
>> If so, then based on the previous discussion, typec should not depend
>> on any DRM components. Does this mean that we should add the if
>> (IS_REACHABLE(CONFIG_DRM_AUX_BRIDGE)) before the direct function call?
> No, do it properly like any other function call to another subsystem.
>
>> Additionally, the current version of CONFIG_DRM_AUX_BRIDGE is selected
>> by the DP driver in patch9.
> Don't do "select" if at all possible, always try to do "depends on".
Thank you for clarifying this. However, CONFIG_DRM_AUX_BRIDGE is not exposed in the menu, and it is not intended for the end user to select it by design. Therefore, I think there still needs to be some place to select it?

-- 
Best,
Chaoyi


