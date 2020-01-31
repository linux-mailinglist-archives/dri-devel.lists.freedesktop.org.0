Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C03C214EA10
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 10:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D146FAD1;
	Fri, 31 Jan 2020 09:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC9F6E952;
 Fri, 31 Jan 2020 09:27:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 01:25:32 -0800
X-IronPort-AV: E=Sophos;i="5.70,385,1574150400"; d="scan'208";a="223084420"
Received: from bbiernac-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.51.157])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 01:25:27 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>,
 akeem.g.abodunrin@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, omer.aran@intel.com,
 pragyansri.pathi@intel.com, d.scott.phillips@intel.com,
 david.c.stewart@intel.com, tony.luck@intel.com, jon.bloomfield@intel.com,
 sudeep.dutt@intel.com, daniel.vetter@intel.com,
 joonas.lahtinen@linux.intel.com, chris.p.wilson@intel.com,
 prathap.kumar.valsan@intel.com, mika.kuoppala@intel.com,
 francesco.balestrieri@intel.com
Subject: Re: [PATCH 2/2] drm/i915/gen7: Clear all EU/L3 residual contexts
In-Reply-To: <20200130165721.20342-3-akeem.g.abodunrin@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200130165721.20342-1-akeem.g.abodunrin@intel.com>
 <20200130165721.20342-3-akeem.g.abodunrin@intel.com>
Date: Fri, 31 Jan 2020 11:25:35 +0200
Message-ID: <871rrg9dv4.fsf@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Jan 2020, Akeem G Abodunrin <akeem.g.abodunrin@intel.com> wrote:
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index b0ade76bec90..7ac5b3565845 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -172,6 +172,11 @@ __check_struct_size(size_t base, size_t arr, size_t count, size_t *size)
>  	(typeof(ptr))(__v + 1);						\
>  })
>  
> +#define ptr_align(ptr, align) ({					\
> +	unsigned long __v = (unsigned long)(ptr);			\
> +	(typeof(ptr))round_up(__v, (align));				\
> +})
> +

There's PTR_ALIGN() in include/kernel.h.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
