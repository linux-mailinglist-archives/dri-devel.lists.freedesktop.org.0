Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE19A123E7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 13:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9903510E66D;
	Wed, 15 Jan 2025 12:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R5pIvm9T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6127910E674
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 12:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736944828; x=1768480828;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=i+iuYPqUI/YYbPP8WquJEnDGp//hV+sAJ0VeYA1mF00=;
 b=R5pIvm9TrqKNLFkVL5N24dLBoUtSQW/oNaLSDupWtbB9zoJR4rEzepTe
 lY3LM5Ed8m9FYHNu0JLc/Mtiz9ilw2CrgyFSGed3MIyg0f7ULTCCHTivK
 TPKfv+kcPeK2BTVs0vDtfF3+Lp8WFqQ6iK4+2/8pZHr40LbkQ9vkCwdWv
 jMwKNO/EQUJEJwysqEuNQ3xDBqX1/axWKWycuyXuRwFBjg1Msb1EowQlz
 imkuHApACvBsPjShEjSTZSbYFQvXS+Xw//ujOk85Zuu8Ma1PN5LflZ1yJ
 RjTaQ22Rxq7kvctYDp35SDHygGG0i33NDUnlwNvesvebyrjFF1w1P1YpD g==;
X-CSE-ConnectionGUID: jAE8GzkZTj2zCbehJy/rQg==
X-CSE-MsgGUID: HauJBHsSS3u8Jw45ubd5IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="24876061"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="24876061"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 04:40:28 -0800
X-CSE-ConnectionGUID: VI2/pHNPSaOVoPmidtWqSg==
X-CSE-MsgGUID: 39JSLQp/QKCbIe7LomtLzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="105663999"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.51])
 ([10.245.246.51])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 04:40:26 -0800
Message-ID: <a2cadd9da0eed757b1a6e4727d5c9bc3adeed768.camel@linux.intel.com>
Subject: Re: [PATCH] drm/tests/buddy: fix build with unused prng
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Date: Wed, 15 Jan 2025 13:40:23 +0100
In-Reply-To: <20250115123734.154243-2-matthew.auld@intel.com>
References: <20250115123734.154243-2-matthew.auld@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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

On Wed, 2025-01-15 at 12:37 +0000, Matthew Auld wrote:
> We no longer use the prng, which leads to the following warning:
>=20
> drivers/gpu/drm/tests/drm_buddy_test.c: In function
> =E2=80=98drm_test_buddy_alloc_clear=E2=80=99:
> drivers/gpu/drm/tests/drm_buddy_test.c:264:23: error: unused variable
> =E2=80=98prng=E2=80=99 [-Werror=3Dunused-variable]
> =C2=A0 264 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_RND_STAT=
E(prng, random_seed);
>=20
> Reported-by: Jani Nikula <jani.nikula@intel.com>
> Reported-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Fixes: 8cb3a1e2b350 ("drm/buddy: Add a testcase to verify the
> multiroot fini")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/tests/drm_buddy_test.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c
> b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 4b5818f9f2a9..7a0e523651f0 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -261,7 +261,6 @@ static void
> drm_test_buddy_alloc_range_bias(struct kunit *test)
> =C2=A0static void drm_test_buddy_alloc_clear(struct kunit *test)
> =C2=A0{
> =C2=A0	unsigned long n_pages, total, i =3D 0;
> -	DRM_RND_STATE(prng, random_seed);
> =C2=A0	const unsigned long ps =3D SZ_4K;
> =C2=A0	struct drm_buddy_block *block;
> =C2=A0	const int max_order =3D 12;

