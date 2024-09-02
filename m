Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A3E9683DC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 11:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CD510E27C;
	Mon,  2 Sep 2024 09:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+xRyqi3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCDF10E270;
 Mon,  2 Sep 2024 09:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725271060; x=1756807060;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bZf9jr5cE7JLGMCjtaacjaj8BapUrJRq1Kijp59lePI=;
 b=l+xRyqi3/X8FVIA2QgAReu0AeZxeVpFUiAB5Loz8mICVFh0VIKVI6A9I
 x86icUrYCa5tYN7rfu/RxPYPrM6WbwORlSkToeMNUcswgBofCCIKR63ic
 bt081ogWMyNDPNAx3f/Xml/uOwckoL20jpOLuyjVCr1BNnFGWLCOc6LHp
 gElF1MOYP2bLB0ksrTTA0QFR+6vVrCaHuFAH4DF46bAJ1U/vUqy9yujfv
 Sp0uqqlumWAUzX/YFVP4R6srdEou0L7Fq7KP21Bl8h6OLjgE7o2Bl85Q3
 2BP3IDgQdWMpY/V6HMKzql/wqxubyi6lzQSs13ZJzz3f46+mQWVP5vyac Q==;
X-CSE-ConnectionGUID: A1LhPUMPSDGp3LCUpBEgeg==
X-CSE-MsgGUID: dQZz3UxzTLG6xT/BRzcPYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="49248272"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="49248272"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 02:57:39 -0700
X-CSE-ConnectionGUID: Xm31gMlLSXKuIfu6cQNzZQ==
X-CSE-MsgGUID: dYJsD8QcRayg5nV6sD/tmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="69357452"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO [10.245.244.77])
 ([10.245.244.77])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 02:57:38 -0700
Message-ID: <c93e7de607293618385e7a109a6717c3af94ba80.camel@linux.intel.com>
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared
 Virtual Memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 airlied@gmail.com, christian.koenig@amd.com, matthew.auld@intel.com, 
 daniel@ffwll.ch
Date: Mon, 02 Sep 2024 11:57:35 +0200
In-Reply-To: <ZtHQHdXsBEtJeg89@DUT025-TGLU.fm.intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
 <d66e492df25e8ec3533575245c10eb7dcca709ca.camel@linux.intel.com>
 <ZtCzo11oKXBeKmWp@DUT025-TGLU.fm.intel.com>
 <b657ceec08091a666bdd907f9171727ef395c093.camel@linux.intel.com>
 <ZtDgd7bd6RCs2Orl@DUT025-TGLU.fm.intel.com>
 <4c157c8634d9414aa088e6969906f29b06171331.camel@linux.intel.com>
 <ZtHQHdXsBEtJeg89@DUT025-TGLU.fm.intel.com>
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

Hi, Matt

On Fri, 2024-08-30 at 13:58 +0000, Matthew Brost wrote:
> >=20
> > So I specifically asked Jason about the performance problem about
> > using
> > many notifiers vs using a single one, and he responded that the
> > problem
> > is slowing down the core mm on invalidations, if the RB tree gets
> > too
> > large to walk. He also mentioned that we should consider core
> > invalidation performance before faulting performance because the
> > latter
> > is so slow anyway we must have the driver stack avoid gpu faults
> > using
> > user-space prefetching and similar techniques.
> >=20
> > In particular inserting and removing into the mmu_interval tree is
> > not
> > costly in terms of locking but because of correctness requirements
> > insertion might block on ongoing validations.
> >=20
> > So basically what I'm trying to say is that as long as we're using
> > SVM
> > ranges in the way we do (I'm not saying that is wrong at this
> > point,
>=20
> If you have been following the mmap write discussions at all, one
> potential fix for removing that hack is a per range migrate mutex
> [1].
> This also need to be considered when / if we try to drop a raneg
> concept.

Still need to read up on that, and for migration I think the situation
is a bit different, pls see below.

>=20
> [1]
> https://patchwork.freedesktop.org/patch/610957/?series=3D137870&rev=3D1#c=
omment_1111296
>=20
> > and I agree that could be fine-tuned later), The benefit of an
> > extra
> > notifier layer is questionable compared to directly inserting the
> > ranges into the mmu_interval_tree. So hence my questions, given
> > those
> > considerations why this additional layer?
> >=20
>=20
> One we do fairly easily if you think this questionable is have an
> option
> to size the notifier to range size and wire this the notifier size
> modparam [2]. Again once we have apps running it would be fairly to
> profile this and see if there is benefit to this large notifier
> scheme.
> If there really is none, perhaps then we consider ripping this out.
>=20
> [2]
> https://patchwork.freedesktop.org/patch/611007/?series=3D137870&rev=3D1
>=20
> Matt

At this point I'm mostly trying to understand the reasoning behind the
various design choices and why data structures look like they do.

But also considering that the page-table mapping and invalidation is
per (vm, gpu_vm) pair and migration is per (vm, device (device group))
pair,I have really been advocating for sorting out the page-table
mapping and invalidation first and end up with something that is
lightweight and sufficient for igpu systems, and to avoid conflating
possible page-table range requirements with migration range
requirements which might be completely different.=C2=A0

I think the former can be done completely without ranges, having
configurable prefaulting-, invalidation- and notifier granularity,
whereas the latter also introduces migration granularity.

/Thomas




