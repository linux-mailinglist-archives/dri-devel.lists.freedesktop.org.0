Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDDDD07F52
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA74D10E86E;
	Fri,  9 Jan 2026 08:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iEts14dp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3568D10E86E;
 Fri,  9 Jan 2026 08:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767948583; x=1799484583;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=xGSddazHMJk2XjbDUv/uDrGUInG2phAIdiHXrLkxr08=;
 b=iEts14dpD93tUx91I86VjKg7gr8kZYe052Hzchjmjm+vKrUq2vYEJfbE
 +nMKAbYyWRkRwrj/3HLCTBEm74srvDPqkM04psmm8y+BkOFz4qf8oGAJl
 rhRO2EhiFGvJIaTIGlKJKPAtmz3+ZOcOXV0PsCjH9TdAW8zVvIj4ihBlZ
 D5wXmbBtCZPXeeYmWmKORD45HbRDu9cgDrxcf0oUM6oo3hFRMLxyqWNYt
 gLUxmK5F49YTJA2tNmt8mfArXYKYACYiIL9+qkK4Yui7GAdYZivIYKUkv
 FsFGRikEhK/Sed3ZHHOfRPwBN6472edp8mebiaScz+zyoFJ/vC9RWhMmI A==;
X-CSE-ConnectionGUID: 5d5hvfEcTLu7oBQZZHRQaA==
X-CSE-MsgGUID: f0hKuqneRlOFeBQudTemkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69241853"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="69241853"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:49:43 -0800
X-CSE-ConnectionGUID: Lfba4l7SQXi2c9Z9N9W40g==
X-CSE-MsgGUID: 6dUu6ORnR2WJgiSLpb4D4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="240926195"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:49:38 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kaushlendra Kumar <kaushlendra.kumar@intel.com>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Kaushlendra Kumar
 <kaushlendra.kumar@intel.com>, Jouni =?utf-8?Q?H=C3=B6gander?=
 <jouni.hogander@intel.com>, Animesh Manna <animesh.manna@intel.com>
Subject: Re: [PATCH] drm/i915/display: use port not transcoder for
 PORT_ALPM_CTL
In-Reply-To: <20260109050021.2017982-1-kaushlendra.kumar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260109050021.2017982-1-kaushlendra.kumar@intel.com>
Date: Fri, 09 Jan 2026 10:49:35 +0200
Message-ID: <6dfa37a9c19089bda5efe1c43d1a40d88d53cf89@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 09 Jan 2026, Kaushlendra Kumar <kaushlendra.kumar@intel.com> wrote:
> intel_alpm_disable() incorrectly passes cpu_transcoder as the
> index to PORT_ALPM_CTL(), which expects an enum port. This
> writes to the wrong register, potentially corrupting state on
> unrelated ports.
>
> Use dp_to_dig_port(intel_dp)->base.port to access the correct
> port-indexed register.

Good catch!

For future reference, please also do 'git blame' on the source to find
out which commit introduced the error, and add a proper Fixes: tag. This
way we know the kernels that are affected.

We have to hop through code movement and multiple other changes to
eventually land on commit 1ccbf135862b ("drm/i915/psr: Enable ALPM on
source side for eDP Panel replay") adding the
PORT_ALPM_CTL(cpu_transcoder) usage in intel_psr.c.

'dim fixes 1ccbf135862b' gives us:

Fixes: 1ccbf135862b ("drm/i915/psr: Enable ALPM on source side for eDP Pane=
l replay")
Cc: Jouni H=C3=B6gander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.10+

Which I'd usually just trim to the author/reviewers like this:

Fixes: 1ccbf135862b ("drm/i915/psr: Enable ALPM on source side for eDP Pane=
l replay")
Cc: Jouni H=C3=B6gander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: <stable@vger.kernel.org> # v6.10+

And these are more important Cc's for the patch than any of the
maintainers or dri-devel, which IMO should be dropped, regardless of
what get_maintainer.pl says.

Obviously, a backport to kernels v6.10..v6.15 will fail due to the other
changes, but it doesn't change the fact that the original broken commit
was 1ccbf135862b in v6.10, and that's what we should reference.


BR,
Jani.

Oh, and also,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_alpm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index 6372f533f65b..09ba1c2be16c 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -557,6 +557,7 @@ void intel_alpm_disable(struct intel_dp *intel_dp)
>  {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
>  	enum transcoder cpu_transcoder =3D intel_dp->alpm.transcoder;
> +	enum port port =3D dp_to_dig_port(intel_dp)->base.port;
>=20=20
>  	if (DISPLAY_VER(display) < 20 || !intel_dp->alpm_dpcd)
>  		return;
> @@ -568,7 +569,7 @@ void intel_alpm_disable(struct intel_dp *intel_dp)
>  		     ALPM_CTL_ALPM_AUX_LESS_ENABLE, 0);
>=20=20
>  	intel_de_rmw(display,
> -		     PORT_ALPM_CTL(cpu_transcoder),
> +		     PORT_ALPM_CTL(port),
>  		     PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE, 0);
>=20=20
>  	drm_dbg_kms(display->drm, "Disabling ALPM\n");

--=20
Jani Nikula, Intel
