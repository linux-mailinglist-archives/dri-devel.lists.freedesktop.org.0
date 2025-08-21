Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAA6B2FBCA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 16:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD88210E9A5;
	Thu, 21 Aug 2025 14:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PSuKEii2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF1810E9A4;
 Thu, 21 Aug 2025 14:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755785190; x=1787321190;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=DFZ8GzH4PMLZ7YtPaIff1L8aOJhTs+rbBfkl4xIUtc4=;
 b=PSuKEii2y/xJ/KDmkaTrprUYPwYtkskcpTQOB3GbpgPUf4Wk+lt1V3ZU
 sSd/ktnrD+LFvkoy1cewpjFSKRrEsm5Yx6/FL1pREok9zkiWia5q1PwSx
 RqPDDsHic5tDbKeeVJEHj3B9hhRAytQCZM6ODxXX0FYAfYpvTJtJeomzY
 UZFOtMPrX3/MGFk+1YeUmH2V0cX8XoWU7Nv59zIPgBgGRVWggNzxEWMt1
 omuDKzs/lWsb5vBbeVnXSYOe9aPYfjSHsIY6qRfqyYfNdiJyAXpqPxmZm
 76Bh/PIg/qE5FJuzPhSGk4jQGaxgVMnO0H3y6vcVllC0KUkzhtRyb7vct g==;
X-CSE-ConnectionGUID: zZxITCH2SFmDw89wthHsog==
X-CSE-MsgGUID: 88aj76zJSQa4l0cMzKB8tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="45647399"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="45647399"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 07:06:27 -0700
X-CSE-ConnectionGUID: MMRioP22SaKl5k3mts6Nkw==
X-CSE-MsgGUID: pC2WanjVTLOBYekjFhfVVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="167657894"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.245.201])
 ([10.245.245.201])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 07:06:25 -0700
Message-ID: <fd34b897a3223346518d3fe009772996eb25c90b.camel@linux.intel.com>
Subject: Re: Switching over to GEM refcounts and a bunch of cleanups
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Thu, 21 Aug 2025 16:06:20 +0200
In-Reply-To: <1f13c0b6-fdbb-4364-a32e-4344f8526464@amd.com>
References: <20250716160555.20217-1-christian.koenig@amd.com>
 <c5830530bafa9806b9e1b0604d87f7907f651c82.camel@linux.intel.com>
 <5a9c2c36-d1b2-4871-b84a-7372aa547399@amd.com>
 <1f13c0b6-fdbb-4364-a32e-4344f8526464@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

Hi Christian,

On Thu, 2025-08-21 at 14:30 +0200, Christian K=C3=B6nig wrote:
> On 04.08.25 14:24, Christian K=C3=B6nig wrote:
> > On 22.07.25 14:36, Thomas Hellstr=C3=B6m wrote:
> > > Hi, Christian,
> > >=20
> > > On Wed, 2025-07-16 at 18:04 +0200, Christian K=C3=B6nig wrote:
> > > > Hi guys,
> > > >=20
> > > > so I hope Thomas is back from vacation while I will be on
> > > > vacation
> > > > for
> > > > the next two weeks.
> > > >=20
> > > > Here is the patch set which cleans up TTM and XE in preperation
> > > > of
> > > > switching to drm_exec.
> > > >=20
> > > > Please take a look and let me know what you think about it.
> > >=20
> > > I'll take a look.
> > > BTW Did you see my comments on patch 6/6 on v1, essentially I
> > > think
> > > both i915 and xe rejecting some TTM callbacks if the object is a
> > > zombie
> > > (the GEM refcount has reached 0).
> >=20
> > Sorry for the delay I'm just back from vacation.
> >=20
> > I have seen that XE and i915 is checking the GEM refcount, but I
> > haven't seen your comment on that.
> >=20
> > Going to take a look ASAP.
>=20
> I'm not able to find that mail.
>=20
> All I've seen is your comment on the VMWGFX stuff and that was
> already resolved by Zack.
>=20
> What are you referring to?

https://lore.kernel.org/intel-xe/a004736315d77837172418eb196d5b5f80b74e6c.c=
amel@linux.intel.com/

Thanks,
Thomas


>=20
> Thanks,
> Christian.
>=20
> >=20
> > Regards,
> > Christian.
> >=20
> > >=20
> > > Thanks,
> > > Thomas
> > >=20
> > >=20
> > > >=20
> > > > Regards,
> > > > Christian.
> > > >=20
> > >=20
> >=20
>=20

