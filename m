Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089F848EFCE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 19:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62BA10E1A2;
	Fri, 14 Jan 2022 18:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E7210E1A2;
 Fri, 14 Jan 2022 18:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642184422; x=1673720422;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dA3BWugCD1eqrlgfj+umYYqbB4n9EGeqOGJXU6rsj8I=;
 b=TiFTXTeGytqZTrXExqQmCN22IDF4gRJ5KJjdlvdKuLzlO7U70qDM+dLL
 0K6vWeh+8dAUE+L5V6x6KDhjbcESqSliLDEiblFU8xWrR0Qfc6hLc9pjD
 M/gXulNL2B4kuMzF9v1jZomFp9+MvUQPckYJdcHVImCXiCiPlb9XgBl4J
 H3/W8BPVMn64jocnCuLlzlxXWOsL2BDikhHRdGoQEtnH+3m7+2uw8n4T+
 cfdmUEbAHdysUZUMe4NUTG0lDBtKKaIysl2lHnvACB2zsZ/ex/AfFYmsv
 iQ3NZQCIum2v/QAnlU7L331CsmCG1CnAfcwe67OA9uaPswt6eW290Lih1 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10227"; a="231652454"
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; d="scan'208";a="231652454"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 10:20:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; d="scan'208";a="530359921"
Received: from schruefk-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.49.248])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 10:20:17 -0800
Date: Fri, 14 Jan 2022 20:20:14 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 2/2] drm/i915/gt: make a gt sysfs group and move power
 management files
Message-ID: <YeG+3nv9j/JoAWis@intel.intel>
References: <20220112222031.82883-1-andi.shyti@linux.intel.com>
 <20220112222031.82883-3-andi.shyti@linux.intel.com>
 <YeGuFsMLL5kxzTiu@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YeGuFsMLL5kxzTiu@mdroper-desk1.amr.corp.intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Andi Shyti <andi@etezian.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

> > The GT has its own properties and in sysfs they should be grouped
> > in the 'gt/' directory.
> > 
> > Create a 'gt/' directory in sysfs which will contain gt0...gtN
> > directories related to each tile configured in the GPU. Move the
> > power management files inside those directories.
> > 
> > The previous power management files are kept in their original
> > root directory to avoid breaking the ABI. They point to the tile
> > '0' and a warning message is printed whenever accessed to. The
> > deprecated interface needs for the CONFIG_SYSFS_DEPRECATED_V2
> > flag in order to be generated.
> > 
> > The new sysfs structure will have a similar layout for the 4 tile
> > case:
> > 
> > /sys/.../card0
> >          ├── gt
> >          │   ├── gt0
> >          │   │   ├── id
> >          │   │   ├── rc6_enable
> >          │   │   ├── rc6_residency_ms
> >          │   │   ├── rps_act_freq_mhz
> >          │   │   ├── rps_boost_freq_mhz
> >          │   │   ├── rps_cur_freq_mhz
> >          │   │   ├── rps_max_freq_mhz
> >          │   │   ├── rps_min_freq_mhz
> >          │   │   ├── rps_RP0_freq_mhz
> >          │   │   ├── rps_RP1_freq_mhz
> >          │   │   └── rps_RPn_freq_mhz
> > 	 .   .
> > 	 .   .
> > 	 .   .
> >          │   └── gt3
> >          │       ├── id
> >          │       ├── rc6_enable
> >          │       ├── rc6_residency_ms
> >          │       ├── rps_act_freq_mhz
> >          │       ├── rps_boost_freq_mhz
> >          │       ├── rps_cur_freq_mhz
> >          │       ├── rps_max_freq_mhz
> >          │       ├── rps_min_freq_mhz
> >          │       ├── rps_RP0_freq_mhz
> >          │       ├── rps_RP1_freq_mhz
> >          │       └── rps_RPn_freq_mhz
> >          ├── gt_act_freq_mhz   -+
> >          ├── gt_boost_freq_mhz  |
> >          ├── gt_cur_freq_mhz    |    Original interface
> >          ├── gt_max_freq_mhz    +─-> kept as existing ABI;
> >          ├── gt_min_freq_mhz    |    it points to gt0/
> >          ├── gt_RP0_freq_mhz    |
> >          └── gt_RP1_freq_mhz    |
> >          └── gt_RPn_freq_mhz   -+
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Even though this is a pretty natural extension of sysfs entries we
> already have in the driver today, it's still technically "new ABI" so I
> think we need a link to the IGT changes that exercise it to make sure
> it's working as expected.

this patch should unblock the level0 sysman for DG1 and DG2,
currently being upstreamed, and this will be handled by Sujaritha
in the next days.

Besides there a patch that is adding an hwmon interface to i915
that depends on this one.

> Likewise we need a link to the real userspace consumer that is expecting
> to use this (does some of the Level0 stuff use these knobs?).  If this
> is one of those really rare cases where we never expect any specific
> userspace software to use the ABI, but the intent is instead to let
> sysadmins turn the knobs manually with custom shell scripts or whatever,
> that would need to be justified in the commit message too.

I think with the first multitile platform coming (next series)
this will be essential to control the power of multitile devices,
either manually or with tools, otherwise we will be able only to
access tile 0.

I can add a note in the commit message.

Andi
