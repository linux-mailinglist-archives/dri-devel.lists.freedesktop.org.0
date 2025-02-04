Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C88CA27DF6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 23:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D846F10E0DA;
	Tue,  4 Feb 2025 22:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SnIdAeiS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C44C10E0DA;
 Tue,  4 Feb 2025 22:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738706516; x=1770242516;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lbPHclbARFkQmvsu0zJqrdw8H+4xG9Vq8ZiG/BDW7Jo=;
 b=SnIdAeiSJzNX9/JAXIM4BtrJXXslAdwH3NO+iWKdYGQglBbs3tJh/85w
 RSURia45TzfiPSKtTO6RkHkhJT/qE6fKCGX4cpsikWOzSnfYsoi6wrdFQ
 OqruTqRvnDYx5FYvCRgCcNt39G9By19skis4H83imsbfsh9Idm86dbaaH
 KpehQH4VZSu2TtlN7avExHkGlVNIjLT7Kgx2adgQQmbbUe+x/zOqCsK/N
 /z/IQg/MksLYozdX52XAf+aqlhmlMoeYc7GFjniKIRwQyByIlF4dQ45Dp
 KgGXBnDbOi9Xl3pS2S35bRkMFzSgCm1N/qJ80Du3bFw3E90p8K4svtqcL Q==;
X-CSE-ConnectionGUID: +STK1273TzqvHsW8I1VQrw==
X-CSE-MsgGUID: 74SKy5jcTlqA1Mxdyup64g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39517120"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="39517120"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 14:01:55 -0800
X-CSE-ConnectionGUID: NAx9oX9yRyOex+aeBj7lDg==
X-CSE-MsgGUID: DNsEcHZsSNySIyoK+sYkqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="111263801"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.144])
 ([10.245.246.144])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 14:01:28 -0800
Message-ID: <60b7e29853cb33d45d10101e494c7ddbe6a5abd6.camel@linux.intel.com>
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch, leon@kernel.org, 
 jglisse@redhat.com, akpm@linux-foundation.org, GalShalom@nvidia.com, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, 	linux-tegra@vger.kernel.org
Date: Tue, 04 Feb 2025 23:01:25 +0100
In-Reply-To: <20250204191601.GK2296753@ziepe.ca>
References: <20250129134757.GA2120662@ziepe.ca>
 <Z5tZc0OQukfZEr3H@phenom.ffwll.local> <20250130132317.GG2120662@ziepe.ca>
 <Z5ukSNjvmQcXsZTm@phenom.ffwll.local> <20250130174217.GA2296753@ziepe.ca>
 <Z50BbuUQWIaDPRzK@phenom.ffwll.local> <20250203150805.GC2296753@ziepe.ca>
 <7b7a15fb1f59acc60393eb01cefddf4dc1f32c00.camel@linux.intel.com>
 <20250204132615.GI2296753@ziepe.ca>
 <3e96aef8009be69858a69d3e49a2bd7fc7d06f5f.camel@linux.intel.com>
 <20250204191601.GK2296753@ziepe.ca>
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

On Tue, 2025-02-04 at 15:16 -0400, Jason Gunthorpe wrote:
> On Tue, Feb 04, 2025 at 03:29:48PM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Tue, 2025-02-04 at 09:26 -0400, Jason Gunthorpe wrote:
> > > On Tue, Feb 04, 2025 at 10:32:32AM +0100, Thomas Hellstr=C3=B6m wrote=
:
> > > >=20
> > >=20
> > > > 1) Existing users would never use the callback. They can still
> > > > rely
> > > > on
> > > > the owner check, only if that fails we check for callback
> > > > existence.
> > > > 2) By simply caching the result from the last checked
> > > > dev_pagemap,
> > > > most
> > > > callback calls could typically be eliminated.
> > >=20
> > > But then you are not in the locked region so your cache is racy
> > > and
> > > invalid.
> >=20
> > I'm not sure I follow? If a device private pfn handed back to the
> > caller is dependent on dev_pagemap A having a fast interconnect to
> > the
> > client, then subsequent pfns in the same hmm_range_fault() call
> > must be
> > able to make the same assumption (pagemap A having a fast
> > interconnect), else the whole result is invalid?
>=20
> But what is the receiver going to do with this device private page?
> Relock it again and check again if it is actually OK? Yuk.

I'm still lost as to what would be the possible race-condition that
can't be handled in the usual way using mmu invalidations + notifier
seqno bump? Is it the fast interconnect being taken down?

/Thomas


>=20
> > > > 3) As mentioned before, a callback call would typically always
> > > > be
> > > > followed by either migration to ram or a page-table update.
> > > > Compared to
> > > > these, the callback overhead would IMO be unnoticeable.
> > >=20
> > > Why? Surely the normal case should be a callback saying the
> > > memory
> > > can
> > > be accessed?
> >=20
> > Sure, but at least on the xe driver, that means page-table
> > repopulation
> > since the hmm_range_fault() typically originated from a page-fault.
>=20
> Yes, I expect all hmm_range_fault()'s to be on page fault paths, and
> we'd like it to be as fast as we can in the CPU present case..
>=20
> Jason

