Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 723F187BC80
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 13:07:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C20F10F21A;
	Thu, 14 Mar 2024 12:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="We50L1xr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346AE10F21A;
 Thu, 14 Mar 2024 12:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710418066; x=1741954066;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=PLPAoVjq0t4xaNG0muI4Yd+yt2YiB407PxAHXEz9hF0=;
 b=We50L1xrOr+rZ46mZ6FpZy6Lz+uQ13AhrSBtBFHJ34GIpy5OJml2P+gK
 1Qa9vgVUmU3lNwKtCJWGbOQLurri2zWfYCpS6o+8+M7XZLYGPX0wavM0P
 uVd0Amb6mwJxhL33UPJI3V0WMUuXFWifIVlYdKHCMXf7kn2Re5Lg4RHxs
 pi3rI0+L9TA5M+WnsYXb3Fnh+yjaDZXyMEjqX4CdUKuAgVfdztQQL4g2G
 FLA/tYsSCIhZAxk9dxz+DOwoSiwm4lyyiPZvpPb1ADVXY7qXUumAStTsV
 g7Bsshx9MZ64cy12IvXCoFRhXGADDKTb3IdXPM4sXRhmxREEunhMg7Dvr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5082286"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5082286"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 05:07:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16929659"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 05:07:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 0/6] drm: debug logging improvements
In-Reply-To: <cover.1709843865.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1709843865.git.jani.nikula@intel.com>
Date: Thu, 14 Mar 2024 14:07:41 +0200
Message-ID: <87r0gdqanm.fsf@intel.com>
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

On Thu, 07 Mar 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Switch a handful of places over to drm device based logging and WARNs,
> unify connector and crtc logging, etc.

Ping for review, please. :)


>
> Jani Nikula (6):
>   drm/modes: add drm_mode_print() to dump mode in drm_printer
>   drm/probe-helper: switch to drm device based logging
>   drm/modes: switch drm_mode_prune_invalid() to use struct drm_printer
>   drm/modes: switch to drm device based error logging
>   drm/sysfs: switch to drm device based logging
>   drm/client: switch to drm device based logging, and more
>
>  drivers/gpu/drm/drm_client_modeset.c | 129 +++++++++++++++------------
>  drivers/gpu/drm/drm_modes.c          |  51 +++++++----
>  drivers/gpu/drm/drm_probe_helper.c   |  41 ++++-----
>  drivers/gpu/drm/drm_sysfs.c          |  21 +++--
>  include/drm/drm_modes.h              |   2 +
>  5 files changed, 137 insertions(+), 107 deletions(-)

-- 
Jani Nikula, Intel
