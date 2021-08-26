Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20203F827C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 08:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC906E508;
	Thu, 26 Aug 2021 06:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1C66E508;
 Thu, 26 Aug 2021 06:31:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="217681416"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; 
 d="asc'?scan'208";a="217681416"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 23:31:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; 
 d="asc'?scan'208";a="494944170"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.143])
 by fmsmga008.fm.intel.com with ESMTP; 25 Aug 2021 23:31:08 -0700
Date: Thu, 26 Aug 2021 14:08:09 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: refactor the i915 GVT support
Message-ID: <20210826060809.GC9942@zhen-hp.sh.intel.com>
References: <20210728175925.GU1721383@nvidia.com>
 <20210729072022.GB31896@lst.de>
 <20210803094315.GF13928@zhen-hp.sh.intel.com>
 <20210803143058.GA1721383@nvidia.com>
 <20210804052606.GG13928@zhen-hp.sh.intel.com>
 <20210816173458.GA9183@lst.de>
 <20210817010851.GW13928@zhen-hp.sh.intel.com>
 <20210817052203.GX13928@zhen-hp.sh.intel.com>
 <20210819082929.GB13928@zhen-hp.sh.intel.com>
 <20210820141724.GA29034@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline
In-Reply-To: <20210820141724.GA29034@lst.de>
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.08.20 16:17:24 +0200, Christoph Hellwig wrote:
> On Thu, Aug 19, 2021 at 04:29:29PM +0800, Zhenyu Wang wrote:
> > I'm working on below patch to resolve this. But I met a weird issue in
> > case when building i915 as module and also kvmgt module, it caused
> > busy wait on request_module("kvmgt") when boot, it doesn't happen if
> > building i915 into kernel. I'm not sure what could be the reason?
>=20
> Luis, do you know if there is a problem with a request_module from
> a driver ->probe routine that is probably called by a module_init
> function itself?
>=20
> In the meantime I'll try to reproduce it locally, but I always had a
> hard time getting useful results out of a modular i915, especially
> when combined with module paramters. (no blame on i915, just the problem
> with modules needed early on).
>=20
> >=20
> > > But the problem I see is that after moving gvt device model (gvt/*.c
> > > except kvmgt.c) into kvmgt module, we'll have issue with initial mmio
> > > state which current gvt relies on, that is in design supposed to get
> > > initial HW state before i915 driver has taken any operation.  Before
> > > we can ensure that, I think we may only remove MPT part first but
> > > still keep gvt device model as part of i915 with config. I'll try to
> > > split that out.
> >=20
> > Sorry I misread the code that as we always request kvmgt module when
> > gvt init, so it should still apply original method that this isn't a
> > problem. Our current validation result has shown no regression as well.
>=20
> What does initial mmio state mean?  This is something new to me.  But
> as you said in this mail unless I missed something very big it should
> work the same as before.
>

It's gvt internal track for all gfx mmio state, and yes with your current
change it should still work as before.

> > -static inline void intel_context_unpin(struct intel_context *ce)
> > +static inline void _intel_context_unpin(struct intel_context *ce)
> >  {
> >  	if (!ce->ops->sched_disable) {
> >  		__intel_context_do_unpin(ce, 1);
> > @@ -150,6 +150,7 @@ static inline void intel_context_unpin(struct intel=
_context *ce)
> >  		}
> >  	}
> >  }
> > +void intel_context_unpin(struct intel_context *ce);
>=20
> Looking at intel_context_unpin/_intel_context_unpin is there really
> a need to have this inline to start with?  It don't see much the compiler
> could optimize by inlining it.

I'll send patch to i915 for this, and get more comments there.

thanks

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYScvyQAKCRCxBBozTXgY
Jz8KAKCJpvaz39KXtI3VDSxG4E4LXamy/gCgizdwhAP/cypZZo3OeM1RLCUmH+Q=
=Z3tx
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--
