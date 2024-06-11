Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D358903D8D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 15:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5416510E64F;
	Tue, 11 Jun 2024 13:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUFZQD9N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3154E10E65F;
 Tue, 11 Jun 2024 13:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718112925; x=1749648925;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xK+JW64160s7B6l5UURa8T49p7gj6EnvGI2Brvq7ZlA=;
 b=XUFZQD9N1FsGuRRjvTR9JJbKDcn2wPoGqIN+90CCvo54+qAa2NH7hmRL
 wz7+bvY06Q0Z+18LwHDXaUSchiKrBzO79IHlc4Uxl9whLxP4uz9aJ36zK
 CXsWtiZWlxNSuZBaEdaXRDq0VeYyXmtLPrksaIlb1vryOBBX7VA35V6t3
 MvOxxb1lxn4kXEM/XJyMjqE8P1+xcg7KsQhiudszSXtCwX+LW4khpi80A
 YOt62O7dDmDtDJIk9zo1Yh5jJwi/CWlpTLcW0W6HeYzCmrklghk5UzUKr
 1DVRvgr+at54Hvd+m/DXOC/a/tKB6tBUo9I2l3ao8egDIZnmp/Xob0L66 g==;
X-CSE-ConnectionGUID: lDntBnNLQQ+4Cd3cF8UyxQ==
X-CSE-MsgGUID: n/wRIErBSIGMSOfpNICgPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32306844"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32306844"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 06:35:14 -0700
X-CSE-ConnectionGUID: 7I8zMfgZRbyE7Hy2tutqiA==
X-CSE-MsgGUID: yrTv3dycSNKMcWOlq0106g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39524931"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.250])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 06:35:12 -0700
Date: Tue, 11 Jun 2024 15:35:09 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH] drm/i915/gt: debugfs: Evaluate forcewake usage within
 locks
Message-ID: <ZmhSjUCZv47n5vcY@ashyti-mobl2.lan>
References: <20240607145131.217251-1-andi.shyti@linux.intel.com>
 <ZmMkSHoUhfuK61fT@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmMkSHoUhfuK61fT@intel.com>
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

Hi Rodrigo,

...

> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> > index 4fcba42cfe34..0437fd8217e0 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> > @@ -71,6 +71,8 @@ static int fw_domains_show(struct seq_file *m, void *data)
> >  	struct intel_uncore_forcewake_domain *fw_domain;
> >  	unsigned int tmp;
> >  
> > +	spin_lock_irq(&uncore->lock);
> > +
> >  	seq_printf(m, "user.bypass_count = %u\n",
> >  		   uncore->user_forcewake_count);
> >  
> > @@ -79,6 +81,8 @@ static int fw_domains_show(struct seq_file *m, void *data)
> >  			   intel_uncore_forcewake_domain_to_str(fw_domain->id),
> >  			   READ_ONCE(fw_domain->wake_count));
> >  
> > +	spin_unlock_irq(&uncore->lock);
> 
> I was going to ask to move all of this to a function inside intel_uncore.c
> so we keep the lock access in there.... But then I noticed it is already
> spread all over :(

Yeah... maybe some refactoring might be needed there.

> Well, perhaps we should start from here to set the precedence and move
> things to its own component... but well, I won't block or make it hard,
> we do need this change and the overall uncore cleanup could be orthogonal.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks,
Andi
