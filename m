Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 855523F8282
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 08:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B25989A91;
	Thu, 26 Aug 2021 06:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C7089A91;
 Thu, 26 Aug 2021 06:35:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="278689518"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; 
 d="asc'?scan'208";a="278689518"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 23:35:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; 
 d="asc'?scan'208";a="527640870"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.143])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Aug 2021 23:35:18 -0700
Date: Thu, 26 Aug 2021 14:12:19 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: refactor the i915 GVT support
Message-ID: <20210826061219.GD9942@zhen-hp.sh.intel.com>
References: <20210729072022.GB31896@lst.de>
 <20210803094315.GF13928@zhen-hp.sh.intel.com>
 <20210803143058.GA1721383@nvidia.com>
 <20210804052606.GG13928@zhen-hp.sh.intel.com>
 <20210816173458.GA9183@lst.de>
 <20210817010851.GW13928@zhen-hp.sh.intel.com>
 <20210817052203.GX13928@zhen-hp.sh.intel.com>
 <20210819082929.GB13928@zhen-hp.sh.intel.com>
 <20210820141724.GA29034@lst.de>
 <YSAI8pKAvvW/8S2O@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="GZVR6ND4mMseVXL/"
Content-Disposition: inline
In-Reply-To: <YSAI8pKAvvW/8S2O@bombadil.infradead.org>
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


--GZVR6ND4mMseVXL/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.08.20 12:56:34 -0700, Luis Chamberlain wrote:
> On Fri, Aug 20, 2021 at 04:17:24PM +0200, Christoph Hellwig wrote:
> > On Thu, Aug 19, 2021 at 04:29:29PM +0800, Zhenyu Wang wrote:
> > > I'm working on below patch to resolve this. But I met a weird issue in
> > > case when building i915 as module and also kvmgt module, it caused
> > > busy wait on request_module("kvmgt") when boot, it doesn't happen if
> > > building i915 into kernel. I'm not sure what could be the reason?
> >=20
> > Luis, do you know if there is a problem with a request_module from
> > a driver ->probe routine that is probably called by a module_init
> > function itself?
>=20
> Generally no, but you can easily foot yourself in the feet by creating
> cross dependencies and not dealing with them properly. I'd make sure
> to keep module initialization as simple as possible, and run whatever
> takes more time asynchronously, then use a state machine to allow
> you to verify where you are in the initialization phase or query it
> or wait for a completion with a timeout.
>=20
> It seems the code in question is getting some spring cleaning, and its
> unclear where the code is I can inspect. If there's a tree somewhere I
> can take a peak I'd be happy to review possible oddities that may stick
> out.

I tried to put current patches under test here: https://github.com/intel/gv=
t-linux/tree/gvt-staging
The issue can be produced with CONFIG_DRM_I915=3Dm and CONFIG_DRM_I915_GVT_=
KVMGT=3Dm.

>=20
> My goto model for these sorts of problems is to abstract the issue
> *outside* of the driver in question and implement new selftests to
> try to reproduce. This serves two purposes, 1) helps with testing
> 2) may allow you to see the problem more clearly.
>=20

I'll see if can abstract that.

Thanks, Luis.

--GZVR6ND4mMseVXL/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYScwwwAKCRCxBBozTXgY
J4yKAJ0d9jcEa21+qw9af0hJvQT2LXk0WACggn/GD2G8nFh6SY4kc8+7qqXkpi0=
=fIjO
-----END PGP SIGNATURE-----

--GZVR6ND4mMseVXL/--
