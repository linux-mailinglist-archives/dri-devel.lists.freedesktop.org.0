Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B794AE559
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 00:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9005710E4C0;
	Tue,  8 Feb 2022 23:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CD910E301;
 Tue,  8 Feb 2022 23:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644362171; x=1675898171;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=luhPLQCHxl3IklxnkV2mrtsQ3tlOad7IJJjFxZYt0UY=;
 b=NYh8lPFAVXn1k5ma+wCNExJCGZ1GyVPv02542r/If2q9h5aY7W+0Z35Q
 snzKeUkFfDhmItSA01a/aNPgifEfxTp8+zfAu5b6bp0IUuUdcdbmy6MK6
 PDOLVSEnkq2OQBE8unx/+FWy1rgb4wRs9K0fPSP69yGrXm9uY9+e8FPIY
 +9o+fe+/ZmfFZWzRCQzsQX4G20NI0AXibtuOS8dMS5FRdMT8iyqj/ABZv
 8eGYWh9hI267+XRQxCmi9wzUFJNSdNjUSBvTJ8o7TSXX5iYO5lewj89q7
 iPREpHKP6HjdvKGnHMe2rLOOL1wWEYZdvmOAxwOCrB+moxB2tFuS+25Ty g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="229723982"
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; d="scan'208";a="229723982"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 15:16:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; d="scan'208";a="536731264"
Received: from ymtarple-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.231.100])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 15:16:11 -0800
Date: Tue, 8 Feb 2022 15:16:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 0/2] drm/i915/guc: Use temporary memory for
 regset
Message-ID: <20220208231610.6gmhnh3eabnbatri@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220208070141.2095177-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220208070141.2095177-1-lucas.demarchi@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It looks like for this series I forgot to Cc dri-devel, although these
patches are the same as the ones in https://patchwork.freedesktop.org/series/99711/,
just extracted since not dependent on the iosys-map discussion.

Lucas De Marchi

On Mon, Feb 07, 2022 at 11:01:39PM -0800, Lucas De Marchi wrote:
>Extract the 2 commits not related to iosys_map from
>drm/i915/guc: Refactor ADS access to use iosys_map
>(https://patchwork.freedesktop.org/series/99711/). The conversion of the
>rest of ADS initializon will take more time to review. So let's take
>these by themselves as suggested by Daniele.
>
>Lucas De Marchi (2):
>  drm/i915/guc: Prepare for error propagation
>  drm/i915/guc: Use a single pass to calculate regset
>
> drivers/gpu/drm/i915/gt/uc/intel_guc.h     |   7 +
> drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 159 +++++++++++++--------
> 2 files changed, 108 insertions(+), 58 deletions(-)
>
>-- 
>2.35.1
>
