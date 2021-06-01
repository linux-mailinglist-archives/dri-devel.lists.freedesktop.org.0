Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A0D39732F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 14:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD80D6EA32;
	Tue,  1 Jun 2021 12:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388286EA2E;
 Tue,  1 Jun 2021 12:27:06 +0000 (UTC)
IronPort-SDR: yx8AhJCDcQz4A3XveRi8hS2h+CGyt5YHgWBGl8dMSJqnqFkqrR9aY4L8sRIzSXGHU+JN2OUPmZ
 LiX8570ScdwQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="190650143"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="190650143"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 05:27:05 -0700
IronPort-SDR: fkQ2IEP/SExb5jxPolr4uhpRk/CHoHQ2VlrNSsi4erb0Bc1sJXEs744JkPg+dvBDV/k5+OnKOI
 z4NxoKSn3B9g==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="479259565"
Received: from ycohenha-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.54.130])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 05:27:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Add relocation exceptions for two
 other platforms
In-Reply-To: <20210601082847.78389-1-zbigniew.kempczynski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210601082847.78389-1-zbigniew.kempczynski@intel.com>
Date: Tue, 01 Jun 2021 15:26:59 +0300
Message-ID: <87lf7trcrw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 01 Jun 2021, Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.=
com> wrote:
> We have established previously we stop using relocations starting
> from gen12 platforms with Tigerlake as an exception. We keep this
> statement but we want to enable relocations conditionally for
> Rocketlake and Alderlake under require_force_probe flag set.
>
> Keeping relocations under require_force_probe flag is interim solution
> until IGTs will be rewritten to use softpin.
>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 26 +++++++++++++++----
>  1 file changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu=
/drm/i915/gem/i915_gem_execbuffer.c
> index 297143511f99..c0562dd14837 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -491,16 +491,32 @@ eb_unreserve_vma(struct eb_vma *ev)
>  	ev->flags &=3D ~__EXEC_OBJECT_RESERVED;
>  }
>=20=20
> +static inline bool

Please don't use the inline keyword in .c files. Let the compiler do its
job.


BR,
Jani.

> +platform_has_relocs_enabled(const struct i915_execbuffer *eb)
> +{
> +	/*
> +	 * Relocations are disallowed starting from gen12 with Tigerlake
> +	 * as an exception. We allow temporarily use relocations for Rocketlake
> +	 * and Alderlake when require_force_probe flag is set.
> +	 */
> +
> +	if (INTEL_GEN(eb->i915) < 12 || IS_TIGERLAKE(eb->i915))
> +		return true;
> +
> +	if (INTEL_INFO(eb->i915)->require_force_probe &&
> +		 (IS_ROCKETLAKE(eb->i915) || IS_ALDERLAKE_S(eb->i915) ||
> +		  IS_ALDERLAKE_P(eb->i915)))
> +		return true;
> +
> +	return false;
> +}
> +
>  static int
>  eb_validate_vma(struct i915_execbuffer *eb,
>  		struct drm_i915_gem_exec_object2 *entry,
>  		struct i915_vma *vma)
>  {
> -	/* Relocations are disallowed for all platforms after TGL-LP.  This
> -	 * also covers all platforms with local memory.
> -	 */
> -	if (entry->relocation_count &&
> -	    INTEL_GEN(eb->i915) >=3D 12 && !IS_TIGERLAKE(eb->i915))
> +	if (entry->relocation_count && !platform_has_relocs_enabled(eb))
>  		return -EINVAL;
>=20=20
>  	if (unlikely(entry->flags & eb->invalid_flags))

--=20
Jani Nikula, Intel Open Source Graphics Center
