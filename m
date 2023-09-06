Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD7179343E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 05:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19F710E152;
	Wed,  6 Sep 2023 03:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-213.mta1.migadu.com (out-213.mta1.migadu.com
 [IPv6:2001:41d0:203:375::d5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F39B10E1A1
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 03:52:13 +0000 (UTC)
Message-ID: <a6337007-b6fa-2ce9-d0cd-46465b540205@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693972331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JXh4IcnbpZdjMU5qCoBqZ2FlGW44f3JEdHzsIEyRCYA=;
 b=nxLw4KNzHkXxfO+wrsgAduaff8bs2XSK2nF4XWj3cl8EnKpR5VWhLYatbcqlzrZd6sbq9i
 xK1/QOSVkI2H2UXyB+cbEfr19S5BTfGnTVmuIz7rMlj7lNlG75g6ADcfdGdAjTx+J6MydS
 XmsEJm2tFaeFX4zuiYwyqM4pB+CnJ6E=
Date: Wed, 6 Sep 2023 11:51:59 +0800
MIME-Version: 1.0
Subject: Re: [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user to select
 the primary video adapter at boot time
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <20230905085243.4b22725e.alex.williamson@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20230905085243.4b22725e.alex.williamson@redhat.com>
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/9/5 22:52, Alex Williamson wrote:
> On Tue,  5 Sep 2023 03:57:15 +0800
> Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> On a machine with multiple GPUs, a Linux user has no control over which
>> one is primary at boot time. This series tries to solve above mentioned
>> problem by introduced the ->be_primary() function stub. The specific
>> device drivers can provide an implementation to hook up with this stub by
>> calling the vga_client_register() function.
>>
>> Once the driver bound the device successfully, VGAARB will call back to
>> the device driver. To query if the device drivers want to be primary or
>> not. Device drivers can just pass NULL if have no such needs.
>>
>> Please note that:
>>
>> 1) The ARM64, Loongarch, Mips servers have a lot PCIe slot, and I would
>>     like to mount at least three video cards.
>>
>> 2) Typically, those non-86 machines don't have a good UEFI firmware
>>     support, which doesn't support select primary GPU as firmware stage.
>>     Even on x86, there are old UEFI firmwares which already made undesired
>>     decision for you.
>>
>> 3) This series is attempt to solve the remain problems at the driver level,
>>     while another series[1] of me is target to solve the majority of the
>>     problems at device level.
>>
>> Tested (limited) on x86 with four video card mounted, Intel UHD Graphics
>> 630 is the default boot VGA, successfully override by ast2400 with
>> ast.modeset=10 append at the kernel cmd line.
>>
>> $ lspci | grep VGA
>>
>>   00:02.0 VGA compatible controller: Intel Corporation CoffeeLake-S GT2 [UHD Graphics 630]
> In all my previous experiments with VGA routing and IGD I found that
> IGD can't actually release VGA routing and Intel confirmed the hardware
> doesn't have the ability to do so.

Which model of the IGD you are using? even for the IGD in Atom D2550,
the legacy 128KB VGA memory range can be tuned to be mapped to IGD
or to the DMI Interface. See the 1.7.3.2 section of the N2000 datasheet[1].

If a specific model of Intel has a bug in the VGA routing hardware logic unit,
I would like to ignore it. Or switch to the UEFI firmware on such hardware.

It is the hardware engineer's responsibility, I will not worry about it.
Thanks for you tell this.

[1] https://www.intel.com/content/dam/doc/datasheet/atom-d2000-n2000-vol-2-datasheet.pdf


>   It will always be primary from a
> VGA routing perspective.  Was this actually tested with non-UEFI?


As you already said, the generous Intel already have confirmed that the hardware defect.
So probably this is a good chance to switch to UEFI to solve the problem. Then, no
testing for legacy is needed.


> I suspect it might only work in UEFI mode where we probably don't
> actually have a dependency on VGA routing.  This is essentially why
> vfio requires UEFI ROMs when assigning GPUs to VMs, VGA routing is too
> broken to use on Intel systems with IGD.  Thanks,

Thanks for you tell me this.

To be honest, I have only tested my patch on machines with UEFI firmware.
Since UEFI because the main stream, but if this patch is really useful for
majority machine, I'm satisfied. The results is not too bad.

Thanks.

> Alex
>
