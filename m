Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201E52AC0A6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 17:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5397F89AF3;
	Mon,  9 Nov 2020 16:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBE489AF3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 16:18:32 +0000 (UTC)
IronPort-SDR: BeIPb7PgrZGr2/UJY20unajZixj4E8Dr1osqdbITZb5F8UwSSTruNwdbo+nTeht6vYaOBMCc/o
 vV7ztY/YmyKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="149678018"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="149678018"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 08:18:28 -0800
IronPort-SDR: oHXidEGW1ilLy7JVzB/4767o4XEqc/pNp4pAfAXm6QCOfjDCH3RQGqoNEqhpdyKkChA2Jb8XF9
 lVtfy3B87o7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="327315585"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 09 Nov 2020 08:18:26 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 09 Nov 2020 18:18:25 +0200
Date: Mon, 9 Nov 2020 18:18:25 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/4] drm/ttm: add multihop infrastrucutre (v2)
Message-ID: <20201109161825.GG6112@intel.com>
References: <20201109005432.861936-1-airlied@gmail.com>
 <20201109005432.861936-2-airlied@gmail.com>
 <9fdcf880-be1a-5803-3e54-14a9910a91b7@amd.com>
 <20201109151650.GE6112@intel.com>
 <bec6848c-3ad5-41ca-d424-669a6797b972@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bec6848c-3ad5-41ca-d424-669a6797b972@amd.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 09, 2020 at 04:57:29PM +0100, Christian K=F6nig wrote:
> Am 09.11.20 um 16:16 schrieb Ville Syrj=E4l=E4:
> > On Wed, Nov 11, 2020 at 06:13:02PM +0100, Christian K=F6nig wrote:
> >> Am 09.11.20 um 01:54 schrieb Dave Airlie:
> >>> @@ -1432,15 +1479,18 @@ int ttm_bo_swapout(struct ttm_operation_ctx *=
ctx)
> >>>    	if (bo->mem.mem_type !=3D TTM_PL_SYSTEM) {
> >>>    		struct ttm_operation_ctx ctx =3D { false, false };
> >>>    		struct ttm_resource evict_mem;
> >>> +		struct ttm_place hop =3D {};
> >> Please always use memset() if you want to zero initialize something in
> >> the kernel, we had enough trouble with that.
> > What trouble is that? I've not heard of anything, and we use
> > =3D{} quite extensively in drm land.
> =

> =3D{} initializes only named fields, not padding.

Has that actually happened?

> =

> The result is that for example when doing a hash or CRC of a structure =

> you can come up with different results depending on the architecture =

> and/or structure layout.
> =

> Another problem are information leaks from the kernel to userspace =

> because of this.
> =

> Because of this Mesa for example strongly discourages using =3D{} for =

> zeroing a structure.
> =

> Regards,
> Christian.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
