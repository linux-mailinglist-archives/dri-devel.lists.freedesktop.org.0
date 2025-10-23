Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A216C00B08
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 13:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEE810E3D3;
	Thu, 23 Oct 2025 11:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="WPP/CtMy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m15589.qiye.163.com (mail-m15589.qiye.163.com
 [101.71.155.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16D310E3CD
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 11:21:37 +0000 (UTC)
Received: from [172.16.12.149] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 26f1c34e0;
 Thu, 23 Oct 2025 19:21:32 +0800 (GMT+08:00)
Message-ID: <9c52db41-14f3-41a8-9423-3efe604361aa@rock-chips.com>
Date: Thu, 23 Oct 2025 19:21:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] usb: typec: Add notifier functions
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
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
 Amit Sunil Dhamne <amitsd@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-2-kernel@airkyi.com> <aPni4AeDaem_rfZH@kuha.fi.intel.com>
 <aPnvoSRJefwDlpNO@kuha.fi.intel.com> <aPn4-S7upPOOtenr@kuha.fi.intel.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aPn4-S7upPOOtenr@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a10cd794c03abkunmb71a32b21958ec
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk0ZS1ZMQklISUMZTxpNSUpWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=WPP/CtMyWjsyonpX6WvCM4hzju69HTiJcibUlL0INhLheBqrQM9p7gBHu5od05BDZ6pM2Ukm7toh6d4/A+Fm6M7Yl0FM6QZa7mJzh7xdQAPZNhD/6oM7QLysGDEz2S54WNzl+ZeotjEgaxczFD8HlruoyNi7HkkWDnqtDTw3R7I=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=Fden5q3cwJAtmjxOzXx/h9BbUz6DpV6vAF7TlM0CQGo=;
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

Hi Heikki,

On 10/23/2025 5:44 PM, Heikki Krogerus wrote:
> On Thu, Oct 23, 2025 at 12:04:44PM +0300, Heikki Krogerus wrote:
>> On Thu, Oct 23, 2025 at 11:10:20AM +0300, Heikki Krogerus wrote:
>>> Hi,
>>>
>>>> diff --git a/include/linux/usb/typec_notify.h b/include/linux/usb/typec_notify.h
>>>> new file mode 100644
>>>> index 000000000000..a3f1f3b3ae47
>>>> --- /dev/null
>>>> +++ b/include/linux/usb/typec_notify.h
>>>> @@ -0,0 +1,17 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +
>>>> +#ifndef __USB_TYPEC_NOTIFY
>>>> +#define __USB_TYPEC_NOTIFY
>>>> +
>>>> +#include <linux/notifier.h>
>>>> +
>>>> +enum usb_typec_event {
>>>> +	TYPEC_ALTMODE_REGISTERED
>>>> +};
>>> Don't you need to know when the altmode is removed?
>> I noticed that you don't because drm_dp_hpd_bridge_register() is
>> always resource managed. But I think you could still send an event
>> also when the altmode is removed already now. That way it does not
>> need to be separately added if and when it is needed.
> Hold on! Every bus has already a notifier chain. That's the one that
> we should also use. Sorry for not noticing that earlier.
>
> So let's just export the bus type in this patch - you can then use
> bus_register_notifier() in your driver:
>
> diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
> index a884cec9ab7e..65ded9e3cdaa 100644
> --- a/drivers/usb/typec/bus.c
> +++ b/drivers/usb/typec/bus.c
> @@ -547,3 +547,4 @@ const struct bus_type typec_bus = {
>          .probe = typec_probe,
>          .remove = typec_remove,
>   };
> +EXPORT_SYMBOL_GPL(typec_bus);
> diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
> index 643b8c81786d..af9edb3db9d0 100644
> --- a/drivers/usb/typec/bus.h
> +++ b/drivers/usb/typec/bus.h
> @@ -5,7 +5,6 @@
>   
>   #include <linux/usb/typec_altmode.h>
>   
> -struct bus_type;
>   struct typec_mux;
>   struct typec_retimer;
>   
> @@ -28,7 +27,6 @@ struct altmode {
>   
>   #define to_altmode(d) container_of(d, struct altmode, adev)
>   
> -extern const struct bus_type typec_bus;
>   extern const struct device_type typec_altmode_dev_type;
>   
>   #define is_typec_altmode(_dev_) (_dev_->type == &typec_altmode_dev_type)
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 309251572e2e..c6fd46902fce 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -20,12 +20,15 @@ struct typec_port;
>   struct typec_altmode_ops;
>   struct typec_cable_ops;
>   
> +struct bus_type;
>   struct fwnode_handle;
>   struct device;
>   
>   struct usb_power_delivery;
>   struct usb_power_delivery_desc;
>   
> +extern const struct bus_type typec_bus;
> +
>   enum typec_port_type {
>          TYPEC_PORT_SRC,
>          TYPEC_PORT_SNK,

Thank you for your detailed explanation. I noticed that there is a device_register() action in typec_register_altmode(), so we can just take advantage of this.


Another thing is that we need to distinguish between different devices in the notifier callback, as typec_register_altmode()/typec_register_partner()/typec_register_plug()/typec_register_cable() may all register devices. Since the data passed in bus_notify() is struct device *dev, I think we can distinguish them through `dev->type.name`? We may already have such names, "typec_alternate_mode", "typec_partner", "typec_plug" in class.c . And then extract these names as macros and put them in the typec header file.


Or do you have any better ideas? Thank you.


> thanks,
>
-- 
Best,
Chaoyi

