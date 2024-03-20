Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC003881828
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 20:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF3110E334;
	Wed, 20 Mar 2024 19:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F6nAGP8H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB7210E334;
 Wed, 20 Mar 2024 19:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710964462; x=1742500462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aPdtRrOUkGyuHA3RYzmYmsdMLldh4oYLNqJw/UAlAN8=;
 b=F6nAGP8HjlTOJPWJFnTcgqNTSWQzHNLcmVwxdJHyhbI7MuU8fS2yllvO
 cGLWqQsGBp40FZIASOlzPDTftGzEqClNVllVPy+wgdzBREJbYzuUAl3Qv
 mdm75EIC0CAT1pb0OKKVm1E7ir7FUc6sz4hl/CBKB/1TJwbd4nUxGl5IQ
 54qxcu7a+f80TbHzncVVUbTbrElb5GT+eYsBLbB7184dDKP1nXAMSYf1z
 pQlcekz/BqIYIejLcvs3bBNw9nhmIs7CX9XNFkg3hfArp41WNHZ5p9mAD
 jB8UklcRyyeIKpK1fwNcvLzjMIEKUwhb5eMJbYyaWMy+iLVl8V3oa543u A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="17055329"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="17055329"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 12:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="14332332"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.7.80])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 12:54:18 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Reset queue_priority_hint on parking
Date: Wed, 20 Mar 2024 20:54:15 +0100
Message-ID: <1888291.AB8Y2P6tQ1@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Zfry5sPQzIbWeXzs@ashyti-mobl2.lan>
References: <20240318135906.716055-2-janusz.krzysztofik@linux.intel.com>
 <Zfry5sPQzIbWeXzs@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi Andi,

On Wednesday, 20 March 2024 15:29:58 CET Andi Shyti wrote:
> Hi Janusz,
> 
> ...
> 
> > Fixes: 22b7a426bbe1 ("drm/i915/execlists: Preempt-to-busy")
> > Closes: https://gitlab.freedesktop.org/drm/intel/issues/10154
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > Cc: <stable@vger.kernel.org> # v5.4+
> 
> this tag list is a bit confusing. Let's keep all Cc's together
> and, besides, Cc'eing the author looks a bit redundant.

You're right, please feel free to fix that while applying.

Thanks,
Janusz

> 
> No need to resend also because I retriggered another round of
> test.
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Thanks,
> Andi
> 




