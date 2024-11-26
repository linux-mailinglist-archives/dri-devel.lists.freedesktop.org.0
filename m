Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7479D91D3
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 07:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8008B10E7A6;
	Tue, 26 Nov 2024 06:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CWhSCSKM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7619E10E7A6;
 Tue, 26 Nov 2024 06:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732603147; x=1764139147;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eurZl2qKDVhWbDHKbXKFHTQAbup43NtVInM08lSeDEw=;
 b=CWhSCSKMb671UzZn4Kbb4cqAiTT8FVBz4lSJt03kPDOKaOkn7uQzf/HI
 GkkCyhuw/KsqU5+T4dByYhy31YpOUvZbXGD9jcdldjAFT59am0IjqNfvD
 A/yNcbtultjkZwetM/xSiqLk9huVZ+DPsVqIjHnm4pr/ypLcnpsUKDueR
 5v6+5Mewpf6gCGuJI9jEsx8nWG4VPNkgWxyevjxDyHRVgkkEyFJW3RX8c
 G4gfZMeHPftfgew2759zCJJW8e5ATpA2L7wEFmk2YMoxPDljwaeCjmT7P
 mo7ibz3WsieExSdcvsBGV+wPyKlDafw1CFmvSYCvGubV7uf8Uy4gYF7fp g==;
X-CSE-ConnectionGUID: WPkn9g7TQOW6EbXdXz8N5g==
X-CSE-MsgGUID: goP043HAQ9OSldbgke2jog==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32899875"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="32899875"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 22:39:07 -0800
X-CSE-ConnectionGUID: GliIqcauRCmuGDNY2yVkvQ==
X-CSE-MsgGUID: GHeiEYqiTpeqajbIDFiC1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="91922218"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 22:39:03 -0800
Date: Tue, 26 Nov 2024 08:38:59 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v9 1/4] drm: Introduce device wedged event
Message-ID: <Z0VtA5o2cW_snZbf@black.fi.intel.com>
References: <20241115050733.806934-1-raag.jadav@intel.com>
 <20241115050733.806934-2-raag.jadav@intel.com>
 <8c7292c3-8459-4ddc-a899-b56b1d93076f@linux.intel.com>
 <Z0Atv3Zw1d0N8hvv@black.fi.intel.com>
 <3644d364-6021-46fe-b3a2-689821551984@amd.com>
 <Z0CrJ3C3wJqtySLp@black.fi.intel.com>
 <1018930b-98cc-432a-a4fe-6898ffa51d29@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1018930b-98cc-432a-a4fe-6898ffa51d29@amd.com>
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

On Mon, Nov 25, 2024 at 10:32:42AM +0100, Christian König wrote:
> Am 22.11.24 um 17:02 schrieb Raag Jadav:
> > On Fri, Nov 22, 2024 at 11:09:32AM +0100, Christian König wrote:
> > > Am 22.11.24 um 08:07 schrieb Raag Jadav:
> > > > On Mon, Nov 18, 2024 at 08:26:37PM +0530, Aravind Iddamsetty wrote:
> > > > > On 15/11/24 10:37, Raag Jadav wrote:
> > > > > > Introduce device wedged event, which notifies userspace of 'wedged'
> > > > > > (hanged/unusable) state of the DRM device through a uevent. This is
> > > > > > useful especially in cases where the device is no longer operating as
> > > > > > expected and has become unrecoverable from driver context. Purpose of
> > > > > > this implementation is to provide drivers a generic way to recover with
> > > > > > the help of userspace intervention without taking any drastic measures
> > > > > > in the driver.
> > > > > > 
> > > > > > A 'wedged' device is basically a dead device that needs attention. The
> > > > > > uevent is the notification that is sent to userspace along with a hint
> > > > > > about what could possibly be attempted to recover the device and bring
> > > > > > it back to usable state. Different drivers may have different ideas of
> > > > > > a 'wedged' device depending on their hardware implementation, and hence
> > > > > > the vendor agnostic nature of the event. It is up to the drivers to
> > > > > > decide when they see the need for recovery and how they want to recover
> > > > > > from the available methods.
> > > > > > 
> > > > > > Prerequisites
> > > > > > -------------
> > > > > > 
> > > > > > The driver, before opting for recovery, needs to make sure that the
> > > > > > 'wedged' device doesn't harm the system as a whole by taking care of the
> > > > > > prerequisites. Necessary actions must include disabling DMA to system
> > > > > > memory as well as any communication channels with other devices. Further,
> > > > > > the driver must ensure that all dma_fences are signalled and any device
> > > > > > state that the core kernel might depend on are cleaned up. Once the event
> > > > > > is sent, the device must be kept in 'wedged' state until the recovery is
> > > > > > performed. New accesses to the device (IOCTLs) should be blocked,
> > > > > > preferably with an error code that resembles the type of failure the
> > > > > > device has encountered. This will signify the reason for wegeding which
> > > > > > can be reported to the application if needed.
> > > > > should we even drop the mmaps we created?
> > > > Whatever is required for a clean recovery, yes.
> > > > 
> > > > Although how would this play out? Do we risk loosing display?
> > > > Or any other possible side-effects?
> > > Before sending a wedge event all DMA transfers of the device have to be
> > > blocked.
> > > 
> > > So yes, all display, mmap() and file descriptor connections you had with the
> > > device would need to be re-created.
> > Does it mean we'd have to rely on userspace to unmap()?
> 
> Yes and no :)
> 
> The handling should be similar to how hotplug is handled. E.g. the device
> becomes inaccessible by normal applications all mappings become invalid.

Isn't that just unbind (which is already part of recovery)?

> But we don't send a SIGBUS or similar on access, instead all mappings
> redirected to a dummy page which basically shallows all writes and gives
> undefined data on reads.
> 
> On IOCTLs the applications should get an error code and eventually restart
> or at least unmap all their mappings.

Thanks for the detailed explanation.

Rethinking about this, the criteria set for prerequisites is to not do
anything that could possibly harm the system. So I think the important
question is,

with fences signalled and ioctls already blocked, is live mmap on a wedged
device capable of producing harmful behaviour or unintended side-effects
(atleast until the application has the opportunity to unmap() as part of
recovery)?

Raag
