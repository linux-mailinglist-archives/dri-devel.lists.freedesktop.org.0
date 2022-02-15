Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105764B6BC7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 13:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D81010E46C;
	Tue, 15 Feb 2022 12:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD1610E465;
 Tue, 15 Feb 2022 12:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644927113; x=1676463113;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zT4S6A5ModLhQpd7e86PbFMHrNsbDenFUKNBpKpWx9k=;
 b=KPngO8FNYHASWhRZmeCyzjnyeCiBxbrGCTv1xVLQKb8AGPGXiv29fmYP
 2kWP/Sm7jV7mAupakoWZb46eWTin9UAo4Uhlr9jp41O7R9ygThyj2MF6U
 7AJ9d7m1Iqq8iPESPA3j70Cahk8lrfSN31ItUrOOJZJb5S+y+XcXg715l
 ngqFfVIHm2MVMKA31krJ8caxv8l0djjPfrSq9HMBU+BnvrIK7zfowragV
 x3kj96QXmIMtnrTSoOToNUVh/iD9csKnqGutoSUyKzpeW/MSgbvvcHUql
 WO82ExMpOsMqxCjj8AvMYEGXPXPIftCTg5/xOe4Gz2PdamVJVfQ5CMUGL w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="249172649"
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="249172649"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 04:11:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="528823662"
Received: from ylian16-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.20.230])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 04:11:50 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the drm-intel tree
In-Reply-To: <20220215121039.1d1ec3e6@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220215121039.1d1ec3e6@canb.auug.org.au>
Date: Tue, 15 Feb 2022 14:11:47 +0200
Message-ID: <87r1845ny4.fsf@intel.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Feb 2022, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the drm-intel tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/i915/gvt/kvmgt.c: In function 'handle_edid_regs':
> drivers/gpu/drm/i915/gvt/kvmgt.c:595:38: error: implicit declaration of function 'drm_edid_block_valid' [-Werror=implicit-function-declaration]
>   595 |                                 if (!drm_edid_block_valid(
>       |                                      ^~~~~~~~~~~~~~~~~~~~
>
> Presumably caused by commit
>
>   14da21cc4671 ("drm/i915: axe lots of unnecessary includes from i915_drv.h")
>
> I am beginning to wonder if you guys run stuff through your CI before
> relasing to linux-next.  Especially important when removing #include
> statements from include files :-)

Thanks for the report. Apparently CI (and I) have VFIO=n, VFIO_MDEV=n,
and DRM_I915_GVT_KVMGT=n.

BR,
Jani.


>
> I have used the drm-intel tree from next-20220214 for today.

-- 
Jani Nikula, Intel Open Source Graphics Center
