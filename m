Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A995B22CAC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 18:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE3610E170;
	Tue, 12 Aug 2025 16:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bA7yGPDK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0499410E03C;
 Tue, 12 Aug 2025 16:06:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 025195C06E0;
 Tue, 12 Aug 2025 16:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6555EC4CEF0;
 Tue, 12 Aug 2025 16:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755014789;
 bh=KJlgQzL63Lf/4ZsgDMTJNonmqPjVPB0OATtJA6XM/cM=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=bA7yGPDKwFCCXYPBzb96UhN7/9i7HUztA3MlMspFJU+VkLhTqJmn8gBLY0Z8hpunX
 ZKuQpbhUjpPs5B+j4X9dTrK5X+IR0IGtl+RWleW+KFIpxVAAIhXJhLJe20hamnZRPv
 Ptu3eGYU1xCGUoEmz5oGp+xtXCSt+22kR4Ln3ZPT4EvLDvcWbck2PCb3JCatWTuz7Q
 yFNQBi8tPVda8hX6oKQu/IgHoq7O65/Br/cVge6luFVxZI6380f+TQifbgIvWy0U5t
 V9YPrYOHWbw/sb7spRnecw4Q+1Xnll9sGLzQ8lgLCDChuAtorUaN3J911dY/9ZdM7C
 ga0kC0Hlqcq/g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Aug 2025 18:06:26 +0200
Message-Id: <DC0KTIPCIM2X.YRWQ3K2RLHIG@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6 04/26] drm/gpuvm: Introduce
 DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE flag
Cc: <intel-xe@lists.freedesktop.org>, "Matthew Brost"
 <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Boris Brezillon"
 <bbrezillon@kernel.org>, <dri-devel@lists.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
 <20250807164338.1832254-5-himal.prasad.ghimiray@intel.com>
 <DBXXHBNTM105.2DTBKIO95D5UI@kernel.org>
 <f5d6e986-abc7-476c-b27b-ba22e5d114a2@intel.com>
In-Reply-To: <f5d6e986-abc7-476c-b27b-ba22e5d114a2@intel.com>
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

On Mon Aug 11, 2025 at 8:52 AM CEST, Himal Prasad Ghimiray wrote:
> On 09-08-2025 18:53, Danilo Krummrich wrote:
> Possible scenarios for ops functionality based on input start and end=20
> address from user:
>
> a) User-provided range is a subset of an existing drm_gpuva
> Expected Result: Same behavior as the default sm_map logic.
> Reference: Case 1 from [1].
>
> b) Either start or end (but not both) is not aligned with a drm_gpuva=20
> boundary
> Expected Result: One REMAP and one MAP operation.
> Reference: Case 3 from [1].
>
> Existing GPUVMAs:
>
>           drm_gpuva1                        drm_gpuva2
> 	[a----------------------------b-1][b-------------------c-1]
>
> User Input to ops:
>    start =3D inside drm_gpuva1
>    end   =3D exactly at c-1 (end of drm_gpuva2)
>
> Resulting Mapping:
> 	drm_gpuva1:pre       drm_gpuva:New map     drm_gpuva2
> 	[a---------start-1][start------- b-1] [b------------c-1]
>
> Ops Created:
>    REMAP:UNMAP drm_gpuva1 a to b
>    REMAP:PREV a to start - 1
>    MAP: start to b-1
>
> Note: No unmap of drm_gpuvma2 and no merging of New map and drm_gpuva2.
>
> c) Both start and end are not aligned with drm_gpuva boundaries, and=20
> they fall within different drm_gpuva regions
> Expected Result: Two REMAP operations and two MAP operations.
> Reference: Case 2 from [1].
>
>
> d) User-provided range does not overlap with any existing drm_gpuva
> Expected Result: No operations.
> start and end exactly match the boundaries of one or more existing=20
> drm_gpuva regions
>
> e) This includes cases where start is at the beginning of drm_gpuva1 and=
=20
> end is at the end of drm_gpuva2 (drm_gpuva1 and drm_gpuva2 can be same=20
> or different).
> Expected Result: No operations
>
> [1]=20
> https://lore.kernel.org/intel-xe/4203f450-4b49-401d-81a8-cdcca02035f9@int=
el.com/=20

<snip>

> I=E2=80=99ve tried to explain the behavior/usecase with madvise and expec=
ted=20
> outcomes of the ops logic in detail in [1]. Could you please take a=20
> moment to review that and let me know if the explanation is sufficient=20
> or if any part needs further clarification?

Thanks a lot for writing this up!

I think this clarifies everything, the examples from [1] are good (sorry th=
at
your reply from the RFC got lost somehow on my end).

>> Please add a separate section about madvise operations to the documentat=
ion at
>> the beginning of the drivers/gpu/drm/drm_gpuvm.c file.
>
> Sure will do that.

Great, this will help users (as well as reviewers) a lot. Please also add y=
our
examples from [1] to this entry, similar to the existing examples for sm_ma=
p.

>>> v2
>>> - use drm_gpuvm_sm_map_ops_create with flags instead of defining new
>>>    ops_create (Danilo)
>>=20
>> If this turns out not to be what I thought semantically and we still agr=
ee it's
>> the correct approach, I think I have to take this back and it should ind=
eed be
>> an entirely separate code path. But let's wait for your answers above.

Having the correct understanding of how this is supposed to work (and seein=
g how
the code turns out) I think it's still OK to integrate it into sm_map().

However, it probably makes sense to factor out the code into a common funct=
ion
and then build the madvise() and sm_map() functions on top of it.

Please also find some more comments on the patch itself.

>> Again, I really think this needs some proper documentation like in the
>> "DOC: Split and Merge" documentation section.
>
> Sure

Thanks!
