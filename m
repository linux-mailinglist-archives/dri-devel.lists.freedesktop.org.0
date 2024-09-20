Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCC297D4A5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 13:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481EA10E811;
	Fri, 20 Sep 2024 11:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NqzB/4/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D7C10E80B;
 Fri, 20 Sep 2024 11:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726831108; x=1758367108;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fhQVWSHHAHk/BjF/V13BQ+gW0rvINcPEWCfsLCr11J4=;
 b=NqzB/4/OaLCEKrfiACAEbimTxoOGxWmMAyZ1UhlUS3mKKd3GsnugvrBs
 PACRXtEWI7uEn06S9RSL0ltx7/nRxLvc5onqpZ0ttJcIkuXjsEU+S6j1Q
 NJnOvl7sYVCnzDYqaqMdnDhblV6PRI7M7Mt3aOf2zZIzqZwLdZDo7zRBK
 baFIw8YzmCZg7wLD7Qor9K0rT1EgexefsNw+ezKrKsAVOD00BeTeYLJ9s
 oNHJVLtdCqrUmucAQtuT1wGR+t5d+gXM9+5lqws7tVUCseS611cNSjAsi
 52KvOalBg1n2GI1LEdBfxrGS1NNsauYfBrZeFuj7B8JZWQoTa0LKW3HBQ w==;
X-CSE-ConnectionGUID: tBWpkajwShea702ibU977g==
X-CSE-MsgGUID: yTH2KbLtR0+l4v+XHJVqYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="43301338"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="43301338"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 04:18:27 -0700
X-CSE-ConnectionGUID: 5wc2R7eBRMiNjurcCqopyg==
X-CSE-MsgGUID: VrrIALB+SfGJteI0EeObvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="71112583"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 04:18:22 -0700
Date: Fri, 20 Sep 2024 14:18:19 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, airlied@gmail.com,
 simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 lina@asahilina.net, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, francois.dugast@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 andi.shyti@linux.intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v5 2/4] drm: Expose wedge recovery methods
Message-ID: <Zu1Z-xnjoEuUf8dt@black.fi.intel.com>
References: <20240917040235.197019-1-raag.jadav@intel.com>
 <20240917040235.197019-3-raag.jadav@intel.com>
 <87msk6d8jw.fsf@intel.com> <ZuujCuVxFnOAKdgR@black.fi.intel.com>
 <87r09g9jp0.fsf@intel.com> <ZuvjGpIdOgGpbBQu@black.fi.intel.com>
 <Zuwq-NOtgr2E1R5S@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zuwq-NOtgr2E1R5S@smile.fi.intel.com>
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

On Thu, Sep 19, 2024 at 04:45:28PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 19, 2024 at 11:38:50AM +0300, Raag Jadav wrote:
> > On Thu, Sep 19, 2024 at 10:38:51AM +0300, Jani Nikula wrote:
> 
> ...
> 
> > Anyway, would you prefer strlcat instead?
> 
> FYI: strl*() are subject to remove. They are bad, no-one should really prefer
> them in the Linux kernel.

Not showing up on checkpatch (along with a few others from deprecated.rst).

Raag
