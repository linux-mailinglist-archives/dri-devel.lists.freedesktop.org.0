Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B375BC5D7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 11:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8820C10E5E7;
	Mon, 19 Sep 2022 09:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2672 seconds by postgrey-1.36 at gabe;
 Mon, 19 Sep 2022 09:55:06 UTC
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AF210E5E7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 09:55:06 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1oaCnO-0003pY-UI; Mon, 19 Sep 2022 11:10:30 +0200
Message-ID: <342fadc8-d902-3ada-fd61-67312d0da352@leemhuis.info>
Date: Mon, 19 Sep 2022 11:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: [regression] Bug 216475 - fbcon crashes during single gpu passthough
 reattachment to host
To: Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1663581307;
 e32d291e; 
X-HE-SMSGID: 1oaCnO-0003pY-UI
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
Cc: "Sergey V." <truesmb@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, this is your Linux kernel regression tracker speaking.

I noticed a regression report in bugzilla.kernel.org. As many (most?)
kernel developer don't keep an eye on it, I decided to forward it by
mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216475 :

> Created attachment 301792 [details]
> My dmesg right after VM shutdown
> 
> Hello, after 5.19 kernel many VFIO users have problems with reattaching GPU from guest to host. It works well previously (5.18.16 for me).
> 
> More complains about the issue:
> https://www.reddit.com/r/VFIO/comments/wp85ve/linux_519_kernel_single_gpu_passthough_black/
> 
> My PC Spec:
>   CPU: Ryzen 5950X
>   RAM: 128GB
>   GPU: NVIDIA RTX 3080
>   OS: Arch Linux
> 
> How to reproduce:
>   1. You have to have properly configured VM with working GPU passthough (too complicated to explain it here)
>   2. When VM starts it detaches GPU from host by 'start.sh' (see below)
>   3. VM starts properly, Windows loads properly
>   4. Shutdown VM regularly and GPU should be reattached by 'revert.sh' (see below)
> Actual results (5.19.*):
>   5. Windows shutdowns, and GPU is not reattaching to host only black screen present and monitors shutdown (no signal)
>   5.1 dmesg contains error message - dmesg.txt in attachments
>     WARNING: CPU: 30 PID: 12528 at drivers/video/fbdev/core/fbcon.c:999 fbcon_init+0x5ce/0x670
>     ...
>     BUG: kernel NULL pointer dereference, address: 0000000000000330
> Expected Result (5.18.* and previous):
>   5. Windows shutdowns, and GPU successfully reattached to host
> 
> I have tried to bisect git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git v5.18.16 as good and v5.19.2 as bad
> (I've done it for the first time, maybe I've done something wrong)
> 
> During bisect after some point my Linux doesn't boot, and it trying to mark those commits as bad.
> Commit below might be not real problem causer
> 
> Commit which I found by bisect:
> 
> commit 3647d6d3dbdafc55f8c4ca8225966963252abe7b (refs/bisect/bad)
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> Date:   Tue Apr 5 23:03:33 2022 +0200
> 
>     fbcon: Move more code into fbcon_release
> 
>     con2fb_release_oldinfo() has a bunch more kfree() calls than
>     fbcon_exit(), but since kfree() on NULL is harmless doing that in both
>     places should be ok. This is also a bit more symmetric now again with
>     fbcon_open also allocating the fbcon_ops structure.
> 
>     Acked-by: Sam Ravnborg <sam@ravnborg.org>
>     Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>     Cc: Daniel Vetter <daniel@ffwll.ch>
>     Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>     Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>     Cc: Du Cheng <ducheng2@gmail.com>
>     Cc: Claudio Suarez <cssk@net-c.es>
>     Link: https://patchwork.freedesktop.org/patch/msgid/20220405210335.3434130-16-daniel.vetter@ffwll.ch
> 
> 
> start.sh
> ========
> #!/bin/bash
> set -x
> 
> systemctl stop display-manager.service
> while systemctl is-active --quiet "display-manager.service" ; do
>     sleep 1
> done
> 
> killall gdm-x-session
> killall -u bormor
> 
> echo 0 > /sys/class/vtconsole/vtcon0/bind
> echo 0 > /sys/class/vtconsole/vtcon1/bind
> 
> # Unbind EFI-Framebuffer
> echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind
> 
> # Avoid a Race condition by waiting 2 seconds. This can be calibrated to be shorter or longer if required for your system
> sleep 2
> 
> # Unload all Nvidia drivers
> modprobe -r nvidia_drm
> modprobe -r nvidia_modeset
> modprobe -r nvidia_uvm
> modprobe -r nvidia
> modprobe -r nouveau
> 
> # Unbind the GPU from display driver
> virsh nodedev-detach pci_0000_09_00_0
> virsh nodedev-detach pci_0000_09_00_1
> 
> # Load VFIO Kernel Module  
> modprobe vfio-pci
> 
> 
> revert.sh
> ========
> #!/bin/bash
> set -x
> 
> # Unload VFIO-PCI Kernel Driver
> modprobe -r vfio-pci
> modprobe -r vfio_iommu_type1
> modprobe -r vfio
> 
> virsh nodedev-reattach pci_0000_09_00_1
> virsh nodedev-reattach pci_0000_09_00_0
> 
> echo 1 > /sys/class/vtconsole/vtcon0/bind
> echo 1 > /sys/class/vtconsole/vtcon1/bind
> 
> nvidia-xconfig --query-gpu-info > /dev/null 2>&1
> echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/bind
> 
> modprobe nvidia_drm
> modprobe nvidia_modeset
> modprobe nvidia_uvm
> modprobe nvidia
> modprobe nouveau
> 
> 
> systemctl start display-manager.service

See the ticket for more details.

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: 3647d6d3dbdafc55f8c4ca8225966963252abe7b
https://bugzilla.kernel.org/show_bug.cgi?id=216475
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
