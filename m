Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F755156C3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 23:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7025910F642;
	Fri, 29 Apr 2022 21:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1233C10F642;
 Fri, 29 Apr 2022 21:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651267410; x=1682803410;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=CzkvMQ+mbI3q7SVPTDZ648LAoSaCp1d1qTEy1w2C7Yk=;
 b=YdsNGSde3lVUbZ7Y4uwRx+zaLqGnvUmNRF0aC77tpw0ZCV+t92zSSHrX
 igCUQA+5XgdqDEJmyBzYxDSBxshWaPBQsU4Aoy7TCSCj8US32oslemZLU
 wPlCcSXQuYLNw/G3oB0HfoGWdieCF0BAX8+P1V1dLimRBL0wLkIOxdzeQ
 XK08k7uPiGG/VZsYJV6I02aInaZpWvSSLYeyxFYBJlwoebS/UzSHFNTW/
 n/Xjvo5RxDjll+ii0eqfOM+fTbvyj0EznmIMgsAh7FhVJlSSoBImnm2ej
 hFyut7+lrVifCdOk7iWij944CQHBwEa4UXnbEKNTPwPQfpEd5UGWl2QVA w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10332"; a="291949374"
X-IronPort-AV: E=Sophos;i="5.91,186,1647327600"; d="scan'208";a="291949374"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 14:23:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,186,1647327600"; d="scan'208";a="662541406"
Received: from ritikash-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.209.8.78])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 14:23:29 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220428041926.1483683-1-matthew.d.roper@intel.com>
References: <20220428041926.1483683-1-matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 0/4] i915: Turn on compute engine support
From: Jordan Justen <jordan.l.justen@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 29 Apr 2022 14:23:24 -0700
Message-ID: <165126740410.678423.2670480013006486900@jljusten-skl>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I did some light testing with our anvil (Vulkan) and iris (OpenGL)
Mesa drivers after applying these patches on top of drm-tip tagged
intel/CI_DRM_11574. All the unit tests that I tried passed. I also ran
the gl_manhattan31 benchmark which used the compute engine for iris
compute shader ops.

Series:

Reviewed-by: Jordan Justen <jordan.l.justen@intel.com>
Tested-by: Jordan Justen <jordan.l.justen@intel.com>

-Jordan

On 2022-04-27 21:19:22, Matt Roper wrote:
> Now that the necessary GuC-based hardware workarounds have landed, we're
> finally ready to actually enable compute engines for use by userspace.
> All of the "under-the-hood" heavy lifting already landed a while back in
> other series so all that remains now is to add I915_ENGINE_CLASS_COMPUTE
> to the uapi enum and add the CCS engines to the engine lists for the
> Xe_HP SDV and DG2.
>=20
> Userspace (Mesa) is linked in the ABI patch.  Existing IGT tests (e.g.,
> i915_hangman) provide test coverage for general engine behavior since com=
pute
> engines should follow the same general rules as other engines.  We've also
> recently added some additional subtests like
> igt@gem_reset_stats@shared-reset-domain to cover the user-visible impacts=
 of
> the compute engines sharing the same hardware reset domain as the render
> engine.
>=20
> v2:
>  - Update TLB invalidation register for compute engines and move it to a
>    separate patch since it isn't related to the new uapi.  (Tvrtko,
>    Prathap)
>  - Move new kerneldoc for pre-existing engine classes to a separate
>    patch.  (Andi)
>  - Drop the compute UMD merge request link for now because it also
>    included some additional multi-tile uapi that we're not ready to
>    upstream just yet.  Even if they don't have a disentangled MR ready
>    for reference, we still have the Mesa MR as a key userspace consumer.
>    (Tvrtko)
>=20
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>=20
> Daniele Ceraolo Spurio (1):
>   drm/i915: Xe_HP SDV and DG2 have up to 4 CCS engines
>=20
> Matt Roper (3):
>   drm/i915/uapi: Add kerneldoc for engine class enum
>   drm/i915/xehp: Add register for compute engine's MMIO-based TLB
>     invalidation
>   drm/i915/xehp: Add compute engine ABI
>=20
>  drivers/gpu/drm/i915/gt/intel_engine_user.c |  2 +-
>  drivers/gpu/drm/i915/gt/intel_gt.c          |  1 +
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  1 +
>  drivers/gpu/drm/i915/i915_drm_client.c      |  1 +
>  drivers/gpu/drm/i915/i915_drm_client.h      |  2 +-
>  drivers/gpu/drm/i915/i915_pci.c             |  6 +-
>  include/uapi/drm/i915_drm.h                 | 62 +++++++++++++++++++--
>  7 files changed, 65 insertions(+), 10 deletions(-)
>=20
> --=20
> 2.35.1
>
