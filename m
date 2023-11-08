Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FAA7E52D1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 10:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723BE10E3A8;
	Wed,  8 Nov 2023 09:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0086110E3A8;
 Wed,  8 Nov 2023 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699436877; x=1730972877;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=DstufyMbrXxk5zdtI4ih0M8jtLGV4pTkpWCJa5YaL34=;
 b=AOeN30gP6VR0pzNLoLZaeAXthvdHOsxT+lKp7dlLDSNBgjIZ+IU3Wb44
 V5vFWaqTMMHjWw6tr6xQBvGtJt3VOV/Y8+CgjOkcYuWOscFVPMfss+Mw9
 sViFUYcZhUjCXWH2bjXt60A5BQYcGjJRUQSoYodfa395GlJOTpjQVaWaF
 mBbPTmQO+uDtEyuhxZ6If9hR16ySB8hhgqRcIKX7tRAk9MfnKF2+YPLIj
 fOduuTaowDLij/AiXdRVwl1nFeBlGLxSlYviXnOSQe9Txg59Rr+jeVCKf
 soi4EOx73aIHDXgHa0nUL3v3gk7Wf7an4GbHmUQs10/njC57LwKXjCSH5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="2674668"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="2674668"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 01:47:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="10747322"
Received: from rwyszeck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 01:47:54 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sam James <sam@gentoo.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm: i915: Adapt to -Walloc-size
In-Reply-To: <20231107215538.1891359-1-sam@gentoo.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231107215538.1891359-1-sam@gentoo.org>
Date: Wed, 08 Nov 2023 11:47:50 +0200
Message-ID: <87jzqsy3sp.fsf@intel.com>
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
Cc: Sam James <sam@gentoo.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 07 Nov 2023, Sam James <sam@gentoo.org> wrote:
> GCC 14 introduces a new -Walloc-size included in -Wextra which errors out
> like:
> ```
> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c: In function =E2=80=98eb_c=
opy_relocations=E2=80=99:
> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1681:24: error: allocation=
 of insufficient size =E2=80=981=E2=80=99 for type =E2=80=98struct drm_i915=
_gem_relocation_entry=E2=80=99 with size =E2=80=9832=E2=80=99 [-Werror=3Dal=
loc-size]
>  1681 |                 relocs =3D kvmalloc_array(size, 1, GFP_KERNEL);
>       |                        ^
>
> ```
>
> So, just swap the number of members and size arguments to match the proto=
type, as
> we're initialising 1 element of size `size`. GCC then sees we're not
> doing anything wrong.
>
> Signed-off-by: Sam James <sam@gentoo.org>

The short answer,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

but please read on.

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu=
/drm/i915/gem/i915_gem_execbuffer.c
> index 683fd8d3151c..45b9d9e34b8b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1678,7 +1678,7 @@ static int eb_copy_relocations(const struct i915_ex=
ecbuffer *eb)
>  		urelocs =3D u64_to_user_ptr(eb->exec[i].relocs_ptr);
>  		size =3D nreloc * sizeof(*relocs);
>=20=20
> -		relocs =3D kvmalloc_array(size, 1, GFP_KERNEL);
> +		relocs =3D kvmalloc_array(1, size, GFP_KERNEL);

Based on the patch context, we should really be calling:

	kvmalloc_array(nreloc, sizeof(*relocs), GFP_KERNEL);

and we'd get mul overflow checks too.

However, the code below also needs size, unless it's refactored to
operate on multiples of sizeof(*relocs) and it all gets a bit annoying.

Maybe there's a better way, but for the short term the patch at hand is
no worse than what we currently have, and it'll silence the warning, so
let's go with this.


>  		if (!relocs) {
>  			err =3D -ENOMEM;
>  			goto err;

--=20
Jani Nikula, Intel
