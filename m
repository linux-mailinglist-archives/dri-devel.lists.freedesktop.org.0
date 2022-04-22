Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C78350B31D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 10:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7295710F5E2;
	Fri, 22 Apr 2022 08:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC4410F5E2;
 Fri, 22 Apr 2022 08:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650616959; x=1682152959;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oJo6686rlTVl4NF8qTq+75xulViOxa7VsmZhuLw8LAY=;
 b=YxWDF3bicTVKgUNG8dZXpa661uH2CXyofWzRjFm9PiHFbw05EddnnNWQ
 Xl8iHbpb5y7NqcJFJ7Tr8JYC7iK3jmANspcQDZNGq2QZjSuu54BBr6kgm
 I+rglGTncLk310CMQzfopTDVGYrk2cT38UOgquvBFZ5ssGh2sRuXv4u6/
 +iW+RAcwkAwTlW3fWb5RyUZ9ZeAqTYDLncA91ER+SutAqMjOUSXPKsmfH
 CQ4uvYl38owA3nE1S1rQSedOtbFQ8My4asua9XiqSs4QFWDNvF83dH4KT
 Jic7sbGyNAa2iAPb8D/YjFGfwFzLpcs0ChXwNhEqEJgj++a8RCRyXfVBS A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="289739711"
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="289739711"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 01:42:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="658925459"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by fmsmga002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 01:42:37 -0700
Date: Fri, 22 Apr 2022 14:13:12 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Subject: Re: [PATCH 3/4] drm/i915/gt: Extend doc on Flat-CCS obj eviction
Message-ID: <20220422084312.GB2564@intel.com>
References: <20220421113813.30796-1-ramalingam.c@intel.com>
 <20220421113813.30796-4-ramalingam.c@intel.com>
 <249408791057852ef445c0a8795f3486ef45b151.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <249408791057852ef445c0a8795f3486ef45b151.camel@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-04-21 at 19:07:29 +0530, Hellstrom, Thomas wrote:
> On Thu, 2022-04-21 at 17:08 +0530, Ramalingam C wrote:
> > Capture the eviction details for Flat-CCS capable lmem only objects
> > and
> > lmem objects with smem residency. This also captures the impact of
> > eviction on  object's memory residency and Flat-CCS compression
> > state.
> >
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_migrate.c | 36 ++++++++++++++++++-----
> > --
> >  1 file changed, 27 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c
> > b/drivers/gpu/drm/i915/gt/intel_migrate.c
> > index 463a6a14b5f9..9d0d18950e76 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> > @@ -485,16 +485,34 @@ static bool wa_1209644611_applies(int ver, u32
> > size)
> >   * And CCS data can be copied in and out of CCS region through
> >   * XY_CTRL_SURF_COPY_BLT. CPU can't access the CCS data directly.
> >   *
> > - * When we exhaust the lmem, if the object's placements support
> > smem, then we can
> > - * directly decompress the compressed lmem object into smem and
> > start using it
> > - * from smem itself.
> > + * when we exhaust the lmem, we need to handle two types of flat-ccs
> > capable
> > + * objects for its eviction.
> > + *   1) lmem only objects
> > + *   2) lmem objects with smem residency option
> >   *
> > - * But when we need to swapout the compressed lmem object into a
> > smem region
> > - * though objects' placement doesn't support smem, then we copy the
> > lmem content
> > - * as it is into smem region along with ccs data (using
> > XY_CTRL_SURF_COPY_BLT).
> > - * When the object is referred, lmem content will be swaped in along
> > with
> > - * restoration of the CCS data (using XY_CTRL_SURF_COPY_BLT) at
> > corresponding
> > - * location.
> > + * 1) lmem only objects:
> > + *
> > + * lmem backing memory can be temporarily evicted to smem, along
> > with the
> > + * auxiliary CCS state, where it can be potentially swapped-out at a
> > later point,
> > + * if required. If userspace later touches the evicted pages, then
> > we always move
> > + * the backing memory back to lmem, which includes restoring the
> > saved CCS state,
> > + * and potentially performing any required swap-in.
> > + *
> > + * In this scenario, objects' backing memory class and Flat-CCS
> > state doesn't
> > + * change.
> > + *
> > + * 2) lmem objects with smem residency option
> > + *
> > + * Lmem object with smem region in it's placement list, will be
> > migrated into
> > + * smem  by decompressing the content. I915 doesn't handle this kind
> > of
> > + * migration for Flat-CCS compressed objects yet.
> > + *
> > + * In this scenario, objects' backing memory class and Flat-CCS
> > state changed,
> > + * and userspace is not aware of it.
> > + *
> > + * In summary, when a userspace wants to be sure about the objects
> > memory
> > + * residency and flat-ccs compression state, then placement list
> > can't have
> > + * the lmem and smem together. Instead, object has to be lmem
> > resident only.
> 
> For 2) I was under the impression that with flat CCS, these objects
> need to be always uncompressed, since the kernel doesn't have the
> needed information to decompress / compress. Or has this been changed
> recently?
Sorry. I have overlooked the lack of inputs required for decompression
at kernel. So yes we can't support the compression on the lmem objects
with {lmem, smem} as placement preferences. I will update the
documentation accordingly.

Ram.
> 
> /Thomas
> 
> 
> 
> 
> >   */
> >
> >  static inline u32 *i915_flush_dw(u32 *cmd, u32 flags)
> 
