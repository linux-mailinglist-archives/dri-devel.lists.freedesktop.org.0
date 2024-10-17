Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A155E9A262A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 17:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5977E10E85A;
	Thu, 17 Oct 2024 15:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGylX7fT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F403410E85A;
 Thu, 17 Oct 2024 15:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729177996; x=1760713996;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bA6oDFyN7Sm1kmRlntZWjgMzk8bVcjnMBuGvs5SSRsY=;
 b=KGylX7fTE5PI8JGV2iAQDOdjG4I4Ldpj9exLg6SZv+BJGMkCqaMMAoii
 HrI14xHxgWJwmDSQwIQb1vq4tbLq+nQm4IPVEtZVdYSRzbTWJIAKeK8b0
 aZWMxksP6EtTHV4frzl4Sb0Vl9GknTUoAqmc0MAi4nF/S5Df9uNvrgkcf
 yY7yKPRPq8t7V9R2bMO5UyQKpdk3Ah1u20yO7wTTMLiGXpFXMaj4ip49s
 Jiqm3CYc5y5ZmOvnn5STGPpNSNvJrV3AUGwbIo+Ov4FsuypwD/de/EVCZ
 Rj6YKXOeUUxut7aUY3FTqVoRte4UDRXVadjYKT7GLnzVnM+rBr0JF2HEB g==;
X-CSE-ConnectionGUID: bA4XrnISQV2fjh0Z/NuYhw==
X-CSE-MsgGUID: Bh+pjFlJSnykJZZaJuFvEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32351968"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="32351968"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 08:13:16 -0700
X-CSE-ConnectionGUID: z9VxX2YJTo6Dv6DCiF3WdA==
X-CSE-MsgGUID: 2FBoITzLTYmIxrhCWNwiEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="83346391"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.246.150])
 ([10.245.246.150])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 08:13:13 -0700
Message-ID: <86b5c0275e43d825b13a71ee2875e8ec48b56578.camel@linux.intel.com>
Subject: Re: [PATCH v2] locking/ww_mutex: Adjust to lockdep nest_lock
 requirements
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: intel-xe@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long
 <longman@redhat.com>, Maarten Lankhorst <maarten@lankhorst.se>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Thu, 17 Oct 2024 17:13:09 +0200
In-Reply-To: <Zw_z9FaTiXV090-b@Boquns-Mac-mini.local>
References: <20241009092031.6356-1-thomas.hellstrom@linux.intel.com>
 <Zw19sMtnKdyOVQoh@boqun-archlinux>
 <bf7632b74c075f2c430fdb98cefed486b4d9e74f.camel@linux.intel.com>
 <Zw6touohNwfqs3T0@boqun-archlinux>
 <ee955c4d3e63edd3d1e37b6467bf01c2c4efc827.camel@linux.intel.com>
 <Zw_z9FaTiXV090-b@Boquns-Mac-mini.local>
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

On Wed, 2024-10-16 at 10:12 -0700, Boqun Feng wrote:
> On Wed, Oct 16, 2024 at 08:17:50AM +0200, Thomas Hellstr=C3=B6m wrote:
> [...]
> > >=20
> > > So even though first_lock_dep_map is a fake lock, it has to have
> > > the
> > > same wait types as a real mutex.
> >=20
> > Understood.
> > >=20
> > > Does this make sense?
> >=20
> > Yes it does. I'll update to a v3, and add a Tested-by: tag. Would
> > you
>=20
> I think you should send a v3 then after I test, I will send my
> Tested-by.
>=20
> > like a Co-developed-by: tag as well?
>=20
> It's not a big change onto yours, but feel free to add it.

It would probably have taken me considerable time to find that missing
LD_WAIT_SLEEP, but I forgot to ask for your S-O-B so I sent the patch
without. Perhaps can be added at commit time if needed.

Thanks again,
Thomas


>=20
> Regards,
> Boqun
>=20
> >=20
> > Thanks,
> > Thomas
> >=20
> >=20
> [...]

