Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8D0AA8DD0
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 10:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8D910E309;
	Mon,  5 May 2025 08:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="icdt4AeV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1536310E309;
 Mon,  5 May 2025 08:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746432347; x=1777968347;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=sEn0JbLJ+2KtLbxcEixQL7BULeNTdU1w4BNv+zrfAC8=;
 b=icdt4AeVIYp9k2OmheG5IHiVmo0dFfPg1Z8N5/LQHT8Mj/1p4Vx6tIGU
 8S7YhjaR2Xwv+EGlarchQwz5W6euzJ/j11THNp3J1olLg7ll6OBObMkg3
 z09rWz9YGSuIm5o5JJ+zFI9rso+HkzlMFKtJv1mmFTFYYctMzJGlwwvgv
 IV2TTAqDYHe59DbGrB40BMg1jt3SdP3FGRP6xmQ3WDm+5wn+uy6UkI0fM
 K303whK/rfXTgxfkwHY4kYhI2dQi4DxFaCNBD72wybOuS+ik1G5eEoBcj
 GTXne1AvRrSW351QvJn0hZ8m/532UHunyUUCvhdx/lgx9nmWkZCdqvJiH w==;
X-CSE-ConnectionGUID: du4nirBqRDKamLntbo2jDQ==
X-CSE-MsgGUID: IOHyi+xYTACecOQO9G5weQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="65433522"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="65433522"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 01:05:46 -0700
X-CSE-ConnectionGUID: WVpB8LTlQ5Gp6D46hzAfvw==
X-CSE-MsgGUID: ZyvzMFgARIqh2D8utixdPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="140172578"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.232])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 01:05:38 -0700
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
Subject: Re: [PATCH v6 06/10] ref_tracker: automatically register a file in
 debugfs for a ref_tracker_dir
In-Reply-To: <20250430-reftrack-dbgfs-v6-6-867c29aff03a@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250430-reftrack-dbgfs-v6-0-867c29aff03a@kernel.org>
 <20250430-reftrack-dbgfs-v6-6-867c29aff03a@kernel.org>
Date: Mon, 05 May 2025 11:05:35 +0300
Message-ID: <87frhjwkhc.fsf@intel.com>
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

On Wed, 30 Apr 2025, Jeff Layton <jlayton@kernel.org> wrote:
> Currently, there is no convenient way to see the info that the
> ref_tracking infrastructure collects. Attempt to create a file in
> debugfs when called from ref_tracker_dir_init().
>
> The file is given the name "class@%px", as having the unmodified address
> is helpful for debugging. This should be safe since this directory is only
> accessible by root
>
> If debugfs file creation fails, a pr_warn will be isssued.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  include/linux/ref_tracker.h | 14 +++++++++
>  lib/ref_tracker.c           | 73 +++++++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 85 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
> index 2adae128d4b5e45f156af4775a1d184bb596fa91..c6e65d7ef4d4fc74c60fcabd19166c131d4173e2 100644
> --- a/include/linux/ref_tracker.h
> +++ b/include/linux/ref_tracker.h
> @@ -5,6 +5,7 @@
>  #include <linux/types.h>
>  #include <linux/spinlock.h>
>  #include <linux/stackdepot.h>
> +#include <linux/seq_file.h>

Nothing here requires seq_file.h as far as I can tell. Please avoid
superfluous header dependencies.

BR,
Jani.

>  
>  struct ref_tracker;
>  
> @@ -18,12 +19,17 @@ struct ref_tracker_dir {
>  	struct list_head	list; /* List of active trackers */
>  	struct list_head	quarantine; /* List of dead trackers */
>  	const char		*class; /* object classname */
> +#ifdef CONFIG_DEBUG_FS
> +	struct dentry		*dentry;
> +#endif
>  	char			name[32];
>  #endif
>  };
>  
>  #ifdef CONFIG_REF_TRACKER
>  
> +void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir);
> +
>  static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
>  					unsigned int quarantine_count,
>  					const char *class,
> @@ -37,7 +43,11 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
>  	refcount_set(&dir->untracked, 1);
>  	refcount_set(&dir->no_tracker, 1);
>  	dir->class = class;
> +#ifdef CONFIG_DEBUG_FS
> +	dir->dentry = NULL;
> +#endif
>  	strscpy(dir->name, name, sizeof(dir->name));
> +	ref_tracker_dir_debugfs(dir);
>  	stack_depot_init();
>  }
>  
> @@ -66,6 +76,10 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
>  {
>  }
>  
> +static inline void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
> +{
> +}
> +
>  static inline void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
>  {
>  }
> diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
> index b69c11e83c18c19aaa2dc23f802291d4a7e82a66..3ee4fd0f33407881cfa140dcb7d8b40e3c2722de 100644
> --- a/lib/ref_tracker.c
> +++ b/lib/ref_tracker.c
> @@ -31,6 +31,14 @@ struct ref_tracker_dir_stats {
>  	} stacks[];
>  };
>  
> +#ifdef CONFIG_DEBUG_FS
> +static void ref_tracker_debugfs_remove(struct ref_tracker_dir *dir);
> +#else
> +static inline void ref_tracker_debugfs_remove(struct ref_tracker_dir *dir)
> +{
> +}
> +#endif
> +
>  static struct ref_tracker_dir_stats *
>  ref_tracker_get_stats(struct ref_tracker_dir *dir, unsigned int limit)
>  {
> @@ -197,6 +205,7 @@ void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
>  	bool leak = false;
>  
>  	dir->dead = true;
> +	ref_tracker_debugfs_remove(dir);
>  	spin_lock_irqsave(&dir->lock, flags);
>  	list_for_each_entry_safe(tracker, n, &dir->quarantine, head) {
>  		list_del(&tracker->head);
> @@ -313,8 +322,7 @@ EXPORT_SYMBOL_GPL(ref_tracker_free);
>  #ifdef CONFIG_DEBUG_FS
>  #include <linux/debugfs.h>
>  
> -static __maybe_unused int
> -ref_tracker_dir_seq_print(struct ref_tracker_dir *dir, struct seq_file *seq)
> +static int ref_tracker_dir_seq_print(struct ref_tracker_dir *dir, struct seq_file *seq)
>  {
>  	struct ostream os = { .func = pr_ostream_seq,
>  			      .prefix = "",
> @@ -328,6 +336,67 @@ ref_tracker_dir_seq_print(struct ref_tracker_dir *dir, struct seq_file *seq)
>  	return os.used;
>  }
>  
> +static int ref_tracker_debugfs_show(struct seq_file *f, void *v)
> +{
> +	struct ref_tracker_dir *dir = f->private;
> +
> +	return ref_tracker_dir_seq_print(dir, f);
> +}
> +
> +static int ref_tracker_debugfs_open(struct inode *inode, struct file *filp)
> +{
> +	struct ref_tracker_dir *dir = inode->i_private;
> +
> +	return single_open(filp, ref_tracker_debugfs_show, dir);
> +}
> +
> +static const struct file_operations ref_tracker_debugfs_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= ref_tracker_debugfs_open,
> +	.read		= seq_read,
> +	.llseek		= seq_lseek,
> +	.release	= single_release,
> +};
> +
> +/**
> + * ref_tracker_dir_debugfs - create debugfs file for ref_tracker_dir
> + * @dir: ref_tracker_dir to be associated with debugfs file
> + *
> + * In most cases, a debugfs file will be created automatically for every
> + * ref_tracker_dir. If the object was created before debugfs is brought up
> + * then that may fail. In those cases, it is safe to call this at a later
> + * time to create the file.
> + */
> +void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
> +{
> +	char name[NAME_MAX + 1];
> +	int ret;
> +
> +	/* No-op if already created */
> +	if (!IS_ERR_OR_NULL(dir->dentry))
> +		return;
> +
> +	ret = snprintf(name, sizeof(name), "%s@%px", dir->class, dir);
> +	name[sizeof(name) - 1] = '\0';
> +
> +	if (ret < sizeof(name))
> +		dir->dentry = debugfs_create_file(name, S_IFREG | 0400,
> +						  ref_tracker_debug_dir, dir,
> +						  &ref_tracker_debugfs_fops);
> +	else
> +		dir->dentry = ERR_PTR(-ENAMETOOLONG);
> +
> +	if (IS_ERR(dir->dentry))
> +		pr_warn("ref_tracker: unable to create debugfs file for %s: %pe\n",
> +			name, dir->dentry);
> +}
> +EXPORT_SYMBOL(ref_tracker_dir_debugfs);
> +
> +static void ref_tracker_debugfs_remove(struct ref_tracker_dir *dir)
> +{
> +	debugfs_remove(dir->dentry);
> +}
> +
>  static int __init ref_tracker_debugfs_init(void)
>  {
>  	ref_tracker_debug_dir = debugfs_create_dir("ref_tracker", NULL);

-- 
Jani Nikula, Intel
