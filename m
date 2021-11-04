Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B2B445370
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 13:59:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100616F46F;
	Thu,  4 Nov 2021 12:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7777B6F478;
 Thu,  4 Nov 2021 12:59:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="292531884"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="292531884"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 05:59:23 -0700
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="450441783"
Received: from agilev-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.249.254.157])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 05:59:21 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211102070601.155501-1-hch@lst.de>
References: <20211102070601.155501-1-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Subject: Re: refactor the i915 GVT support and move to the modern mdev API v2
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <163603075885.4807.880888219859400958@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Thu, 04 Nov 2021 14:59:18 +0200
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zhenyu and Zhi,

Can you have somebody from the GVT team to review the patches that
are fully contained in gvt/ ?

I also started discussion on patch 6 which is about defining the
interface between the modules. I remember there is prior work to shrink
the interface. Do you have links to such patches?

The minimal we should do is to eliminate the double underscore
prefixed functions. But I would prefer to have the symbol exports by
default so that we can enable the functionality just by loading the
module.

Regards, Joonas

Quoting Christoph Hellwig (2021-11-02 09:05:32)
> Hi all,
>=20
> the GVT code in the i915 is a bit of a mess right now due to strange
> abstractions and lots of indirect calls.  This series refactors various
> bits to clean that up.  The main user visible change is that almost all
> of the GVT code moves out of the main i915 driver and into the kvmgt
> module.
>=20
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
> Changes since v1:
>  - rebased on Linux 5.15
>  - allow the kvmgvt module to be loaded at any time and thus solve
>    the deadlock when both i915 amd kvmgvt are modular
>  - include the conversion to the modern mdev API
>=20
> Note that I do expect to rebased this again against 5.16-rc1 once
> released, but I'd like to get this out for review ASAP.
>=20
> Diffstat:
>  b/drivers/gpu/drm/i915/Kconfig          |   33=20
>  b/drivers/gpu/drm/i915/Makefile         |   31=20
>  b/drivers/gpu/drm/i915/gvt/cfg_space.c  |   89 --
>  b/drivers/gpu/drm/i915/gvt/cmd_parser.c |    4=20
>  b/drivers/gpu/drm/i915/gvt/dmabuf.c     |   36 -
>  b/drivers/gpu/drm/i915/gvt/execlist.c   |   12=20
>  b/drivers/gpu/drm/i915/gvt/gtt.c        |   55 +
>  b/drivers/gpu/drm/i915/gvt/gvt.h        |  125 ++-
>  b/drivers/gpu/drm/i915/gvt/interrupt.c  |   38 +
>  b/drivers/gpu/drm/i915/gvt/kvmgt.c      | 1099 +++++++++++++++----------=
-------
>  b/drivers/gpu/drm/i915/gvt/mmio.c       |    4=20
>  b/drivers/gpu/drm/i915/gvt/opregion.c   |  148 ----
>  b/drivers/gpu/drm/i915/gvt/page_track.c |    8=20
>  b/drivers/gpu/drm/i915/gvt/scheduler.c  |   37 -
>  b/drivers/gpu/drm/i915/gvt/trace.h      |    2=20
>  b/drivers/gpu/drm/i915/gvt/vgpu.c       |   22=20
>  b/drivers/gpu/drm/i915/i915_drv.c       |    7=20
>  b/drivers/gpu/drm/i915/i915_drv.h       |    1=20
>  b/drivers/gpu/drm/i915/i915_trace.h     |    1=20
>  b/drivers/gpu/drm/i915/intel_gvt.c      |  162 +++-
>  b/drivers/gpu/drm/i915/intel_gvt.h      |   17=20
>  drivers/gpu/drm/i915/gvt/Makefile       |    9=20
>  drivers/gpu/drm/i915/gvt/gvt.c          |  340 ---------
>  drivers/gpu/drm/i915/gvt/hypercall.h    |   82 --
>  drivers/gpu/drm/i915/gvt/mpt.h          |  400 -----------
>  25 files changed, 929 insertions(+), 1833 deletions(-)
