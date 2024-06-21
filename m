Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92301912700
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 15:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E146610F197;
	Fri, 21 Jun 2024 13:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UsGyxC89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DD310F197
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 13:51:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BE542626A9;
 Fri, 21 Jun 2024 13:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550E9C2BBFC;
 Fri, 21 Jun 2024 13:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718977907;
 bh=8ElvnQPorg4Uy8imgywI1nXgKQs3ZmLKdexYoFKBvac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UsGyxC89mordI9Vx2/gblUM+5Ftjcp3r6aWKgvC7AgxfbKbF3tjOKH0Oc8+4xZ7ka
 53imU3u4kl0xmHWBQeUrPXwpUd4HV0CgvxjAnuDWJ+ESadO9DPtFhcHEFsx5/l50Bz
 PqCADX8QGP+tUecordMNnCcTvHzzeLNDNuubgkM1ZH0YhaycbAUJQX5AgoxWKcT6ec
 LoK6DITeynsMoscskznn7E6zxgUT2BnmrOQrutlHoqdl3OFBWB1zfStM0zrLF8lSLa
 q/3x7IxAscJ0MKpSbvImWfCwO2VqiKdnJI4j+sBQLyP7fynER53ZfDDEcEKKBhm0gu
 ID9btTmN8DF3w==
Date: Fri, 21 Jun 2024 14:51:42 +0100
From: Simon Horman <horms@kernel.org>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 06/11] mm/util: Deduplicate code in
 {kstrdup,kstrndup,kmemdup_nul}
Message-ID: <20240621135142.GF1098275@kernel.org>
References: <20240621022959.9124-1-laoar.shao@gmail.com>
 <20240621022959.9124-7-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621022959.9124-7-laoar.shao@gmail.com>
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

On Fri, Jun 21, 2024 at 10:29:54AM +0800, Yafang Shao wrote:
> These three functions follow the same pattern. To deduplicate the code,
> let's introduce a common help __kstrndup().
> 
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>

Hi Yafang Shao,

Some minor nits from my side.

> ---
>  mm/internal.h | 24 ++++++++++++++++++++++++
>  mm/util.c     | 27 ++++-----------------------
>  2 files changed, 28 insertions(+), 23 deletions(-)
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index b2c75b12014e..fd87f685739b 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1521,4 +1521,28 @@ static inline void shrinker_debugfs_remove(struct dentry *debugfs_entry,
>  void workingset_update_node(struct xa_node *node);
>  extern struct list_lru shadow_nodes;
>  
> +/**
> + * __kstrndup - Create a NUL-terminated string from @s, which might be unterminated.
> + * @s: The data to stringify
> + * @len: The size of the data, including the null terminator
> + * @gfp: the GFP mask used in the kmalloc() call when allocating memory
> + *
> + * Return: newly allocated copy of @s with NUL-termination or %NULL in
> + * case of error
> + */
> +static __always_inline char *__kstrndup(const char *s, size_t len, gfp_t gfp)
> +{
> +	char *buf;
> +
> +	buf = kmalloc_track_caller(len, gfp);
> +	if (!buf)
> +		return NULL;
> +
> +	memcpy(buf, s, len);
> +	/* Ensure the buf is always NUL-terminated, regardless of @s. */
> +	buf[len - 1] = '\0';
> +	return buf;
> +}
> +
> +

nit: One blank line is enough.

>  #endif	/* __MM_INTERNAL_H */
> diff --git a/mm/util.c b/mm/util.c
> index 41c7875572ed..d9135c5fdf7f 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -58,17 +58,8 @@ char *kstrdup(const char *s, gfp_t gfp)
>  	if (!s)
>  		return NULL;
>  
> -	len = strlen(s) + 1;
> -	buf = kmalloc_track_caller(len, gfp);
> -	if (buf) {
> -		memcpy(buf, s, len);
> -		/* During memcpy(), the string might be updated to a new value,
> -		 * which could be longer than the string when strlen() is
> -		 * called. Therefore, we need to add a null termimator.
> -		 */
> -		buf[len - 1] = '\0';
> -	}
> -	return buf;

nit: The local variable buf is now unused, and should be removed from kstrdup().
     Likewise for kstrndup() and kmemdup_nul()

     Flagged by W=1 builds with gcc-13 and clang-18, and Smatch.

> +	len = strlen(s);
> +	return __kstrndup(s, len + 1, gfp);
>  }
>  EXPORT_SYMBOL(kstrdup);
>  
> @@ -111,12 +102,7 @@ char *kstrndup(const char *s, size_t max, gfp_t gfp)
>  		return NULL;
>  
>  	len = strnlen(s, max);
> -	buf = kmalloc_track_caller(len+1, gfp);
> -	if (buf) {
> -		memcpy(buf, s, len);
> -		buf[len] = '\0';
> -	}
> -	return buf;
> +	return __kstrndup(s, len + 1, gfp);
>  }
>  EXPORT_SYMBOL(kstrndup);
>  
> @@ -195,12 +181,7 @@ char *kmemdup_nul(const char *s, size_t len, gfp_t gfp)
>  	if (!s)
>  		return NULL;
>  
> -	buf = kmalloc_track_caller(len + 1, gfp);
> -	if (buf) {
> -		memcpy(buf, s, len);
> -		buf[len] = '\0';
> -	}
> -	return buf;
> +	return __kstrndup(s, len + 1, gfp);
>  }
>  EXPORT_SYMBOL(kmemdup_nul);
>  
> -- 
> 2.39.1
> 
> 
