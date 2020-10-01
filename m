Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F032807D6
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 21:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0142F6E061;
	Thu,  1 Oct 2020 19:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9816E061
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 19:36:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209457] AMDGPU resume fail with RX 580 GPU
Date: Thu, 01 Oct 2020 19:36:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rmuncrief@humanavance.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209457-2300-wQ5wx1m7XQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209457-2300@https.bugzilla.kernel.org/>
References: <bug-209457-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=209457

--- Comment #4 from Robert M. Muncrief (rmuncrief@humanavance.com) ---
You are correct, the restored 5.8.5 dmesg output doesn't have the full output
either, and it's the only other output I can find in my backups. I apologize
for my error.  

Unfortunately I can't remove my VFIO setup for any extended period of time
because I'm working on a project with other musicians that demands I use my
Windows 10 VM daily for software that has no Linux alternative. There is other
almost-equivalent software that could have been used (which I actually prefer)
but the other musicians aren't willing to switch to Linux. In their defense
they did all try quite awhile ago, but it was just to difficult for them, and
their frustration ended up causing anger and contention among our group.  

In any case here's my VFIO passthrough setup:  

/etc/default/grub boot command line:  

GRUB_CMDLINE_LINUX_DEFAULT="quiet loglevel=3 video=efifb:off audit=0
acpi_enforce_resources=lax rd.modules-load=vfio-pci amd_iommu=on iommu=
pt"  


/etc/modprobe.d/kvm.conf:  

options kvm_amd avic=1  


/etc/modprobe.d/vfio.conf:  

options vfio-pci disable_vga=1  
softdep amdgpu pre: vfio-pci  
softdep radeon pre: vfio-pci  
softdep ahci pre: vfio-pci  
softdep xhci_pci pre: vfio-pci  
install vfio-pci /usr/local/bin/vfio-pci-override.sh  


/usr/local/bin/vfio-pci-override.sh  

```
#!/bin/sh

DEVS="0000:0b:00.0 0000:0b:00.1"

if [ ! -z "$(ls -A /sys/class/iommu)" ]; then
    for DEV in $DEVS; do
        echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
    done
fi

modprobe -i vfio-pci
```

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
