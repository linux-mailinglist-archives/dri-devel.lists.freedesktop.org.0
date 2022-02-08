Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072924AD2B1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989FD10E13A;
	Tue,  8 Feb 2022 08:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2525110E13A;
 Tue,  8 Feb 2022 08:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644307456; x=1675843456;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:to:cc:subject:from:message-id:date;
 bh=AUUalteisJVotgwm2A5rb5kQMU4MKwe9fDedhXPmsdY=;
 b=ISajwYDkQ3UTA6UsP3EB/nbS7PtnugVeeCC+MfxNhP/uxsT5VQF/lz/K
 DNSGF5nQ3Ebf+BF3XXZCzR/TjW8TItGxCyAhIT6mTL0iKqf/Fit0TxCKs
 OUILcEHrBAsmwyH0Q/4yIQXJhCaSKcDjIukMquvfrxM2hxR8srE4G5p7f
 +PdrTeYQwwvA+Ayi7snpAomuW5rMFJNp4KLI3OAnCR/fZGGwzwTU0o//J
 rg8Qh7ojhCEWd0PQsEE/pu0lbfW2u2gL9GHzQzO63Gn2GbryhlRbLKMCU
 hL/Ccou0zVknJ86MXNBqlzSryZfOEwVJ/SAYIuBBijESOEE5MPaLwcGNA g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="232463872"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="232463872"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 00:04:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="540492714"
Received: from zimmerer-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.39.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 00:04:10 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <877da7rlzr.fsf@intel.com>
References: <20220127120508.11330-1-zhi.a.wang@intel.com>
 <20220207073247.GA24327@lst.de>
 <DM4PR11MB5549FE45F8098368114ADE75CA2C9@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20220207083535.GA25345@lst.de> <877da7rlzr.fsf@intel.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, Christoph Hellwig <hch@lst.de>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/3] i915/gvt: Introduce the mmio_table.c to support VFIO
 new mdev API
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <164430744744.6827.16056768203919410118@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Tue, 08 Feb 2022 10:04:07 +0200
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
Cc: Zhi Wang <zhi.wang.linux@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Jani Nikula (2022-02-07 12:48:08)
> On Mon, 07 Feb 2022, Christoph Hellwig <hch@lst.de> wrote:
> > On Mon, Feb 07, 2022 at 08:28:13AM +0000, Wang, Zhi A wrote:
> >> 1) About having the mmio_table.h, I would like to keep the stuff in a
> >> dedicated header as putting them in intel_gvt.h might needs i915 guys
> >> to maintain it.
> >> 2) The other one is about if we should move the mmio_table.c into
> >> i915 folder. I guess we need the some comments from Jani. In the
> >> current version that I am testing, it's still in GVT folder. Guess we
> >> can submit a patch to move it to i915 folder later if Jani is ok
> >> about that.
> >
> > Yes, let's have Jani chime in on these.  They're basically one and the
> > same issue.  This code will have to be built into into the core i915
> > driver even with my planned split, which is kindof the point of this
> > exercise.  I think it makes sense to use the subdirectories as boundari=
es
> > for where the code ends up and not to declarare maintainership boundari=
es,
> > but it will be up to the i915 and gvt maintainers to decide that.
>=20
> Agreed. If there's going to be a gvt.ko, I think all of gvt/ should be
> part of that module, nothing more, nothing less.
>=20
> The gvt related files in i915/ should probably be named intel_gvt* or
> something, ditto for function naming, and we'll probably want patches
> touching them be Cc'd to intel-gfx list.
>=20
> Joonas, Rodrigo, Tvrtko, thoughts?

Agreed on above. I don't think we expect much changes on the golden MMIO
state capture set.

Regards, Joonas
