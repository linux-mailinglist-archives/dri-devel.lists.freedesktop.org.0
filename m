Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E41A3A4D87
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jun 2021 10:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876F06E0DD;
	Sat, 12 Jun 2021 08:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17506E0D1;
 Sat, 12 Jun 2021 08:23:38 +0000 (UTC)
IronPort-SDR: c1RaNO+ijiEJgp9ebY3JoIx/wfPM1eVG/9cCv6iF7BhFkDaGqQPpxmYUez81A+jC2xbygUwWaR
 f2+zgRIYWYeg==
X-IronPort-AV: E=McAfee;i="6200,9189,10012"; a="205469296"
X-IronPort-AV: E=Sophos;i="5.83,268,1616482800"; d="scan'208";a="205469296"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2021 01:23:38 -0700
IronPort-SDR: CsqbSQUwtXmCWsFGn6BRTor2yWGGA3RkBDZ3aauIzU1zcCzN3Xs6VkANg6DCOvq1JZPmClyyZZ
 En+mKDM7hJJg==
X-IronPort-AV: E=Sophos;i="5.83,268,1616482800"; d="scan'208";a="420300598"
Received: from lapeders-mobl.ger.corp.intel.com (HELO [10.249.254.31])
 ([10.249.254.31])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2021 01:23:36 -0700
Message-ID: <a7941cc1de789afe7ea66dd75e3abb46f45dc67d.camel@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 2/4] drm/i915/ttm: Adjust gem flags and
 caching settings after a move
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Date: Sat, 12 Jun 2021 10:23:34 +0200
In-Reply-To: <CAM0jSHNdwG0WcGNUV01JV2r5SXdxQPN4Oz+wLJrBs=7yZrCz0g@mail.gmail.com>
References: <20210611145459.8576-1-thomas.hellstrom@linux.intel.com>
 <20210611145459.8576-3-thomas.hellstrom@linux.intel.com>
 <CAM0jSHNdwG0WcGNUV01JV2r5SXdxQPN4Oz+wLJrBs=7yZrCz0g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2021-06-11 at 17:29 +0100, Matthew Auld wrote:
> On Fri, 11 Jun 2021 at 15:55, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
> > 
> > After a TTM move we need to update the i915 gem flags and caching
> > settings to reflect the new placement.
> > Also introduce gpu_binds_iomem() and cpu_maps_iomem() to clean up
> > the
> > various ways we previously used to detect this.
> > Finally, initialize the TTM object reserved to be able to update
> > flags and caching before anyone else gets hold of the object.
> 
> Hmm, why do we need to update it after a move? Is it not static? i.e
> we just consider the mm.placements/region to determine the correct
> domain and cache tracking? Or maybe it doesn't really matter either
> way?

Flags are not static, currently. If migrating from LMEM to SYSTEM, they
need to be updated. Caching and domains should remain unchanged for now
because of the rule that we don't want to change caching mode when
migrating from LMEM to SYSTEM for buffers that support both, and that
rule is enforced by setting the ttm_tt caching mode accordingly.
However, I figure if we need to change that rule moving forward because
we decide we can't rely on the TTM shinker for WC system pages, or
because allocating WC system pages is too expensive, It would be good
if we don't need to audit all the code to find places where an updated
caching policy needs changes.

/Thomas




