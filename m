Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB77B2AF75
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 19:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9B210E4B0;
	Mon, 18 Aug 2025 17:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tJzO5/g8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0D010E4B0;
 Mon, 18 Aug 2025 17:32:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D32F443769;
 Mon, 18 Aug 2025 17:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BBEDC113D0;
 Mon, 18 Aug 2025 17:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755538348;
 bh=CmRgn46BZl6J8MX5ylLoEiE1qDDgfVYS/Cf/oUWsXb8=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=tJzO5/g8GoOsv1LGnoDNyLrNjSOQePx69nmeTl2UbA/cdNFyD+oUAaDYh13ANZooD
 RbY02jcA2AjN6p/nbLNWshWWxyBYLg7YZEfCGLFruceWGhUw9SH/n4Hlb7Aaakrbgg
 LbobOYTbCZMHB8nGzd3mp4dao1ZMrchcMu5qUkyCJEDSPzBtIOd/EpCXu1fFYlrZ0k
 nkFMF1fHg1tlWqObj77WnK5TIjdfmYtZaZOtgNcfQq+V4MTzovf0mMPDslk12kiPY8
 QPCEbojroOx2B82JzzRqqszJ2Zhb1rCPXAdiZe7qvMa0sXe8A1l4lTxBkhBmvNRkgT
 zyx/H3mIHkB2A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Aug 2025 19:32:25 +0200
Message-Id: <DC5QEMCVGZVV.3F24M2TIFEN96@kernel.org>
Subject: Re: [PATCH v7 03/24] drm/gpuvm: Introduce drm_gpuvm_madvise_ops_create
Cc: <intel-xe@lists.freedesktop.org>, "Matthew Brost"
 <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Boris Brezillon"
 <bbrezillon@kernel.org>, <dri-devel@lists.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
 <20250814105950.2177480-4-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250814105950.2177480-4-himal.prasad.ghimiray@intel.com>
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

On Thu Aug 14, 2025 at 12:59 PM CEST, Himal Prasad Ghimiray wrote:
> This ops is used to iterate over GPUVA's in the user-provided range
> and split the existing sparse VMA's if the start or end of the input
> range lies within it. The operations can create up to 2 REMAPS and 2 MAPs=
.
>
> The primary use case is for drivers to assign attributes to GPU VAs in
> the specified range without performing unmaps or merging mappings,
> supporting fine-grained control over sparse va's.
>
> v2
> - use drm_gpuvm_sm_map_ops_create with flags instead of defining new
>   ops_create (Danilo)
> - Add doc (Danilo)
>
> v3
> - Fix doc
> - Fix unmapping check
>
> v4
> - Fix mapping for non madvise ops
>
> v5
> - Fix mapping (Matthew Brost)
> - Rebase on top of struct changes
>
> v6
> - flag moved to map_req
>
> v7 (Danilo)
> - Use different functions
> - Add kernel-doc
> - Modify op_unmap_cb and op_map_cb to handle madvise and NULL ptr
> - use gem_obj check in single place

(Same comment as in patch 1.)

> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v6

This looks pretty clean now, and thanks for adding the documentation.

Acked-by: Danilo Krummrich <dakr@kernel.org>

Feel free to take this through the Xe tree if necessary.
