Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6328BB01EBB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 16:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D73B10E290;
	Fri, 11 Jul 2025 14:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MvXkYTKZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E7E10E290
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 14:12:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CE9EA60010;
 Fri, 11 Jul 2025 14:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E8C3C4CEED;
 Fri, 11 Jul 2025 14:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752243162;
 bh=U6cxtSHyOQ9QCaoBodqp6zYZ+8VXJFakc92XcJD5XCw=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=MvXkYTKZnshtOXEpmgxG1eAYZ5T4ybDEiM8la83RFl3X+yCJN6HV0lvD4KaKaaCHd
 4d2/LIbSOq8ePdaTsubspT7Oshhw4WUFejE8+6pqlIczEoE0RU8zohMrMFNLNVGgHG
 euIHEET071Fy4tEbTspOjxtty7WYLcj23SAUheVcZCOiMucBljX4nGKhj06jkGWGSQ
 TacqM+6FhnMnSi5N7eNFuS51bSy56ZRTAnE2VJ/Xw45FLGVkhQDfFWp0INvrOs4Bbo
 1s48fVLYxJr8FQAEpb/FDOyW+na2nnMbg/S0o21vn1jtKmMmDET8Ax1SkUJ/gE/SUo
 tWZpDtL25alRg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id EF5C1CE0841; Fri, 11 Jul 2025 07:12:41 -0700 (PDT)
Date: Fri, 11 Jul 2025 07:12:41 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Christian Brauner <brauner@kernel.org>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Natalie Vock <natalie.vock@gmx.de>, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, cgroups@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang@linux.dev>, Maxime Ripard <mripard@kernel.org>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Subject: Re: [PATCH v1 1/1] rculist: move list_for_each_rcu() to where it
 belongs
Message-ID: <a90c8ad5-e016-40bc-873b-8bb6e7b8b441@paulmck-laptop>
References: <20250710121528.780875-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710121528.780875-1-andriy.shevchenko@linux.intel.com>
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
Reply-To: paulmck@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 10, 2025 at 03:15:28PM +0300, Andy Shevchenko wrote:
> The list_for_each_rcu() relies on the rcu_dereference() API which is not
> provided by the list.h. At the same time list.h is a low-level basic header
> that must not have dependencies like RCU, besides the fact of the potential
> circular dependencies in some cases. With all that said, move RCU related
> API to the rculist.h where it belongs.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I cannot see why this would not work, and it does pass testing, but I
am adding David Howells in case there is some subtle reason why this
must remain in include/linux/list.h.

ad25f5cb3987 ("rxrpc: Fix locking issue")

In the absence of such a reason, from an RCU viewpoint:

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>

> ---
>  include/linux/list.h    | 10 ----------
>  include/linux/rculist.h | 10 ++++++++++
>  kernel/cgroup/dmem.c    |  1 +
>  3 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/list.h b/include/linux/list.h
> index e7e28afd28f8..e7bdad9b8618 100644
> --- a/include/linux/list.h
> +++ b/include/linux/list.h
> @@ -686,16 +686,6 @@ static inline void list_splice_tail_init(struct list_head *list,
>  #define list_for_each(pos, head) \
>  	for (pos = (head)->next; !list_is_head(pos, (head)); pos = pos->next)
>  
> -/**
> - * list_for_each_rcu - Iterate over a list in an RCU-safe fashion
> - * @pos:	the &struct list_head to use as a loop cursor.
> - * @head:	the head for your list.
> - */
> -#define list_for_each_rcu(pos, head)		  \
> -	for (pos = rcu_dereference((head)->next); \
> -	     !list_is_head(pos, (head)); \
> -	     pos = rcu_dereference(pos->next))
> -
>  /**
>   * list_for_each_continue - continue iteration over a list
>   * @pos:	the &struct list_head to use as a loop cursor.
> diff --git a/include/linux/rculist.h b/include/linux/rculist.h
> index 1b11926ddd47..2abba7552605 100644
> --- a/include/linux/rculist.h
> +++ b/include/linux/rculist.h
> @@ -42,6 +42,16 @@ static inline void INIT_LIST_HEAD_RCU(struct list_head *list)
>   */
>  #define list_bidir_prev_rcu(list) (*((struct list_head __rcu **)(&(list)->prev)))
>  
> +/**
> + * list_for_each_rcu - Iterate over a list in an RCU-safe fashion
> + * @pos:	the &struct list_head to use as a loop cursor.
> + * @head:	the head for your list.
> + */
> +#define list_for_each_rcu(pos, head)		  \
> +	for (pos = rcu_dereference((head)->next); \
> +	     !list_is_head(pos, (head)); \
> +	     pos = rcu_dereference(pos->next))
> +
>  /**
>   * list_tail_rcu - returns the prev pointer of the head of the list
>   * @head: the head of the list
> diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
> index 10b63433f057..e12b946278b6 100644
> --- a/kernel/cgroup/dmem.c
> +++ b/kernel/cgroup/dmem.c
> @@ -14,6 +14,7 @@
>  #include <linux/mutex.h>
>  #include <linux/page_counter.h>
>  #include <linux/parser.h>
> +#include <linux/rculist.h>
>  #include <linux/slab.h>
>  
>  struct dmem_cgroup_region {
> -- 
> 2.47.2
> 
