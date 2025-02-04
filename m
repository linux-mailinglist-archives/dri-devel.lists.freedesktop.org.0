Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3810A27461
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 15:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE7E10E65F;
	Tue,  4 Feb 2025 14:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ut5+L/bf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C34B10E34F;
 Tue,  4 Feb 2025 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738679395; x=1770215395;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lAbL/0l6KMc7nqVP2DUrdeWeqlThU/+Tdw9u/t7yoPg=;
 b=Ut5+L/bfBadwBA4fhQHMxlRUXuurRnewSL4yoa+vnO1UrbnywaFgGyGJ
 //0KNylxPVqKd9ngmLmD+Fqz6D3AJl1J1BUu8kGjy29RZ4nwrYTn135Do
 LmfT5MsW927xKdwYOtCiFvRN98KFvdWBnGqbHadIGHKr8w7luF0BRt2iL
 Jtyhi09f9CWkBdGcFYP0TP5iQhQ8t5GvVD2LdwjGnjCHgzquR2ruk25b6
 oAdEZFiiin5qoHsY6UfEqchUKQeUkk8VRRSHL12s4mOnvlwYwJQeqfb+P
 E6HIfTsEBxeSdkpkHuLXXh9jCHUp/PF6ypzej1y2X6Wjzl4tN7MZJhib3 Q==;
X-CSE-ConnectionGUID: hGvBkOEEQGa0r718HHw4Ng==
X-CSE-MsgGUID: jCUzXPGMTl+GKqODL0asFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39238447"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="39238447"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 06:29:55 -0800
X-CSE-ConnectionGUID: RN6d+SumTOSsCLPg3AdQww==
X-CSE-MsgGUID: kC63yfL0SO+G5fseY8Womg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="147807634"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.144])
 ([10.245.246.144])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 06:29:51 -0800
Message-ID: <3e96aef8009be69858a69d3e49a2bd7fc7d06f5f.camel@linux.intel.com>
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
Date: Tue, 04 Feb 2025 15:29:48 +0100
In-Reply-To: <20250204132615.GI2296753@ziepe.ca>
References: <20250128172123.GD1524382@ziepe.ca>
 <Z5ovcnX2zVoqdomA@phenom.ffwll.local> <20250129134757.GA2120662@ziepe.ca>
 <Z5tZc0OQukfZEr3H@phenom.ffwll.local> <20250130132317.GG2120662@ziepe.ca>
 <Z5ukSNjvmQcXsZTm@phenom.ffwll.local> <20250130174217.GA2296753@ziepe.ca>
 <Z50BbuUQWIaDPRzK@phenom.ffwll.local> <20250203150805.GC2296753@ziepe.ca>
 <7b7a15fb1f59acc60393eb01cefddf4dc1f32c00.camel@linux.intel.com>
 <20250204132615.GI2296753@ziepe.ca>
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

On Tue, 2025-02-04 at 09:26 -0400, Jason Gunthorpe wrote:
> On Tue, Feb 04, 2025 at 10:32:32AM +0100, Thomas Hellstr=C3=B6m wrote:
> >=20
>=20
> > 1) Existing users would never use the callback. They can still rely
> > on
> > the owner check, only if that fails we check for callback
> > existence.
> > 2) By simply caching the result from the last checked dev_pagemap,
> > most
> > callback calls could typically be eliminated.
>=20
> But then you are not in the locked region so your cache is racy and
> invalid.

I'm not sure I follow? If a device private pfn handed back to the
caller is dependent on dev_pagemap A having a fast interconnect to the
client, then subsequent pfns in the same hmm_range_fault() call must be
able to make the same assumption (pagemap A having a fast
interconnect), else the whole result is invalid?

>=20
> > 3) As mentioned before, a callback call would typically always be
> > followed by either migration to ram or a page-table update.
> > Compared to
> > these, the callback overhead would IMO be unnoticeable.
>=20
> Why? Surely the normal case should be a callback saying the memory
> can
> be accessed?

Sure, but at least on the xe driver, that means page-table repopulation
since the hmm_range_fault() typically originated from a page-fault.


>=20
> > 4) pcie_p2p is already planning a dev_pagemap callback?
>=20
> Yes, but it is not a racy validation callback, and it already is
> creating a complicated lifecycle problem inside the exporting the
> driver.

Yeah, I bet there are various reasons against a callback. I just don't
see the performance argument being a main concern.=20

>=20
> Jason

/Thomas


