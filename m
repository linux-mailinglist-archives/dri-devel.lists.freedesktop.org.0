Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EF4C00291
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 11:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A023B10E3A0;
	Thu, 23 Oct 2025 09:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8hXX5Wu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D8910E39B;
 Thu, 23 Oct 2025 09:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761210899; x=1792746899;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Vqadwd1I2CeWoBVNMzKv6Z1Yupb4AHkaifFRp8uiRYM=;
 b=B8hXX5WuNDErhv/oZubAoaPLBJ4iwRg3NN5LuFIdsf1rs32cxo8vpWPH
 YQDfVyipYgbr+dMsKCmI9NU0qlIImrgm8DHV3/JIeU3ev+L4EmGDrjLMK
 LPBuUjeOcG+1XeeeAQEHTxmxorIUs53Z0D/znFGJXTlCxUaTA0woeJUNV
 FolpEUm9ZZEosdGCrubDcP+AEaPYO8w3nlmd6SnTr9AWNOriFf1KPNQfe
 bj8Goti7XWjDG0VCRyTfyXRJRWvs+vmdlwZ57D6zAXg12IOE+gmgsG2Es
 cuk9wkNdgSJlCh2CgooziJw7PXLElAeqgb35U4wkWquDEm3qnmzjgHUoF A==;
X-CSE-ConnectionGUID: 1TxN3bRHTyGXVbQ5dKqiuw==
X-CSE-MsgGUID: IfnzNf0lRdK6k3GcGjM5yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63470404"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="63470404"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:14:58 -0700
X-CSE-ConnectionGUID: VANhW/4JTwC/iSVr31uJJg==
X-CSE-MsgGUID: LjsW2HyGQuyOI/7p7XWBQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="183281702"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.158])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:14:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Animesh Manna <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>, Jouni =?utf-8?Q?H=C3=B6gander?=
 <jouni.hogander@intel.com>
Subject: Re: [PATCH 2/8] drm/i915/alpm: alpm_init() for DP2.1
In-Reply-To: <20251023084147.572535-3-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251023084147.572535-1-animesh.manna@intel.com>
 <20251023084147.572535-3-animesh.manna@intel.com>
Date: Thu, 23 Oct 2025 12:14:53 +0300
Message-ID: <fe6a48ba86619b390cc44f187bd00ccf976ec3df@intel.com>
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

On Thu, 23 Oct 2025, Animesh Manna <animesh.manna@intel.com> wrote:
> Initialize mutex for DP2.1 alpm.

Let's not do that for every detect cycle.

Perhaps intel_alpm_init() needs to be split to one-time init and sink
specific init.

BR,
Jani.


>
> Cc: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 475518b4048b..3f9cbeb215ed 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -6073,8 +6073,12 @@ intel_dp_detect(struct drm_connector *_connector,
>  	if (ret =3D=3D 1)
>  		connector->base.epoch_counter++;
>=20=20
> -	if (!intel_dp_is_edp(intel_dp))
> +	if (!intel_dp_is_edp(intel_dp)) {
> +		if (DISPLAY_VER(display) >=3D 35)
> +			intel_alpm_init(intel_dp);
> +
>  		intel_psr_init_dpcd(intel_dp);
> +	}
>=20=20
>  	intel_dp_detect_dsc_caps(intel_dp, connector);

--=20
Jani Nikula, Intel
