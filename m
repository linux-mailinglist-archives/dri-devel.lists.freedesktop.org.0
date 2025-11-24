Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F25C7F51C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 09:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8175410E1D6;
	Mon, 24 Nov 2025 08:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="KJvSMQWn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49214.qiye.163.com (mail-m49214.qiye.163.com
 [45.254.49.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201C310E1D6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 08:05:59 +0000 (UTC)
Received: from [172.16.12.51] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2aa88f2fe;
 Mon, 24 Nov 2025 16:05:54 +0800 (GMT+08:00)
Message-ID: <a80483de-518d-45d5-b46a-9b70cca5b236@rock-chips.com>
Date: Mon, 24 Nov 2025 16:05:53 +0800
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
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <2025112402-unopposed-polio-e6e9@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ab4e5daa803abkunma55763e93ea70d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkxISlZNSktCGh9IGkoaTk9WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
 5VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=KJvSMQWnhpc4p7xme6emDFe2++rK44pn+ANOLRzg5kiLyjx+/4+yFvS6QcBrrxdhALgpyzrKiSpzwKvymkjs34dszmAkArFI9nKrFKxGwSzH8jEZmbae68cvtp3xcYfv9VmIj6xu/V65TudwLH2r6q/J/2emA/s0k+m7iBbXtjc=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=Dm0AUIAI3rBdsSDVXq01oojJAQeP5JCEx7XZOEM8cDU=;
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

Hi Greg,

On 11/24/2025 3:10 PM, Greg Kroah-Hartman wrote:

> On Mon, Nov 24, 2025 at 09:40:03AM +0800, Chaoyi Chen wrote:
>> Hi Greg,
>>
>> On 11/21/2025 10:07 PM, Greg Kroah-Hartman wrote:
>>> On Thu, Nov 20, 2025 at 10:23:33AM +0800, Chaoyi Chen wrote:
>>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>
>>>> Some other part of kernel may want to know the event of typec bus.
>>> Be specific, WHAT part of the kernel will need to know this?
>> For now, it is DRM.
> Then say this.

Okay, please refer to the discussion below.

>
>>> And why a new notifier, why not just use the existing notifiers that you
>>> already have?  And what is this going to be used for?
>> We have discussed this before, but the current bus notifier cannot achieve the expected notification [0].
>>
>> [0] https://lore.kernel.org/all/aPsuLREPS_FEV3DS@kuha.fi.intel.com/
> Then you need to document the heck out of this in the changelog text.
> But I'm still not quite understanding why the bus notifier does not work
> here, as you only want this information if the usb device is bound to
> the bus there, you do not want to know this if it did not complete.
>
> That thread says you want this not "too late", but why?  What is the
> problem there, and how will you handle your code getting loaded after
> the typec code is loaded?  Notifier callbacks don't work for that
> situation, right?

In fact, the typec_register_altmode() function generates two registered events. The first one is the registered event of the port device,

and the second one is the registered event of the partner device. The second one event only occurs after a Type-C device is inserted.

The bus notifier event does not actually take effect for the port device, because it only sets the bus for the partner device:

     /* The partners are bind to drivers */
     if (is_typec_partner(parent))
         alt->adev.dev.bus = &typec_bus;


I hope it's not too late. In fact, the notifier here will notify DRM to establish a bridge chain.

The downstream DP controller driver hopes to obtain the fwnode of the last-level Type-C device

through this bridge chain to create a DRM connector. And when a device is inserted,

drivers/usb/typec/altmodes/displayport.c can notify the HPD (Hot Plug Detect) event.

If relying on the second event, the bridge chain may never be established, and the operations of the DP driver will be

always deferred. Furthermore, other parts of the display controller driver will also be deferred accordingly.

>
>>> Notifiers are a pain, and should almost never be added.  Use real
>>> function calls instead.
>> In v6, I used direct function calls, but had to switch to notifiers because couldn't resolve the dependencies between DRM and Type-C [1]. Do you have any good ideas? Thank you.
> Only allow this DRM code to be built if typec code is enabled, do NOT
> use a select, use a depends in the drm code.

Sorry, I didn't get your point. Does this mean that the current notifiers approach still needs to be changed to direct function calls?

If so, then based on the previous discussion, typec should not depend on any DRM components. Does this mean that we should add the if (IS_REACHABLE(CONFIG_DRM_AUX_BRIDGE)) before the direct function call?

Additionally, the current version of CONFIG_DRM_AUX_BRIDGE is selected by the DP driver in patch9.

-- 
Best,
Chaoyi

