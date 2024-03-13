Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0980887A977
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 15:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71B910E6BD;
	Wed, 13 Mar 2024 14:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7Ta1YI6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CD610E739;
 Wed, 13 Mar 2024 14:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710340219; x=1741876219;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f+f5XcYjsmrgzxCdlVV9KOe05mMTqwtZCfOtFzV/x0Q=;
 b=L7Ta1YI6k5NXfmeZV7sc/YQgf3qU2SdboG2F0jkxUJdWVa/gXFv2iaxW
 oKeTHzYA8mIo57slpc/cl5D2K98x/WStE2aj5AHzxK4jv0V2r4XRXz1m2
 BWBczMjEljtaHHoBU8HYXIPAgoVwaoJU06I9yKgFL3VHemlzLgsDHhfc4
 IznIf7THkA9GYyg2HzO61Qd1U37Di0a0DCuDrUYxF+WdGx8j2edW+/xYv
 x8RUoXbhZ9/brXLE7jXDmFc8SftBBiXeh//HQBoeo87Z+caX05YwRuLp2
 90kNGjBvIbbHObVqJ1saIjrgD2GA0HlAzmgReQLfjAENfVjJOOg6cnzOO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16554291"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="16554291"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 07:30:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="35062967"
Received: from unknown (HELO intel.com) ([10.247.118.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 07:30:09 -0700
Date: Wed, 13 Mar 2024 15:30:02 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Dale B Stimson <dale.b.stimson@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v2] drm/i915/hwmon: Fix locking inversion in sysfs getter
Message-ID: <ZfG4aqW47iU1Qw50@ashyti-mobl2.lan>
References: <20240311203500.518675-2-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311203500.518675-2-janusz.krzysztofik@linux.intel.com>
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

On Mon, Mar 11, 2024 at 09:34:58PM +0100, Janusz Krzysztofik wrote:
> In i915 hwmon sysfs getter path we now take a hwmon_lock, then acquire an
> rpm wakeref.  That results in lock inversion:
> 
> <4> [197.079335] ======================================================
> <4> [197.085473] WARNING: possible circular locking dependency detected
> <4> [197.091611] 6.8.0-rc7-Patchwork_129026v7-gc4dc92fb1152+ #1 Not tainted

...

> Fixes: c41b8bdcc297 ("drm/i915/hwmon: Show device level energy usage")
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: <stable@vger.kernel.org> # v6.2+

With the "Fixes:" tag changed and the stable version updated,
pushed to drm-intel-next.

Thanks,
Andi
