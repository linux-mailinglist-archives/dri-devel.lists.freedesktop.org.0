Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A148CA8DA
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 09:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F1489BEC;
	Tue, 21 May 2024 07:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jud8iDmH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C8E89BEC;
 Tue, 21 May 2024 07:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716276142; x=1747812142;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jiuRTDxDjUegjX0iPABfl5rNfzwE5fCYB1v/1qPYNjE=;
 b=Jud8iDmH1Ai+CZ2bdYo/oGCX1SIy6+ykbUg5fUyf4WNo869ESX0vXhm0
 R6nOMzTU8jKTuZlhSqgsvG//iR6gsJywonmTub7V4KiBF+hD38gWY+H3T
 x02xA2H5ZTAYKbmgc/n8GrNDEkO9FailnYBZr0scVUWEjTTo8Hr/NZ09M
 k/DBCpidU5iHMSAzwMPsTqvoMFY8o5qtKUzeOM8hXkMDyvIoVCnmQmGuG
 dPwjoqQFNY+3W46tKyQ9wSL2Kz1tAslldyAeFDYzWxIlckgc3SnrHFa4y
 rTIh3fDxY2Gu4AnzSxetXKGbaEnkkX/tOkhVHmkK/9oO+emBpJ9TxQTdm w==;
X-CSE-ConnectionGUID: WvLiUF3cTmO5svO/ykOOUg==
X-CSE-MsgGUID: +mxyIG9fSYmF7BTrM4dL6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="37826190"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37826190"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 00:22:22 -0700
X-CSE-ConnectionGUID: vbXrLHo5Q1uLIH5wQFqaDA==
X-CSE-MsgGUID: USjAKo9NTxqCO/beLcBBeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="32684337"
Received: from unknown (HELO [10.245.246.159]) ([10.245.246.159])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 00:22:19 -0700
Message-ID: <a641c53aa55c7a0ec9ceab3049e890e2aeca18c6.camel@linux.intel.com>
Subject: Re: [PATCH v3 00/21] TTM shrinker helpers and xe buffer object
 shrinker
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Matthew Brost <matthew.brost@intel.com>, 
 dri-devel@lists.freedesktop.org
Date: Tue, 21 May 2024 09:22:16 +0200
In-Reply-To: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
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

Hi, all

On Tue, 2024-05-21 at 09:16 +0200, Thomas Hellstr=C3=B6m wrote:
> This series implements TTM shrinker / eviction helpers and an xe bo
> shrinker. It builds on two previous series, *and obsoletes these*.
> First
>=20
> https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg484425.ht=
ml
>=20
> Second the previous TTM shrinker series
>=20
> https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd=
.com/T/
>=20
> Where the comment about layering
> https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd=
.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9
>=20
> now addressed, and this version also implements shmem objects for
> backup
> rather than direct swap-cache insertions, which was used in the
> previuos
> series. It turns out that with per-page backup / shrinking, shmem
> objects
> appears to work just as well as direct swap-cache insertions with the
> added benefit that was introduced in the previous TTM shrinker series
> to
> avoid running out of swap entries isn't really needed.
>=20
> Patch 1-4 implements restartable LRU list iteration.
>=20
> Patch 5 implements a LRU walker + resv locking helper
>=20
> Patch 6 moves TTM swapping over to the walker.
>=20
> Patch 7 moves TTM eviction over to the walker.
>=20
> Patch 8 could in theory be skipped but introduces a possibility to
> easily
> add or test multiple backup backends, like the direct swap-cache
> insertion or even files into fast dedicated nvme storage for for
> example.
>=20
> Patch 9 introduces helpers in the ttm_pool code for page-by-page
> shrinking
> and recovery. It avoids having to temporarily allocate a huge amount
> of
> memory to be able to shrink a buffer object. It also introduces the
> possibility to immediately write-back pages if needed, since that
> tends
> to be a bit delayed when left to kswapd.
>=20
> Patch 10 Adds a simple error injection to the above code to help
> increase
> test coverage.
>=20
> Patch 11 Implements an xe bo shrinker and a common helper in TTM for
> shrinking.
>=20
> Patch 12-21 are really a separate POC series, for introducing
> drm_exec locking
> in TTM. The patch touches both drm_exec and dma-buf and is for now
> marked as
> an RFC:
>=20
> Patch 12 Introduces dma_resv_trylock_ctx.
>=20
> Patches 13-14 deal with introducing drm_exec_trylock.
>=20
> Patch 15 adds a snapshot capability to drm_exec.
>=20
> Patch 16 adds an evict mode locking capability to drm_exec
>=20
> Patch 17 converts the LRU + locking walker to drm_exec.
>=20
> Patch 18 converts TTM vm to use drm_exec.
>=20
> Patch 19 converts the xe fault handler to drm_exec.
>=20
> Patch 20 converts bo initialization locking to drm_exec
>=20
> Patch 21 introduces drm_exec locking around some of the
> bo validation callsites in drm_exec.
>=20
> v2:
> - Squash obsolete revision history in the patch commit messages.
> - Fix a couple of review comments by Christian
> - Don't store the mem_type in the TTM managers but in the
> =C2=A0 resource cursor.
> - Rename introduced TTM *back_up* function names to *backup*
> - Add ttm pool recovery fault injection.
> - Shrinker xe kunit test
> - Various bugfixes
>=20
> v3:
> - Address some review comments from Matthew Brost and Christian
> K=C3=B6nig.
> - Use the restartable LRU walk for TTM swapping and eviction.
> - Provide a POC drm_exec locking implementation for exhaustive
> =C2=A0 eviction. (Christian K=C3=B6nig).
>=20
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>

Now with a POC available how the drm_exec locking could be done in TTM
(the RFC part) I think the best approach is to get patch 1-11 reviewed
and pushed, and we could then settle on a solution for the drm_exec
part as a follow-up. Undoubtedly there are a couple of things that need
discussion there, in particular the resv_set, the snapshot and the
trylock memory allocation.

/Thomas

