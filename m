Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93644EA7D6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 08:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550D410EEAB;
	Tue, 29 Mar 2022 06:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B5610E2E5;
 Tue, 29 Mar 2022 06:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648535111; x=1680071111;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U6NbcSXc/VH1AcU06fpIQs0WEQTuZ8RSFE17XrDqT2I=;
 b=lxs8G24iTQg+Ib4KKl5wDFGnOMmdQ7FVROlUnj/IIczdQ2DM3lgXHBRa
 4AH/4yvmJtfZ/VWBGYObSE2N4hgTXEY/mxtmd9KR91kzpjz+IoySoImV3
 dS8ACjHuOQo3MywdrgZcBNYNjNFQ5OWnOk8vcdG0mKr9pVHquWNFGJWMg
 OSLIUe28Vk2aX2yT/5i7CWP62CgUoyuW4fAwXinUImiRVvZ7v/JtTIYbf
 Uk9dphHIqN9QSYmlf/hgOkthNSnAqlRtz2sKSv8JLH1a1AatXkYmEkD1a
 u9JhvC/XmM2IwMOW8Ru/2dFg1SxXH1fF2UL9dqmvXU0J+r5262AKvrYwr Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="322359278"
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="322359278"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 23:25:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="585455689"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO [10.249.254.86])
 ([10.249.254.86])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 23:25:09 -0700
Message-ID: <6d019f4c414ecac65f4e662e730e80f4d0886b1d.camel@linux.intel.com>
Subject: Re: [PATCH v7 2/9] drm/i915/gt: Use XY_FAST_COLOR_BLT to clear obj
 on graphics ver 12+
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Ramalingam C <ramalingam.c@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Date: Tue, 29 Mar 2022 08:25:07 +0200
In-Reply-To: <20220328190736.19697-3-ramalingam.c@intel.com>
References: <20220328190736.19697-1-ramalingam.c@intel.com>
 <20220328190736.19697-3-ramalingam.c@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-3.fc34) 
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

On Tue, 2022-03-29 at 00:37 +0530, Ramalingam C wrote:
> Use faster XY_FAST_COLOR_BLT cmd on graphics version of 12 and more,
> for clearing (Zero out) the pages of the newly allocated object.
> 
> XY_FAST_COLOR_BLT is faster than the older XY_COLOR_BLT.
> 
> v2:
>   Typo fix at title [Thomas]
> v3:
>   XY_FAST_COLOR_BLT is used only for FLAT_CCS capable gen12+

Hm. It's a huge benefit also for DG1. But we can do that as a follow up
patch.

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
> index 9e6c98a17441..17dd372a47d1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -614,18 +614,51 @@ intel_context_migrate_copy(struct intel_context
> *ce,
>         return err;
>  }
>  
> -static int emit_clear(struct i915_request *rq, u32 offset, int size,
> u32 value)
> +static int emit_clear(struct i915_request *rq, u32 offset, int size,
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
> -       cs = intel_ring_begin(rq, ver >= 8 ? 8 : 6);
> +       if (HAS_FLAT_CCS(i915) && ver >= 12)
> +               ring_sz = XY_FAST_COLOR_BLT_DW;
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
> +       if (HAS_FLAT_CCS(i915) && ver >= 12) {
> +               *cs++ = XY_FAST_COLOR_BLT_CMD |
> XY_FAST_COLOR_BLT_DEPTH_32 |
> +                       (XY_FAST_COLOR_BLT_DW - 2);
> +               *cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs)
> |
> +                       (PAGE_SIZE - 1);
> +               *cs++ = 0;
> +               *cs++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
> +               *cs++ = offset;
> +               *cs++ = rq->engine->instance;
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
> @@ -708,7 +741,7 @@ intel_context_migrate_clear(struct intel_context
> *ce,
>                 if (err)
>                         goto out_rq;
>  
> -               err = emit_clear(rq, offset, len, value);
> +               err = emit_clear(rq, offset, len, value, is_lmem);
>  
>                 /* Arbitration is re-enabled between requests. */
>  out_rq:


