Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A373DD34A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 11:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C860B6E03A;
	Mon,  2 Aug 2021 09:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292126E03A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 09:49:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="200625372"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; d="scan'208";a="200625372"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 02:49:34 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; d="scan'208";a="520446499"
Received: from mariaf7x-mobl.amr.corp.intel.com (HELO [10.252.52.214])
 ([10.252.52.214])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 02:49:31 -0700
Subject: Re: [PATCH v2 1/2] locking/lockdep: Provide lockdep_assert{, _once}()
 helpers
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 peterz@infradead.org, mingo@redhat.com, will@kernel.org, longman@redhat.com,
 boqun.feng@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210731082458.1962043-1-desmondcheongzx@gmail.com>
 <20210731082458.1962043-2-desmondcheongzx@gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <1450737c-719f-34ec-4d0f-581d8ac853ac@linux.intel.com>
Date: Mon, 2 Aug 2021 11:49:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210731082458.1962043-2-desmondcheongzx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Op 31-07-2021 om 10:24 schreef Desmond Cheong Zhi Xi:
> From: Peter Zijlstra <peterz@infradead.org>
>
> Extract lockdep_assert{,_once}() helpers to more easily write composite
> assertions like, for example:
>
> 	lockdep_assert(lockdep_is_held(&drm_device.master_mutex) ||
> 		       lockdep_is_held(&drm_file.master_lookup_lock));
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> Acked-by: Boqun Feng <boqun.feng@gmail.com>
> Acked-by: Waiman Long <longman@redhat.com>
> ---
>  include/linux/lockdep.h | 41 +++++++++++++++++++++--------------------
>  1 file changed, 21 insertions(+), 20 deletions(-)
>
> diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
> index 5cf387813754..9fe165beb0f9 100644
> --- a/include/linux/lockdep.h
> +++ b/include/linux/lockdep.h
> @@ -306,31 +306,29 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
>  
>  #define lockdep_depth(tsk)	(debug_locks ? (tsk)->lockdep_depth : 0)
>  
> -#define lockdep_assert_held(l)	do {					\
> -		WARN_ON(debug_locks &&					\
> -			lockdep_is_held(l) == LOCK_STATE_NOT_HELD);	\
> -	} while (0)
> +#define lockdep_assert(cond)		\
> +	do { WARN_ON(debug_locks && !(cond)); } while (0)
>  
> -#define lockdep_assert_not_held(l)	do {				\
> -		WARN_ON(debug_locks &&					\
> -			lockdep_is_held(l) == LOCK_STATE_HELD);		\
> -	} while (0)
> +#define lockdep_assert_once(cond)	\
> +	do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
>  
> -#define lockdep_assert_held_write(l)	do {			\
> -		WARN_ON(debug_locks && !lockdep_is_held_type(l, 0));	\
> -	} while (0)
> +#define lockdep_assert_held(l)		\
> +	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
>  
> -#define lockdep_assert_held_read(l)	do {				\
> -		WARN_ON(debug_locks && !lockdep_is_held_type(l, 1));	\
> -	} while (0)
> +#define lockdep_assert_not_held(l)	\
> +	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
>  
> -#define lockdep_assert_held_once(l)	do {				\
> -		WARN_ON_ONCE(debug_locks && !lockdep_is_held(l));	\
> -	} while (0)
> +#define lockdep_assert_held_write(l)	\
> +	lockdep_assert(lockdep_is_held_type(l, 0))
>  
> -#define lockdep_assert_none_held_once()	do {				\
> -		WARN_ON_ONCE(debug_locks && current->lockdep_depth);	\
> -	} while (0)
> +#define lockdep_assert_held_read(l)	\
> +	lockdep_assert(lockdep_is_held_type(l, 1))
> +
> +#define lockdep_assert_held_once(l)		\
> +	lockdep_assert_once(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
> +
> +#define lockdep_assert_none_held_once()		\
> +	lockdep_assert_once(!current->lockdep_depth)
>  
>  #define lockdep_recursing(tsk)	((tsk)->lockdep_recursion)
>  
> @@ -407,6 +405,9 @@ extern int lock_is_held(const void *);
>  extern int lockdep_is_held(const void *);
>  #define lockdep_is_held_type(l, r)		(1)
>  
> +#define lockdep_assert(c)			do { } while (0)
> +#define lockdep_assert_once(c)			do { } while (0)
> +
>  #define lockdep_assert_held(l)			do { (void)(l); } while (0)
>  #define lockdep_assert_not_held(l)		do { (void)(l); } while (0)
>  #define lockdep_assert_held_write(l)		do { (void)(l); } while (0)

All other macros seem to do (void)(c); in this case?


Otherwise looks good.

