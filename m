Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AC070AC5C
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 06:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989A010E1B3;
	Sun, 21 May 2023 04:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B25310E1AE;
 Sun, 21 May 2023 04:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684643454; x=1716179454;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=LPpM6aQhCvcVwBBGSwwi/M9jpM2Vsn7igU+v39JQJDo=;
 b=Rr1JQElr0x98CnGgEKKlBjQBgY9yq1oOaK9Wmd7v3a1DcNEkqJbEXiQH
 f/+Kl/0wdbD069nphCTXJAi2ye85l2WyEBkzYa4xZn5qBw0IE3ABtHQA8
 25bGp5+eL8og14Pm4JLbNuP220wHxnfAvOVX7d1ekF2vKpnxUfPudE31d
 cB5RPmDGIUYkw3XTfXkCGIsiqEP1b148gyeWlrS0CniuDErbLKCVpFfY/
 pW2KP1D4YzDw61pcJ/2txVrkvr/oyoOOlo5YhwwA9aXdbDb7V+42Qw2dw
 gGpzDyfUZPiQ4MiLeZvN9QoDx9DhxrQHVlwkpcSo10X5oRH5g7JtN37qU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10716"; a="351515665"
X-IronPort-AV: E=Sophos;i="6.00,181,1681196400"; d="scan'208";a="351515665"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2023 21:30:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10716"; a="703058773"
X-IronPort-AV: E=Sophos;i="6.00,181,1681196400"; d="scan'208";a="703058773"
Received: from wmarrero-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.212.185.130])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2023 21:30:53 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230519051103.3404990-3-fei.yang@intel.com>
References: <20230519051103.3404990-1-fei.yang@intel.com>
 <20230519051103.3404990-3-fei.yang@intel.com>
Subject: Re: [PATCH v10 2/2] drm/i915: Allow user to set cache at BO creation
From: Jordan Justen <jordan.l.justen@intel.com>
To: fei.yang@intel.com, intel-gfx@lists.freedesktop.org
Date: Sat, 20 May 2023 21:30:52 -0700
Message-ID: <168464345246.1509813.13613662359356255520@jljusten-skl>
User-Agent: alot/0.10
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, Fei Yang <fei.yang@intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-18 22:11:03,  wrote:
> From: Fei Yang <fei.yang@intel.com>
>=20
> To comply with the design that buffer objects shall have immutable
> cache setting through out their life cycle, {set, get}_caching ioctl's
> are no longer supported from MTL onward. With that change caching
> policy can only be set at object creation time. The current code
> applies a default (platform dependent) cache setting for all objects.
> However this is not optimal for performance tuning. The patch extends
> the existing gem_create uAPI to let user set PAT index for the object
> at creation time.
> The new extension is platform independent, so UMD's can switch to using
> this extension for older platforms as well, while {set, get}_caching are
> still supported on these legacy paltforms for compatibility reason.
>=20
> Test igt@gem_create@create_ext_set_pat posted at
> https://patchwork.freedesktop.org/series/117695/
>=20
> Tested with https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/228=
78
>=20
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Acked-by: Jordan Justen <jordan.l.justen@intel.com>

Nevertheless, I'm still disappointed my suggestion was so quickly shot
down.

I tried to look over our usage Mesa of i915 extensions, and found
this:

I915_GEM_CREATE_EXT_MEMORY_REGIONS:

 * If DRM_I915_QUERY_MEMORY_REGIONS is found

I915_GEM_CREATE_EXT_PROTECTED_CONTENT:

 * Probed via the current "robust" method. Resulted in 8s driver
   startup delay in some bad scenarios.

 * Will be guarded by I915_PARAM_PXP_STATUS when available in future

I915_CONTEXT_CREATE_EXT_SETPARAM (I915_CONTEXT_PARAM_ENGINES):

 * If DRM_I915_QUERY_ENGINE_INFO is found

I915_GEM_CREATE_EXT_SET_PAT:

 * When platform is mtl or newer

I think we will continue to try to find workarounds that imply the
extension's existence, but it could be nice to have a generic way to
find out what extensions the kernel knows about.

-Jordan
