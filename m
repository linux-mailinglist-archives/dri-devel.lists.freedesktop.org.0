Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2046EB5A1BE
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 22:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DAA10E3F7;
	Tue, 16 Sep 2025 20:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSZZzpbV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020B510E178;
 Tue, 16 Sep 2025 20:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758052916; x=1789588916;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=mwAHz9ba3dQ48Eyxw1EK6eNu9sQXdGFtegPuPz/Y7Uw=;
 b=XSZZzpbVdupN3B/15AM0zvILGY2CKZoQubAvBXDk6Zd72OsXMAjYgWsp
 OmWjkeX8KemloWzyimOI45CEYxwIukzaoi7FRHVnMxDBYvXe9AmzEhnNH
 zPJ5ku46iCXyhZzhWx/bt4cFJ0gEbHYpUYW/KfStDVrrl5UWepN8lA4Bh
 fzK4dMTu+DGxpG1r2HJVJHbFtMI+Wi07NrzjXZvWMEcaInuT00UbGgJhu
 dTMCFmj7ABbAYZJI/eGcmNdTuVMzqj54sCIhGLFORm2jaDNXH+NOJ/r3/
 07mTFfzLc2XZ3TD2gowdvmpn6TLfe3eJFd1l9QtsmWAn5THQuMDmbcAxo A==;
X-CSE-ConnectionGUID: gk8Q/bShS7mPz2/p8O90Ng==
X-CSE-MsgGUID: rWq5dMdiS6qlb2WYjMm2Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60296165"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60296165"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:01:56 -0700
X-CSE-ConnectionGUID: lGI8fgW3TPa6n4SW+D8/OA==
X-CSE-MsgGUID: 99jls8oMTwy2d6NdwUDmTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="174139320"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.138])
 ([10.245.245.138])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:01:54 -0700
Message-ID: <67c3122d47c276e4f936cb8ae372f559b1a7cd2f.camel@linux.intel.com>
Subject: Re: [PATCH v4 2/5] drm/xe/dmabuf: Don't migrate BO to System RAM if
 P2P check succeeds
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Tue, 16 Sep 2025 22:01:51 +0200
In-Reply-To: <20250915072428.1712837-3-vivek.kasireddy@intel.com>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
 <20250915072428.1712837-3-vivek.kasireddy@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

Hi,

On Mon, 2025-09-15 at 00:21 -0700, Vivek Kasireddy wrote:
> If the P2P test (i.e, pci_p2pdma_distance()) is successful, then it
> means that the importer can directly access the BO located in VRAM.
> Therefore, in this specific case, do not migrate the BO to System
> RAM before exporting it.
>=20
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_dma_buf.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> b/drivers/gpu/drm/xe/xe_dma_buf.c
> index a7d67725c3ee..04082e3e4295 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -52,7 +52,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment
> *attach)
> =C2=A0	struct xe_bo *bo =3D gem_to_xe_bo(obj);
> =C2=A0	struct xe_device *xe =3D xe_bo_device(bo);
> =C2=A0	struct drm_exec *exec =3D XE_VALIDATION_UNSUPPORTED;
> -	int ret;
> +	int ret =3D 0;
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * For now only support pinning in TT memory, for two
> reasons:
> @@ -64,7 +64,8 @@ static int xe_dma_buf_pin(struct dma_buf_attachment
> *attach)
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> -	ret =3D xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
> +	if (!attach->peer2peer)
> +		ret =3D xe_bo_migrate(bo, XE_PL_TT, NULL, exec);

From review of previous series:

"Pinning in VRAM is an ongoing discussion and there are many reasons
for
allowing that. However we need to sort out how the accounting should be
done and how regressions should avoided along the path to the final
solution which is cgroups-based.

So until that has been sorted out, there are no exceptions for special
use-cases that don't fit in that plan."

(I have an RFC patch out that if all stakeholders agree should fix
this).

https://patchwork.freedesktop.org/series/154593/

And also a question, can't the guest virtio-gpu KMD support
move_notify() Does it really pin the imported VF fb fullscreen on the
physical screen?


Thanks,
Thomas


> =C2=A0	if (ret) {
> =C2=A0		if (ret !=3D -EINTR && ret !=3D -ERESTARTSYS)
> =C2=A0			drm_dbg(&xe->drm,

