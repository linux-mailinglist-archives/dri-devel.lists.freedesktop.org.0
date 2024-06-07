Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D294290071E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 16:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F4D10E0E7;
	Fri,  7 Jun 2024 14:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LvHzy/nM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B0010E0E7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 14:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717771472; x=1749307472;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=trC8zjKdFoxKnt0LPm3AF+tVZcf0sdu9cvB6t+sMDf0=;
 b=LvHzy/nMwgZdYxKArfZkeh9cNebLMvegaKUTGvodKckb6S+lC6+LEanX
 d94/7aF85POeqld1sqENZhDWANq/27TsA03VnXEuAzUvaJyHX5zqVm3Gx
 0MTeviXz4gPgxooYGIa1cFlyLh0bDiH6LyByU808uswfQUN87ZEYkWrRa
 wRDwBHs2BrR7PkrEO7gVpBLQyU5FNmk6pFo2vohV358jarUWNGurzQYOt
 PbWlOzMINQud5IFtGvURfkxqMq0ePlfHEYureVm1D8fHmNKT69OlT1SQr
 cRz63pJDMG87TkmnKKxPHKaK6QR9zYS1vGgd4Ije5rmvTxu1+GRE9Haov A==;
X-CSE-ConnectionGUID: K7oJBwXLSTi2FYEbUgD36A==
X-CSE-MsgGUID: y/FgMXJXQ5uN6L3Jnr/dzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="18285785"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="18285785"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 07:44:31 -0700
X-CSE-ConnectionGUID: McnHDPOqQXu8ZXa06yJZCA==
X-CSE-MsgGUID: Xi0V/LR6S9y0ihvmx1VdTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38277942"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 07:44:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, airlied@gmail.com, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH] drm: have config DRM_WERROR depend on !WERROR
In-Reply-To: <87tti5j5d2.fsf@minerva.mail-host-address-is-not-set>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240516083343.1375687-1-jani.nikula@intel.com>
 <87tti5j5d2.fsf@minerva.mail-host-address-is-not-set>
Date: Fri, 07 Jun 2024 17:44:26 +0300
Message-ID: <87le3glsmt.fsf@intel.com>
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

On Fri, 07 Jun 2024, Javier Martinez Canillas <javierm@redhat.com> wrote:
> Jani Nikula <jani.nikula@intel.com> writes:
>
> Hello Jani,
>
>> If WERROR is already enabled, there's no point in enabling DRM_WERROR or
>> asking users about it.
>>
>> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
>> Closes: https://lore.kernel.org/r/CAHk-=whxT8D_0j=bjtrvj-O=VEOjn6GW8GK4j2V+BiDUntZKAQ@mail.gmail.com
>> Fixes: f89632a9e5fa ("drm: Add CONFIG_DRM_WERROR")
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>
> The change makes sense to me.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks, pushed to drm-misc-fixes.

BR,
Jani.

-- 
Jani Nikula, Intel
