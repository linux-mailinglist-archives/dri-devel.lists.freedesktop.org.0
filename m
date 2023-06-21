Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D29BA737C72
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 09:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376C210E3E1;
	Wed, 21 Jun 2023 07:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB37210E3DD;
 Wed, 21 Jun 2023 07:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687333131; x=1718869131;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=z9Sj3YeuNpGi+kC2OKSHhpUo2+Q4p5ltLVJ8mQ7FYcs=;
 b=lsZFUJHMXDn1WkHNOrB27c8VOeC679RtnxscpRjoq7wTpYmymHZgx668
 EMC5gSxUjQltGd+3nBdViML8tSv6T6/ErqSKuuu6dbEAVgaf6zIqwrIFo
 YKEdl6l1QN3HRbTiiZ4UZJZ25zTBaJsFqESLueAIRPlQ1nhed8uHFP3/M
 154493JVE/iWdyitys5ud5IhZV/dEVmN3UfdtDZ3Z2mV7CbeSBn0mSJBQ
 rCrolMJwtIPhfBp6oaZXmAA6pit3/JZnZvEfiKr499/gUW1ru5jRbAqvh
 R6di8ArTUXZ4VlOFLcfPRGsT5rE4T/HuVBxJtITs6w1BcBL7eeAYmc2fh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="389532832"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; d="scan'208";a="389532832"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 00:38:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="888553416"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; d="scan'208";a="888553416"
Received: from dafnaroz-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.63.122])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 00:38:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 4/4] drm/i915: Implement DRM_IOCTL_GET_RESET
In-Reply-To: <20230621005719.836857-5-andrealmeid@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230621005719.836857-1-andrealmeid@igalia.com>
 <20230621005719.836857-5-andrealmeid@igalia.com>
Date: Wed, 21 Jun 2023 10:38:06 +0300
Message-ID: <87ilbhfeox.fsf@intel.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Timur =?utf-8?Q?Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Jun 2023, Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:
> Implement get_reset ioctl for i915.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c    | 18 ++++++++++++++++++
>  drivers/gpu/drm/i915/gem/i915_gem_context.h    |  2 ++
>  .../gpu/drm/i915/gem/i915_gem_context_types.h  |  2 ++
>  drivers/gpu/drm/i915/i915_driver.c             |  2 ++
>  4 files changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_context.c
> index 9a9ff84c90d7..fba8c9bbc7e9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1666,6 +1666,8 @@ i915_gem_create_context(struct drm_i915_private *i9=
15,
>  		ctx->uses_protected_content =3D true;
>  	}
>=20=20
> +	ctx->dev_reset_counter =3D i915_reset_count(&i915->gpu_error);
> +
>  	trace_i915_context_create(ctx);
>=20=20
>  	return ctx;
> @@ -2558,6 +2560,22 @@ int i915_gem_context_reset_stats_ioctl(struct drm_=
device *dev,
>  	return 0;
>  }
>=20=20
> +int i915_gem_get_reset(struct drm_file *filp, struct drm_device *dev,
> +		       struct drm_get_reset *reset)
> +{
> +	struct i915_gem_context *ctx;
> +
> +	ctx =3D i915_gem_context_lookup(file->driver_priv, reset->ctx_id);
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
> +
> +	reset->dev_reset_count =3D i915_reset_count(&i915->gpu_error) - ctx->de=
v_reset_count;
> +	reset->ctx_reset_count =3D ctx->guilty_count;
> +
> +	i915_gem_context_put(ctx);

Usually return is preceded by a blank line.

> +	return 0;
> +}
> +
>  /* GEM context-engines iterator: for_each_gem_engine() */
>  struct intel_context *
>  i915_gem_engines_iter_next(struct i915_gem_engines_iter *it)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/dr=
m/i915/gem/i915_gem_context.h
> index e5b0f66ea1fe..9ee119d8123f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> @@ -138,6 +138,8 @@ int i915_gem_context_setparam_ioctl(struct drm_device=
 *dev, void *data,
>  				    struct drm_file *file_priv);
>  int i915_gem_context_reset_stats_ioctl(struct drm_device *dev, void *dat=
a,
>  				       struct drm_file *file);
> +int i915_gem_get_reset(struct drm_file *file_priv, struct drm_device *de=
v,
> +		       struct drm_get_reset *reset);
>=20=20
>  struct i915_gem_context *
>  i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/=
gpu/drm/i915/gem/i915_gem_context_types.h
> index cb78214a7dcd..2e4cf0f0d3dc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> @@ -414,6 +414,8 @@ struct i915_gem_context {
>  		/** @engines: list of stale engines */
>  		struct list_head engines;
>  	} stale;
> +
> +	uint64_t dev_reset_counter;

u64 please. i915 only uses the kernel fixed types.

Please do wait for review on the actual content before reposting.

BR,
Jani.

>  };
>=20=20
>  #endif /* __I915_GEM_CONTEXT_TYPES_H__ */
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i9=
15_driver.c
> index 97244541ec28..640304141ada 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1805,6 +1805,8 @@ static const struct drm_driver i915_drm_driver =3D {
>  	.postclose =3D i915_driver_postclose,
>  	.show_fdinfo =3D i915_drm_client_fdinfo,
>=20=20
> +	.get_reset =3D i915_gem_get_reset,
> +
>  	.prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>  	.gem_prime_import =3D i915_gem_prime_import,

--=20
Jani Nikula, Intel Open Source Graphics Center
