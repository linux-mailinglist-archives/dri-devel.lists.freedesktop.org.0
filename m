Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C22B6C0638
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 00:00:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1FF10E15B;
	Sun, 19 Mar 2023 23:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168A010E15B;
 Sun, 19 Mar 2023 23:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679266819; x=1710802819;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=s4BG9r1dyTLxYEqUOdUn0mdobQsXAN0A78/09axaYy4=;
 b=hrdzPqFieTJdJDpo2anb72iNhKRIEyfNIxMtnTL0u3B/r6wGSuzaB9y6
 sPufyYZKJrK/mXEp6bvDL7xYnnktbMyb8ZGSXQG3Lmy6CaORUx6lq/Oh2
 0gE0v76LIkZWaBJP4yd2+c8cNBlVTC9ZLtiZZguvL0kTHXeMbHurtrX2Y
 4p7uG8emmrfHwewudNbvzDFXfwGMQujQ3j4XOPAeUV/JjkwbSNxs7gXKn
 XtySmeZptT0bfTtGpCZUhe4WFjrjIjSH7WPc9OgbzT58TBtGJmoOgYbzJ
 8cyyoXK5RmLqeguPH8w/TvYMXbfkqtywnj1ssdwJ30dfnbgiPUxW5bUBE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="326914234"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="326914234"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2023 16:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="791382656"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="791382656"
Received: from msbunten-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.251.221.102])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2023 16:00:14 -0700
Date: Sun, 19 Mar 2023 23:59:49 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 01/10] lib/ref_tracker: add unlocked leak
 print helper
Message-ID: <ZBeT5cWWqY4hkqu6@ashyti-mobl2.lan>
References: <20230224-track_gt-v4-0-464e8ab4c9ab@intel.com>
 <20230224-track_gt-v4-1-464e8ab4c9ab@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224-track_gt-v4-1-464e8ab4c9ab@intel.com>
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

[...]

> diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
> index dc7b14aa3431e2..5e9f90bbf771b0 100644
> --- a/lib/ref_tracker.c
> +++ b/lib/ref_tracker.c
> @@ -14,6 +14,38 @@ struct ref_tracker {
>  	depot_stack_handle_t	free_stack_handle;
>  };
>  
> +void __ref_tracker_dir_print(struct ref_tracker_dir *dir,
> +			   unsigned int display_limit)

can we call this ref_tracker_dir_print_locked() instead of using
the '__'?

> +{
> +	struct ref_tracker *tracker;
> +	unsigned int i = 0;
> +
> +	lockdep_assert_held(&dir->lock);
> +
> +	list_for_each_entry(tracker, &dir->list, head) {
> +		if (i < display_limit) {
> +			pr_err("leaked reference.\n");
> +			if (tracker->alloc_stack_handle)
> +				stack_depot_print(tracker->alloc_stack_handle);
> +			i++;
> +		} else {
> +			break;
> +		}
> +	}
> +}
> +EXPORT_SYMBOL(__ref_tracker_dir_print);
> +
> +void ref_tracker_dir_print(struct ref_tracker_dir *dir,
> +			   unsigned int display_limit)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&dir->lock, flags);
> +	__ref_tracker_dir_print(dir, display_limit);
> +	spin_unlock_irqrestore(&dir->lock, flags);
> +}
> +EXPORT_SYMBOL(ref_tracker_dir_print);
> +
>  void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
>  {
>  	struct ref_tracker *tracker, *n;
> @@ -27,13 +59,13 @@ void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
>  		kfree(tracker);
>  		dir->quarantine_avail++;
>  	}
> -	list_for_each_entry_safe(tracker, n, &dir->list, head) {
> -		pr_err("leaked reference.\n");
> -		if (tracker->alloc_stack_handle)
> -			stack_depot_print(tracker->alloc_stack_handle);
> +	if (!list_empty(&dir->list)) {
> +		__ref_tracker_dir_print(dir, 16);
>  		leak = true;
> -		list_del(&tracker->head);
> -		kfree(tracker);
> +		list_for_each_entry_safe(tracker, n, &dir->list, head) {
> +			list_del(&tracker->head);
> +			kfree(tracker);
> +		}

Just thinking whether this should go on a different patch, but I
don't have a strong opinion.

Looks good!

Andi
