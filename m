Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A410248B8BB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 21:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470D110F4F7;
	Tue, 11 Jan 2022 20:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 555 seconds by postgrey-1.36 at gabe;
 Tue, 11 Jan 2022 20:37:27 UTC
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A1810F4BF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 20:37:27 +0000 (UTC)
Received: from [192.168.0.5] (ip5f5aeb85.dynamic.kabel-deutschland.de
 [95.90.235.133])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id C20C761E5FE02;
 Tue, 11 Jan 2022 21:28:09 +0100 (CET)
Message-ID: <b72ad376-7a42-1ff2-701d-7fb2f3333c64@molgen.mpg.de>
Date: Tue, 11 Jan 2022 21:28:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Unable to unselect VGA_ARB (VGA Arbitration)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Linux folks,


I am using Linux 5.16, and I am unable to unset `VGA_ARB` in Kconfig 
(`make menuconfig`). I have an Asus F2A85-M PRO with an AMD A6-6400K APU 
(integrated Radeon graphics device), so no legacy stuff.

 From `drivers/gpu/vga/Kconfig`:

```
config VGA_ARB
         bool "VGA Arbitration" if EXPERT
         default y
         depends on (PCI && !S390)
         help
           […]

config VGA_ARB_MAX_GPUS
         int "Maximum number of GPUs"
         default 16
         depends on VGA_ARB
         help
           […]

config VGA_SWITCHEROO
         bool "Laptop Hybrid Graphics - GPU switching support"
         depends on X86
         depends on ACPI
         depends on PCI
         depends on (FRAMEBUFFER_CONSOLE=n || FB=y)
         select VGA_ARB
         help
           […]
```

But in `make menuconfig` I am unable to unselect it.

     -*- VGA Arbitration

and the help says:

     Symbol: VGA_ARB [=y]
     Type  : bool
       Depends on: HAS_IOMEM [=y] && PCI [=y] && !S390
       Visible if: HAS_IOMEM [=y] && PCI [=y] && !S390 && EXPERT [=n]
       Location:
         Main menu
          -> Device Drivers
            -> Graphics support
     Selected by [n]:
       - VGA_SWITCHEROO [=n] && HAS_IOMEM [=y] && X86 [=y] && ACPI [=y] 
&& PCI [=y] && (!FRAMEBUFFER_CONSOLE [=y] || FB [=y]=y)

So, VGA_SWITCHEROO is not set, and, therefore, as `Selected by [n]:` 
suggests, I thought I’d be able to deselect it.

It’d be great if you could help me out.


Kind regards,

Paul
