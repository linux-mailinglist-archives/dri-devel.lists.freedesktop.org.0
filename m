Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5142D9DE6FB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 14:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE6410EE11;
	Fri, 29 Nov 2024 13:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FPYwbl/m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC4B10EE11;
 Fri, 29 Nov 2024 13:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732885699; x=1764421699;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ymVZB3HtED4Q8PkSQhbePKzyxIi3QdvZ85qTR8UCtgA=;
 b=FPYwbl/mKD40cZ3CKu1vUJcmh1wZDLHSS9Bf5CuFE8qJZ000/WxY0p/I
 ljFYjYXCLswWDpfSCCrIiO6LDkVTMksLT393KTFkCza3AO9H8MmoFG/im
 STEjTxMyrX/t3xXSJz/wotE3IC15EWhrJ3kxN991f0cmRt4n0AULcAb/f
 Ona9mCkAEWais5OhjJikw8KjBCOqHAR5wOTaKA9WRyayL2o1u98QIa41G
 EUM0gBTjKVl+MbeDHNmkOBGd4vDr4GAjXu9RvAtxXT5HHueXWW0MCmlgW
 K56PKjQIOMms0x8xMTznnGuWPXnPYIDp9au0PJm8v58Wg8TxnnfzGB9sC Q==;
X-CSE-ConnectionGUID: qkrDPL4vQbOnpD2wkj635A==
X-CSE-MsgGUID: IBcSCaiJQ/uMmcQjC/5vYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="55617532"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; d="scan'208";a="55617532"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 05:08:19 -0800
X-CSE-ConnectionGUID: DKLcYPknQ169UhED397FGg==
X-CSE-MsgGUID: RRhf3RyPQtKpnHknLRoaRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="97524325"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.241])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 05:08:17 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/modes: Fix drm_mode_vrefres() docs
In-Reply-To: <20241129042629.18280-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241129042629.18280-1-ville.syrjala@linux.intel.com>
 <20241129042629.18280-3-ville.syrjala@linux.intel.com>
Date: Fri, 29 Nov 2024 15:08:10 +0200
Message-ID: <87a5di6vd1.fsf@intel.com>
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

On Fri, 29 Nov 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> We no longer store a cache vrefresh value in the mode.
> Remove the stale information from drm_vrefresh() docs.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_modes.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 71573b85d924..e72f855fc495 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1282,8 +1282,7 @@ EXPORT_SYMBOL(drm_mode_set_name);
>   * @mode: mode
>   *
>   * Returns:
> - * @modes's vrefresh rate in Hz, rounded to the nearest integer. Calcula=
tes the
> - * value first if it is not yet set.
> + * @modes's vrefresh rate in Hz, rounded to the nearest integer.
>   */
>  int drm_mode_vrefresh(const struct drm_display_mode *mode)
>  {

--=20
Jani Nikula, Intel
