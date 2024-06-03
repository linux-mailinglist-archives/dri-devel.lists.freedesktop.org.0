Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DCA8D7C6A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 09:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683C510E2D6;
	Mon,  3 Jun 2024 07:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G2gDK9AD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2703810E2D6;
 Mon,  3 Jun 2024 07:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717399488; x=1748935488;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=CFw0jXkCJ2C0wlfWJK24i5rMaTVUzDmZPVQIJxPWnQA=;
 b=G2gDK9AD0dULbtSNRWzbN1bDwIVT3gGumBWwcNDY2OpXPiz+u778KJZ1
 yAs7UOeCwVf+xwRfezMf2jPEfHwBOtoWskk2J3hE4okwG+Q7RraD0DBZV
 JRJUMtPNWVC+1wJ/5gfIOxtQbk7ifSfQA1M9sJ57ZqO8BP2S90/Cxf0jJ
 53wIOvY8Az5d358a+sL0Ya822RCkn8st//h9B+yYAA4wudGaYpKGoXUER
 ENYVFDKq6gRlWahUxrz27bgS52AZ4owgfuA1H3eoO3sqRKsrFCbBfGakh
 GK+19g0gTFgrUkkgVi4zJZVQ8ilLEqy2s3+1xLlMhMyleurbGe64ga8Aj Q==;
X-CSE-ConnectionGUID: l7v9qsZgQzmBgtXWzJUPIw==
X-CSE-MsgGUID: PDwZJob8S4GhQESgxX0oFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13824952"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="13824952"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 00:24:47 -0700
X-CSE-ConnectionGUID: kxqd9paxTmyZfVioFUTnCg==
X-CSE-MsgGUID: wgn4h+pnQIKznB3X/28G+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="36875565"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.247.161])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 00:24:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Jun 2024 10:24:39 +0300 (EEST)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc: Chia-I Wu <olvaffe@gmail.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com, 
 alexander.deucher@amd.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>, 
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kernel/resource: optimize find_next_iomem_res
In-Reply-To: <Zlw1_n20oqchAYxH@smile.fi.intel.com>
Message-ID: <783e9d9a-e408-c6f0-9a4b-050e1979b919@linux.intel.com>
References: <20240531053704.2009827-1-olvaffe@gmail.com>
 <ZlmQ3_wcL3cgp4Hb@smile.fi.intel.com>
 <CAPaKu7SsD+X7KAO=3vEYU_7YGM_f+7k1fdC9nEK=-NaJw8oYaA@mail.gmail.com>
 <Zlw1_n20oqchAYxH@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-947370823-1717399436=:1529"
Content-ID: <ac58b535-760b-99ee-4936-892d3e4f1ed9@linux.intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-947370823-1717399436=:1529
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <9a23e7b3-9da0-cdcd-f514-8f55036748af@linux.intel.com>

On Sun, 2 Jun 2024, Andy Shevchenko wrote:

> On Fri, May 31, 2024 at 02:31:45PM -0700, Chia-I Wu wrote:
> > On Fri, May 31, 2024 at 1:57=E2=80=AFAM Andy Shevchenko <
> > andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, May 30, 2024 at 10:36:57PM -0700, Chia-I Wu wrote:
>=20
> ...
>=20
> > > P.S> I'm not so sure about this change. It needs a thoroughly testing=
, esp.
> > > in PCI case. Cc'ing to Ilpo.
>=20
> > What's special about PCI?
>=20
> PCI, due to its nature, may rebuild resources either by shrinking or expa=
nding
> of the entire subtree after the PCI bridge in question. And this may happ=
en at
> run-time due to hotplug support. But I'm not a deep expert in this area, =
Ilpo
> knows much more than me.

There is code which clearly tries to do expanding resource but that=20
usually fails to work as intended because of a parent resource whose size=
=20
is fixed because it's already assigned.

Some other code might block shrinking too under certain conditions.

This area would need to be reworked in PCI core but it's massive and=20
scary looking change.

--=20
 i.
--8323328-947370823-1717399436=:1529--
