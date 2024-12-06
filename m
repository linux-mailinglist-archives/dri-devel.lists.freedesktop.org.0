Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1789E6502
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 04:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8818710E050;
	Fri,  6 Dec 2024 03:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="kPHScr15";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m12763.qiye.163.com (mail-m12763.qiye.163.com
 [115.236.127.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED19910E050
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 03:28:26 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 4df43c1a;
 Fri, 6 Dec 2024 11:28:21 +0800 (GMT+08:00)
Message-ID: <c0bc25b7-6e41-4ed8-ae8d-692a908607df@rock-chips.com>
Date: Fri, 6 Dec 2024 11:28:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/10] phy: phy-rockchip-samsung-hdptx: Add support for
 eDP mode
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20241127075157.856029-1-damon.ding@rock-chips.com>
 <2131853.KlZ2vcFHjT@diego>
 <6e1f35c0-5ea8-414f-b3ea-4e7222c605ef@rock-chips.com>
 <2886747.Y6S9NjorxK@diego>
 <h4giob7bcrh7qmtepti6huym2llw4ujfmeff76vrgpahb5zy6x@dz6zghsifww5>
 <2342f342-672c-447e-90d8-674b748af6a4@rock-chips.com>
 <abzu2chif2g3urxoqbm3gbe6cciexbmqvn44qezrx4hgllfkkn@7bzi5jl3stqe>
 <42035ebe-09b7-4005-912a-8ec72d5dabcc@rock-chips.com>
 <5ncdog66jtc4s7vxk2yt4jkknf2es3whvweuqmrxbot3azi5ge@t6s3xadkiasp>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <5ncdog66jtc4s7vxk2yt4jkknf2es3whvweuqmrxbot3azi5ge@t6s3xadkiasp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0JDQlYdSBoZS0sfTx0dTx9WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a939a02e70703a3kunm4df43c1a
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MhQ6GTo4OjIpSgEZKCkWFzww
 FhVPCilVSlVKTEhIT05OTEtITkhNVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJTUtLNwY+
DKIM-Signature: a=rsa-sha256;
 b=kPHScr159WsiJG96Ork6FzwSMNbCQmUyQiTo49UIfTNDjTnurol/onZC7EOZpN8egR0d5Wltmfu4s4A1J2M/lM0yadBTKzrhmL5jyZk8oBUo6Ei1RJqUkOFc+a+RMgvgkwTIS2d4wyBGm1zAptOnnzrxcMoGdC5S+7C9miLNpcc=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=OkOQFcENXzlE05E2GhFQKZHqHer5Jyvf4HzPjb5KtAk=;
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

Hi Sebastian,

On 2024/12/6 2:04, Sebastian Reichel wrote:
> Hello Damon,
> 
> On Thu, Dec 05, 2024 at 09:13:33AM +0800, Damon Ding wrote:
>> Firstly, the term "the HDMI and eDP dynamic switching" can be somewhat
>> misleading, because the eDP usually does not support hot plug. The RK3588
>> eDP is often used as DP, and it actually supports DP 1.2. Therefore, it is
>> better to use the "the HDMI and DP dynamic switching" description.
> 
> The part unclear to me is how the dynamic switching is supposed to
> happen. Looking at the TRM the hotplug detect signals also seem to be
> shared between HDMI and eDP. Can the RK3588S EVB distinguish if HDMI
> or eDP has been plugged, or does this require some user interaction
> to set the right mode?

Indeed, HDMI and eDP share the same pin for hotplug detect. However, 
some users may connect the hotplug detection pin of DP-connector with an 
unexpected pin that can not support the iomux of hotplug detect function 
on RK3588 SoC. This could be due to a flaw in the hardware design, a 
conflict in pin multiplexing, or other factors. Therefore, we support 
the GPIO HDP function for the eDP, as DP also supports this for the same 
reasons.

If the dynamic switching is enabled, HDMI detects the HPD signal through 
  the hotplug detect function pin, while eDP uses one of the available 
GPIO pins to do this.

What's more, if the user connects an HDMI cable first and than connects 
a DP cable as well, despite our clear instruction against using HDMI and 
eDP simultaneously, the status register of GRF will indicate that HDMI 
has been connected. Meanwhile, during the HPD detection process for eDP, 
it will return "connector_status_disconnected". The reverse scenario 
also applies.

> 
>> Indeed, the devm_phy_get(dp->dev, "dp") and devm_of_phy_get_by_index() will
>> help to get the phy reference in .probe() or .bind().
>>
>> However, the phy_set_mode() may be still needed in the HDMI and DP dynamic
>> switching application scenarios. We need the enum phy_mode
>> PHY_MODE_DP/PHY_MODE_HDMI to differentiate the configuration processes in
>> .power_on(), .power_off() and .configure() of struct phy_ops, which will be
>> called in conjunction with plugging in and unplugging an HDMI or DP cable.
> 
> I suppose you could fetch the PHY in power_on() and release it in
> power_off(). But using phy_set_mode() might indeed be better here.
> 

As a future expansion, the .set_mode() can also be helpful in the txffe 
level adjustment for HDMI 2.1. :)

> -- Sebastian

Best regards,
Damon
