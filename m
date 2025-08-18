Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7163B2AF62
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 19:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91D710E4B1;
	Mon, 18 Aug 2025 17:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FeYx6TUz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3156910E4AD;
 Mon, 18 Aug 2025 17:27:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5E91B5C6285;
 Mon, 18 Aug 2025 17:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC233C4CEEB;
 Mon, 18 Aug 2025 17:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755538058;
 bh=T4QcEjQHxRjUEljBp1OjQ4aiDneFCNvaSRkWFCtDAGY=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=FeYx6TUzFOmEld/fC/sKDsvIEG1lMcpH9Hl4QQRptYMMzD5eudnS7VnhU+uwwB0/E
 XVJbnZ09og0EhIaNuDo+C7TEbyNhcfsu/nHivISX0gA3ESH37YT9JsvpnJ8AKBQxXW
 4N3LM3OeKe7tmkZjcDFG1LZqWtN90f/OJKm9qxq4NjcCjuG436PXWTQMPyyRAmT2St
 sFAwLWY5Nd6SQ4n6xSFMxXEeZuaItmymLXm6dgE6dH3Mkfx+A0EufNGs/ELesu0Vqt
 PwtCZd2jv56yPTziLdNOESmewrR100ZUWdVVxQg8eSAOh53Tl4wMsfbte7U/Q20nr+
 w+QoCQM9MmtOQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Aug 2025 19:27:34 +0200
Message-Id: <DC5QAWS5QUG8.28DC0DJFT5S2X@kernel.org>
Cc: <intel-xe@lists.freedesktop.org>, "Matthew Brost"
 <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Brendan King" <Brendan.King@imgtec.com>,
 "Boris Brezillon" <bbrezillon@kernel.org>, "Caterina Shablia"
 <caterina.shablia@collabora.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v7 01/24] drm/gpuvm: Pass map arguments through a struct
References: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
 <20250814105950.2177480-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250814105950.2177480-2-himal.prasad.ghimiray@intel.com>
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
> From: Boris Brezillon <boris.brezillon@collabora.com>
>
> We are about to pass more arguments to drm_gpuvm_sm_map[_ops_create](),
> so, before we do that, let's pass arguments through a struct instead
> of changing each call site every time a new optional argument is added.
>
> v5
>  - Use drm_gpuva_op_map=E2=80=94same as drm_gpuvm_map_req
>  - Rebase changes for drm_gpuvm_sm_map_exec_lock()
>  - Fix kernel-docs
>
> v6
>  - Use drm_gpuvm_map_req (Danilo/Matt)
>
> v7
>  - change member name to map instead of op_map
>  - use local variable to minize the code changes in _sm_map

I know it's a thing in DRM, but I'd rather not have the version changes in =
the
commit message. Please move them below "---" or into the cover letter.

(No need to resend for this. :)

> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Brendan King <Brendan.King@imgtec.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Caterina Shablia <caterina.shablia@collabora.com>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org> #v4
> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v6
