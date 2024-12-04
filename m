Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE439E4717
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 22:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D6310E093;
	Wed,  4 Dec 2024 21:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M1b+cjZe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296BD10E093;
 Wed,  4 Dec 2024 21:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733348766; x=1764884766;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=t+1yZQ2yj5jDedfR7Qxs3G0ejCWg1EregGj5E/3jjSM=;
 b=M1b+cjZePnN5fQG+4AxX99sD3oyvvDrh1IEBwow5+iQ1YYFBueceId56
 mSrd80cxVVbQSAayMf+pB9c51sGkWnCxAuqKvcgcPRHWwefUqnU0GqSIo
 8yLh6J0sopWqUO5RTb0mefCCS98qSSt37fl4e0Yb6vKOR+SytMfBo7TP2
 B6PK3EDDh0ypWg19CfuPOCJyrEFUHdHFU6akUv10KNDz3jnjZdfWqkll7
 9TG5xF7VAJOUzQJCc/VM13XTTuVDpMumKG8VCB8q7ODBMhZcKZQ4+GSbF
 lUNujWEOVMlJo8KnICNlqGFBQgSaDICOlyAiBpihyYbSufZh05G+psTkk g==;
X-CSE-ConnectionGUID: /ldWBjF/QzqO6ZT3LqOF1g==
X-CSE-MsgGUID: BLRBc4v+RPyLipNDNdZ5CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="32995283"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="32995283"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 13:46:05 -0800
X-CSE-ConnectionGUID: RVcurs7sRD6wYNuyblX5qw==
X-CSE-MsgGUID: ifksASnzQY2wsyfIrvnc2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="93768613"
Received: from slindbla-desk.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.225])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 13:46:00 -0800
Date: Wed, 4 Dec 2024 22:45:56 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: nirmoy.das@linux.intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, airlied@gmail.com, daniel@ffwll.ch,
 chris@chris-wilson.co.uk, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@outlook.com>,
 stable@vger.kernel.org, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH RESEND v2] drm/i915: Fix memory leak by correcting cache
 object name in error handler
Message-ID: <Z1DNlAPvPNtgpMXO@ashyti-mobl2.lan>
References: <20241127201042.29620-1-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127201042.29620-1-jiashengjiangcool@gmail.com>
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

Hi Jiasheng,

On Wed, Nov 27, 2024 at 08:10:42PM +0000, Jiasheng Jiang wrote:
> From: Jiasheng Jiang <jiashengjiangcool@outlook.com>
> 
> Replace "slab_priorities" with "slab_dependencies" in the error handler
> to avoid memory leak.
> 
> Fixes: 32eb6bcfdda9 ("drm/i915: Make request allocation caches global")
> Cc: <stable@vger.kernel.org> # v5.2+
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@outlook.com>

merged to drm-intel-next.

Thanks,
Andi
