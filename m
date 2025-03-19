Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8508A6828B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 02:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A1A10E4DC;
	Wed, 19 Mar 2025 01:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNTuvzfk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A967710E4DD;
 Wed, 19 Mar 2025 01:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742346048; x=1773882048;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jIN2GDksBVIf2OBYv8lG1GlMzeYDLDT4nsVXncumAx8=;
 b=gNTuvzfkI4a3tzy0znWTt8/ZI8lgwMXWQ7KWQ9i/5vTfpvbi2YFmTLgE
 MdmNJIb0e19r2gQkEvi2KINaHxayGwiSODLb518P+nr6eh9pTVrpGQsZw
 CYgpRQVzR+CTipodMq99aTYdSKh8jqL9rBmvJTOX/HvxYcVABWRQLlGIM
 paaUYEwwOVb5eD1lcNZgRvX8veJqGoA0mV6SX7Lq6bS9lAv7SITseZHPK
 VgFsKSCj6mS0HPaqmecAyTNllhIA4WhDO41T08WXBmExGbgJjQO7r/QGs
 McLImJ50BWhHUS2IBkUxeGzRv7/iwP1jwvHzH2m7Mc/Ia0LZ9wp7IZuxH g==;
X-CSE-ConnectionGUID: lEdoNfKfTTuoZNWlzPqkGQ==
X-CSE-MsgGUID: GUqZ+XFtRpmpc6phGa8Sww==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43434659"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="43434659"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 18:00:47 -0700
X-CSE-ConnectionGUID: Rt/7RbBjTNi/dWIxmZDkyQ==
X-CSE-MsgGUID: tyu4oaM7QpW0PqpRWkhGNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="122350420"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.185])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 18:00:42 -0700
Date: Wed, 19 Mar 2025 02:00:39 +0100
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
Subject: Re: [PATCH v5 2/3] drm/i915: Fix PXP cleanup missing from probe
 error rewind
Message-ID: <Z9oXN4M_pKbEFbgE@ashyti-mobl2.lan>
References: <20250314205202.809563-5-janusz.krzysztofik@linux.intel.com>
 <20250314205202.809563-7-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314205202.809563-7-janusz.krzysztofik@linux.intel.com>
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

On Fri, Mar 14, 2025 at 09:38:34PM +0100, Janusz Krzysztofik wrote:
> Commit f67986b0119c04 ("drm/i915/pxp: Promote pxp subsystem to top-level
> of i915") added PXP initialization to driver probe path, but didn't add a
> respective PXP cleanup on probe error.  That lack of cleanup seems
> harmless as long as PXP is still unused and idle when a probe failure
> occurs and error rewind path is entered, but as soon as PXP starts
> consuming device and driver resources keeping them busy, kernel warnings
> may be triggered when cleaning up resources provided by memory regions,
> GGTT, GEM and/or VMA cache from the probe error rewind and/or module
> unload paths because of missing PXP cleanup.  That scenario was observed
> on attempts to fail the probe and enter the rewind path on injection of
> now ignored error in device registration path.
> 
> Fix it.
> 
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
