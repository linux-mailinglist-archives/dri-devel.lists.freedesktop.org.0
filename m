Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 265FD7C9391
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 10:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF2210E093;
	Sat, 14 Oct 2023 08:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2DF10E093;
 Sat, 14 Oct 2023 08:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697273498; x=1728809498;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fHTAeI3l4XQDaB/GNzh2C+XRjtoMqm0TgHpfTMeoA6U=;
 b=mzgfIzcdoLjbGCsNdmmbAC/ZYUcs5cuwl/E5lWKZc5DsbNT7GEYZpC2A
 NYHubDYh9p5nEEPTg5C18JpIakyZxamr+5AxXGh5iic21dMA5+h/2L4N2
 XBOEYGWxQ/h1pNDq8fDKwNQ6T/3lc5wlPfw9bKoD3bN6wxbniBlxPMBtR
 osW/uXKMpJdNV3kGC3uYbPVSCvJz1F+EppszxjVxWe5xcefEeCSSf5q7U
 bEbuSA79kKTzp3TsWAHbpZ0+JF0OEJHVkJvyiTv4yivcVAkGZRE7zx0td
 XR7ZuGeqi42rHAc+2Ob+oKDLfVOcSZU2YAIzM7i+JT8DNnIlwvfwc0UrB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="6875603"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="6875603"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2023 01:51:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1086434465"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; d="scan'208";a="1086434465"
Received: from phamt-mobl2.ccr.corp.intel.com (HELO intel.com)
 ([10.214.145.117])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2023 01:51:30 -0700
Date: Sat, 14 Oct 2023 10:51:25 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v2] drm/i915: Flush WC GGTT only on required platforms
Message-ID: <ZSpWjR+gtjt2oMJZ@ashyti-mobl2.lan>
References: <20231013134439.13579-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231013134439.13579-1-nirmoy.das@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Fri, Oct 13, 2023 at 03:44:39PM +0200, Nirmoy Das wrote:
> gen8_ggtt_invalidate() is only needed for limited set of platforms
> where GGTT is mapped as WC otherwise this can cause unwanted
> side-effects on XE_HP platforms where GFX_FLSH_CNTL_GEN6 is not
> valid.
> 
> v2: Add a func to detect wc ggtt detection (Ville)
> 
> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v6.2+
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Acked-by: Andi Shyti <andi.shyti@linux.intel.com>

I took some time to look at this and you can swap the a-b with
an r-b:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Thanks,
Andi
