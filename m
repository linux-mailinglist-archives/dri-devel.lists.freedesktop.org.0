Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0728193236D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 11:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE17E10E620;
	Tue, 16 Jul 2024 09:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvlxd0wm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACF510E61F;
 Tue, 16 Jul 2024 09:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721123704; x=1752659704;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ds1biXbXIWkTSsdB0y9iUmwLmE9tUaNFwkZkwt+FOGU=;
 b=lvlxd0wmwrcBJipf6HvSEKm46aI53JfBhsrrCIiIHeJRnLeCW9g8PKTQ
 fgM366QBM8eesRhLopksluSriv3L8LWwNhOVhxrpGaaqKeurywdnyd8j9
 EGHbwE49bAgNC10p4sZLwf9nq91buTE4h9WjIdtVAHivRJaII7+aFlZSk
 mExlMeiUx29i0jTH0q7mLApZGqyCNvB1dQk0ww1tqWFHGk/IYn26xDLY+
 OxTt8G08m0Own1pAwEVQMwQ8q2qkkRtID+40q5ASU3VSOp39F36J6K1K4
 S34aUb8jdwyAukls2wPEKolCVWpscvZRtxxK6/bp+RVvE8ZInsZ+/+mrU Q==;
X-CSE-ConnectionGUID: 5e/sJtK/QCaU9A9RIrM6fQ==
X-CSE-MsgGUID: wNmqPgTMSDqqgvj9BS895g==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="41075128"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="41075128"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 02:55:03 -0700
X-CSE-ConnectionGUID: 4jR0Id70RXCZxcFhe+VTUA==
X-CSE-MsgGUID: UoH08PBHT4Gu1d5QT37C0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="80637535"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.212])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 02:55:01 -0700
Date: Tue, 16 Jul 2024 11:54:56 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: chris.p.wilson@intel.com, tursulin@ursulin.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nirmoy.das@intel.com, janusz.krzysztofik@linux.intel.com,
 Chris Wilson <chris.p.wilson@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3] drm/i915/gt: Do not consider preemption during
 execlists_dequeue for gen8
Message-ID: <ZpZDcGxmwSQ3ze8t@ashyti-mobl2.lan>
References: <20240711163208.1355736-1-nitin.r.gote@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711163208.1355736-1-nitin.r.gote@intel.com>
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

Hi Nitin,

On Thu, Jul 11, 2024 at 10:02:08PM +0530, Nitin Gote wrote:
> We're seeing a GPU HANG issue on a CHV platform, which was caused by
> bac24f59f454 ("drm/i915/execlists: Enable coarse preemption boundaries for gen8").
> 
> Gen8 platform has only timeslice and doesn't support a preemption mechanism
> as engines do not have a preemption timer and doesn't send an irq if the
> preemption timeout expires. So, add a fix to not consider preemption
> during dequeuing for gen8 platforms.
> 
> v2: Simplify can_preempt() function (Tvrtko Ursulin)
> 
> v3:
>  - Inside need_preempt(), condition of can_preempt() is not required
>    as simplified can_preempt() is enough. (Chris Wilson)
> 
> Fixes: bac24f59f454 ("drm/i915/execlists: Enable coarse preemption boundaries for gen8")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11396
> Suggested-by: Andi Shyti <andi.shyti@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> CC: <stable@vger.kernel.org> # v5.2+

with the commit message fixed and the checkpatch as well, merged
to drm-intel-gt-next.

Thank you,
Andi
