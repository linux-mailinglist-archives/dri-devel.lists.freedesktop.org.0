Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C35E18ED57
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 00:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D1F89E3E;
	Sun, 22 Mar 2020 23:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3379F89E3E
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Mar 2020 23:45:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206895] [amdgpu] crash while using opencl from amdgpu-pro on
 kernel 5.5.10
Date: Sun, 22 Mar 2020 23:45:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bigbeeshane@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206895-2300-LR9QJoxRq5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206895-2300@https.bugzilla.kernel.org/>
References: <bug-206895-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206895

--- Comment #6 from bigbeeshane@gmail.com ---
Looks like its more to do with switching from amd-iommmu to dma-iommu (see my
bisect below)

git bisect start
# good: [e87eb585d31fadb5e9e549a1de4b2da60a79bfc9] Merge branch 'pci/misc'
git bisect good e87eb585d31fadb5e9e549a1de4b2da60a79bfc9
# bad: [c3bed3b20e40ab44b98ac5f0471a5bd92a802f5a] Merge tag 'pci-v5.5-changes'
of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci
git bisect bad c3bed3b20e40ab44b98ac5f0471a5bd92a802f5a
# good: [3f1b210a7f97f7e75c56174ada476fba2d36f340] Merge tag 'sound-5.5-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
git bisect good 3f1b210a7f97f7e75c56174ada476fba2d36f340
# skip: [a6ed68d6468bd5a3da78a103344ded1435fed57a] Merge tag
'drm-next-2019-11-27' of git://anongit.freedesktop.org/drm/drm
git bisect skip a6ed68d6468bd5a3da78a103344ded1435fed57a
# skip: [3f86a7e090d1dfb974a9dc9d44049f9bff01e6a5] gpiolib: acpi: Print pin
number on acpi_gpiochip_alloc_event errors
git bisect skip 3f86a7e090d1dfb974a9dc9d44049f9bff01e6a5
# good: [32d1fe8fcb32130733b59fc447e35753dc87fd40] mm/hotplug: reorder
memblock_[free|remove]() calls in try_remove_memory()
git bisect good 32d1fe8fcb32130733b59fc447e35753dc87fd40
# good: [a5255bc31673c72e264d837cd13cd3085d72cb58] Merge tag
'dmaengine-5.5-rc1' of git://git.infradead.org/users/vkoul/slave-dma
git bisect good a5255bc31673c72e264d837cd13cd3085d72cb58
# bad: [9b326948c23908692d7dfe56ed149840d3829eaa] Merge tag 'firewire-update'
of git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394
git bisect bad 9b326948c23908692d7dfe56ed149840d3829eaa
# bad: [937d6eefc716a9071f0e3bada19200de1bb9d048] Merge tag 'docs-5.5a' of
git://git.lwn.net/linux
git bisect bad 937d6eefc716a9071f0e3bada19200de1bb9d048
# good: [a8de1304b7df30e3a14f2a8b9709bb4ff31a0385] libfdt: define INT32_MAX and
UINT32_MAX in libfdt_env.h
git bisect good a8de1304b7df30e3a14f2a8b9709bb4ff31a0385
# good: [bf23a48edbe331f834eb49d1bd6484ae98cf4dc7] Documentation/translation:
Use Korean for Korean translation title
git bisect good bf23a48edbe331f834eb49d1bd6484ae98cf4dc7
# good: [34d1b0895dbd10713c73615d8f532e78509e12d9] iommu/arm-smmu: Remove
duplicate error message
git bisect good 34d1b0895dbd10713c73615d8f532e78509e12d9
# bad: [9b3a713feef8db41d4bcccb3b97e86ee906690c8] Merge branches 'iommu/fixes',
'arm/qcom', 'arm/renesas', 'arm/rockchip', 'arm/mediatek', 'arm/tegra',
'arm/smmu', 'x86/amd', 'x86/vt-d', 'virtio' and 'core' into next
git bisect bad 9b3a713feef8db41d4bcccb3b97e86ee906690c8
# bad: [3c124435e8dd516df4b2fc983f4415386fd6edae] iommu/amd: Support multiple
PCI DMA aliases in IRQ Remapping
git bisect bad 3c124435e8dd516df4b2fc983f4415386fd6edae
# bad: [be62dbf554c5b50718a54a359372c148cd9975c7] iommu/amd: Convert AMD iommu
driver to the dma-iommu api
git bisect bad be62dbf554c5b50718a54a359372c148cd9975c7
# good: [781ca2de89bae1b1d2c96df9ef33e9a324415995] iommu: Add gfp parameter to
iommu_ops::map
git bisect good 781ca2de89bae1b1d2c96df9ef33e9a324415995
# good: [6e2350207f40e24884da262976f7fd4fba387e8a] iommu/dma-iommu: Use the
dev->coherent_dma_mask
git bisect good 6e2350207f40e24884da262976f7fd4fba387e8a
# first bad commit: [be62dbf554c5b50718a54a359372c148cd9975c7] iommu/amd:
Convert AMD iommu driver to the dma-iommu api


I am going to *try* and revert that change and see if if it fixes the issue.
Will also check if the latest 5.6rc has shows the errors

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
