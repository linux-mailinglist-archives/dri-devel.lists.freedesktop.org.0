Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 936CD4FC1E3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B6D10E1AB;
	Mon, 11 Apr 2022 16:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691CC10E1AB;
 Mon, 11 Apr 2022 16:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649693362; x=1681229362;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=y1V561DsC8ai3Gqb7cZYWzHmr8pZatljnnPprOuneD4=;
 b=icaBweDETmOCp4Bl1ai2FRrEsyygJyRUvbe4jI13EiqIgR2Y3xiapikR
 9r2dAtZswyZchI23i86uWtg0xC4Hnnc3o0I9Kj8fc6g2TfufvXicZs+y5
 H4JDS2zq3PgEv901fAY/krMSO2arNlksGNlspeQg2XUSkPZIHjoJcFi+m
 f49aKraYEpt69SOaSJBqHdbRjHtSMfl8wPsnWt3aFZ/myh+KK5yKzh6Bo
 h5I4UdJXosFTO1SGYsoCcZvidt93bMpSsxD8GIvRQXENAXzlTrmARjrds
 cKMT3l5VQMbUvpEm24MD7+8QLIothqCBdxOA9h7Lh2Aq+xThBvtiwQ72d Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261898049"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="261898049"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 09:09:19 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="572274334"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 09:09:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: Re: [PATCH 04/34] drm/i915/gvt: don't override the include path
In-Reply-To: <20220411141403.86980-5-hch@lst.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-5-hch@lst.de>
Date: Mon, 11 Apr 2022 19:09:12 +0300
Message-ID: <8735ijiouv.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Apr 2022, Christoph Hellwig <hch@lst.de> wrote:
> drivers/gpu/drm/i915/gvt/Makefile is included
> from drivers/gpu/drm/i915/Makefile and thus inherits the normal include
> path relative to drivers/gpu/drm/i915/.  Fix up the gvt-specific trace
> header and just do away with the include path manipulation.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/Makefile | 1 -
>  drivers/gpu/drm/i915/gvt/trace.h  | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
> index ea8324abc784a..4d70f4689479c 100644
> --- a/drivers/gpu/drm/i915/gvt/Makefile
> +++ b/drivers/gpu/drm/i915/gvt/Makefile
> @@ -5,5 +5,4 @@ GVT_SOURCE := gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o firmware.o \
>  	execlist.o scheduler.o sched_policy.o mmio_context.o cmd_parser.o debugfs.o \
>  	fb_decoder.o dmabuf.o page_track.o
>  
> -ccflags-y				+= -I $(srctree)/$(src) -I $(srctree)/$(src)/$(GVT_DIR)/
>  i915-y					+= $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
> diff --git a/drivers/gpu/drm/i915/gvt/trace.h b/drivers/gpu/drm/i915/gvt/trace.h
> index 6d787750d279f..348f57f8301db 100644
> --- a/drivers/gpu/drm/i915/gvt/trace.h
> +++ b/drivers/gpu/drm/i915/gvt/trace.h
> @@ -379,5 +379,5 @@ TRACE_EVENT(render_mmio,
>  #undef TRACE_INCLUDE_PATH
>  #define TRACE_INCLUDE_PATH .
>  #undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_FILE trace
> +#define TRACE_INCLUDE_FILE gvt/trace

This is not actually correct. Please see my gvt Makefile cleanup [1][2].

BR,
Jani.

[1] https://lore.kernel.org/all/20220331082127.432171-1-jani.nikula@intel.com/
[2] https://lore.kernel.org/all/20220331082127.432171-2-jani.nikula@intel.com/

>  #include <trace/define_trace.h>

-- 
Jani Nikula, Intel Open Source Graphics Center
