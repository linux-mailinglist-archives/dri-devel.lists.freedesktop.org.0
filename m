Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE25877F52
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 12:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D33A10EDAB;
	Mon, 11 Mar 2024 11:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EN8+LFJY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0E410EDAB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 11:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710157802; x=1741693802;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gmgEPXFyvPSYAQqXRpmzSnJqW78T1VTekFavVyLzNUo=;
 b=EN8+LFJYWp46xokvtBICy59GJY/tgj++g+sjWIwVfodVrpbAOrtQFepY
 nQ4iHNWVMeUvRI+7IivG4h9Ri8mmxPEVPG03b+N5Wsa1R+zaOJWK9bxml
 uX2TWEqnNjBRdewwmv62DoIoCMvHJUdzbH+W4VYNHo8UFlnEGbasm1M/9
 n32P+u1TVywasJKxyUtC2n/qeYQBgLJYzwIoRb6j7s5lQ2fuQaCXnJUsU
 nnIwzKE25a3CC8MAOZIFui9S176OSS+I2LnmmCuVUULFBVZ37UOKqBYrx
 lAHgynunEKn8eUMRlOEZRLsrHw8/6LlVEuSaIZTQqcrtPVsGNhyYdmTSd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="22335455"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="22335455"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 04:50:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="11235880"
Received: from tbeaumon-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.24])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 04:49:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com, kernel test robot
 <lkp@intel.com>
Subject: Re: [PATCH 3/3] drm/panthor: Fix undefined
 panthor_device_suspend/resume symbol issue
In-Reply-To: <20240311124634.2ee63052@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240304090812.3941084-1-boris.brezillon@collabora.com>
 <20240304090812.3941084-4-boris.brezillon@collabora.com>
 <87il1tt4f6.fsf@intel.com> <20240311124634.2ee63052@collabora.com>
Date: Mon, 11 Mar 2024 13:49:56 +0200
Message-ID: <87frwxt2cb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 11 Mar 2024, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> On Mon, 11 Mar 2024 13:05:01 +0200
> Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
>> This breaks the config for me:
>> 
>>   SYNC    include/config/auto.conf.cmd
>>   GEN     Makefile
>> drivers/iommu/Kconfig:14:error: recursive dependency detected!
>> drivers/iommu/Kconfig:14:	symbol IOMMU_SUPPORT is selected by DRM_PANTHOR
>> drivers/gpu/drm/panthor/Kconfig:3:	symbol DRM_PANTHOR depends on PM
>> kernel/power/Kconfig:183:	symbol PM is selected by PM_SLEEP
>> kernel/power/Kconfig:117:	symbol PM_SLEEP depends on HIBERNATE_CALLBACKS
>> kernel/power/Kconfig:35:	symbol HIBERNATE_CALLBACKS is selected by XEN_SAVE_RESTORE
>> arch/x86/xen/Kconfig:67:	symbol XEN_SAVE_RESTORE depends on XEN
>> arch/x86/xen/Kconfig:6:	symbol XEN depends on PARAVIRT
>> arch/x86/Kconfig:781:	symbol PARAVIRT is selected by HYPERV
>> drivers/hv/Kconfig:5:	symbol HYPERV depends on X86_LOCAL_APIC
>> arch/x86/Kconfig:1106:	symbol X86_LOCAL_APIC depends on X86_UP_APIC
>> arch/x86/Kconfig:1081:	symbol X86_UP_APIC prompt is visible depending on PCI_MSI
>> drivers/pci/Kconfig:39:	symbol PCI_MSI is selected by AMD_IOMMU
>> drivers/iommu/amd/Kconfig:3:	symbol AMD_IOMMU depends on IOMMU_SUPPORT
>
> Uh, I guess we want a "depends on IOMMU_SUPPORT" instead of "select
> IOMMU_SUPPORT" in panthor then.

That works for me.

>
>> For a resolution refer to Documentation/kbuild/kconfig-language.rst
>> subsection "Kconfig recursive dependency limitations"

-- 
Jani Nikula, Intel
