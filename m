Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3C5907DEC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 23:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06A010EBAB;
	Thu, 13 Jun 2024 21:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EMg5zEp0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C269D10EBAB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 21:14:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A028CCE27D1;
 Thu, 13 Jun 2024 21:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E20C2BBFC;
 Thu, 13 Jun 2024 21:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1718313277;
 bh=4a2+5zIfwargPvYAlTmLGH6pFw0rZamk0P9b4EVRVsM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EMg5zEp0mO+NhF6jvPGvPYkQn8Gd0u2aw4kR2cAYBNOQj5bRnNWwQM9CehUe95cZs
 6Ig1y6VAXMhH/JYy3dPHM1EG0vGdCUoJaJs1tYAbb6NeSB3p4cP0PLop0SsGaGcGr6
 fg74mWAVBAHGreHe41TJIWG8GiGZhlI1Nb5wr4hM=
Date: Thu, 13 Jun 2024 14:14:35 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 05/10] mm/util: Fix possible race condition in kstrdup()
Message-Id: <20240613141435.fad09579c934dbb79a3086cc@linux-foundation.org>
In-Reply-To: <20240613023044.45873-6-laoar.shao@gmail.com>
References: <20240613023044.45873-1-laoar.shao@gmail.com>
 <20240613023044.45873-6-laoar.shao@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 13 Jun 2024 10:30:39 +0800 Yafang Shao <laoar.shao@gmail.com> wrote:

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

The concept sounds a little strange.  If some code takes a copy of a
string while some other code is altering it, yes, the result will be a
mess.  This is why get_task_comm() exists, and why it uses locking.

I get that "your copy is a mess" is less serious than "your string
isn't null-terminated" but still.  Whichever outcome we get, the
calling code is buggy and should be fixed.

Are there any other problematic scenarios we're defending against here?

>
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -60,8 +60,10 @@ char *kstrdup(const char *s, gfp_t gfp)
>  
>  	len = strlen(s) + 1;
>  	buf = kmalloc_track_caller(len, gfp);
> -	if (buf)
> +	if (buf) {
>  		memcpy(buf, s, len);
> +		buf[len - 1] = '\0';
> +	}
>  	return buf;
>  }

Now I'll start receiving patches to remove this again.  Let's have a
code comment please.

And kstrdup() is now looking awfully similar to kstrndup().  Perhaps
there's a way to reduce duplication?
