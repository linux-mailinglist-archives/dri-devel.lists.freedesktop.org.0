Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FFD829D66
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 16:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CCD10E61E;
	Wed, 10 Jan 2024 15:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC9210E608;
 Wed, 10 Jan 2024 15:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704900037; x=1736436037;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:to:cc:from:message-id:date;
 bh=E0Bmp/5XWFLDuolIr/rqLJ0YwdpFYqvUjJulwkaWkOU=;
 b=QjSEzug+9KjtPQjwBL60X1mZyrkHmc0QIQa+7Wa3YedTK2f1RL6dWh/m
 gTnsXcHBG8ghgPJc8mubGT6tsWd1wS0S1wRAmqzY3R/zuf0pFeHzRjngd
 +LpRGawRX9v4irtQrzBIHDffoVa97aWYj/v25Cup9VepoPa65TEFJcig8
 PpUvlSodvqV+3UjV9X0aMnSURiCq30TZyFIeLUVWgGrqH/OQg7IIuoEUz
 xpZsYGtkUXX6yigNmoST/gL6bEpIO+riAyFykTWqEAn0YGko8c1oYCs3l
 UvEu97qpJweA6sGJjbd+7otWXRy8QMvXQdSpGUIC66eFh3S+a2X4c4hng A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="429731675"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="429731675"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 07:20:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="905573417"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="905573417"
Received: from nselinsk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.246.34.242])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 07:20:28 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZZ6Pfk8tLXbvs4dE@casper.infradead.org>
References: <20240110092109.1950011-1-hch@lst.de>
 <ZZ6Pfk8tLXbvs4dE@casper.infradead.org>
Subject: Re: disable large folios for shmem file used by xfs xfile
To: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <170490002493.164187.5401160425746227111@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Wed, 10 Jan 2024 17:20:24 +0200
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

Quoting Matthew Wilcox (2024-01-10 14:37:18)
> On Wed, Jan 10, 2024 at 10:21:07AM +0100, Christoph Hellwig wrote:
> > Hi all,
> >=20
> > Darrick reported that the fairly new XFS xfile code blows up when force
> > enabling large folio for shmem.  This series fixes this quickly by disa=
bling
> > large folios for this particular shmem file for now until it can be fix=
ed
> > properly, which will be a lot more invasive.
> >=20
> > I've added most of you to the CC list as I suspect most other users of
> > shmem_file_setup and friends will have similar issues.
>=20
> The graphics users _want_ to use large folios.  I'm pretty sure they've
> been tested with this.

Correct. We've done quite a bit of optimization in userspace and
enabling in kernel to take advantage of page sizes of 2M and beyond.

However we specifically pass "huge=3Dwithin_size" to vfs_kern_mount when
creating a private mount of tmpfs for the purpose of i915 created
allocations.

Older hardware also had some address hashing bugs where 2M aligned
memory caused a lot of collisions in TLB so we don't enable it always.

You can see drivers/gpu/drm/i915/gem/i915_gemfs.c function
i915_gemfs_init for details and references.

So in short, functionality wise we should be fine either default
for using 2M pages or not. If they become the default, we'd probably
want an option that would still be able to prevent them for performance
regression reasons on older hardware.

Regards, Joonas

> It's just XFS that didn't know about this
> feature of shmem.
