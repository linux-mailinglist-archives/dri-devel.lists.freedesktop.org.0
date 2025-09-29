Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6821BA7E29
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 05:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF0910E207;
	Mon, 29 Sep 2025 03:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="UVyf33Fq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m15595.qiye.163.com (mail-m15595.qiye.163.com
 [101.71.155.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CBB10E207
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 03:55:51 +0000 (UTC)
Received: from [172.16.12.153] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 24652f4a9;
 Mon, 29 Sep 2025 11:55:46 +0800 (GMT+08:00)
Message-ID: <42f41be2-9afb-4087-9ce9-1e711df98df8@rock-chips.com>
Date: Mon, 29 Sep 2025 11:55:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-6-kernel@airkyi.com>
 <idyrlzhd5sotg3ylr7vbwmczimglffc75nafxbnhhm3ot2jn4w@ixerm6elfmre>
 <ede70598-c451-4352-ab3e-0e278ce33ad7@rock-chips.com>
 <pwk4ylrxyedq33qivpwy4kly3yx25yjkv75ja3prf5ynxosiez@lb53gculvj3x>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <pwk4ylrxyedq33qivpwy4kly3yx25yjkv75ja3prf5ynxosiez@lb53gculvj3x>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a99939cbbf503abkunmf7f47fbafa8c8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ04fT1YfTkxDGBgYGBhCTx5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=UVyf33FqlputOQa4i79XGybq+AHVBKpYG2XhkZ6ZsqEY+uBjh+doRGcpDIIyihJwJzLoZuBaP8YAxS1iEJ8+T496AL+scaEHMn+JL13fmHgyixWLNleRn15RaeUrcxUFa8lPcxDbkRBf/tFKJtLx0+uQh/Rz1zRor79EWuMmPyI=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=vM6i8BgSabuk/duHJbVX0Gnp95HLl19dL4T224ShB2g=;
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

On 9/29/2025 5:27 AM, Dmitry Baryshkov wrote:

> On Sun, Sep 28, 2025 at 05:52:35PM +0800, Chaoyi Chen wrote:
>> On 9/23/2025 9:50 AM, Dmitry Baryshkov wrote:
>>
>> [...]
>>
>>
>>>> +	/* One endpoint may correspond to one HPD bridge. */
>>>> +	for_each_of_graph_port_endpoint(port, dp_ep) {
>>>> +		/* Try to get "port" node of correspond PHY device */
>>>> +		struct device_node *phy_ep __free(device_node) =
>>>> +			of_graph_get_remote_endpoint(dp_ep);
>>>> +		struct device_node *phy_port __free(device_node) =
>>>> +			of_get_parent(phy_ep);
>>>> +
>>>> +		if (!phy_port) {
>>>> +			continue;
>>>> +		}
>>>> +
>>>> +		/*
>>>> +		 * A PHY port may contain two endpoints: USB connector port or CDN-DP port.
>>>> +		 * Try to find the node of USB connector.
>>> And then there can be a retimer between PHY and the USB-C connector. Or
>>> some signal MUX. Or DP-to-HDMI bridge. Please, don't parse DT for other
>>> devices. Instead you can add drm_aux_bridge to your PHY and let DRM core
>>> build the bridge chain following OF graph.
>>>
>> I think building a bridge chain across multiple drm_aux_hpd_bridge may be difficult. First, drm_dp_hpd_bridge_register() cannot register the bridge immediately; instead, it is deferred until drm_aux_hpd_bridge_probe(). When it is added to the bridge_list, it may not yet be attached, and attempting to attach it at that point is too late.
>>
>> But, if I only use drm_aux_bridge on the USB-C connector, and use my own custom bridge on the PHY device and managing the alloc and attach bridge process myself, then things would become much easier.
> Well... consider a your board, but add onnn,nb7vpq904m retimer between
> the CDP and usb-c connector (it's not an uncommon device nowadays). Or
> add fsa4480 analog audio switch. Build all the drivers as modules. You
> should not need any changes to your drivers to handle such boards and
> such kernel config.
>
> With those devices you can't handle everything inside the DP driver,
> since there are two "streams" of probe events: the DRM bridge needs the
> "next" bridge (in the direction from the SoC to the connector), but the
> USB-C events code needs "previous" mux, switch or retirmer. After some
> trial and error we have ended up with having a chain of drm_aux_bridge
> devices ending up with the drm_aux_hpd_bridge inside the Type-C port
> manager driver. This way the typec_* depetencies are resolved first,
> going from the SoC to the Type-C controller driver then the DRM bridge
> devices probe backwards, creating the chain, which is finally consumer
> by the DP driver inside the SoC.

Sorry, I kept trying to look for the "next bridge" in "drm_hpd_aux_bridge", and I didn't notice that "drm_aux_bridge" already had a similar implementation about "next bridge". Thanks again for your patience.


BTW the devm_drm_of_get_bridge(&auxdev->dev, auxdev->dev.of_node, 0, 0) in drm_aux_bridge cannot be used directly with tcphy->dev. I may need to create a device for the dp-port child node, and then use drm_aux_bridge_register(). But this is no longer a big issue :)

-- 
Best,
Chaoyi

