Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904CC4BB067
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 04:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E91F10ECBE;
	Fri, 18 Feb 2022 03:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m176231.qiye.163.com (mail-m176231.qiye.163.com
 [59.111.176.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE7A10EC32
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 03:50:36 +0000 (UTC)
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m176231.qiye.163.com (Hmail) with ESMTPA id 633CD6C013E;
 Fri, 18 Feb 2022 11:50:33 +0800 (CST)
Message-ID: <8c0b1d1e-6787-8edc-c1fd-e1b68b92e60e@rock-chips.com>
Date: Fri, 18 Feb 2022 11:50:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 21/23] drm: rockchip: Add VOP2 driver
Content-Language: en-US
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Sascha Hauer <s.hauer@pengutronix.de>
References: <20220217082954.2967889-1-s.hauer@pengutronix.de>
 <e1eb945b-d7da-f21c-ee19-e19f7f1d9b04@rock-chips.com>
 <20220217135823.GR18637@pengutronix.de> <6072461.kR79ftKOrO@diego>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <6072461.kR79ftKOrO@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUJMTE1WGE1LSUIeSUtKQh
 hNVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWVVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Oio6Ogw4Ez5KHgodEDIwTixO
 Ci9PFApVSlVKTU9OSk5NSUhIQk1DVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBT0NNSjcG
X-HM-Tid: 0a7f0af3f1ddd9a9kuws633cd6c013e
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha:

On 2/17/22 22:06, Heiko Stübner wrote:
> Am Donnerstag, 17. Februar 2022, 14:58:23 CET schrieb Sascha Hauer:
>> Hi Andy,
>>
>> Please trim the context in your answers to the relevant parts, it makes
>> it easier to find the things you said.
>>
>> On Thu, Feb 17, 2022 at 08:00:11PM +0800, Andy Yan wrote:
>>> Hi Sascha:
>>>
>>>> +
>>>> +	drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
>>>> +		struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
>>>> +		struct device_node *node, *parent;
>>>> +
>>>> +		parent = of_get_parent(rkencoder->port);
>>>> +
>>>> +		for_each_endpoint_of_node(parent, node) {
>>> Is there any hurt directly use our downstream vendor kernel method here: use
>>> vcstate->output_if set by encoder driver to get which interface we should
>>> enable here?
>> There is no vcstate->output_if in mainline currently. Ok, we could add
>> that. The other thing is that there are multiple HDMI interfaces and
>> the id of the HDMI encoder is encoded into output_if. Downstream kernel
>> adds OF aliases to the HDMI ports. I didn't want to go that route
>> because it doesn't seem to be very elegant to me.
aliases is a very comm strategy in device tree world.  And your method 
also add need additional dt binds to define RK3568_VOP2_EP_xxx
>>> You method is ok with device tree,  but it tied up this driver to device
>>> tree, we are now tring to extend vop2 driver work with ACPI, so we hope this
>>> driver can be much more flexible.
>> The current rockchip drm driver seems to be pretty much tied to device
>> tree. There are probably many other places that need parallel paths for
>> ACPI support, I think we can delay this particular part until we see the
>> whole picture. In the end we can still retrieve the output_if
>> information differently with ACPI while still retrieving the information
>> from the device tree the way we are doing currently.

The current driver only reference device thee at driver initial, we not 
wrap

device tree related things in other parts, so if we extend it to support 
ACPI,

we just need modify the initial code, this make things easier.

> agreed :-) .
>
> I.e. adding ACPI support for Rockchip drivers separately later on
> makes things way easier.
>
> Having a separate discussion about ACPI changes at that point
> also makes the whole process easier, as adding the whole thing
> here will delay everything even more.


  Heiko: I am not  ask to add new code for future  ACPI support, I just

hope the original downstream method  can keep to make future work easier.

> Also if a later series really only is about adding ACPI support, this
> makes for easier discussion but also easier review of changes.
> The new VOP2 driver is big enough as it is.
>
>
> Heiko
>
>
