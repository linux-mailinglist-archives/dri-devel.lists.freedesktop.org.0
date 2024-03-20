Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABCA881356
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 15:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E7310FCEC;
	Wed, 20 Mar 2024 14:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/Sg410F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F5410FCEB;
 Wed, 20 Mar 2024 14:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710945013; x=1742481013;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+TNRwm9HOUKW8ofmDKvoTDPlsf0Hv953Jcg6WszF1yg=;
 b=k/Sg410FYNcTnuRwt7UH547EMnN8YnjcddfbhxFuoykUoZN7fQCrW05H
 VDseAefG5jplVP2+JJpPjhPyuoygm1MapaL/7b7GrzHP2Nkq4s0hXSYEe
 wSWiJ8eUVsZvK65GfV+TxhSfy4ngwW0T8YlNs0CKrKvpCd3Aso2FRfOu2
 LyQusldQE13kTpFMp2BlPRXP+tuu8rgF83QFOZug8H6ccrg7a+D4/TtqQ
 ez16WCp2D1sFCqkteSWP4ggRGJiwkFhfrUAzrvQnNSTYAhhBVnMfA1F0a
 LeujZ6NL/vupew+Osdo3Cpxsq2QyKECEAThhEoJJB7ea013C87Ax6inmx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5991322"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="5991322"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 07:30:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14059461"
Received: from unknown (HELO intel.com) ([10.247.118.184])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 07:30:05 -0700
Date: Wed, 20 Mar 2024 15:29:58 +0100
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
Message-ID: <Zfry5sPQzIbWeXzs@ashyti-mobl2.lan>
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

Hi Janusz,

...

> Fixes: 22b7a426bbe1 ("drm/i915/execlists: Preempt-to-busy")
> Closes: https://gitlab.freedesktop.org/drm/intel/issues/10154
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.4+

this tag list is a bit confusing. Let's keep all Cc's together
and, besides, Cc'eing the author looks a bit redundant.

No need to resend also because I retriggered another round of
test.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
