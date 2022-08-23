Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F5359DAD8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 13:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C9310F344;
	Tue, 23 Aug 2022 11:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3BF10F344;
 Tue, 23 Aug 2022 11:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661252976; x=1692788976;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=RDXPW1FcYEVDFhnp5BVZ3m8YMvZs/+EeD7gFbEk+hhs=;
 b=laxr3NvlDNTNlz+6J8tsqYOlJgpmiryuC9hwTuF59hR0qUCHSza4ej7h
 xYPPQNCKNe3Q4z6hohh/iS7uoIO3ZP/+IJmzSz0jMhINrNEdcpA6OtXKV
 DJ4kNgB0gTsZD6JyxKQrSwyvV2bOAZGS6uhQSuTirRSaaQRdXQIKu+HE5
 FfdpI2+3c/26H5zWIqvzYz/xB013fjw1mMUoyqC5oG6asYCx2c7tnB+dO
 wU3V/8FxDTs1tCSbAONHlYkjggx3iRCrJdFlxIoCdQ9us7hri98pyPLoR
 I+oXbZdvVej7yMHiAvYL7qCIYhr5A/nby7I3VDBinnR2s/lfHuAaovcto Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="294942245"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="294942245"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 04:09:34 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="669984982"
Received: from obeltran-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.51.100])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 04:09:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v3 09/15] drm/i915/pxp: add huc
 authentication and loading command
In-Reply-To: <20220819225335.3947346-10-daniele.ceraolospurio@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220819225335.3947346-1-daniele.ceraolospurio@intel.com>
 <20220819225335.3947346-10-daniele.ceraolospurio@intel.com>
Date: Tue, 23 Aug 2022 14:09:30 +0300
Message-ID: <878rnfkyhh.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Tomas Winkler <tomas.winkler@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Aug 2022, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_huc.h b/drivers/gpu/drm/i915/pxp/intel_pxp_huc.h
> new file mode 100644
> index 000000000000..6cf2d00548c0
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_huc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2021, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __INTEL_PXP_HUC_H__
> +#define __INTEL_PXP_HUC_H__
> +
> +#include <linux/types.h>

Unnecessary.

PSA: I'm going to keep nagging about unnecessary includes for as long as
it takes to stop people from adding build dependencies for no actual
reason.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
