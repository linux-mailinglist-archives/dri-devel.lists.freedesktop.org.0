Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275279165BE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 13:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4312810E05A;
	Tue, 25 Jun 2024 11:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="fANV+9tf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com
 [91.218.175.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B0510E05A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 11:06:28 +0000 (UTC)
X-Envelope-To: uwu@icenowy.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1719313585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4QIrkEOg0q3Qdp/6/fgIyt5BuEczwkBWFON7bt0o2s=;
 b=fANV+9tffaUMKGqnfXF5a2oYI7nJ0P1GXcKgbIPZQ/eXD1L6zb0XSRxVeRNbzG4x+4gvqQ
 YWOQ1kF8w0GbzsDf+0sixem4KRy1WWcdxXNp2GyQL1DN1jYwG937SkBj/Q9qXWgRtZPLk6
 ZOMU3qCbWehW+uS3TcxEkTbdVtbL7i4=
X-Envelope-To: l.stach@pengutronix.de
X-Envelope-To: linux+etnaviv@armlinux.org.uk
X-Envelope-To: christian.gmeiner@gmail.com
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: etnaviv@lists.freedesktop.org
X-Envelope-To: dri-devel@lists.freedesktop.org
Message-ID: <21696f2b-9321-4992-8a05-a4d8bf998e5b@linux.dev>
Date: Tue, 25 Jun 2024 19:06:17 +0800
MIME-Version: 1.0
Subject: Re: [etnaviv-next v14 0/8] drm/etnaviv: Add driver wrapper for
 vivante GPUs attached on PCI(e) device
To: Icenowy Zheng <uwu@icenowy.me>, Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20240519165321.2123356-1-sui.jingfeng@linux.dev>
 <19acb7b11ed22a0a87694b2e74807b82e3b5450e.camel@icenowy.me>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <19acb7b11ed22a0a87694b2e74807b82e3b5450e.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 6/25/24 11:18, Icenowy Zheng wrote:
> 在 2024-05-20星期一的 00:53 +0800，Sui Jingfeng写道：
>> drm/etnaviv use the component framework to bind multiple GPU cores to
>> a
>> virtual master, the virtual master is manually create during driver
>> load
>> time. This works well for various SoCs, yet there are some PCIe card
>> has
>> the vivante GPU cores integrated. The driver lacks the support for
>> PCIe
>> devices currently.
>>
>> Adds PCIe driver wrapper on the top of what drm/etnaviv already has,
>> the
>> component framework is still being used to bind subdevices, even
>> though
>> there is only one GPU core. But the process is going to be reversed,
>> we
>> create virtual platform device for each of the vivante GPU IP core
>> shipped
>> by the PCIe master. The PCIe master is real, bind all the virtual
>> child
>> to the master with component framework.
>>
>>
>> v6:
>>          * Fix build issue on system without CONFIG_PCI enabled
>> v7:
>>          * Add a separate patch for the platform driver rearrangement
>> (Bjorn)
>>          * Switch to runtime check if the GPU is dma coherent or not
>> (Lucas)
>>          * Add ETNAVIV_PARAM_GPU_COHERENT to allow userspace to query
>> (Lucas)
>>          * Remove etnaviv_gpu.no_clk member (Lucas)
>>          * Fix Various typos and coding style fixed (Bjorn)
>> v8:
>>          * Fix typos and remove unnecessary header included (Bjorn).
>>          * Add a dedicated function to create the virtual master
>> platform
>>            device.
>> v9:
>>          * Use PCI_VDEVICE() macro (Bjorn)
>>          * Add trivial stubs for the PCI driver (Bjorn)
>>          * Remove a redundant dev_err() usage (Bjorn)
>>          * Clean up etnaviv_pdev_probe() with
>> etnaviv_of_first_available_node()
>> v10:
>>          * Add one more cleanup patch
>>          * Resolve the conflict with a patch from Rob
>>          * Make the dummy PCI stub inlined
>>          * Print only if the platform is dma-coherrent
>> V11:
>>          * Drop unnecessary changes (Lucas)
>>          * Tweak according to other reviews of v10.
>>
>> V12:
>>          * Create a virtual platform device for the subcomponent GPU
>> cores
>>          * Bind all subordinate GPU cores to the real PCI master via
>> component.
>>
>> V13:
>>          * Drop the non-component code path, always use the component
>> framework
>>            to bind subcomponent GPU core. Even though there is only
>> one core.
>>          * Defer the irq handler register.
>>          * Rebase and improve the commit message
>>
>> V14:
>>          * Rebase onto etnaviv-next and improve commit message.
>>
>> Tested with JD9230P GPU and LingJiu GP102 GPU.
> 
> BTW how should VRAM and displayed related parts be handled on these
> dGPUs?

Emm, I can only say I have no ideas.

Thanks for Christian's tested-by, but I'm a bit worry about if etnaviv
folks really like(or need) this. In the past, we started to contribute
before we know the policy/framework very well. I have to managed to
make things work before knowing the full picture. We developing drivers
in a rather rapid way and rather wild. Sometime, we do it just for fun. 
As the card don't has a usable driver, we want do something and we do
have already learned the framework and knowledge.

But now as we know a bit more, I actually don't intend to brings
concerns to other people. So only first 6 patch (or only part of them)
are requested to be merged, patch 0007 or patch 0008 can just leave it
there to be reviewed a bit longer if something is unsure.

Its totally up to etnaviv folks, I don't mind. Thanks for the nice
project.

-- 
Best regards
Sui
