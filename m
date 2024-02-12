Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 166A6850F6D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 10:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B339610EBD4;
	Mon, 12 Feb 2024 09:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAgdnnT7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4260910EB80;
 Mon, 12 Feb 2024 09:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707729186; x=1739265186;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zQg70D7zlwaT01vgAiLlUs8t5uerkv7D7w9ZxCQ0BBg=;
 b=fAgdnnT7HgOb6h549/uwEoAn/bBnLi0mACC8HjbvTCbwiHEbr7kufcFh
 QTd1YP5b2HGvndBwSPcae4lUN3Js7RnTHYmv09zXd1Q8YLr/TEzVGu8LA
 vkj9ICP5zyZ2uKQs/6YpzweR1EOuQS3ezNsvgUwDamfBnJ6v7+oYpgca9
 CIU+IZF8e7g/eYsB9vS35ZK+TCl883M/nmSPG9K7wn1cd0KziW2Ijo08m
 MTXNecdARFEsslJ8Mr1rP0CRShg0IKB+R+bsNvT8CUiWjaPMnnTwM5wJS
 PT2ueA4X4Je2YGpsck+lsAlg4ZjqG0uw/kg2Hcm6VpBxaedjTF8VRmT37 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1576665"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="1576665"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 01:13:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="2541949"
Received: from belyakov-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.63.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 01:13:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
In-Reply-To: <20240212122652.0961dc7c@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240212122652.0961dc7c@canb.auug.org.au>
Date: Mon, 12 Feb 2024 11:12:58 +0200
Message-ID: <87le7q9hb9.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 12 Feb 2024, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/tests/drm_mm_test.c: In function 'drm_test_mm_debug':
> drivers/gpu/drm/tests/drm_mm_test.c:191:32: error: implicit declaration of function 'drm_debug_printer'; did you mean 'drm_dbg_printer'? [-Werror=implicit-function-declaration]
>   191 |         struct drm_printer p = drm_debug_printer(test->name);
>       |                                ^~~~~~~~~~~~~~~~~
>       |                                drm_dbg_printer
> drivers/gpu/drm/tests/drm_mm_test.c:191:32: error: invalid initializer
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>   e154c4fc7bf2 ("drm: remove drm_debug_printer in favor of drm_dbg_printer")
>
> I have used the drm-misc tree from next-20240209 for today.

Fix at [1].

BR,
Jani.


[1] https://lore.kernel.org/r/20240209140818.106685-1-michal.winiarski@intel.com


-- 
Jani Nikula, Intel
