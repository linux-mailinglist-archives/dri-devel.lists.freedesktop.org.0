Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444A596A43A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 18:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0190F10E4B5;
	Tue,  3 Sep 2024 16:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hyTSuvq0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940CB10E4B5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 16:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725380760; x=1756916760;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=VoKYPh++tWILoWaGfi256XRcWGMk5WZ3zkpYUVbSCek=;
 b=hyTSuvq0LSs0BCJOP6FPjFkfO2N3yzQGUW8O6eEr3+VaKGpSKFeBDYJF
 ngyfzyjrEdVfyqVm1MabxpPCcRSQg/oQbfz04zxC19n1I0XSS3xpct4TA
 ArcuPS8+n/A3q+jvZOTIb5ZnWKAU4xGbvsYkNteaQDadTNxl0zUAuEI5B
 2kx+oB6CQ/+xOTGgxTP3Mgoe2uvXT8qy5huieu6OBODts5KWdU6cTaWUW
 Ue695FDxeiG0aGwyQZ5u9CuH4/0qurLNsP+ebEkl68IQHvrQE2nxQMg4S
 049utWhin8TNtneNWiaVgeZBhDHd+fLjt/fovPGR47K60IDN1hv+ROsiC Q==;
X-CSE-ConnectionGUID: WJntfbcBQle5t+hjyuDR0w==
X-CSE-MsgGUID: hf7LVGVCRBi8AbQ3piISDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34562549"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="34562549"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 09:26:00 -0700
X-CSE-ConnectionGUID: PUGcUR2FSteX2dmEFU22rg==
X-CSE-MsgGUID: tJF6xGK/REei/qiCMswLrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="69119688"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 09:25:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, kernel test robot
 <dan.carpenter@linaro.org>, Thierry Reding <treding@nvidia.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: fix potential uninitialized variable use
In-Reply-To: <dejyfvxyi6fibvld3rdlxf2m4xws7shxvhhkokp6y2jk2djltz@reoqqwov4jg4>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240902161317.2437148-1-jani.nikula@intel.com>
 <dejyfvxyi6fibvld3rdlxf2m4xws7shxvhhkokp6y2jk2djltz@reoqqwov4jg4>
Date: Tue, 03 Sep 2024 19:25:41 +0300
Message-ID: <87frqgu2ka.fsf@intel.com>
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

On Tue, 03 Sep 2024, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Mon, Sep 02, 2024 at 07:13:17PM GMT, Jani Nikula wrote:
>> It's likely either output->drm_edid or output->ddc is non-NULL, but
>> avoid the uninitialized variable usage anyway.
>> 
>> Reported-by: kernel test robot <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/r/ZtXLyXxew7z6H2bD@stanley.mountain
>> Fixes: 98365ca74cbf ("drm/tegra: convert to struct drm_edid")
>> Cc: Thierry Reding <treding@nvidia.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: linux-tegra@vger.kernel.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/tegra/output.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Do you want to apply this or should I? In the former case:
>
> Acked-by: Thierry Reding <treding@nvidia.com>

Thanks, pushed to drm-misc-next.

BR,
Jani.

-- 
Jani Nikula, Intel
