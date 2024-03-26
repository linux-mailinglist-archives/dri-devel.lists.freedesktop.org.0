Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6D388C05E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 12:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02E610EE8D;
	Tue, 26 Mar 2024 11:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mwk4jhOJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CAD10EE8D;
 Tue, 26 Mar 2024 11:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711451747; x=1742987747;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=t3RQyFwpbhBMxoKmMWSRVceEBvSc/h9Voe108r0hYjg=;
 b=mwk4jhOJW158u/88pnKqqEzi84xsH9a/gBAqE6NKEujbWHBx3Wbi8qLS
 gCIct83G86aoHJrRO+6gEwwxkV5iFmeIWdWo3e8RCjkitmDkmgtSmK1Zq
 C6ywF5r2QjA7EnISfcyiR5J36b7OaL8iEQUPtItZRcLc17SLBqyVp0w1g
 IB+Nxpk2XE5fyGUgRarYt7jamInIh4vv564GMbm0ZB8ITSZMn2rvJPLv1
 XZ/L86ZiOU4DZmd/iONEZmazgXx0XOqUFjjvZaVAG8aodlfr/jXK+i02k
 ZhNhBcoc7M3qoYiAOjNVW1Nd07Z49QS0lVfZtK2piDmi8j6wQSBv9Qcw+ Q==;
X-CSE-ConnectionGUID: kU0LRA2iS/eHGS9HPNLRuQ==
X-CSE-MsgGUID: V1EhYQ3ITMKauflKlX3MnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17884774"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17884774"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 04:15:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="16363304"
Received: from unknown (HELO intel.com) ([10.247.118.204])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 04:15:38 -0700
Date: Tue, 26 Mar 2024 12:15:32 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Reset queue_priority_hint on parking
Message-ID: <ZgKuVOTdvSvu43mT@ashyti-mobl2.lan>
References: <20240318135906.716055-2-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318135906.716055-2-janusz.krzysztofik@linux.intel.com>
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

Hi Janusz and Chris,

> Fixes: 22b7a426bbe1 ("drm/i915/execlists: Preempt-to-busy")
> Closes: https://gitlab.freedesktop.org/drm/intel/issues/10154
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.4+

with the tags rearranged a bit, pushed to drm-intel-gt-next.

Andi
