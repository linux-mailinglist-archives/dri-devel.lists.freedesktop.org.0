Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4887798917B
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 23:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672F510E18B;
	Sat, 28 Sep 2024 21:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g9tqavMY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62C210E18B
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 21:14:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8E380A40117;
 Sat, 28 Sep 2024 21:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F384C4CEC3;
 Sat, 28 Sep 2024 21:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727558067;
 bh=jktDOh0pQJ6Jkqsq+yKW1qQ5mo20RTE6ds51doxTD2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g9tqavMYyNMNsLQ90Hv8A7KbaPkFXwEzrTr5sUcx3Go75HmSrEM5AGbS3oGkbdlel
 B6eeA9RvWWVqPZh9Wyg+F2ooAJEJP2A9vmlOpz3KGgnUCCaozlOpVXmu34F4CSTbVW
 VYi3AeJ+So0qIkRNXn0E4ZMxj7wF4lRw5UT4Z9kANXoElsoElSAq/nMKw4C30aQ1eq
 FyUyaqsM2A7JG0XC1b589UzBaWfIb8SBg8crnH5eMbtpFnuBXzJZorS5YemcfRe1yg
 2gYtwluBB821Xd++PBJbJ5ISoXfK7xESIT3aL16deLWzsV9vCOeNQKEJ+OF0s25yqT
 cS+Ic0n7Zt0/Q==
Date: Sat, 28 Sep 2024 14:14:27 -0700
From: Kees Cook <kees@kernel.org>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org,
 alx@kernel.org, justinstitt@google.com, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 5/8] mm/util: Fix possible race condition in kstrdup()
Message-ID: <202409281411.3C42A3703C@keescook>
References: <20240817025624.13157-1-laoar.shao@gmail.com>
 <20240817025624.13157-6-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240817025624.13157-6-laoar.shao@gmail.com>
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

On Sat, Aug 17, 2024 at 10:56:21AM +0800, Yafang Shao wrote:
> In kstrdup(), it is critical to ensure that the dest string is always
> NUL-terminated. However, potential race condidtion can occur between a
> writer and a reader.
> 
> Consider the following scenario involving task->comm:
> 
>     reader                    writer
> 
>   len = strlen(s) + 1;
>                              strlcpy(tsk->comm, buf, sizeof(tsk->comm));
>   memcpy(buf, s, len);
> 
> In this case, there is a race condition between the reader and the
> writer. The reader calculate the length of the string `s` based on the
> old value of task->comm. However, during the memcpy(), the string `s`
> might be updated by the writer to a new value of task->comm.
> 
> If the new task->comm is larger than the old one, the `buf` might not be
> NUL-terminated. This can lead to undefined behavior and potential
> security vulnerabilities.
> 
> Let's fix it by explicitly adding a NUL-terminator.

So, I'm fine with adding this generally, but I'm not sure we can
construct these helpers to be universally safe against the strings
changing out from under them. This situation is distinct to the 'comm'
member, so I'd like to focus on helpers around 'comm' access behaving in
a reliable fashion.

-Kees

> 
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>  mm/util.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/util.c b/mm/util.c
> index 983baf2bd675..4542d8a800d9 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -62,8 +62,14 @@ char *kstrdup(const char *s, gfp_t gfp)
>  
>  	len = strlen(s) + 1;
>  	buf = kmalloc_track_caller(len, gfp);
> -	if (buf)
> +	if (buf) {
>  		memcpy(buf, s, len);
> +		/* During memcpy(), the string might be updated to a new value,
> +		 * which could be longer than the string when strlen() is
> +		 * called. Therefore, we need to add a null termimator.
> +		 */
> +		buf[len - 1] = '\0';
> +	}
>  	return buf;
>  }
>  EXPORT_SYMBOL(kstrdup);
> -- 
> 2.43.5
> 

-- 
Kees Cook
