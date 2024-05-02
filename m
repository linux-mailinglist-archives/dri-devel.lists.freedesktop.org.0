Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7648B9CFC
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 17:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688521124EC;
	Thu,  2 May 2024 15:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nztOQpEx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C2B1124EA;
 Thu,  2 May 2024 15:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714662118; x=1746198118;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=AxiPjBwg/o//qvlid03BaPkYWf99rAvtN0FR76XKJDE=;
 b=nztOQpEx628Nsgxr26pdKSyeAkUCSgzJ+PglYrTSSDRQnhwMBzIblPLj
 VCJIsLsR41TwZsMKtIB44RdkvfZtdLeKIUQqgFnoZ2DF3KQ9dxxgiX5zY
 H4AUEhh8xGd5Ky4CS72J2f5RecoHRxBaVR5W9xdqoJO9VyYhiA1mjUeta
 dBwB5d3dEY9TS0WDHG9SF4YsDoTQ5GJSFPa2wRcv7xABLIAOMcpQX2I6h
 zb026TTyT3vKfDd7XD5lafLqD8AAhWIH17oP0JMIART9J8m6yXKsoEl41
 nwj88gDg4fVMKGMHfwNjkclqgU2G7/oIAeCO+5QFQd73lWQM895oSSzjp Q==;
X-CSE-ConnectionGUID: inJWjQSqT9SvU8B63wVJ7w==
X-CSE-MsgGUID: 851W8Bg9TcinthCgMm/C6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10283449"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10283449"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 08:01:58 -0700
X-CSE-ConnectionGUID: 7MtFKqrtSmmOCLOQKuvvBQ==
X-CSE-MsgGUID: 6KwmRaYgQJmL+quXWHpFyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27027101"
Received: from antonvol-mobl1.ccr.corp.intel.com (HELO [10.251.209.48])
 ([10.251.209.48])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 08:01:55 -0700
Message-ID: <0b700baf6fc3d41b4adf6301b1b4dbc4ff7078fa.camel@linux.intel.com>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, "Zeng, Oak" <oak.zeng@intel.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>,  "Welty, Brian"
 <brian.welty@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Bommu, Krishnaiah"
 <krishnaiah.bommu@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, Leon Romanovsky <leon@kernel.org>
Date: Thu, 02 May 2024 17:01:51 +0200
In-Reply-To: <20240502124632.GB3341011@nvidia.com>
References: <65cb3984309d377d6e7d57cb6567473c8a83ed78.camel@linux.intel.com>
 <20240426120047.GX941030@nvidia.com>
 <ad82f95ee29ada403459416d4c97c2b9083b5a0f.camel@linux.intel.com>
 <20240426163519.GZ941030@nvidia.com>
 <f938dc8f7309ae833e02ccdbc72134df0607dfa4.camel@linux.intel.com>
 <20240430173002.GV941030@nvidia.com> <ZjE_LJ7AFFQk0Eep@phenom.ffwll.local>
 <20240501000915.GY941030@nvidia.com> <ZjNJASw0JdXS6dTa@phenom.ffwll.local>
 <93fca752517f0120baa770992fd0f9160b0c14d1.camel@linux.intel.com>
 <20240502124632.GB3341011@nvidia.com>
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

On Thu, 2024-05-02 at 09:46 -0300, Jason Gunthorpe wrote:
> On Thu, May 02, 2024 at 11:11:04AM +0200, Thomas Hellstr=C3=B6m wrote:
>=20
> > It's true the cpu vma lookup is a remnant from amdkfd. The idea
> > here is
> > to replace that with fixed prefaulting ranges of tunable size. So
> > far,
> > as you mention, the prefaulting range has been determined by the
> > CPU
> > vma size. Given previous feedback, this is going to change.
>=20
> Perhaps limiting prefault to a VMA barrier is a reasonable thing to
> do, but the implementation should be pushed into hmm_range_fault and
> not open coded in the driver.
>=20
> > Still the prefaulting range needs to be restricted to avoid -EFAULT
> > failures in hmm_range_fault(). That can ofc be done by calling it
> > without HMM_PFN_REQ_FAULT for the range and interpret the returned
> > pnfs.=20
>=20
> Yes, this is exactly what that feature is for, you mark your prefetch
> differently from the fault critical page(s).
>=20
> > There is a performance concern of this approach as compared to
> > peeking at the CPU vmas directly, since hmm_range_fault() would
> > need to
> > be called twice. Any guidelines ideas here?
>=20
> If there is something wrong with hmm_range_fault() then please fix
> it. I'm not sure why you'd call it twice, the HMM_PFN_REQ_FAULT is
> per
> PFN?

Ah, yes you're right. I somehow thought it was per range. Makes sense
now.

Thanks,
Thomas



>=20
> Jason

