Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B203C4936C0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 10:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD08E10E161;
	Wed, 19 Jan 2022 09:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FF010E161;
 Wed, 19 Jan 2022 09:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642582831; x=1674118831;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=w7BZPSfdRG10upFPmfjOPceiSWYyEs7fPYAFXzfsYsk=;
 b=VggleB/cfUtLlTk4QpR6pJOWThkjTFNULdKtt4mkZAaHEktMg0pTN4OL
 tkU47FxkIz3/r8jvdjER6yNJ7AtVQc/5R+c/GyMaVqgYwyFaCfLu4uAAb
 rdR0XmI5tZcCX3DWbG1iidN8GZHbBAfURHHawlMGZ/Dw0n0qXjGZfIB6s
 MQEFhpuemmvPvivZMWVth7oUCqh3g5kpAa51pfpZQldD7IerLAZYp+JeP
 FaPX0s6GkRFreciR1XtTzpuBWk+nC9h6SW9RPXarF+5lSfIYTlOuMmFpx
 56IJZHsIngk+RlJp3nv2Z8wsLnfhnxBULt0VfZ9b4YpBhd5f5BKt+12RI A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="225694786"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="225694786"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 01:00:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="532189439"
Received: from weberral-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.252.46.50])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 01:00:25 -0800
Date: Wed, 19 Jan 2022 11:00:22 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 2/2] drm/i915/gt: make a gt sysfs group
 and move power management files
Message-ID: <YefTJr0DYqwCF1Ii@intel.intel>
References: <20220117150910.231889-1-andi.shyti@linux.intel.com>
 <20220117150910.231889-3-andi.shyti@linux.intel.com>
 <ccbd6b7b-49ef-677f-ca3a-0e99c449f35d@linux.intel.com>
 <164257674010.4293.7082663050451897157@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164257674010.4293.7082663050451897157@jlahtine-mobl.ger.corp.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Joonas,

> > > The GT has its own properties and in sysfs they should be grouped
> > > in the 'gt/' directory.
> > > 
> > > Create a 'gt/' directory in sysfs which will contain gt0...gtN
> > > directories related to each tile configured in the GPU. Move the
> > > power management files inside those directories.
> > > 
> > > The previous power management files are kept in their original
> > > root directory to avoid breaking the ABI. They point to the tile
> > > '0' and a warning message is printed whenever accessed to.
> 
> This is wrong. They should act as multiplexers to all the tiles.
> 
> Needs to be fixed before merging.

I have a patch for this and I planned to send it later. I have
even been asked to split this one in more chunks as the review is
a bit difficult.

> > > The
> > > deprecated interface needs for the CONFIG_SYSFS_DEPRECATED_V2
> > > flag in order to be generated.
> > 
> > CONFIG_SYSFS_DEPRECATED_V2 idea was abandoned, no? This patch at least 
> > does not appear to contain it so please update the commit message to 
> > reflect current state.
> > 
> > Adding Joonas to help address the question of how strict are userspace 
> > requirements for sysfs additions. Personally sysadmin use sounds fine to 
> > me, although it needs to be mentioned/documented as Matt requested, but 
> > I fear it may not be enough to upstream. Is Level0 at the stage where we 
> > can upstream for it I am also not sure.
> 
> Sysadmin usage is fine for the simple interfaces that can truly be used
> from the command line. This patch seems to just expose the existing
> interface in per-tile manner, so should not be a concern.

This will definitely help this patch (series) to get in, but I
my understanding is that Level0 is a bit behind for upstreaming.

> However, the controls not under gt directories, need to be converted to
> apply to all tiles. (I've definitely given that feedback multiple
> times). Otherwise it will be very unexpected to the end user when what
> previously applied to whole device would only apply to part of it.

It's not forgotten :)

> Regards, Joonas

Thank you,
Andi
