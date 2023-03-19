Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0CF6C0688
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 00:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C3010E1C4;
	Sun, 19 Mar 2023 23:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDBC10E1C3;
 Sun, 19 Mar 2023 23:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679267513; x=1710803513;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MCjD/Cjctl3lsA9iTC0uh9mq2PU5xdTO+OMJfvuYmkg=;
 b=MBIh4+rwhg2w/U1Cc9VbBrq7HUIvEmmjhVdkjVJ63KYFI3sAuJ+gIz1d
 jzwQeUNZjgvwpJFDgiHwyXWo4lWn00f/kJ0rAbldfOpEktbGn+Woa9DAu
 CQRDb0LQH+84LfK7UaBl5jkW3OwDMBU6xIAtSEScFKDUottJ8EGgI36c4
 yyf0yl+G15jvb9hBCJnRghrBGW5IA2LMZWQ7zdFxIsTXgYqluQG4s9fOY
 +qLE17MTc8llQGPoddp5IiChQz6LDGjJ5syNzAO1hpDfKBUf4EEx5gEhP
 Jp3j97WtCVuRg2+jK4APM7GlhqoPAxdHpf22Nl3sIdKae/e4I6QyLKY/h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="322387306"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="322387306"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2023 16:11:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="824292558"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="824292558"
Received: from msbunten-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.251.221.102])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2023 16:11:49 -0700
Date: Mon, 20 Mar 2023 00:11:24 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 02/10] lib/ref_tracker:
 __ref_tracker_dir_print improve printing
Message-ID: <ZBeWnKmLiGOOMOiG@ashyti-mobl2.lan>
References: <20230224-track_gt-v4-0-464e8ab4c9ab@intel.com>
 <20230224-track_gt-v4-2-464e8ab4c9ab@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224-track_gt-v4-2-464e8ab4c9ab@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Eric Dumazet <edumazet@google.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

looks good, few comments below,

On Mon, Mar 06, 2023 at 05:31:58PM +0100, Andrzej Hajda wrote:
> To improve readability of ref_tracker printing following changes
> have been performed:
> - reports are printed per stack_handle - log is more compact,
> - added display name for ref_tracker_dir,
> - stack trace is printed indented, in the same printk call,
> - total number of references is printed every time,
> - print info about dropped references.

nit: I think you can do better with the log :)

> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  include/linux/ref_tracker.h | 15 ++++++--
>  lib/ref_tracker.c           | 90 +++++++++++++++++++++++++++++++++++++++------
>  2 files changed, 91 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
> index 3e9e9df2a41f5f..a2cf1f6309adb2 100644
> --- a/include/linux/ref_tracker.h
> +++ b/include/linux/ref_tracker.h
> @@ -17,12 +17,19 @@ struct ref_tracker_dir {
>  	bool			dead;
>  	struct list_head	list; /* List of active trackers */
>  	struct list_head	quarantine; /* List of dead trackers */
> +	char			name[32];
>  #endif
>  };
>  
>  #ifdef CONFIG_REF_TRACKER
> -static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
> -					unsigned int quarantine_count)
> +
> +// Temporary allow two and three arguments, until consumers are converted

I thought only Linus was allowed to use '//' :)

> +#define ref_tracker_dir_init(_d, _q, args...) _ref_tracker_dir_init(_d, _q, ##args, #_d)
> +#define _ref_tracker_dir_init(_d, _q, _n, ...) __ref_tracker_dir_init(_d, _q, _n)

[...]

> +void __ref_tracker_dir_print(struct ref_tracker_dir *dir,
> +			   unsigned int display_limit)
> +{
> +	struct ref_tracker_dir_stats *stats;
> +	unsigned int i = 0, skipped;
> +	depot_stack_handle_t stack;
> +	char *sbuf;
> +
> +	lockdep_assert_held(&dir->lock);
> +
> +	if (list_empty(&dir->list))
> +		return;
> +
> +	stats = ref_tracker_get_stats(dir, display_limit);
> +	if (IS_ERR(stats)) {
> +		pr_err("%s@%pK: couldn't get stats, error %pe\n",
> +		       dir->name, dir, stats);
> +		return;
>  	}
> +
> +	sbuf = kmalloc(STACK_BUF_SIZE, GFP_NOWAIT | __GFP_NOWARN);
> +
> +	for (i = 0, skipped = stats->total; i < stats->count; ++i) {
> +		stack = stats->stacks[i].stack_handle;
> +		if (sbuf && !stack_depot_snprint(stack, sbuf, STACK_BUF_SIZE, 4))
> +			sbuf[0] = 0;
> +		pr_err("%s@%pK has %d/%d users at\n%s\n", dir->name, dir,
> +		       stats->stacks[i].count, stats->total, sbuf);

what if sbuf is NULL?

> +		skipped -= stats->stacks[i].count;
> +	}
> +
> +	if (skipped)

is skipped used to double check whether stats->count is equal to
all the stacks[].conunts? What are the cases when skipped is > 0?

Andi

> +		pr_err("%s@%pK skipped reports about %d/%d users.\n",
> +		       dir->name, dir, skipped, stats->total);
> +
> +	kfree(sbuf);
> +
> +	kfree(stats);
>  }
>  EXPORT_SYMBOL(__ref_tracker_dir_print);
>  
> 
> -- 
> 2.34.1
