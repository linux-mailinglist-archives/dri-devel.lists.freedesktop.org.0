Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 210B6879CF1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 21:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0723810E7A0;
	Tue, 12 Mar 2024 20:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gjeu+zww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E2210E7A0;
 Tue, 12 Mar 2024 20:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710275672; x=1741811672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IIyA24Ww4q+YFVBHrpK9di1rGUh6VhtHOSecH2SUB/w=;
 b=Gjeu+zww5ZbYlWuLNGrvUU8IHlDX/qrPmrZOslXzbgVAGet6QIzkKAj/
 1FIZndaMa7y6QPhgnpt8D1paAFFEiPm87yIJAPFjuSH6+Pmj6TQQDA9we
 dldrNFDmjH29W/HOEiR3l5DuHImx/G4erUin8UX5mceCftEB1UUOEoHUI
 OvlFeOExEJlt1x+u6GiDPjpvHG2dovSZEFHT9UJqcy4CPeyrUZeazngGe
 Rh3Ynff5FMipyUw9pg+5OE63PGn+HV6tMrKQ1r/2yZgSUd1hlpnHZav4+
 C2t2cmUwI1WQ0Cl7v1TYORxuufIlAET9cKKfN531nQpXy0VoqOTvyhZOA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4861597"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4861597"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 13:34:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11562599"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.6.110])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 13:34:28 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, Guenter Roeck <linux@roeck-us.net>,
 Dale B Stimson <dale.b.stimson@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v2] drm/i915/hwmon: Fix locking inversion in sysfs getter
Date: Tue, 12 Mar 2024 21:34:25 +0100
Message-ID: <1841305.FMhQkTaH9n@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <85zfv35set.wl-ashutosh.dixit@intel.com>
References: <20240311203500.518675-2-janusz.krzysztofik@linux.intel.com>
 <85zfv35set.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi Ashutosh,

On Tuesday, 12 March 2024 17:25:14 CET Dixit, Ashutosh wrote:
> On Mon, 11 Mar 2024 13:34:58 -0700, Janusz Krzysztofik wrote:
> >
> > In i915 hwmon sysfs getter path we now take a hwmon_lock, then acquire an
> > rpm wakeref.  That results in lock inversion:
> >
> > <4> [197.079335] ======================================================
> > <4> [197.085473] WARNING: possible circular locking dependency detected
> > <4> [197.091611] 6.8.0-rc7-Patchwork_129026v7-gc4dc92fb1152+ #1 Not tainted
> > <4> [197.098096] ------------------------------------------------------
> > <4> [197.104231] prometheus-node/839 is trying to acquire lock:
> > <4> [197.109680] ffffffff82764d80 (fs_reclaim){+.+.}-{0:0}, at: __kmalloc+0x9a/0x350
> > <4> [197.116939]
> > but task is already holding lock:
> > <4> [197.122730] ffff88811b772a40 (&hwmon->hwmon_lock){+.+.}-{3:3}, at: hwm_energy+0x4b/0x100 [i915]
> > <4> [197.131543]
> > which lock already depends on the new lock.
> > ...
> > <4> [197.507922] Chain exists of:
> >   fs_reclaim --> &gt->reset.mutex --> &hwmon->hwmon_lock
> > <4> [197.518528]  Possible unsafe locking scenario:
> > <4> [197.524411]        CPU0                    CPU1
> > <4> [197.528916]        ----                    ----
> > <4> [197.533418]   lock(&hwmon->hwmon_lock);
> > <4> [197.537237]                                lock(&gt->reset.mutex);
> > <4> [197.543376]                                lock(&hwmon->hwmon_lock);
> > <4> [197.549682]   lock(fs_reclaim);
> > ...
> > <4> [197.632548] Call Trace:
> > <4> [197.634990]  <TASK>
> > <4> [197.637088]  dump_stack_lvl+0x64/0xb0
> > <4> [197.640738]  check_noncircular+0x15e/0x180
> > <4> [197.652968]  check_prev_add+0xe9/0xce0
> > <4> [197.656705]  __lock_acquire+0x179f/0x2300
> > <4> [197.660694]  lock_acquire+0xd8/0x2d0
> > <4> [197.673009]  fs_reclaim_acquire+0xa1/0xd0
> > <4> [197.680478]  __kmalloc+0x9a/0x350
> > <4> [197.689063]  acpi_ns_internalize_name.part.0+0x4a/0xb0
> > <4> [197.694170]  acpi_ns_get_node_unlocked+0x60/0xf0
> > <4> [197.720608]  acpi_ns_get_node+0x3b/0x60
> > <4> [197.724428]  acpi_get_handle+0x57/0xb0
> > <4> [197.728164]  acpi_has_method+0x20/0x50
> > <4> [197.731896]  acpi_pci_set_power_state+0x43/0x120
> > <4> [197.736485]  pci_power_up+0x24/0x1c0
> > <4> [197.740047]  pci_pm_default_resume_early+0x9/0x30
> > <4> [197.744725]  pci_pm_runtime_resume+0x2d/0x90
> > <4> [197.753911]  __rpm_callback+0x3c/0x110
> > <4> [197.762586]  rpm_callback+0x58/0x70
> > <4> [197.766064]  rpm_resume+0x51e/0x730
> > <4> [197.769542]  rpm_resume+0x267/0x730
> > <4> [197.773020]  rpm_resume+0x267/0x730
> > <4> [197.776498]  rpm_resume+0x267/0x730
> > <4> [197.779974]  __pm_runtime_resume+0x49/0x90
> > <4> [197.784055]  __intel_runtime_pm_get+0x19/0xa0 [i915]
> > <4> [197.789070]  hwm_energy+0x55/0x100 [i915]
> > <4> [197.793183]  hwm_read+0x9a/0x310 [i915]
> > <4> [197.797124]  hwmon_attr_show+0x36/0x120
> > <4> [197.800946]  dev_attr_show+0x15/0x60
> > <4> [197.804509]  sysfs_kf_seq_show+0xb5/0x100
> >
> > Acquire the wakeref before the lock and hold it as long as the lock is
> > also held.  Follow that pattern across the whole source file where similar
> > lock inversion can happen.
> >
> > v2: Keep hardware read under the lock so the whole operation of updating
> >     energy from hardware is still atomic (Guenter),
> >   - instead, acquire the rpm wakeref before the lock and hold it as long
> >     as the lock is held,
> >   - use the same aproach for other similar places across the i915_hwmon.c
> >     source file (Rodrigo).
> >
> > Fixes: c41b8bdcc297 ("drm/i915/hwmon: Show device level energy usage")
> 
> I would think that the lock inversion issue was introduced here:
> 
> 1b44019a93e2 ("drm/i915/guc: Disable PL1 power limit when loading GuC firmware")
> 
> This is the commit which introduced this sequence:
> 	lock(&gt->reset.mutex);
> 	lock(&hwmon->hwmon_lock);
> 
> Before this, everything was fine. So perhaps the Fixes tag should reference
> this commit?

OK, thanks for pointing that out.

> Otherwise the patch LGTM:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thank you,
Janusz



