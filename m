Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A4044C281
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 14:49:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5D56E484;
	Wed, 10 Nov 2021 13:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A336E484;
 Wed, 10 Nov 2021 13:49:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="219872669"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="219872669"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 05:49:52 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="492101967"
Received: from skofoed-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.254.124])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 05:49:48 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211109075957.GC27339@lst.de>
References: <20211102070601.155501-1-hch@lst.de>
 <163603075885.4807.880888219859400958@jlahtine-mobl.ger.corp.intel.com>
 <20211109075957.GC27339@lst.de>
Subject: Re: refactor the i915 GVT support and move to the modern mdev API v2
To: Christoph Hellwig <hch@lst.de>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <163655218578.6332.7934375733343731100@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Wed, 10 Nov 2021 15:49:45 +0200
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Christoph Hellwig (2021-11-09 09:59:57)
> On Thu, Nov 04, 2021 at 02:59:18PM +0200, Joonas Lahtinen wrote:
> > The minimal we should do is to eliminate the double underscore
> > prefixed functions. But I would prefer to have the symbol exports by
> > default so that we can enable the functionality just by loading the
> > module.
>=20
> I'm fine with exporting by default, but just loading won't really work
> even with that:
>=20
>  - there are a bunch of IS_ENABLED conditionals in the i915 (although
>    they look like minor optimizations to me).

I'd assume the golden state capture being the one with biggest impact.

>  - the enable_gvt needs to be set, although after this refactor this
>    option is completely pointless and should probably be enabled

Indeed. Hope is that modprobe/rmmod would be enough to enable/disable.
This should help any distros intending to enable the feature, too.

So mostly about making sure the IS_ENABLED portions in base i915
operation are not too invasive.

>  - the enable_guc option needs to be disable for gvt to work.

On the GVT supported platforms GuC is disabled by default, so it should
be fine. We can change the logic to opposite to disable the feature if
the enable_guc unsafe modparam is used.

Regards, Joonas
