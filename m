Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C42B877F59
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 12:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863FD112742;
	Mon, 11 Mar 2024 11:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SooSqzvb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E3E1129CF
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 11:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710158086;
 bh=yr7Ui4tD1di5smcnO9r6jefrAuExlKIglIzo/C+B594=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SooSqzvb/BJgjcN51+iyivWdmbbDv/m9DX3DB3yXUvBcI+Eo/g+kOUESWFqId2YEB
 o9zTdhXpSPIabJOx0uMc5jvb26eGYpl5UGsQVSKIdCJGoxqMSsCzVLG2zpjGki4vIu
 FTqTwmMzqXt1zDZoCv5qKInsng7Qo7MvDd4GVkTs8ifQApxETLa3dthTWolbBBi7Bz
 qwiy0NW1Me5d/YAZ11IffS98i5e+giHZdOzdGJmGO9qvDvjdM5Mv2KVME1MIbNQ+eg
 rN0n6Mt6+O/DuiwUu6zuZhX2ExET1GYegTnC65NXTmF5VV0v8j1UWo64M/fbbdo7a7
 FRnl8lvYiXrHA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4FCE737801C1;
 Mon, 11 Mar 2024 11:54:46 +0000 (UTC)
Date: Mon, 11 Mar 2024 12:54:45 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] Revert "drm/panthor: Fix undefined
 panthor_device_suspend/resume symbol issue"
Message-ID: <20240311125445.4bab1712@collabora.com>
In-Reply-To: <87cys1t299.fsf@intel.com>
References: <20240311111619.249776-1-jani.nikula@intel.com>
 <20240311124826.44cc69ba@collabora.com> <87cys1t299.fsf@intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 11 Mar 2024 13:51:46 +0200
Jani Nikula <jani.nikula@intel.com> wrote:

> On Mon, 11 Mar 2024, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > On Mon, 11 Mar 2024 13:16:19 +0200
> > Jani Nikula <jani.nikula@intel.com> wrote:
> >  
> >> This reverts commit 674dc7f61aefea81901c21402946074927e63f1a.
> >> 
> >> The commit causes a recursive dependency in kconfig:
> >> 
> >> drivers/iommu/Kconfig:14:error: recursive dependency detected!
> >> drivers/iommu/Kconfig:14:	symbol IOMMU_SUPPORT is selected by DRM_PANTHOR
> >> drivers/gpu/drm/panthor/Kconfig:3:	symbol DRM_PANTHOR depends on PM
> >> kernel/power/Kconfig:183:	symbol PM is selected by PM_SLEEP
> >> kernel/power/Kconfig:117:	symbol PM_SLEEP depends on HIBERNATE_CALLBACKS
> >> kernel/power/Kconfig:35:	symbol HIBERNATE_CALLBACKS is selected by XEN_SAVE_RESTORE
> >> arch/x86/xen/Kconfig:67:	symbol XEN_SAVE_RESTORE depends on XEN
> >> arch/x86/xen/Kconfig:6:	symbol XEN depends on PARAVIRT
> >> arch/x86/Kconfig:781:	symbol PARAVIRT is selected by HYPERV
> >> drivers/hv/Kconfig:5:	symbol HYPERV depends on X86_LOCAL_APIC
> >> arch/x86/Kconfig:1106:	symbol X86_LOCAL_APIC depends on X86_UP_APIC
> >> arch/x86/Kconfig:1081:	symbol X86_UP_APIC prompt is visible depending on PCI_MSI
> >> drivers/pci/Kconfig:39:	symbol PCI_MSI is selected by AMD_IOMMU
> >> drivers/iommu/amd/Kconfig:3:	symbol AMD_IOMMU depends on IOMMU_SUPPORT
> >> For a resolution refer to Documentation/kbuild/kconfig-language.rst
> >> subsection "Kconfig recursive dependency limitations"
> >> 
> >> Fixes: 674dc7f61aef ("drm/panthor: Fix undefined panthor_device_suspend/resume symbol issue")
> >> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> >> Cc: Liviu Dudau <liviu.dudau@arm.com>
> >> Cc: Steven Price <steven.price@arm.com>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>  
> >
> > Acked-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> Your suggestion select -> depends on IOMMU_SUPPORT seems to also work,
> at least for me. Want to send a patch for that instead of me merging the
> revert?

I replied on the other thread :-). I think we're better off reverting
the faulty commit, so we can discuss how to fix the original issue
properly without blocking the build.

Thanks;

Boris
