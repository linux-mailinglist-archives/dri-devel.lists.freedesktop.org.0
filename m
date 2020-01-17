Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407E11401E5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 03:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DBB6F37C;
	Fri, 17 Jan 2020 02:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5369B6F37C;
 Fri, 17 Jan 2020 02:27:26 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 18:27:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,327,1574150400"; 
 d="asc'?scan'208";a="214325648"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.14])
 by orsmga007.jf.intel.com with ESMTP; 16 Jan 2020 18:27:23 -0800
Date: Fri, 17 Jan 2020 10:15:39 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>
Subject: Re: [RFC PATCH 4/4] drm/i915/gvt: move public gvt headers out into
 global include
Message-ID: <20200117021539.GA6715@zhen-hp.sh.intel.com>
References: <4079ce7c26a2d2a3c7e0828ed1ea6008d6e2c805.camel@cyberus-technology.de>
 <20200109171357.115936-1-julian.stecklina@cyberus-technology.de>
 <20200109171357.115936-5-julian.stecklina@cyberus-technology.de>
 <20200115152215.GA3830321@kroah.com>
 <9b32e225ee680e61716e300eb1ed8387599cc0dd.camel@cyberus-technology.de>
MIME-Version: 1.0
In-Reply-To: <9b32e225ee680e61716e300eb1ed8387599cc0dd.camel@cyberus-technology.de>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hang.yuan@intel.com,
 intel-gvt-dev@lists.freedesktop.org, zhiyuan.lv@intel.com
Content-Type: multipart/mixed; boundary="===============0777771393=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0777771393==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.01.16 15:13:01 +0100, Julian Stecklina wrote:
> Hi Greg, Christoph,
>=20
> On Wed, 2020-01-15 at 16:22 +0100, Greg KH wrote:
> > On Thu, Jan 09, 2020 at 07:13:57PM +0200, Julian Stecklina wrote:
> > > Now that the GVT interface to hypervisors does not depend on i915/GVT
> > > internals anymore, we can move the headers to the global include/.
> > >=20
> > > This makes out-of-tree modules for hypervisor integration possible.
> >=20
> > What kind of out-of-tree modules do you need/want for this?
>=20
> The mediated virtualization support in the i915 driver needs a backend to=
 the
> hypervisor. There is currently one backend for KVM in the tree
> (drivers/gpu/drm/i915/gvt/kvmgt.c) and at least 3 other hypervisor backen=
ds out
> of tree in various states of development that I know of. We are currently
> developing one of these.
>=20
> >=20
> > Also, as Christoph said, adding exports for functions that are not used
> > by anything within the kernel tree itself is not ok, that's not how we
> > work.
>=20
> The exports are used by the KVM hypervisor backend. The patchset I sent
> basically decouples KVMGT from i915 driver internals. So personally I wou=
ld
> count this as a benefit in itself.
>=20
> There is already an indirection in place that looks like it is intended to
> decouple the hypervisor backends from the i915 driver core: intel_gvt_ops=
=2E This
> is a struct of function pointers that the hypervisor backend uses to talk=
 to the
> GPU mediator code.
>=20
> Unfortunately, this struct doesn't cover all usecases and the KVM hypervi=
sor
> backend directly touches the i915 devices' internal state in very few pla=
ces. My
> current solution was to wrap these accesses in accessor functions and
> EXPORT_SYMBOL_GPL them.
>=20
> If the more acceptable solution is to add more function pointers to
> intel_gvt_ops instead of exporting symbols, I'm happy to go along this ro=
ute.
>

That depends on the hypervisor requirement and purpose, if it requires
gvt device model for some function e.g emulate mmio, we want it to be
a general gvt_ops, if it just trys to retrieve some vgpu info, we
might see if some common wrapper of internal data would be more easier.

> > And why do they somehow have to be out of the tree?  We want them in the
> > tree, and so should you, as it will save you time and money if they are.
>=20
> I also want these hypervisor backends in the tree, but from a development
> workflow having the ability to build them as a out-of-tree modules is very
> convenient. I guess this is also true for the developers working on the o=
ther
> hypervisor backends.
>=20
> When I looked at the status quo in i915/gvt a couple of weeks ago, it see=
med
> like it would be a win for everyone. Let me just clearly say that we have=
 no
> intention of doing binary blob drivers. :)
>

yeah, we do like to see more hypervisor support and make more clear interfa=
ce
between core device model with that.

thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXiEYywAKCRCxBBozTXgY
J7VAAJ4+GPxnpxcifJMey1RQ7Tu+IykKMQCdFGYEJ8xf6HRdloBoM5olfjQ3+Wo=
=4F3W
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--

--===============0777771393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0777771393==--
