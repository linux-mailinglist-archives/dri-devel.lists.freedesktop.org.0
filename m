Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D827095961F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 09:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E9110E52F;
	Wed, 21 Aug 2024 07:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZjMGxQiU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B56710E52F;
 Wed, 21 Aug 2024 07:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724225574; x=1755761574;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zkXMjNqssWc4LDjuvlW7IRqezLfug6anGPQLEoFujuQ=;
 b=ZjMGxQiUDgBTFaQmX9eaHEs1pB8NclfUOqF7RckpAytHFyzsmiibuMPc
 mDZHJ8azaD3NeGKGldQ1KiR9zZfue/MXaLkCv/mwLlBKJg3dq4YHcU+ah
 TeuTFn2gY9Dqqa0IbPvYAB7SteMmHnvQv/Kedddr1mQYqzYHjsan9tQ8s
 ya5o2pJcee3eABKuAzBzTQprx8cvYFNZYgOwWT3uQhQvPq4saxkSJk6xu
 bIdeOZUop71lAP1kSZ+tAGaSyJyhuEejcKAYn7z1d5bZTNSblpp+Ouk5h
 Or63NtLt3hvrzLhcfqzoDLMqpDCKb0k/znwCzUZQaWf7BXGGdU8pM/EZo A==;
X-CSE-ConnectionGUID: ngKlikFYS/GcsoZxr86wbw==
X-CSE-MsgGUID: p834aektRautqFvGxTqF5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="13128235"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="13128235"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 00:32:53 -0700
X-CSE-ConnectionGUID: cpfrf5zVRUaLkInS4Ih1DQ==
X-CSE-MsgGUID: q7EI/KbFTB+iTw34kRSYgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="65846606"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.24])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 00:32:52 -0700
Date: Wed, 21 Aug 2024 09:32:48 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gt: Continue creating engine sysfs files even
 after a failure
Message-ID: <ZsWYIBsuFKAqVpIS@ashyti-mobl2.lan>
References: <20240819113140.325235-1-andi.shyti@linux.intel.com>
 <ZsUJIFVKuIX_pbDw@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsUJIFVKuIX_pbDw@intel.com>
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

On Tue, Aug 20, 2024 at 05:22:40PM -0400, Rodrigo Vivi wrote:
> On Mon, Aug 19, 2024 at 01:31:40PM +0200, Andi Shyti wrote:
> > The i915 driver generates sysfs entries for each engine of the
> > GPU in /sys/class/drm/cardX/engines/.
> > 
> > The process is straightforward: we loop over the UABI engines and
> > for each one, we:
> > 
> >  - Create the object.
> >  - Create basic files.
> >  - If the engine supports timeslicing, create timeslice duration files.
> >  - If the engine supports preemption, create preemption-related files.
> >  - Create default value files.
> > 
> > Currently, if any of these steps fail, the process stops, and no
> > further sysfs files are created.
> > 
> > However, it's not necessary to stop the process on failure.
> > Instead, we can continue creating the remaining sysfs files for
> > the other engines. Even if some files fail to be created, the
> > list of engines can still be retrieved by querying i915.
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > ---
> > Hi,
> > 
> > It might make sense to create an "inv-<engine_name>" if something
> > goes wrong, so that the user is aware that the engine exists, but
> > the sysfs file is not present.
> 
> well, if the sysfs dir/files creation is failing, then it will
> probably be unreliable anyway right?

Are you suggesting that "inv-<engine_name>" is OK?

> > One further improvement would be to provide more information
> > about thei failure reason the dev_warn() message.
> 
> So, perhaps this patch should already go there and remove
> the dev_err and add individual dev_warn for each failing path?

That's a suggestion, but it doesn't mean that it necessarily
improves things as it might add some innecessary information.
Just thinking.

> Also it looks something is off with the goto paths...
> 
> That if (0) is also ugly... probably better to use a
> kobject_put with continue on every failing point as well...

ehehe... I came to like it, to be honest. Besides I like single
exit paths instead of distributed returns. In this particular
case we would replcate the same "kobject_put() ... dev_warn()" in
several places, so that I'm not sure it's better.

If you like more we could do:

	for (...) {
		...
		...
		/* everything goes fine */
		continue

err_engine:
		kobject_put(...);
		dev_warn(...);
	}

And we avoid using the "if (0)" that you don't like.

Thanks,
Andi
