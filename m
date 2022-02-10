Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8EE4B18F1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 00:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1883E10E97C;
	Thu, 10 Feb 2022 23:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5CC10E123;
 Thu, 10 Feb 2022 23:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644534019; x=1676070019;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=OJRIW15C03/JExJ87WTiX4JuLRDaylI9fDIoyPwnHsA=;
 b=WBKTZN/glBvhJX/HpquTzyb2EvdN4qH6CY/2JlUR2EUDovkQ5dtiBjag
 HQWXqtmOx87dvoxY5ni86jduTmMwvU2TUg1YJkM3FtrTx5Ry5pO4ivkH6
 tpSgR60AvYEixFISMQlLtXRqhimMiLjJTTUQhEeLtiwB9B+ASRLdm9sE1
 kBAhVxguo+wrNiH96HdyTpvimKIDaJyps3FvuiGoMI7elZDOvx/H5Cqlo
 PDXegkdWKwzSdmgvLivraPq/jFIrZ6l7jTWsAzfzqeshhp256jBtRxXdR
 5L4JApiG6EmJcQwqRa7I1CGNePPGMqt4RMYqsS3pqoA3Eqk5orxE7PNzQ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="230255269"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="230255269"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 15:00:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="568822437"
Received: from jjmurray-mobl.amr.corp.intel.com (HELO msatwood-mobl)
 ([10.209.24.65])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 15:00:18 -0800
Date: Thu, 10 Feb 2022 15:00:05 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>;,
 intel-gfx@lists.freedesktop.org;, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 05/18] drm/i915/guc: Add read/write
 helpers for ADS blob
Message-ID: <20220210230005.GB4707@msatwood-mobl>
References: <20220208104524.2516209-1-lucas.demarchi@intel.com>
 <20220208104524.2516209-6-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220208104524.2516209-6-lucas.demarchi@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 08, 2022 at 02:45:11AM -0800, Lucas De Marchi wrote:
> Add helpers on top of iosys_map_read_field() /
> iosys_map_write_field() functions so they always use the right
> arguments and make code easier to read.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 13671b186908..9bf9096b8337 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -60,6 +60,13 @@ struct __guc_ads_blob {
>  	struct guc_mmio_reg regset[0];
>  } __packed;
>  
> +#define ads_blob_read(guc_, field_)					\
> +	iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
> +
> +#define ads_blob_write(guc_, field_, val_)				\
> +	iosys_map_wr_field(&(guc_)->ads_map, 0, struct __guc_ads_blob,	\
> +			   field_, val_)
> +
>  static u32 guc_ads_regset_size(struct intel_guc *guc)
>  {
>  	GEM_BUG_ON(!guc->ads_regset_size);
> -- 
> 2.35.1
> 
