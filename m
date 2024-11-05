Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5192D9BCA51
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 11:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEEC10E550;
	Tue,  5 Nov 2024 10:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jGkNkoWs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3990010E550;
 Tue,  5 Nov 2024 10:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730802138; x=1762338138;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BBMwAG0uQt6pj8tjIKAgL50477jlmmrDkTO03Lr+I/0=;
 b=jGkNkoWsjhkBfXgNk9Zu8mpoUtEhmYSEpglITXXTKT2Rs5gsDgiunSeI
 Yt8A4DDV63tSVdWDnmAY30ZLgbGijuCoEVZLEPVlZDp/otxcZGFIZf5Gx
 VfzgVUmrcz4aAxvXCFsryWGfuJux7STSn+br6G6VeahUdC6XgJe2RyRwv
 Du/AtgPvnr/J68KXxsTaBPSxePoVF+N+jH/bGJy46d3vKDHm/yUHyGg3v
 peU/68WdCIXjUdL2XYPSk1V7ev9Br2Roj/6l4sndIuq+7oq3GWFCDxtiz
 HfU0+NhaD0SAMIT1oeTJpR7NgljkqpBO5xL6h7rN+L0GVl+Ftl9KjoN9A g==;
X-CSE-ConnectionGUID: 5G3NrktcSgCxtpgapM+ztw==
X-CSE-MsgGUID: clxE8iMHTmSpLagSGUhZ4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30391045"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30391045"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 02:22:17 -0800
X-CSE-ConnectionGUID: fvkiyhR/Tq+gvi5iSBaNaA==
X-CSE-MsgGUID: yqVl8kMWT0i8UnZ+5hz0oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="87903209"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.97])
 ([10.245.246.97])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 02:22:15 -0800
Message-ID: <38c69f6205ca80c5da9ae7cde2d669399bbdce64.camel@linux.intel.com>
Subject: Re: [PATCH v2 05/29] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Tue, 05 Nov 2024 11:22:12 +0100
In-Reply-To: <ZylTmvdEMQXxftgi@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-6-matthew.brost@intel.com>
 <4162aad194d52983035a7e2a5453e394ff84fb11.camel@linux.intel.com>
 <ZykCmAJEUIv+nzwz@lstrano-desk.jf.intel.com>
 <4acf3ea6edd0a856c5614d25b5a54d6a1c3f6194.camel@linux.intel.com>
 <ZylTmvdEMQXxftgi@lstrano-desk.jf.intel.com>
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

On Mon, 2024-11-04 at 15:07 -0800, Matthew Brost wrote:
> > We
> > have
> > https://elixir.bootlin.com/linux/v6.12-rc6/source/include/linux/int
> > erval_tree_generic.h#L24
> >=20
> > to relate to. Now GPUVM can't use the generic version since it
> > needs
> > u64 intervals. These trees need unsigned long only so it should be
> > ok.
> > And safe removal, isn't that possible to implement without the
> > list?
> > Then it's really only the linked list as a perf optimization I
> > guess,
> > but we have a lot of those pending...
> >=20
>=20
> See my other comments. Let me just follow on using a maple tree and
> perhaps a
> list isn't required if we use that. Will have definite answer in my
> next rev.

Note, though, that IIRC maple trees do not allow overlapping ranges,
and If we need to support multiple svm VMAs with different offsets,
like Christian suggests, we will likely have overlapping ranges for the
range tree but not for the notifier tree.

Thinking a bit more about this, my concern is mostly around needlessly
instantiating new interval trees instead of using the generic
instantiation, because that is clearly against recommended practice.=C2=A0

But the list could probably be added anyway if needed, and it does
indeed AFAICT reduce the traversal complexity from O(N ln N) to O(N).

/Thomas
=20
