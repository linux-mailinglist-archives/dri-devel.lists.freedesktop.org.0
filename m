Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A617084F991
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 17:26:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E50D10F71B;
	Fri,  9 Feb 2024 16:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ZEwYP/v2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4930210F71E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 16:25:55 +0000 (UTC)
Message-ID: <67936300-7bfb-4f5e-9b80-ee339313fd61@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1707495952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5BnIaHou+tTqerewpAXrAwSWE/7/bxrlz0wZwxMI/Sw=;
 b=ZEwYP/v2JvNMIGJVhm5yoS5MtyVa116To23vi0ejfFBimBywJI6GFlf2xhf3UzuNYoqLsx
 vU+CtMI3OesuzthlpssnEr/k99cyAWBqEFti75zjWWNvRs+LbTjzqaFNlz/MAx76iAgyHu
 UrGshGTP2yI9nWLdtg4il5N1KsmHGgk=
Date: Sat, 10 Feb 2024 00:25:33 +0800
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
 <65qv24hhkmmy4haylh53muvz2xliejysc3uywq44pl3xx7rus4@ynyau4djposv>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <65qv24hhkmmy4haylh53muvz2xliejysc3uywq44pl3xx7rus4@ynyau4djposv>
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

On 2024/2/9 23:15, Maxime Ripard wrote:
> On Fri, Feb 09, 2024 at 12:02:48PM +0100, Daniel Vetter wrote:
>> On Thu, Feb 08, 2024 at 04:27:02PM +0100, Maxime Ripard wrote:
>>> On Wed, Feb 07, 2024 at 10:35:49AM +0100, Daniel Vetter wrote:
>>>> On Wed, Feb 07, 2024 at 01:27:59AM +0800, Sui Jingfeng wrote:
>>>>> The component helper functions are the glue, which is used to bind multiple
>>>>> GPU cores to a virtual master platform device. Which is fine and works well
>>>>> for the SoCs who contains multiple GPU cores.
>>>>>
>>>>> The problem is that usperspace programs (such as X server and Mesa) will
>>>>> search the PCIe device to use if it is exist. In other words, usperspace
>>>>> programs open the PCIe device with higher priority. Creating a virtual
>>>>> master platform device for PCI(e) GPUs is unnecessary, as the PCI device
>>>>> has been created by the time drm/etnaviv is loaded.
>>>>>
>>>>> we create virtual platform devices as a representation for the vivante GPU
>>>>> ip core. As all of subcomponent are attached via the PCIe master device,
>>>>> we reflect this hardware layout by binding all of the virtual child to the
>>>>> the real master.
>>>>>
>>>>> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
>>>> Uh so my understanding is that drivers really shouldn't create platform
>>>> devices of their own. For this case here I think the aux-bus framework is
>>>> the right thing to use. Alternatively would be some infrastructure where
>>>> you feed a DT tree to driver core or pci subsystem and it instantiates it
>>>> all for you correctly, and especially with hotunplug all done right since
>>>> this is pci now, not actually part of the soc that cannot be hotunplugged.
>>> I don't think we need intermediate platform devices at all. We just need
>>> to register our GPU against the PCI device and that's it. We don't need
>>> a platform device, we don't need the component framework.
>> Afaik that's what this series does. The component stuff is for the
>> internal structure of the gpu ip, so that the same modular approach that
>> works for arm-soc also works for pci chips.
> But there should be a single PCI device, while we have multiple "DT"
> devices, right? Or is there several PCI devices too on that PCI card?


There is only a single PCI(e) device on that PCI(e) card, this single
PCI(e) device is selected as the component master. All other Hardware IP
blocks are shipped by the single PCI(e) master. It may includes Display
controllers, GPUs, video decoders, HDMI display bridges hardware unit etc.

But all of those Hardware IP share the same MMIO registers PCI BAR, this
PCI BAR is a kind of PCI(e) MEM resource. It is a relative *big* chunk,
as large as 32MB in address ranges for the JingJia Macro dGPU. Therefore,
I break the whole registers memory(MMIO) resource into smaller pieces by
creating platform device manually, manually created platform device is
called as virtual child in this series.

In short, we cut the whole into smaller piece, each smaller piece is a
single hardware IP block, thus deserve a single device driver. We will
have multiple platform devices if the dGPU contains multiple hardware
IP block. On the driver side, we bind all of the scattered driver module
with component.

Bind with another PCI(e) device is also possible, if it is going to be
used under the same driver. It is just that this will not need us to
create a platform device for it manually. We won't set its parent, they
are siblings then.
  

> Maxime
