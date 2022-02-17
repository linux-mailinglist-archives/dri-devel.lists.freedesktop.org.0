Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 621224BA4BF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 16:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B337110EB3A;
	Thu, 17 Feb 2022 15:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA02010EB3A;
 Thu, 17 Feb 2022 15:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645112713; x=1676648713;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x0Sjhy23qKvrvWx1/OaVuSgVMkaku3F28lUTUNbSrss=;
 b=hr8e5OFVHGOWiEbeh4nqQnQcHbRHp/wLMEy5KhoPYlM7Kf1FNEcnWRru
 tVTJGf4+y1FbuChyFdc4Y7wmFWqSUtJoQ84x5YWcC8CbXxjet3Ujl0IBY
 bCocIiNkhnOziegnbFQPblHCOHuif+XUOGqb7VZmkw9AeJh4GiZ618d9Q
 4njRIyGkyB6NiJFmk0ZEh0Y2nmT8riYFDOH+XVPlEv9bOkVCW9G0M45Mm
 5RiNp+mDhqZS7Tn2Qv4/tYT2cbq+0Hvdql8LjO9+0BbTSuEahgNao/9da
 WLxjHGFZgpc6Mkud1YduBKNAPuUPYO3qhZcB6rmPE0So4fYKdZjryLvyX w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="251099405"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="251099405"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 07:45:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="545667954"
Received: from pkivi-mobl.ger.corp.intel.com (HELO intel.com) ([10.252.43.228])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 07:45:07 -0800
Date: Thu, 17 Feb 2022 16:45:05 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v5 7/7] drm/i915/gt: Adding new sysfs frequency attributes
Message-ID: <Yg5tgepi3dkP6Y0M@intel.intel>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-8-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217144158.21555-8-andi.shyti@linux.intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I forgot to add some note to this patch...

[...]

> +static ssize_t throttle_reason_status_show(struct device *dev,
> +					   struct device_attribute *attr,
> +					   char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool status = !!intel_rps_read_throttle_reason_status(rps);

why are these boolean? Can't we send whatever we read from the
register?

[...]

> +#define GT0_PERF_LIMIT_REASONS		_MMIO(0x1381A8)
> +#define   GT0_PERF_LIMIT_REASONS_MASK	0x00000de3

This mask is really weird! Sujaritha, can you please explain it?

It looks something like this,

  REG_GENMASK(11, 6) | REG_GENMASK(2, 0)

But I don't know if it improves any readability, in any case, the
mask is not clear.

> +#define   PROCHOT_MASK			BIT(1)
> +#define   THERMAL_LIMIT_MASK		BIT(2)
> +#define   RATL_MASK			BIT(6)
> +#define   VR_THERMALERT_MASK		BIT(7)
> +#define   VR_TDC_MASK			BIT(8)
> +#define   POWER_LIMIT_4_MASK		BIT(9)
> +#define   POWER_LIMIT_1_MASK		BIT(11)
> +#define   POWER_LIMIT_2_MASK		BIT(12)

I hope I got these right. Sujaritha, can you please check?

Andi
