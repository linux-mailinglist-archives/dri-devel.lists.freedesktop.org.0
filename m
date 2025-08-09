Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C1FB1F4B8
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 15:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5977B10E05A;
	Sat,  9 Aug 2025 13:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NXLHlwTi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9EA10E05A;
 Sat,  9 Aug 2025 13:23:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DCA6A601EC;
 Sat,  9 Aug 2025 13:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48684C4CEE7;
 Sat,  9 Aug 2025 13:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754745828;
 bh=C0ufAO9p+980fE893bDZN4cXSxwWXToqZqF5AfgMcW0=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=NXLHlwTi2n9LxaCiN4xyQeZScJ7MtECb2kyLDY6tNng6dpQVePZPZ9dt9YhlE1Oy7
 CG5DurIcsZKTl2w/A75Lb5z3Et9DECJUSY/NPIpEQFi6TbWgB5KIsOtBBcfno3IH20
 snhRadhpYY5m3UNQieCDIu1xS5eYE5hXgCZ1iu0hCfSR4yCRhU3JZBJ3dGXTnhTb28
 P3UBBZM3FrPaRWrTQ01DkaakuUCYtngtKKhkvtIJunhT/xFhfJz47WRM/QwOmWEnsd
 BaxeGeSrIowlC5P6+8ppZUXbwDFpAofnW716l8PUBjkTdLlYas2WclPHE0ERTlfFZ0
 WCSpX+GIc16MA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 09 Aug 2025 15:23:45 +0200
Message-Id: <DBXXHBNTM105.2DTBKIO95D5UI@kernel.org>
Subject: Re: [PATCH v6 04/26] drm/gpuvm: Introduce
 DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE flag
Cc: <intel-xe@lists.freedesktop.org>, "Matthew Brost"
 <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Boris Brezillon"
 <bbrezillon@kernel.org>, <dri-devel@lists.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
 <20250807164338.1832254-5-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250807164338.1832254-5-himal.prasad.ghimiray@intel.com>
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

On Thu Aug 7, 2025 at 6:43 PM CEST, Himal Prasad Ghimiray wrote:
> - DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE: This flag is used by
>   drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
> user-provided range and split the existing non-GEM object VMA if the

What do you mean with non-GEM object VMA? I assume you just mean sparse
mappings?

> start or end of the input range lies within it. The operations can
> create up to 2 REMAPS and 2 MAPs.

Wait -- that doesn't make sense with what I thought how this works.

In the RFC you gave the following example:

	Example:
	Input Range: 0x00007f0a54000000 to 0x00007f0a54400000
	GPU VMA: 0x0000000000000000 to 0x0000800000000000
	Operations Result:
	- REMAP:UNMAP: addr=3D0x0000000000000000, range=3D0x0000800000000000
	- REMAP:PREV: addr=3D0x0000000000000000, range=3D0x00007f0a54000000
	- REMAP:NEXT: addr=3D0x00007f0a54400000, range=3D0x000000f5abc00000
	- MAP: addr=3D0x00007f0a54000000, range=3D0x0000000000400000

That's exactly the same what the existing logic does. So in which case do y=
ou
have *two* MAP operations?

For completeness, the other example you gave was:

	Example:
	Input Range: 0x00007fc898800000 to 0x00007fc899000000
	GPU VMAs:
	- 0x0000000000000000 to 0x00007fc898800000
	- 0x00007fc898800000 to 0x00007fc898a00000
	- 0x00007fc898a00000 to 0x00007fc898c00000
	- 0x00007fc898c00000 to 0x00007fc899000000
	- 0x00007fc899000000 to 0x00007fc899200000
	Operations Result: None

This just means, if things are split already, at the defined edges, just do=
n't
do anything, which is also conform with the existing logic except for the "=
no
merge" part, which is obviously fine given that it's explicitly for splitti=
ng
things.

Can you please provide some additional *simple* examples, like the document=
ation
of GPUVM does today for the normal split/merge stuff? I.e. please don't use
complex real addresses, that makes it hard to parse.

Also, can you please provide some information on what this whole thing does
*semantically*? I thought I understood it, but now I'm not so sure anymore.

> The purpose of this operation is to be
> used by the Xe driver to assign attributes to GPUVMA's within the
> user-defined range.

Well, hopefully it's useful to other drivers as well. :)

> Unlike drm_gpuvm_sm_map_ops_flags in default mode,
> the operation with this flag will never have UNMAPs and
> merges, and can be without any final operations.

I really think this is significant enough of a feature to add some proper
documentation about it.

Please add a separate section about madvise operations to the documentation=
 at
the beginning of the drivers/gpu/drm/drm_gpuvm.c file.

>
> v2
> - use drm_gpuvm_sm_map_ops_create with flags instead of defining new
>   ops_create (Danilo)

If this turns out not to be what I thought semantically and we still agree =
it's
the correct approach, I think I have to take this back and it should indeed=
 be
an entirely separate code path. But let's wait for your answers above.

Again, I really think this needs some proper documentation like in the
"DOC: Split and Merge" documentation section.
