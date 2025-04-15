Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7EDA8A000
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 15:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D987F10E2AF;
	Tue, 15 Apr 2025 13:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EMw9VTFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5918610E79F;
 Tue, 15 Apr 2025 13:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744724977; x=1776260977;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6g6gxP4uXd9XMpLT6vqRCb0OxFzHqKBaTYnlUxQV6BU=;
 b=EMw9VTFL3Jp5pwomQ4dYPQTnABIx4N5XntuxT+qET8LuTW14myWNsO/j
 bZDoSgYKkGKXikfVMrM2tdYHEJDchkf32kkK1RQ3qh2C1xzGpr61IP1rG
 8gchUASYLDc1vASBUd1LCdwgrw5UOkQCX190cHV+7zUMhoag7boITFj+4
 VtagP8bnfm/DjGOcteDbi1ECWxKwmKPszbynz6p+fQi3zcxuSNIpSP4dZ
 sZ+9Po437awLm5vyseODT8lQOPSRIKzQ0SpAYmMS0kxlLMOXNKt7Yqr0o
 stqolVXpLXfTapzm2K+E3mI2/Q701Q1FJaSb1Po2BHtK6Rkf+RnrtBb/T A==;
X-CSE-ConnectionGUID: 50y6mpwLRQWrc8d8sXEDeQ==
X-CSE-MsgGUID: PFXi4ogiQLih+HIl/8+5Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="57227306"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="57227306"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 06:49:36 -0700
X-CSE-ConnectionGUID: KIt2dNEiTkeqAwpkIhmmzw==
X-CSE-MsgGUID: kn+lRZqOQ7yIhdwGcBQQkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="135189635"
Received: from monicael-mobl3 (HELO [10.245.246.24]) ([10.245.246.24])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 06:49:33 -0700
Message-ID: <4ea89adf109e4d7d55ea024fd4e85521c81ccb47.camel@linux.intel.com>
Subject: Re: [PATCH 10/11] drm/xe: Test for imported buffers with
 drm_gem_is_imported()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 simona@ffwll.ch, 	mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, Lucas De Marchi
 <lucas.demarchi@intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
Date: Tue, 15 Apr 2025 15:49:31 +0200
In-Reply-To: <20250414134821.568225-10-tzimmermann@suse.de>
References: <20250414134821.568225-10-tzimmermann@suse.de>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Mon, 2025-04-14 at 15:48 +0200, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The helper tests the dma_buf
> itself while import_attach is just an artifact of the import.
> Prepares
> to make import_attach optional.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
> =C2=A01 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c337790c81ae..adb69e0bbcb4 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -749,7 +749,7 @@ static int xe_bo_move_notify(struct xe_bo *bo,
> =C2=A0		return ret;
> =C2=A0
> =C2=A0	/* Don't call move_notify() for imported dma-bufs. */
> -	if (ttm_bo->base.dma_buf && !ttm_bo->base.import_attach)
> +	if (ttm_bo->base.dma_buf && !drm_gem_is_imported(&ttm_bo-
> >base))
> =C2=A0		dma_buf_move_notify(ttm_bo->base.dma_buf);
> =C2=A0
> =C2=A0	/*
> @@ -1514,7 +1514,7 @@ static void xe_ttm_bo_destroy(struct
> ttm_buffer_object *ttm_bo)
> =C2=A0	struct xe_tile *tile;
> =C2=A0	u8 id;
> =C2=A0
> -	if (bo->ttm.base.import_attach)
> +	if (drm_gem_is_imported(&bo->ttm.base))
> =C2=A0		drm_prime_gem_destroy(&bo->ttm.base, NULL);
> =C2=A0	drm_gem_object_release(&bo->ttm.base);
> =C2=A0
> @@ -2228,7 +2228,7 @@ int xe_bo_pin(struct xe_bo *bo)
> =C2=A0	 * No reason we can't support pinning imported dma-bufs we
> just don't
> =C2=A0	 * expect to pin an imported dma-buf.
> =C2=A0	 */
> -	xe_assert(xe, !bo->ttm.base.import_attach);
> +	xe_assert(xe, !drm_gem_is_imported(&bo->ttm.base));
> =C2=A0
> =C2=A0	/* We only expect at most 1 pin */
> =C2=A0	xe_assert(xe, !xe_bo_is_pinned(bo));
> @@ -2298,7 +2298,7 @@ void xe_bo_unpin(struct xe_bo *bo)
> =C2=A0	struct ttm_place *place =3D &bo->placements[0];
> =C2=A0	struct xe_device *xe =3D xe_bo_device(bo);
> =C2=A0
> -	xe_assert(xe, !bo->ttm.base.import_attach);
> +	xe_assert(xe, !drm_gem_is_imported(&bo->ttm.base));
> =C2=A0	xe_assert(xe, xe_bo_is_pinned(bo));
> =C2=A0
> =C2=A0	if (mem_type_is_vram(place->mem_type) || bo->flags &
> XE_BO_FLAG_GGTT) {

