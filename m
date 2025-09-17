Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FB8B7EF8E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 15:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8652A10E419;
	Wed, 17 Sep 2025 07:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gnLWhdO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998AF10E419;
 Wed, 17 Sep 2025 07:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758093023; x=1789629023;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=NR3vB7P34lfRH5s6vxgMe+VjfIXtRMdJTzD25Y+R00Q=;
 b=gnLWhdO2ZaR5+bgA+m4bxs+ZmgyNAJHoBOGtWzlXrfnAcPrIaYU+A5p1
 NHTIcQYYIrZkRO2+UBHUWwb4/jOQ3YoqpLjtj0t3rq19K/arPKIIWr6Hs
 Q5lq3Trf+ReZJOvckEmXYc4LbTbdgVYf6Mg2eu4//hdm/OupC1bqpKN6A
 7tkj+4VogkCcjKd44CnZjUDYc7695+PFirsI+ma5K5y1ZcE/2OZMDiumv
 4fioG7d66oYmcd5qfzB9dMt0kfPRsxvmmE+OHhcffizR22k1Ibjd53Fto
 qaAJYZbXQICzuzeh/9lkZT5hbFRXoLVpVPt/YHU7VN1PuB8GKfz+qjK0H A==;
X-CSE-ConnectionGUID: 2ZTySakRRP+UYa/dnwc+5w==
X-CSE-MsgGUID: YjXrQ6EBTu2FWqR4RSuUZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="77828955"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="77828955"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 00:10:23 -0700
X-CSE-ConnectionGUID: BPXqxGDURtqnoul5P+Bfdw==
X-CSE-MsgGUID: 3nRu7LnDSHSEqF51gvRXsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="179449916"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.26])
 ([10.245.244.26])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 00:10:21 -0700
Message-ID: <c8f13753981072aeef025b0a23967b07cfc0dc79.camel@linux.intel.com>
Subject: Re: [PATCH v4 3/5] drm/xe/pf: Add a helper function to get a VF's
 backing object in LMEM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Wed, 17 Sep 2025 09:10:18 +0200
In-Reply-To: <a28534edd2c0d496317869a6f85d199d6fbfef54.camel@linux.intel.com>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
 <20250915072428.1712837-4-vivek.kasireddy@intel.com>
 <a28534edd2c0d496317869a6f85d199d6fbfef54.camel@linux.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Tue, 2025-09-16 at 22:06 +0200, Thomas Hellstr=C3=B6m wrote:
> On Mon, 2025-09-15 at 00:21 -0700, Vivek Kasireddy wrote:
> > To properly import a dmabuf that is associated with a VF (or that
> > originates in a Guest VM that includes a VF), we need to know where
> > in LMEM the VF's allocated regions exist. Therefore, introduce a
> > new helper to return the object that backs the VF's regions in
> > LMEM.
> >=20
> > v2:
> > - Make the helper return the LMEM object instead of the start
> > address
> >=20
> > v3:
> > - Move the declaration of the helper under other lmem helpers
> > (Michal)
>=20
> In XeKMD we're typically using VRAM instead of LMEM, IMO we should
> try
> to be consistent with this.

I actually notice that most of the SRIOV code uses LMEM instead of
VRAM, so I discussed with the other maintainers what would be the best
way moving forward here.

So if you could try as a general rule to avoid using "lmem" in other
files than the SRIOV files. Also if SRIOV functions or variable names
or fields mandate it, "lmem" is OK.

But in other files, functions and variable names, pleas use VRAM.

Thanks,
Thomas


