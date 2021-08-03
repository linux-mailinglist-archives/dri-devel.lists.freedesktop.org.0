Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CFA3DEA59
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 12:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E4689F4F;
	Tue,  3 Aug 2021 10:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D6F89F35;
 Tue,  3 Aug 2021 10:05:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="210534556"
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; 
 d="asc'?scan'208";a="210534556"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 03:05:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; 
 d="asc'?scan'208";a="441111523"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.143])
 by fmsmga007.fm.intel.com with ESMTP; 03 Aug 2021 03:05:21 -0700
Date: Tue, 3 Aug 2021 17:43:15 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: refactor the i915 GVT support
Message-ID: <20210803094315.GF13928@zhen-hp.sh.intel.com>
References: <20210721155355.173183-1-hch@lst.de>
 <DM4PR11MB55496531B246A4604FC86998CAE49@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210722112636.wj277vqhg4dez5ug@sirius.home.kraxel.org>
 <20210727121224.GA2145868@nvidia.com>
 <DM4PR11MB5549EC882AA6076F3468274DCAEA9@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210728175925.GU1721383@nvidia.com>
 <20210729072022.GB31896@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="tfmLD+Hxjexp/STe"
Content-Disposition: inline
In-Reply-To: <20210729072022.GB31896@lst.de>
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


--tfmLD+Hxjexp/STe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.07.29 09:20:22 +0200, Christoph Hellwig wrote:
> On Wed, Jul 28, 2021 at 02:59:25PM -0300, Jason Gunthorpe wrote:
> > On Wed, Jul 28, 2021 at 01:38:58PM +0000, Wang, Zhi A wrote:
> >=20
> > > I guess those APIs you were talking about are KVM-only. For other
> > > hypervisors, e.g. Xen, ARCN cannot use the APIs you mentioned. Not
> > > sure if you have already noticed that VFIO is KVM-only right now.
> >=20
> > There is very little hard connection between VFIO and KVM, so no, I
> > don't think that is completely true.
>=20
> The only connection is the SET_KVM notifier as far as I can tell.
> Which is used by a total of two drivers, including i915/gvt.  That
> being said gvt does not only use vfio, but also does quite a few
> direct cals to KVM.

yeah, we mostly combined VFIO into hypervisor specific thing before,
e.g interface to set vgpu edid, etc. along with kvm specific calls.

>=20
> > In an event, an in-tree version of other hypervisor support for GVT
> > needs to go through enabling VFIO support so that the existing API
> > multiplexers we have can be used properly, not adding a shim layer
> > trying to recreate VFIO inside a GPU driver.
>=20
> Yes.  And if we go back to actually looking at the series a lot of
> it just removes entirely pointless indirect calls that go to generic
> code and not even the kvm code, or questionable data structure designs.
> If we were to support another upstream hypervisor we'd just need to
> union a few fields in struct intel_gpu and maybe introduce a few
> methods.  Preferably in a way that avoids expensive indirect calls
> in the fast path.

ok, agree on that.

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks a lot for this effort!

--tfmLD+Hxjexp/STe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYQkPqQAKCRCxBBozTXgY
J28fAKCfkK2e0YsTNF5bkYm4ywfcUrVyUwCfTp2OmZlILsmRQlQHqq/BzcFaawY=
=TyW6
-----END PGP SIGNATURE-----

--tfmLD+Hxjexp/STe--
