Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E36B9E5650
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 14:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2DE10E3B0;
	Thu,  5 Dec 2024 13:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="icPJih1A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E5E10E3B0;
 Thu,  5 Dec 2024 13:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733404599; x=1764940599;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nWTQHDX/bKLu0iRhgiEnvyYdXooW/A7kHsbG7V9YG2M=;
 b=icPJih1AhcMwDkd16NhrGq4li+EoxgHLwbV9dang9xOxnItmjaVu0FLQ
 HUtFROPaMtSchKBD9V8PGKBeov4Jrox8dtSSXf83W7iaagioa8UoEDePJ
 oJzTvn0qfPsElg8PACg+x3sTamWkrrK3Q0TWvX69PPOqMRolp0kRcJZis
 UbmHKMQqZQG37Nn7fnSDpzLVifSkzctbLr8vr2vIM6B90CdjeoB2hXpil
 awCT8BWg+GoIbyRc5i1ipE8nrvm8hllqY1kR/4TeopeV1C+0yKcrvHlRH
 77ndig7iwt0rvqabjYrpXxn8GZZNQgXfOCJm6KnJOUvEJYkgtSE8miCZN Q==;
X-CSE-ConnectionGUID: wTrjAw9gS8qGFDyjzJDCLA==
X-CSE-MsgGUID: NFt+QzX2SSGwQVjFeABTGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="56194094"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="56194094"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 05:16:39 -0800
X-CSE-ConnectionGUID: 8kki0tRMSzKVqclKruvgGg==
X-CSE-MsgGUID: jOb8vqrFRFKZf99C3q/p9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="94287103"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.41])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 05:16:36 -0800
Date: Thu, 5 Dec 2024 14:16:32 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/i915/display: use drm_print_hex_dump() for crtc
 state dump
Message-ID: <Z1GnsMJXRvMgpCdf@ashyti-mobl2.lan>
References: <cover.1733392101.git.jani.nikula@intel.com>
 <12d76e34ed4c508524f768a46d2a2beb09991a23.1733392101.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12d76e34ed4c508524f768a46d2a2beb09991a23.1733392101.git.jani.nikula@intel.com>
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

Hi Jani,

On Thu, Dec 05, 2024 at 11:49:34AM +0200, Jani Nikula wrote:
> Use the drm_printer based printer to get the device specific printing of
> the hex dump.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

...

> -static void
> -intel_dump_buffer(const char *prefix, const u8 *buf, size_t len)
> -{
> -	if (!drm_debug_enabled(DRM_UT_KMS))
> -		return;

We lose this check now, anyway,

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
