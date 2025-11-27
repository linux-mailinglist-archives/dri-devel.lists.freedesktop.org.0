Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB55C8DD4C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 11:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD5C10E7E9;
	Thu, 27 Nov 2025 10:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e28GUUQn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8F310E7E7;
 Thu, 27 Nov 2025 10:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764240373; x=1795776373;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=769dfkMjwB9JqVOZ3iZbI/fNgaIZ21gfa4qwhm9zbXQ=;
 b=e28GUUQn3KXeG8hlyf9v+urM7n5/Y2oq9LVkf5v0NTcR0WkAQiSRycnU
 mpHNRTEEgrGi3OkfbaBWmK7D/HBuxMOFDsotlAI7ardZ+dOySmV6gCRQw
 jftV4Tu5g730I1iDFLX71Oep5PEE3Pgp/RQT/Z1EuYH3C5sUBOglmfZHj
 /67TiKJRn4lubv/oqohdStwCAMYHHFKZ8j6eeD5lBTI3LMa3mR4vu/+br
 xcWVdmyTLfIvR2ACmrWrmEvP5uGGa9GWIG4fJWzvwTlf1y9v9nCpIyUy9
 2GaZoaf/DmFEOa7DhiOB5phKTvOioYc+hpZtOW1ay/a+pfpyBvuljGgAd Q==;
X-CSE-ConnectionGUID: 8NJgAFPDRLmD9pgnoEysWw==
X-CSE-MsgGUID: k/Pi/kmGTaaviJW8iVzT+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77756236"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="77756236"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 02:46:13 -0800
X-CSE-ConnectionGUID: TXdyOk74SWOPAGhU7TKbCg==
X-CSE-MsgGUID: LLRTSh/cRRCYqaUimuPpEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="230469413"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.43])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 02:46:08 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Krzysztof
 Niemiec <krzysztof.niemiec@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, =?utf-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH] drm/i915/gem: NULL-initialize the eb->vma[].vma
 pointers in gem_do_execbuffer
In-Reply-To: <1835827.4herOUoSWf@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251125133337.26483-2-krzysztof.niemiec@intel.com>
 <4423188.Fh7cpCN91P@jkrzyszt-mobl2.ger.corp.intel.com>
 <qylrctylmtj6qzibfpbapwpb77ut7gzckgg2wpc3gv56kl46m2@hyio7hcsj6vy>
 <1835827.4herOUoSWf@jkrzyszt-mobl2.ger.corp.intel.com>
Date: Thu, 27 Nov 2025 12:46:05 +0200
Message-ID: <24917431ff16a8464b89b1314e02201172cc3fde@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 27 Nov 2025, Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> To my taste, zeroing on allocation would be a more clean solution.

IIUC there are micro optimizations to not clear on allocation when you
don't strictly have to...

I'm not advocating one or the other approach, just stating what I
believe is the reason.


BR,
Jani.

-- 
Jani Nikula, Intel
