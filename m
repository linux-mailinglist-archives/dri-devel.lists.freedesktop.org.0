Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F158F829D8B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 16:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A088D10E5F1;
	Wed, 10 Jan 2024 15:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D3810E035;
 Wed, 10 Jan 2024 15:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704900513; x=1736436513;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:from:to:cc:subject:message-id:date;
 bh=fV7NAoQ0qHc6gn38m7vJBQuKu07R0duL29KMcubUULk=;
 b=TbOsPyz/geJaiIACnT+Ojt4t6DliSdw3s0rxiRqwMf9A2SjFC9VKF1ic
 tq40mmc57hA5p4oW/a2i+2OR3G8XV5r2RsR9KA8tDW8AqW1UkGh783byK
 Y3mW6JF63Vs2N6ZrGgwr2Xba1Otlsvm8ybgRBEbaEOmt7fpbHDf4lreaF
 gUupeJFcpEP+l8GW4k2rwFHpw1o7GbWcude0ZQn/Z3A+n16mOlXs0V54L
 ei0LE78KNd5krslYM6IpTePNAf1jzu1WAq1HSr7VM+/x8KQvvi9FgIllG
 TQFj3tvFubBakH7xKV0EN03vDAY4kV/oL3zk4dyeqeJhbYzvpDCOOd8Dy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="395704783"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="395704783"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 07:28:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="30639512"
Received: from nselinsk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.246.34.242])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 07:28:26 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <170490002493.164187.5401160425746227111@jlahtine-mobl.ger.corp.intel.com>
References: <20240110092109.1950011-1-hch@lst.de>
 <ZZ6Pfk8tLXbvs4dE@casper.infradead.org>
 <170490002493.164187.5401160425746227111@jlahtine-mobl.ger.corp.intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>
Subject: Re: disable large folios for shmem file used by xfs xfile
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <170490050245.164862.16261803493864298341@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Wed, 10 Jan 2024 17:28:22 +0200
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
Cc: "Darrick J . Wong" <djwong@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-sgx@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Chandan Babu R <chandan.babu@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Joonas Lahtinen (2024-01-10 17:20:24)
> Quoting Matthew Wilcox (2024-01-10 14:37:18)
> > On Wed, Jan 10, 2024 at 10:21:07AM +0100, Christoph Hellwig wrote:
> > > Hi all,
> > >=20
> > > Darrick reported that the fairly new XFS xfile code blows up when for=
ce
> > > enabling large folio for shmem.  This series fixes this quickly by di=
sabling
> > > large folios for this particular shmem file for now until it can be f=
ixed
> > > properly, which will be a lot more invasive.
> > >=20
> > > I've added most of you to the CC list as I suspect most other users of
> > > shmem_file_setup and friends will have similar issues.
> >=20
> > The graphics users _want_ to use large folios.  I'm pretty sure they've
> > been tested with this.
>=20
> Correct. We've done quite a bit of optimization in userspace and
> enabling in kernel to take advantage of page sizes of 2M and beyond.
>=20
> However we specifically pass "huge=3Dwithin_size" to vfs_kern_mount when
> creating a private mount of tmpfs for the purpose of i915 created
> allocations.
>=20
> Older hardware also had some address hashing bugs where 2M aligned
> memory caused a lot of collisions in TLB so we don't enable it always.
>=20
> You can see drivers/gpu/drm/i915/gem/i915_gemfs.c function
> i915_gemfs_init for details and references.
>=20
> So in short, functionality wise we should be fine either default
> for using 2M pages or not. If they become the default, we'd probably
> want an option that would still be able to prevent them for performance
> regression reasons on older hardware.

To maybe write out my concern better:

Is there plan to enable huge pages by default in shmem?

If not I guess we should be pretty good with the way current code is, force
enabling them just might bring out some performance, so we might want to add
a warning for that.

If there is, then we'll probably want to in sync with those default changes
apply a similar call to block them on older HW.

Regards, Joonas

>=20
> Regards, Joonas
>=20
> > It's just XFS that didn't know about this
> > feature of shmem.
