Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A1C4E33A9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 00:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE9B10E4C5;
	Mon, 21 Mar 2022 23:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712AF10E4C5;
 Mon, 21 Mar 2022 23:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647904013; x=1679440013;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=K3n/F3fnhZ2Zo4LdZXOGrUaZMS9i8yWu7dFDwW3b7MQ=;
 b=lhGBwJcW4cox6Za9J2nuv2bF0RQ4IZlCan2TITOUfrjEjiki2bgL8vCZ
 M6PhH2xLlyHukocPSaL2Wwjmw16xHIMK/MqXVHwn9GkFNSDtOnvVrCHyn
 0C7aBB7hYnc93A7OvbMbyeolDfJSDXSwOImC4ZIKJQ6unhlxQX7JXWkvv
 1iTTHx9o0c5Nbsb5HFEPLtjZH8sdvhXvmQy/e6pU647evL9/MVUyfq19m
 Hp9kq63oY7jy4hqz+GX0PWt4MEnO+u2k5VLd1zVw9NhU/NwwXNjSlQTiK
 T7benSIqUAXvv48//UWYiHq7/4ytWzeYgoaYOw0pUUocJiKEWhtrgXKSs w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="318378381"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="318378381"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 16:06:52 -0700
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="692334584"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by fmsmga001-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 16:06:51 -0700
Date: Tue, 22 Mar 2022 04:37:26 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Subject: Re: [PATCH v4 1/8] drm/i915/gt: Use XY_FASR_COLOR_BLT to clear obj
 on graphics ver 12+
Message-ID: <20220321230725.GD12356@intel.com>
References: <20220319204229.9846-1-ramalingam.c@intel.com>
 <20220319204229.9846-2-ramalingam.c@intel.com>
 <028e89a677269f10efe6a59afcaef52e5b126afa.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <028e89a677269f10efe6a59afcaef52e5b126afa.camel@intel.com>
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

On 2022-03-21 at 14:19:01 +0530, Hellstrom, Thomas wrote:
> On Sun, 2022-03-20 at 02:12 +0530, Ramalingam C wrote:
> > XY_FAST_COLOR_BLT cmd is faster than the older XY_COLOR_BLT. Hence
> > for
> > clearing (Zero out) the pages of the newly allocated object, faster
> > cmd
> > is used.
> 
> NIT: Imperative wording
> 
> >
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> 
> Also there's a typo in the patch title.
Fixed them in the next version. Thanks for the review Thomas.

Ram
> 
> With that fixed:
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> 
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  5 +++
> >  drivers/gpu/drm/i915/gt/intel_migrate.c      | 43 +++++++++++++++++-
> > --
> >  2 files changed, 43 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> > b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> > index d112ffd56418..925e55b6a94f 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> > @@ -205,6 +205,11 @@
> >
> >  #define COLOR_BLT_CMD                  (2 << 29 | 0x40 << 22 | (5 -
> > 2))
> >  #define XY_COLOR_BLT_CMD               (2 << 29 | 0x50 << 22)
> > +#define XY_FAST_COLOR_BLT_CMD          (2 << 29 | 0x44 << 22)
> > +#define   XY_FAST_COLOR_BLT_DEPTH_32   (2 << 19)
> > +#define   XY_FAST_COLOR_BLT_DW         16
> > +#define   XY_FAST_COLOR_BLT_MOCS_MASK  GENMASK(27, 21)
> > +#define   XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT 31
> >  #define SRC_COPY_BLT_CMD               (2 << 29 | 0x43 << 22)
> >  #define GEN9_XY_FAST_COPY_BLT_CMD      (2 << 29 | 0x42 << 22)
> >  #define XY_SRC_COPY_BLT_CMD            (2 << 29 | 0x53 << 22)
> > diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c
> > b/drivers/gpu/drm/i915/gt/intel_migrate.c
> > index 20444d6ceb3c..73199ebf0671 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> > @@ -614,20 +614,53 @@ intel_context_migrate_copy(struct intel_context
> > *ce,
> >         return err;
> >  }
> >
> > -static int emit_clear(struct i915_request *rq, u64 offset, int size,
> > u32 value)
> > +static int emit_clear(struct i915_request *rq, u64 offset, int size,
> > +                     u32 value, bool is_lmem)
> >  {
> > -       const int ver = GRAPHICS_VER(rq->engine->i915);
> > +       struct drm_i915_private *i915 = rq->engine->i915;
> > +       int mocs = rq->engine->gt->mocs.uc_index << 1;
> > +       const int ver = GRAPHICS_VER(i915);
> > +       int ring_sz;
> >         u32 *cs;
> >
> >         GEM_BUG_ON(size >> PAGE_SHIFT > S16_MAX);
> >
> >         offset += (u64)rq->engine->instance << 32;
> >
> > -       cs = intel_ring_begin(rq, ver >= 8 ? 8 : 6);
> > +       if (ver >= 12)
> > +               ring_sz = 16;
> > +       else if (ver >= 8)
> > +               ring_sz = 8;
> > +       else
> > +               ring_sz = 6;
> > +
> > +       cs = intel_ring_begin(rq, ring_sz);
> >         if (IS_ERR(cs))
> >                 return PTR_ERR(cs);
> >
> > -       if (ver >= 8) {
> > +       if (ver >= 12) {
> > +               *cs++ = XY_FAST_COLOR_BLT_CMD |
> > XY_FAST_COLOR_BLT_DEPTH_32 |
> > +                       (XY_FAST_COLOR_BLT_DW - 2);
> > +               *cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs)
> > |
> > +                       (PAGE_SIZE - 1);
> > +               *cs++ = 0;
> > +               *cs++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
> > +               *cs++ = lower_32_bits(offset);
> > +               *cs++ = upper_32_bits(offset);
> > +               *cs++ = !is_lmem << XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
> > +               /* BG7 */
> > +               *cs++ = value;
> > +               *cs++ = 0;
> > +               *cs++ = 0;
> > +               *cs++ = 0;
> > +               /* BG11 */
> > +               *cs++ = 0;
> > +               *cs++ = 0;
> > +               /* BG13 */
> > +               *cs++ = 0;
> > +               *cs++ = 0;
> > +               *cs++ = 0;
> > +       } else if (ver >= 8) {
> >                 *cs++ = XY_COLOR_BLT_CMD | BLT_WRITE_RGBA | (7 - 2);
> >                 *cs++ = BLT_DEPTH_32 | BLT_ROP_COLOR_COPY |
> > PAGE_SIZE;
> >                 *cs++ = 0;
> > @@ -711,7 +744,7 @@ intel_context_migrate_clear(struct intel_context
> > *ce,
> >                 if (err)
> >                         goto out_rq;
> >
> > -               err = emit_clear(rq, offset, len, value);
> > +               err = emit_clear(rq, offset, len, value, is_lmem);
> >
> >                 /* Arbitration is re-enabled between requests. */
> >  out_rq:
> 
