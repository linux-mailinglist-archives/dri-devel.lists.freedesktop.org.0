Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E83854224
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 05:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C910710E2B9;
	Wed, 14 Feb 2024 04:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="dvza0EGk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com
 [95.215.58.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29ABC10E2B9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 04:54:58 +0000 (UTC)
Message-ID: <854345d2-201e-481f-8d6c-e59a788683d5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1707886493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4382P76+Y7tKDUvDdheaaNMjB6c+0ejXl5XBSiHG0io=;
 b=dvza0EGkf4toDKv/2JsRvuJlHsbLqIhVlhRjTndgfvTr4v/W64+oDC2L7gtqTo7Q8iPAwW
 zztKYU1tSd9MqBG9M4MocOkfAdKHzzsX7Ue07CzbrSO2gWBR76gzZcfITNclnNP1dXgpJN
 Aludn9trCW46xmCGzc1JHGjvfbdHu1c=
Date: Wed, 14 Feb 2024 12:54:43 +0800
MIME-Version: 1.0
Subject: Re: [etnaviv-next v13 7/7] drm/etnaviv: Add support for vivante GPU
 cores attached via PCI(e)
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240206172759.421737-1-sui.jingfeng@linux.dev>
 <20240206172759.421737-8-sui.jingfeng@linux.dev>
 <ZcNO9aZwWzyYs-Rv@phenom.ffwll.local>
 <jahydq72bqb27de2ijwwmdjh4ri326mxhfjn5pbvf7cqcpnauq@rw5hjdiroi5d>
 <ZcYGWEG8eqAiqqai@phenom.ffwll.local>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <ZcYGWEG8eqAiqqai@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 2024/2/9 19:02, Daniel Vetter wrote:
> On Thu, Feb 08, 2024 at 04:27:02PM +0100, Maxime Ripard wrote:
>> On Wed, Feb 07, 2024 at 10:35:49AM +0100, Daniel Vetter wrote:
>>> On Wed, Feb 07, 2024 at 01:27:59AM +0800, Sui Jingfeng wrote:
>>>> The component helper functions are the glue, which is used to bind multiple
>>>> GPU cores to a virtual master platform device. Which is fine and works well
>>>> for the SoCs who contains multiple GPU cores.
>>>>
>>>> The problem is that usperspace programs (such as X server and Mesa) will
>>>> search the PCIe device to use if it is exist. In other words, usperspace
>>>> programs open the PCIe device with higher priority. Creating a virtual
>>>> master platform device for PCI(e) GPUs is unnecessary, as the PCI device
>>>> has been created by the time drm/etnaviv is loaded.
>>>>
>>>> we create virtual platform devices as a representation for the vivante GPU
>>>> ip core. As all of subcomponent are attached via the PCIe master device,
>>>> we reflect this hardware layout by binding all of the virtual child to the
>>>> the real master.
>>>>
>>>> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
>>> Uh so my understanding is that drivers really shouldn't create platform
>>> devices of their own. For this case here I think the aux-bus framework is
>>> the right thing to use. Alternatively would be some infrastructure where
>>> you feed a DT tree to driver core or pci subsystem and it instantiates it
>>> all for you correctly, and especially with hotunplug all done right since
>>> this is pci now, not actually part of the soc that cannot be hotunplugged.
>> I don't think we need intermediate platform devices at all. We just need
>> to register our GPU against the PCI device and that's it. We don't need
>> a platform device, we don't need the component framework.
> Afaik that's what this series does. The component stuff is for the
> internal structure of the gpu ip, so that the same modular approach that
> works for arm-soc also works for pci chips.
>
> Otherwise we end up with each driver hand-rolling that stuff, which is
> defacto what both nouveau and amdgpu do (intel hw is too much a mess for
> that component-driver based approach to actually work reasonably well).


Emmm, I spend years to achieve this, and only to find that you have fully
understand my patch within two days.


> Cheers, Sima
>
>>> I think I've seen some other pci devices from arm soc designs that would
>>> benefit from this too, so lifting this logic into a pci function would
>>> make sense imo.


Yes, as you said, we are trying to avoid the hand-rolling stuff.
I guess, extremely advanced drivers(like i915, amdgpu, and nouveau)
won't need this. So I'm not sure if lifting this logic into PCI
core would benefit to other people. While investigating the aux-bus
framework a few days, I find it is not as concise as this one. It
introduce a lot of new structure, I fear that it may cause namespace
pollution if adopt it. So, I thinks I should choose the alternative
way.

While taking a lot from contribution, we are really want to do some
feedback(pay-back). We are happy if there are other users(or new
drivers) would like to adopt this idea, I think, the idea itself
has already been conveyed. Which probably can be seen as a trivial
contribution. Other programmer are free to copy and modify.

But as a initial commit, I minimized the mount of changes  as required
by Locus. meanwhile, I'm willing to following the expectation in the
long term. If there are other users or other problem need to solve,
I would like help to improve and to cooperate to testing in the future.

