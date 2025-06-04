Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEE5ACDAA0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 11:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D460510E5B8;
	Wed,  4 Jun 2025 09:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NjH7h2yj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6186110E126;
 Wed,  4 Jun 2025 09:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749028355; x=1780564355;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zZpo6mK8tf383MWZB/POECNU1sIuN6ckveroVl8Bdjs=;
 b=NjH7h2yjdi/R4va01KIQhQp8Qtn3vr6k2kD3NA4kM90WpAG0Ny5go8EB
 kiPjvB2n5lq4fVDjcc2M5+2Qon9F2GVUdC1/NOTleLDtgLezFM1yI/8b4
 j6t3HWZkqoXlkb4qU3+Rrw/VlylNxXstYcFxWr7QeSoAQgCiPHG4nzqDk
 o38cEmfzT92APYI20YkljTbSJjx/Gzs1jjSi4pfvwZqd37+pAza+nED9F
 1OuTYlwx5wOjFctPVqsnfjFW551NRFkAiTAzwMBBu6JPvMDG85qVrCitb
 xnFC/XLzAStJo14+P05AqcQiPJKc1RZxRrVjBe9CzQRXqPKqzBk16UUFH g==;
X-CSE-ConnectionGUID: zMRmJ2oLRV+Mxl+jjotqnA==
X-CSE-MsgGUID: DIZgq4Y/QqOtpFY0bxNOng==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51245022"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="51245022"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 02:12:34 -0700
X-CSE-ConnectionGUID: 6KQ7jSotTlyHgRT2Bv6ztA==
X-CSE-MsgGUID: YHZD5V2FShW3vSBzcpE+kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="149915958"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 02:12:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jeff Layton <jlayton@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Jeff
 Layton <jlayton@kernel.org>
Subject: Re: [PATCH v12 03/10] ref_tracker: add a top level debugfs
 directory for ref_tracker
In-Reply-To: <20250529-reftrack-dbgfs-v12-3-11b93c0c0b6e@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250529-reftrack-dbgfs-v12-0-11b93c0c0b6e@kernel.org>
 <20250529-reftrack-dbgfs-v12-3-11b93c0c0b6e@kernel.org>
Date: Wed, 04 Jun 2025 12:12:25 +0300
Message-ID: <378d6754aad9991b859a5c2136f4a4211e9fafea@intel.com>
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

On Thu, 29 May 2025, Jeff Layton <jlayton@kernel.org> wrote:
> Add a new "ref_tracker" directory in debugfs. Each individual refcount
> tracker can register files under there to display info about
> currently-held references.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  lib/ref_tracker.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
> index de71439e12a3bab6456910986fa611dfbdd97980..d374e5273e1497cac0d70c02c282baa2c3ab63fe 100644
> --- a/lib/ref_tracker.c
> +++ b/lib/ref_tracker.c
> @@ -273,3 +273,16 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(ref_tracker_free);
> +
> +#ifdef CONFIG_DEBUG_FS
> +#include <linux/debugfs.h>
> +
> +static struct dentry *ref_tracker_debug_dir = (struct dentry *)-ENOENT;

Nitpick, please prefer ERR_PTR(-ENOENT) over casting inline.

BR,
Jani.


> +
> +static int __init ref_tracker_debugfs_init(void)
> +{
> +	ref_tracker_debug_dir = debugfs_create_dir("ref_tracker", NULL);
> +	return 0;
> +}
> +late_initcall(ref_tracker_debugfs_init);
> +#endif /* CONFIG_DEBUG_FS */

-- 
Jani Nikula, Intel
