Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CA5C8DFAE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 12:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9514810E02A;
	Thu, 27 Nov 2025 11:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="et3QpFXE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A4B10E00A;
 Thu, 27 Nov 2025 11:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764242478; x=1795778478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wVBm+5KWupaATaDiiobiNvx07HtguyZruwuj7nyVaT8=;
 b=et3QpFXE6MKeWDsYVArB0XZQyI/SL26FLkL75tVPNKGBynwI0Lf/M8E6
 EjfSvTEKTQBGI7CcQUTm/1H/XPflkjlp+i35xKg+2WL8yw60Su6u2sLhe
 b4wWpRlTGmvvKZ86Q7ybwjUXsHzgPp5eOy8SMGOp3jngYGp2u6k3yjBsn
 TcP4x6nwwYUeSF8jU0qfLq+oZpbU7GhoJ8ivs63WHHqzvO8JSCJqt4IVZ
 JE50qVlcdUvB/YYzpCt7ny9WGXkrem7nx0+1OpcMl7f0BrtTuTEipXv++
 o1b+Glc/+rFPUSES8Fal1cdGUKCDlj6VMn25D8576pQEn48EaDIz6kc0V g==;
X-CSE-ConnectionGUID: euCsbpp+RH+Exjg/m3xAPA==
X-CSE-MsgGUID: +eTwKG07QX2s8Xq/AVGGJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="53855879"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="53855879"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 03:21:17 -0800
X-CSE-ConnectionGUID: vCT+vODPRkqbm+sph1dshw==
X-CSE-MsgGUID: 0WBxLg1QTYWiepMHeKHr/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="193431310"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.49])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 03:21:14 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, =?UTF-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH] drm/i915/gem: NULL-initialize the eb->vma[].vma pointers
 in gem_do_execbuffer
Date: Thu, 27 Nov 2025 12:21:11 +0100
Message-ID: <4085794.qgXdJBQaxk@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <24917431ff16a8464b89b1314e02201172cc3fde@intel.com>
References: <20251125133337.26483-2-krzysztof.niemiec@intel.com>
 <1835827.4herOUoSWf@jkrzyszt-mobl2.ger.corp.intel.com>
 <24917431ff16a8464b89b1314e02201172cc3fde@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Thursday, 27 November 2025 11:46:05 CET Jani Nikula wrote:
> On Thu, 27 Nov 2025, Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> > To my taste, zeroing on allocation would be a more clean solution.
> 
> IIUC there are micro optimizations to not clear on allocation when you
> don't strictly have to...
> 
> I'm not advocating one or the other approach, just stating what I
> believe is the reason.

OK, good to hear there is still someone who is able to recall what the reason 
could be when no hints can be found in git history nor inline comments.

If that's the case, but we agree on pre-zeroing only the sub-area dedicated to 
the vma table rather than doing that on failure and limited to one element 
that follows the one that failed, as Krzysztof initially proposed, then I'd 
vote for restoring memset() that was dropped with commit 170fa29b14fad ("drm/
i915: Simplify eb_lookup_vmas()").  In any case, a clarification (in commit 
description or inline comment) on why we chose one solutions and not the 
another wouldn't hurt.

Thanks,
Janusz

> 
> 
> BR,
> Jani.
> 
> 




