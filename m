Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD479D3AA3C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 14:23:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6753A10E458;
	Mon, 19 Jan 2026 13:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oBqUf4gf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E20410E456;
 Mon, 19 Jan 2026 13:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768829007; x=1800365007;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=EeY2uaEGnTwq+4ZaogD0q59x2qILS3XqGNqn+Mciofc=;
 b=oBqUf4gfvYRVZ6/Kk3OZpcDcn0TFDe4tugOHPalmTkU81j23IazhcF8h
 c46zBgPNM9RAbGvN0tPVNSiLjf8Ct8yvxQSYpWWmTY4ogzltLKc7IUYBs
 jwXHH2r0wr/d8ImiCbQbOzcVJ06pGtoWWuOaIkK3aMfIkCrQVEBSVacLt
 A7rKNiJGkGe0eJphNYH5zFDETu+0YswawWEXi8uAv71gSS0MnXOi7xVgb
 EIg3+F88YkihcIyudhxyluyv6IETFgk2WYto6U43BNQXTmffWkA8lbLlk
 MMpPvZUZAfM5/hrUnWLHY90ynis5ZvH4szSW+DgfVszF8+YvjQH4sAfGx A==;
X-CSE-ConnectionGUID: 0kuBXdqRS52/e0DB6tbcMg==
X-CSE-MsgGUID: 6uPWjFJDSnKGpdS1b/h5TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69948439"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="69948439"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 05:23:26 -0800
X-CSE-ConnectionGUID: xcFkq0vmRnucJbCLtIeBPg==
X-CSE-MsgGUID: dVt4dC0LS8SC5HorO45NtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="205485240"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.12])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 05:23:21 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tomasz.pakula.oficjalny@gmail.com, bernhard.berger@gmail.com
Subject: Re: [PATCH 01/17] drm/amd/display: Return if DisplayID not found in
 parse_amd_vsdb()
In-Reply-To: <20260119011146.62302-2-tomasz.pakula.oficjalny@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
 <20260119011146.62302-2-tomasz.pakula.oficjalny@gmail.com>
Date: Mon, 19 Jan 2026 15:23:18 +0200
Message-ID: <b535614d27e30831628b4a70b7ed825fd03791d4@intel.com>
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

On Mon, 19 Jan 2026, Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>=
 wrote:
> [Why]
> The function would continue to try to parse EDID even if DisplayID
> extension block wasn't found. Sometimes it got lucky and found AMD vsdb
> in CEA extension block which made debugging harder.
>
> [How]
> Add a return if DisplayID extension block wasn't found

Maybe don't use homegrown EDID parsing, but use drm_edid.c instead?

BR,
Jani.

>
> Signed-off-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 655c9fcb078a..a0d23853b8fc 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -13113,6 +13113,9 @@ static int parse_amd_vsdb(struct amdgpu_dm_connec=
tor *aconnector,
>  			break;
>  	}
>=20=20
> +	if (i =3D=3D edid->extensions)
> +		return false;
> +
>  	while (j < EDID_LENGTH - sizeof(struct amd_vsdb_block)) {
>  		struct amd_vsdb_block *amd_vsdb =3D (struct amd_vsdb_block *)&edid_ext=
[j];
>  		unsigned int ieeeId =3D (amd_vsdb->ieee_id[2] << 16) | (amd_vsdb->ieee=
_id[1] << 8) | (amd_vsdb->ieee_id[0]);

--=20
Jani Nikula, Intel
