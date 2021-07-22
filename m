Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AD63D21BB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 12:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4116EA2E;
	Thu, 22 Jul 2021 10:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C813F6EA2A;
 Thu, 22 Jul 2021 10:06:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="272727227"
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; 
 d="asc'?scan'208";a="272727227"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 03:06:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; 
 d="asc'?scan'208";a="433069587"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.143])
 by fmsmga007.fm.intel.com with ESMTP; 22 Jul 2021 03:06:54 -0700
Date: Thu, 22 Jul 2021 17:45:16 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: refactor the i915 GVT support
Message-ID: <20210722094516.GQ13928@zhen-hp.sh.intel.com>
References: <20210721155355.173183-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="wjoFZxbW4tu+iR6v"
Content-Disposition: inline
In-Reply-To: <20210721155355.173183-1-hch@lst.de>
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wjoFZxbW4tu+iR6v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.07.21 17:53:34 +0200, Christoph Hellwig wrote:
> Hi all,
>=20
> the GVT code in the i915 is a bit of a mess right now due to strange
> abstractions and lots of indirect calls.  This series refactors various
> bits to clean that up.  The main user visible change is that almost all
> of the GVT code moves out of the main i915 driver and into the kvmgt
> module.
>

The reason we isolated hypervisor specific code from core vgpu
emulation is to make multiple hypervisor support possible. Yes, we do
have Xen support but never got way into upstream...And we also have
third party hypervisors which leverage gvt function through current
hypervisor interface.

Sorry I may not have more time to check in details for now, but some
of them look fine to me. I'll review more after vacation or let Zhi check d=
etails.

Thanks!

> Tested on my Thinkpad with a Kaby Lake CPU and integrated graphics.
>=20
> Git tree:
>=20
>     git://git.infradead.org/users/hch/misc.git i915-gvt
>=20
> Gitweb:
>=20
>     http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/i915-=
gvt
>=20
> Diffstat:
>  b/drivers/gpu/drm/i915/Kconfig                         |   31=20
>  b/drivers/gpu/drm/i915/Makefile                        |   30=20
>  b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c |    4=20
>  b/drivers/gpu/drm/i915/gvt/cfg_space.c                 |   89 --
>  b/drivers/gpu/drm/i915/gvt/cmd_parser.c                |    4=20
>  b/drivers/gpu/drm/i915/gvt/dmabuf.c                    |   36=20
>  b/drivers/gpu/drm/i915/gvt/execlist.c                  |   12=20
>  b/drivers/gpu/drm/i915/gvt/gtt.c                       |   55 -
>  b/drivers/gpu/drm/i915/gvt/gvt.c                       |  100 --
>  b/drivers/gpu/drm/i915/gvt/gvt.h                       |  132 ++-
>  b/drivers/gpu/drm/i915/gvt/interrupt.c                 |   38 -
>  b/drivers/gpu/drm/i915/gvt/kvmgt.c                     |  634 ++++------=
-------
>  b/drivers/gpu/drm/i915/gvt/mmio.c                      |    4=20
>  b/drivers/gpu/drm/i915/gvt/opregion.c                  |  148 ---
>  b/drivers/gpu/drm/i915/gvt/page_track.c                |    8=20
>  b/drivers/gpu/drm/i915/gvt/scheduler.c                 |   37=20
>  b/drivers/gpu/drm/i915/gvt/trace.h                     |    2=20
>  b/drivers/gpu/drm/i915/gvt/vgpu.c                      |   22=20
>  b/drivers/gpu/drm/i915/i915_drv.h                      |    7=20
>  b/drivers/gpu/drm/i915/i915_params.c                   |    2=20
>  b/drivers/gpu/drm/i915/intel_gvt.c                     |   64 +
>  b/drivers/gpu/drm/i915/intel_gvt.h                     |    4=20
>  drivers/gpu/drm/i915/gvt/Makefile                      |    9=20
>  drivers/gpu/drm/i915/gvt/hypercall.h                   |   82 --
>  drivers/gpu/drm/i915/gvt/mpt.h                         |  400 ----------
>  25 files changed, 541 insertions(+), 1413 deletions(-)

--wjoFZxbW4tu+iR6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYPk+JAAKCRCxBBozTXgY
J09VAJ9C5w8OkOxQaT+Hh6GRuwyrHlKVPgCfR2B56jaNxNaxyz+943xRn2xdLCo=
=enIC
-----END PGP SIGNATURE-----

--wjoFZxbW4tu+iR6v--
