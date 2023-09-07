Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EE5797230
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 14:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5062210E233;
	Thu,  7 Sep 2023 12:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAB310E24E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 12:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694088863; x=1725624863;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DBrL4mS557cxBvRouvwV9QF+iy39q5mSe7MPFfBAAyY=;
 b=N7cTfKRFU/yBUqzy5iZPUCEJxP/tbaAPNi3zOs0mUzHYv/UWEm4qgqT6
 AhgISbbqZDLHqP/sWQen/9N6lmXOgZMOXsujRNr3++ZzMuQB9Xax80+mq
 Zu4LtR2sOcH2BAATfWZLgOggcsnKbCfvGLxnRoOGdr80tx2SnkGoApzeB
 QNs63lRrB/2TfEqW8w9C+UjXpaq0OVRXv5Ip9qhb2uCKXEZ/WprOpLD1P
 +zsM3ofQAapIi4j6k4gM41hGdkSFf/5yRwqtUPTXhVF7qvctLbCcaXsdN
 jHN7MrxybJ+PMGNXFCX5YuvVAnSBZnXkh8AfDynjxaOirIn9lcbKQ+9G4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="441323675"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="441323675"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 05:14:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="807515912"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="807515912"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 05:14:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 02/20] drm/gpuva_mgr: Helper to get range of unmap
 from a remap op.
In-Reply-To: <20230906095542.3280699-3-sarah.walker@imgtec.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230906095542.3280699-1-sarah.walker@imgtec.com>
 <20230906095542.3280699-3-sarah.walker@imgtec.com>
Date: Thu, 07 Sep 2023 15:14:14 +0300
Message-ID: <87a5tygoyx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: matthew.brost@intel.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 tzimmermann@suse.de, corbet@lwn.net, hns@goldelico.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, mripard@kernel.org,
 afd@ti.com, robh+dt@kernel.org, matt.coster@imgtec.com, luben.tuikov@amd.com,
 dakr@redhat.com, donald.robson@imgtec.com, krzysztof.kozlowski+dt@linaro.org,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 06 Sep 2023, Sarah Walker <sarah.walker@imgtec.com> wrote:
> From: Donald Robson <donald.robson@imgtec.com>
>
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>
> ---
>  include/drm/drm_gpuva_mgr.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
> index ed8d50200cc3..be7b3a6d7e67 100644
> --- a/include/drm/drm_gpuva_mgr.h
> +++ b/include/drm/drm_gpuva_mgr.h
> @@ -703,4 +703,31 @@ void drm_gpuva_remap(struct drm_gpuva *prev,
>  
>  void drm_gpuva_unmap(struct drm_gpuva_op_unmap *op);
>  
> +/**
> + * drm_gpuva_op_remap_get_unmap_range() - Helper to get the start and range of
> + * the unmap stage of a remap op.
> + * @op: Remap op.
> + * @start_addr: Output pointer for the start of the required unmap.
> + * @range: Output pointer for the length of the required unmap.
> + *
> + * These parameters can then be used by the caller to unmap memory pages that
> + * are no longer required.
> + */
> +static __always_inline void

IMO __always_inline *always* requires a justification in the commit
message.

BR,
Jani.


> +drm_gpuva_op_remap_get_unmap_range(const struct drm_gpuva_op_remap *op,
> +				   u64 *start_addr, u64 *range)
> +{
> +	const u64 va_start = op->prev ?
> +			     op->prev->va.addr + op->prev->va.range :
> +			     op->unmap->va->va.addr;
> +	const u64 va_end = op->next ?
> +			   op->next->va.addr :
> +			   op->unmap->va->va.addr + op->unmap->va->va.range;
> +
> +	if (start_addr)
> +		*start_addr = va_start;
> +	if (range)
> +		*range = va_end - va_start;
> +}
> +
>  #endif /* __DRM_GPUVA_MGR_H__ */

-- 
Jani Nikula, Intel Open Source Graphics Center
