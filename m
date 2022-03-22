Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3CA4E3C34
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 11:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BE210E5BF;
	Tue, 22 Mar 2022 10:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC74310E5B8;
 Tue, 22 Mar 2022 10:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647943863; x=1679479863;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KIE9AGL4zTZmYysZsNxhWt9/p8gsOhkrTOVOyJAvCHo=;
 b=VGkODopJdLvLcYQCYwbht3ZEAZKCoyRji8P8gPy3mALaqg96Ezn/Z41e
 VWNB9av/FCje+QS48/F9pf85iDheONbdOYCwhZu+QzfjD9crLK/0GLC63
 kfhl2+/5VAs/wla1LH6MUhX3adVwaAb/kIvww7OPExHqjnip8SW1NIUhg
 F/5gJyAIfbqiNn/PRzNZIMSML26qBYrMg4OrMbCHJTczrH8jHLYT6QwsB
 vN+8scj2IIugalv/c+BhVuH4B42iIQYXP0bd5CDs1Wmgu1O/bZXdR/3db
 3dP4sXcEh3IDzgUWX2KmfavEH2HmEPh3fNRSirS9gtKDZfOlVMjLUZUve A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="245253232"
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="245253232"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 03:10:50 -0700
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="692495492"
Received: from sorenthe-mobl2.ger.corp.intel.com (HELO [10.249.254.95])
 ([10.249.254.95])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 03:10:49 -0700
Message-ID: <dd95e96f6c9546c5e88cd5334ee000be0b05fa12.camel@linux.intel.com>
Subject: Re: [PATCH v5 1/9] drm/i915/gt: Use XY_FAST_COLOR_BLT to clear obj
 on graphics ver 12+
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Ramalingam C <ramalingam.c@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Date: Tue, 22 Mar 2022 11:10:45 +0100
In-Reply-To: <20220321224459.12223-2-ramalingam.c@intel.com>
References: <20220321224459.12223-1-ramalingam.c@intel.com>
 <20220321224459.12223-2-ramalingam.c@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-03-22 at 04:14 +0530, Ramalingam C wrote:
> Use faster XY_FAST_COLOR_BLT cmd on graphics version of 12 and more,
> for clearing (Zero out) the pages of the newly allocated object.
> 
> XY_FAST_COLOR_BLT is faster than the older XY_COLOR_BLT.
> 
> v2:
>   Typo fix at title [Thomas]
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  5 +++
>  drivers/gpu/drm/i915/gt/intel_migrate.c      | 43 +++++++++++++++++-
> --
>  2 files changed, 43 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index d112ffd56418..925e55b6a94f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -205,6 +205,11 @@
>  
>  #define COLOR_BLT_CMD                  (2 << 29 | 0x40 << 22 | (5 -
> 2))
>  #define XY_COLOR_BLT_CMD               (2 << 29 | 0x50 << 22)
> +#define XY_FAST_COLOR_BLT_CMD          (2 << 29 | 0x44 << 22)
> +#define   XY_FAST_COLOR_BLT_DEPTH_32   (2 << 19)
> +#define   XY_FAST_COLOR_BLT_DW         16
> +#define   XY_FAST_COLOR_BLT_MOCS_MASK  GENMASK(27, 21)
> +#define   XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT 31
>  #define SRC_COPY_BLT_CMD               (2 << 29 | 0x43 << 22)
>  #define GEN9_XY_FAST_COPY_BLT_CMD      (2 << 29 | 0x42 << 22)
>  #define XY_SRC_COPY_BLT_CMD            (2 << 29 | 0x53 << 22)
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c
> b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 20444d6ceb3c..73199ebf0671 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -614,20 +614,53 @@ intel_context_migrate_copy(struct intel_context
> *ce,
>         return err;
>  }
>  
> -static int emit_clear(struct i915_request *rq, u64 offset, int size,
> u32 value)
> +static int emit_clear(struct i915_request *rq, u64 offset, int size,
> +                     u32 value, bool is_lmem)
>  {
> -       const int ver = GRAPHICS_VER(rq->engine->i915);
> +       struct drm_i915_private *i915 = rq->engine->i915;
> +       int mocs = rq->engine->gt->mocs.uc_index << 1;
> +       const int ver = GRAPHICS_VER(i915);
> +       int ring_sz;
>         u32 *cs;
>  
>         GEM_BUG_ON(size >> PAGE_SHIFT > S16_MAX);
>  
>         offset += (u64)rq->engine->instance << 32;
>  
> -       cs = intel_ring_begin(rq, ver >= 8 ? 8 : 6);
> +       if (ver >= 12)
> +               ring_sz = 16;

XY_FAST_COLOR_BLT_DW

With that fixed, 
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> +       else if (ver >= 8)
> +               ring_sz = 8;
> +       else
> +               ring_sz = 6;
> +
> +       cs = intel_ring_begin(rq, ring_sz);
>         if (IS_ERR(cs))
>                 return PTR_ERR(cs);
>  
> -       if (ver >= 8) {
> +       if (ver >= 12) {
> +               *cs++ = XY_FAST_COLOR_BLT_CMD |
> XY_FAST_COLOR_BLT_DEPTH_32 |
> +                       (XY_FAST_COLOR_BLT_DW - 2);
> +               *cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs)
> |
> +                       (PAGE_SIZE - 1);
> +               *cs++ = 0;
> +               *cs++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
> +               *cs++ = lower_32_bits(offset);
> +               *cs++ = upper_32_bits(offset);
> +               *cs++ = !is_lmem << XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
> +               /* BG7 */
> +               *cs++ = value;
> +               *cs++ = 0;
> +               *cs++ = 0;
> +               *cs++ = 0;
> +               /* BG11 */
> +               *cs++ = 0;
> +               *cs++ = 0;
> +               /* BG13 */
> +               *cs++ = 0;
> +               *cs++ = 0;
> +               *cs++ = 0;
> +       } else if (ver >= 8) {
>                 *cs++ = XY_COLOR_BLT_CMD | BLT_WRITE_RGBA | (7 - 2);
>                 *cs++ = BLT_DEPTH_32 | BLT_ROP_COLOR_COPY |
> PAGE_SIZE;
>                 *cs++ = 0;
> @@ -711,7 +744,7 @@ intel_context_migrate_clear(struct intel_context
> *ce,
>                 if (err)
>                         goto out_rq;
>  
> -               err = emit_clear(rq, offset, len, value);
> +               err = emit_clear(rq, offset, len, value, is_lmem);
>  
>                 /* Arbitration is re-enabled between requests. */
>  out_rq:


