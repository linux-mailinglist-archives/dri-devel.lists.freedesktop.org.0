Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F51A69D66
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 02:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C7A10E06A;
	Thu, 20 Mar 2025 01:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SL9bOE4U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60B910E06A;
 Thu, 20 Mar 2025 01:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742432575; x=1773968575;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Gjl9kyvTD0ulbp+jUD12tu9FpDmGuNiozp9YQp3ylm0=;
 b=SL9bOE4UMgu9soEuchpyhoikmnHQkSm3dsU+kF0yxhPJ9zVl4+/N5OsC
 FQCRNbAQGY/d40xP1qkm2UuIsoSYnalde835YA1oT+IxfUVLTZDdnKBNy
 56E6IrnuFJlkQImfg8lnTbv0fVvy7dGhVaKLOaDWoDpQ0Z0s4kzuvxxYL
 zIhWQEu9RF8JdNe1Ssn1pz5fod11t6z+FISim5+X2f29nFFl2gl4e4Qp/
 A7dcBjVVK0Um4iFFwO13OWwu7LS7mj0bqvNh8ecduNScOOlgGN3fwbxIl
 MJu7WJ51AmgE8ryMw9IiuvzVyH8xgSqXLz2PZ1KiIeu55SA8UIUv5rN3P w==;
X-CSE-ConnectionGUID: uwEqGp1SSEWhIyVOtIVKFA==
X-CSE-MsgGUID: 2N3VAx7ASHeP2pvdszajHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43834094"
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; d="scan'208";a="43834094"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 18:02:44 -0700
X-CSE-ConnectionGUID: 3kfFvN74QaKPqtZp9e4MbA==
X-CSE-MsgGUID: oUiMN5ieQAaMUBHxJC2CTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; d="scan'208";a="127950479"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.67])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 18:02:39 -0700
Date: Thu, 20 Mar 2025 02:02:36 +0100
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
Subject: Re: [PATCH v5 0/3] drm/i915: Fix harmful driver register/unregister
 asymmetry
Message-ID: <Z9tpLC5KP--Na3e8@ashyti-mobl2.lan>
References: <20250314205202.809563-5-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314205202.809563-5-janusz.krzysztofik@linux.intel.com>
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

> Janusz Krzysztofik (3):
>   drm/i915: Downgrade device register error if injected
>   drm/i915: Fix PXP cleanup missing from probe error rewind
>   drm/i915: Fix harmful driver register/unregister asymmetry

merged to drm-intel-next.

Thanks,
Andi
