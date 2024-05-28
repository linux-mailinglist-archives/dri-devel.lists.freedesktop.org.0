Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA638D1F2A
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 16:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1391110E1F2;
	Tue, 28 May 2024 14:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSwLXPAv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD33B10E0E8;
 Tue, 28 May 2024 14:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716907570; x=1748443570;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WM1Ru3mLX4zWI02W0VPy8yVNN3HZVq5joCnDe1A1HyA=;
 b=QSwLXPAvJeO0VBUuxOUE04Wx2KSvcXFWC2LUamm+rtwVyGVg0zj3rIuJ
 hof3OdS3VoMvtFpHScvKyhucMgqm+3+diM+j25DcUjeac/qn5qdXmJlYU
 HZi7iXGkOR8XpEZYe3tenPSFrq0W1wS1Ai/Mv0Nj2h+r5Z3iBizNrzQdg
 PZxbPtxc5jCvXqffeL0/3nynGB8nQqFkly9efUVUEnnnmq3NRNuTwGG/l
 nD/mHz3dCP5pLyB18v1GDQrQmV6sAr6UO7BhSp5/KJsrWXowiofUOBVXV
 qaVEDVligAO607jMOXFXHRPR0jBb5YtIVeMuYC/WaeJ+ryHkKl3U/E1wS w==;
X-CSE-ConnectionGUID: Fcq0NFNyRqSETP1UTMp52w==
X-CSE-MsgGUID: sIiWD/5dTseYsDrMqIrM3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13385500"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13385500"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 07:46:09 -0700
X-CSE-ConnectionGUID: xGs5gK3MRcO4NYbEnddi9A==
X-CSE-MsgGUID: OXNqiTS6TfG+Z+wOQgedAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="35116733"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO [10.245.244.233])
 ([10.245.244.233])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 07:46:05 -0700
Message-ID: <706e63abf12b9cf76d43cf67999cbb7baa06ebb0.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: replace format-less snprintf() with strscpy()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>,  Oded Gabbay <ogabbay@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, Matthew
 Brost <matthew.brost@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>,  intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Date: Tue, 28 May 2024 16:46:02 +0200
In-Reply-To: <20240528133251.2310868-1-arnd@kernel.org>
References: <20240528133251.2310868-1-arnd@kernel.org>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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

On Tue, 2024-05-28 at 15:32 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Using snprintf() with a format string from task->comm is a bit
> dangerous since the string may be controlled by unprivileged
> userspace:
>=20
> drivers/gpu/drm/xe/xe_devcoredump.c: In function
> 'devcoredump_snapshot':
> drivers/gpu/drm/xe/xe_devcoredump.c:184:9: error: format not a string
> literal and no format arguments [-Werror=3Dformat-security]
> =C2=A0 184 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snprintf(ss-=
>process_name, sizeof(ss->process_name),
> process_name);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ^~~~~~~~
>=20
> In this case there is no reason for an snprintf(), so use a simpler
> string copy.
>=20
> Fixes: b10d0c5e9df7 ("drm/xe: Add process name to devcoredump")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Thanks,

Will pick up and apply as soon as our CI is fit for fight.
/Thomas



> ---
> =C2=A0drivers/gpu/drm/xe/xe_devcoredump.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 1643d44f8bc4..1973bfaece40 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -181,7 +181,7 @@ static void devcoredump_snapshot(struct
> xe_devcoredump *coredump,
> =C2=A0		if (task)
> =C2=A0			process_name =3D task->comm;
> =C2=A0	}
> -	snprintf(ss->process_name, sizeof(ss->process_name),
> process_name);
> +	strscpy(ss->process_name, process_name);
> =C2=A0	if (task)
> =C2=A0		put_task_struct(task);
> =C2=A0

