Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA62FA68283
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 02:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CC910E4DB;
	Wed, 19 Mar 2025 01:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4vsE5om";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A0810E4D8;
 Wed, 19 Mar 2025 00:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742345999; x=1773881999;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gj0ziHYZy0X/oi1qLBX+sStExx10C+kk7gLlCtwei6s=;
 b=O4vsE5om6ZqwkNMBsKWmHMdKmedIbILn1ZyeiaeADYkJkIAy2KDjkP81
 4BWcVFKbHje3uHvmC4wvRumDdXNcZK1jmLJ+w4od378K+Dgcvfvc/rrKr
 Ef1ou0VskQDMw30eXjm9oq47XDjFlXtY+gupCFNRInBDagnEiLuDB0XbX
 Xoanjkj6p2TWfiSdgp1W+gnnmXcsja3Z97ZK0PujsDBakSrEGqGhmwAnD
 DmGFrrdrGqsFpW7NYd3UznMw3e8JO6/iRmTnkI1xpiVj3TuLDH7E5SMMs
 CDPWOg308rkoXhLQNe/kze7J+eETk6DKfC3Itamygx8MqYYzn0nIJ+ZEW w==;
X-CSE-ConnectionGUID: sFct1VI7R+a4y8fpvZzvlw==
X-CSE-MsgGUID: KI/jJBBDSYuK0ucNPmqKzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43530346"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="43530346"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 17:59:56 -0700
X-CSE-ConnectionGUID: OsvNgHJQQE6uXuS57fUmDQ==
X-CSE-MsgGUID: fDlAG8EwQRiHhCl9+3dTDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="153274493"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.185])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 17:59:52 -0700
Date: Wed, 19 Mar 2025 01:59:49 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v5 1/3] drm/i915: Downgrade device register error if
 injected
Message-ID: <Z9oXBeZZ7IHwX1Pw@ashyti-mobl2.lan>
References: <20250314205202.809563-5-janusz.krzysztofik@linux.intel.com>
 <20250314205202.809563-6-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314205202.809563-6-janusz.krzysztofik@linux.intel.com>
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

On Fri, Mar 14, 2025 at 09:38:33PM +0100, Janusz Krzysztofik wrote:
> Commit 8f460e2c78f2 ("drm/i915: Demidlayer driver loading") which
> introduced manual device registration also added a message that is
> submitted on device registration failure as an error.  If that failure is
> triggered by error injection test, that's an expected error, but CI still
> reports it as a bug.  Fix it.
> 
> Suggested-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
