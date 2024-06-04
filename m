Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39958FABF9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 09:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5377110E2FA;
	Tue,  4 Jun 2024 07:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JfTPqY7d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474FD10E2FA
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 07:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717486224; x=1749022224;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ms+mo4E4Xeu42EZvKUQ0AzYAurvxQvagwaNDrtZEtWM=;
 b=JfTPqY7d1w2A8HKlt03WQO8aNohcgWHazG+wT51He7QxnkcXDSAvEUpR
 5OGWAzFikidkc03ijSHYgZUTOmRxzu4TRqu1Kb5mGXKNF054n8Egk0c1e
 HA7d7Nb7jNKrXleYk+020i22igiPzgsz9NKGav3AXF1c4DZB1izRz5nlD
 taN0AeGYJMo8BYJsf5H1dIdVWkVT6gF8KiQSiba1nGd38QB7dF3WghiYh
 r0L62ORmfVeeMKn/kugPJZPElzj3SUzCOi4Ra7nI5pWh0o+jSAA+9CaoA
 orjecv75zhFbagSEtNhgPmr6LMGXPgy1Klazb8FVTKg/ovw+FSrtBd340 A==;
X-CSE-ConnectionGUID: 3v0QCb5/QZa1ogugqA9rGg==
X-CSE-MsgGUID: J8MoewnpT0Gm4qUQXKfVyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14137687"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="14137687"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 00:30:24 -0700
X-CSE-ConnectionGUID: +Nxvvn4WThiYwyIsejnHfQ==
X-CSE-MsgGUID: NZK6n2KqSCyTr5uWROZy8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="42232444"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 00:30:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, dri-devel@lists.freedesktop.org
Cc: mcanal@igalia.com
Subject: Re: [PATCH] drm/v3d: Fix compile with CONFIG_WERROR
In-Reply-To: <20240604024055.1792731-1-ashutosh.dixit@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240604024055.1792731-1-ashutosh.dixit@intel.com>
Date: Tue, 04 Jun 2024 10:30:18 +0300
Message-ID: <87v82pcghh.fsf@intel.com>
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

On Mon, 03 Jun 2024, Ashutosh Dixit <ashutosh.dixit@intel.com> wrote:
> Fix compile with CONFIG_WERROR by explicitly computing the max number of
> 7.1 and 4.2 counters.

Nitpick, the warning you're hitting is unused-const-variable. Werror
just turns it into an error.

>
> In file included from ../drivers/gpu/drm/v3d/v3d_drv.h:14,
>                  from ../drivers/gpu/drm/v3d/v3d_bo.c:26:
> ../drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: \
> 	error: =E2=80=98v3d_v42_performance_counters=E2=80=99 defined but not us=
ed \
> 	[-Werror=3Dunused-const-variable=3D]
>
> Fixes: 3cbcbe016c31 ("drm/v3d: Add Performance Counters descriptions for =
V3D 4.2 and 7.1")
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

This is not the fix that should be done. See [1].

BR,
Jani.


[1] https://lore.kernel.org/r/87msojqv89.fsf@intel.com

> ---
>  drivers/gpu/drm/v3d/v3d_drv.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index 556cbb400ba0..93dccb5f4c23 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -352,7 +352,9 @@ struct v3d_timestamp_query {
>  };
>=20=20
>  /* Maximum number of performance counters supported by any version of V3=
D */
> -#define V3D_MAX_COUNTERS ARRAY_SIZE(v3d_v71_performance_counters)
> +#define MAX(a, b) ((a) > (b) ? (a) : (b))
> +#define V3D_MAX_COUNTERS MAX(ARRAY_SIZE(v3d_v71_performance_counters), \
> +			     ARRAY_SIZE(v3d_v42_performance_counters))
>=20=20
>  /* Number of perfmons required to handle all supported performance count=
ers */
>  #define V3D_MAX_PERFMONS DIV_ROUND_UP(V3D_MAX_COUNTERS, \

--=20
Jani Nikula, Intel
