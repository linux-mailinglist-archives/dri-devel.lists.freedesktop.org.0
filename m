Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D6E8781D8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 15:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EDED1126F1;
	Mon, 11 Mar 2024 14:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 89AC81127FE
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 14:41:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE1B2FEC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 07:42:22 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A1AC43F762
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 07:41:45 -0700 (PDT)
Date: Mon, 11 Mar 2024 14:41:42 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] Revert "drm/panthor: Fix undefined
 panthor_device_suspend/resume symbol issue"
Message-ID: <Ze8YJhmZgruRfNBo@e110455-lin.cambridge.arm.com>
References: <20240311111619.249776-1-jani.nikula@intel.com>
 <20240311124826.44cc69ba@collabora.com> <87cys1t299.fsf@intel.com>
 <20240311125445.4bab1712@collabora.com> <87a5n5t0mt.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a5n5t0mt.fsf@intel.com>
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

On Mon, Mar 11, 2024 at 02:26:50PM +0200, Jani Nikula wrote:
> On Mon, 11 Mar 2024, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > On Mon, 11 Mar 2024 13:51:46 +0200
> > Jani Nikula <jani.nikula@intel.com> wrote:
> >
> >> On Mon, 11 Mar 2024, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >> > On Mon, 11 Mar 2024 13:16:19 +0200
> >> > Jani Nikula <jani.nikula@intel.com> wrote:
> >> >  
> >> >> This reverts commit 674dc7f61aefea81901c21402946074927e63f1a.
> >> >> 
> >> >> The commit causes a recursive dependency in kconfig:
> >> >> 
> >> >> drivers/iommu/Kconfig:14:error: recursive dependency detected!
> >> >> drivers/iommu/Kconfig:14:	symbol IOMMU_SUPPORT is selected by DRM_PANTHOR
> >> >> drivers/gpu/drm/panthor/Kconfig:3:	symbol DRM_PANTHOR depends on PM
> >> >> kernel/power/Kconfig:183:	symbol PM is selected by PM_SLEEP
> >> >> kernel/power/Kconfig:117:	symbol PM_SLEEP depends on HIBERNATE_CALLBACKS
> >> >> kernel/power/Kconfig:35:	symbol HIBERNATE_CALLBACKS is selected by XEN_SAVE_RESTORE
> >> >> arch/x86/xen/Kconfig:67:	symbol XEN_SAVE_RESTORE depends on XEN
> >> >> arch/x86/xen/Kconfig:6:	symbol XEN depends on PARAVIRT
> >> >> arch/x86/Kconfig:781:	symbol PARAVIRT is selected by HYPERV
> >> >> drivers/hv/Kconfig:5:	symbol HYPERV depends on X86_LOCAL_APIC
> >> >> arch/x86/Kconfig:1106:	symbol X86_LOCAL_APIC depends on X86_UP_APIC
> >> >> arch/x86/Kconfig:1081:	symbol X86_UP_APIC prompt is visible depending on PCI_MSI
> >> >> drivers/pci/Kconfig:39:	symbol PCI_MSI is selected by AMD_IOMMU
> >> >> drivers/iommu/amd/Kconfig:3:	symbol AMD_IOMMU depends on IOMMU_SUPPORT
> >> >> For a resolution refer to Documentation/kbuild/kconfig-language.rst
> >> >> subsection "Kconfig recursive dependency limitations"
> >> >> 
> >> >> Fixes: 674dc7f61aef ("drm/panthor: Fix undefined panthor_device_suspend/resume symbol issue")
> >> >> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> >> >> Cc: Liviu Dudau <liviu.dudau@arm.com>
> >> >> Cc: Steven Price <steven.price@arm.com>
> >> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>  
> >> >
> >> > Acked-by: Boris Brezillon <boris.brezillon@collabora.com>  
> >> 
> >> Your suggestion select -> depends on IOMMU_SUPPORT seems to also work,
> >> at least for me. Want to send a patch for that instead of me merging the
> >> revert?
> >
> > I replied on the other thread :-). I think we're better off reverting
> > the faulty commit, so we can discuss how to fix the original issue
> > properly without blocking the build.
> 
> Thanks, pushed to drm-misc-next.

So with this revert we're OK with an undefined symbol if !CONFIG_PM, but we're not happy
with a recursive dependency that is only triggered for COMPILE_TEST? I would've thought
IOMMU_SUPPORT options is a better one.

Best regards,
Liviu

> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
