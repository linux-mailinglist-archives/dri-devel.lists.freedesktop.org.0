Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1592517A41
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 00:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FC410EB50;
	Mon,  2 May 2022 22:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295BB10EA7C;
 Mon,  2 May 2022 22:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651532333; x=1683068333;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=s9dbQGe/CHAGskJEgoQ3HaR2s9etoDRPili9QQfWCvw=;
 b=OlBPKYbzEd542smDAxou6bu7QhLmTv5tVOfo179uyOf4MEbImpM1w/uS
 5GicR6e51p6DdTCFq4x8AQwI4w6oQqjh5w0IM/mHrDP1kiRhW2/HWVxUH
 9kuSbmbqmdk144j2hyueV4aSn2prRgm1AvkmkNvGWE0Mgm04JqlebD3m5
 QB4NBHrxxysaMnMx3cT50egO81lBDCa08rR7zlNpx7UJVC0P9IVs96zth
 sFhmZmsvMMSti3qke9bTUUPriHqbBpLWUAmdxbQ9uE1axhVSmERgNVYm+
 ZLSOzRVJkvuzLoF58OBAdmFvu7sDihYGUOnn7ffxPd9eOjuedbeKR0CqP g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="267509209"
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; d="scan'208";a="267509209"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 15:58:52 -0700
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; d="scan'208";a="653027990"
Received: from pkumarva-server.jf.intel.com (HELO intel.com) ([10.165.21.200])
 by fmsmga003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 15:58:52 -0700
Date: Mon, 2 May 2022 18:58:52 -0400
From: "Kumar Valsan, Prathap" <prathap.kumar.valsan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 10/11] drm/i915/pvc: skip all copy engines from aux table
 invalidate
Message-ID: <20220502225852.GP384@intel.com>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
 <20220502163417.2635462-11-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220502163417.2635462-11-matthew.d.roper@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 02, 2022 at 09:34:16AM -0700, Matt Roper wrote:
> From: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> As we have more copy engines now, mask all of them from aux table
> invalidate.
> 
> Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 0de17b568b41..f262aed94ef3 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -275,7 +275,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>  		if (!HAS_FLAT_CCS(rq->engine->i915) &&
>  		    (rq->engine->class == VIDEO_DECODE_CLASS ||
>  		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
> -			aux_inv = rq->engine->mask & ~BIT(BCS0);
> +			aux_inv = rq->engine->mask & ~GENMASK(BCS8, BCS0);
If we had defined I915_MAX_BCS earlier.
We use ~GENMASK(BCS0 + I915_MAX_BCS - 1, BCS0), so we don't need to
change this with the number of instances.

Otherwise looks good to me.

Reviewed-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
>  			if (aux_inv)
>  				cmd += 4;
>  		}
> -- 
> 2.35.1
> 
