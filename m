Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C7F989183
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 23:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD24210E264;
	Sat, 28 Sep 2024 21:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RKee8TD0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1798A10E264
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 21:17:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DBD91A40117;
 Sat, 28 Sep 2024 21:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAFFC4CEC3;
 Sat, 28 Sep 2024 21:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727558250;
 bh=D0r2pMAslanB4R9KKI1cz+nAetpbVmkKyvYYI304mqI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RKee8TD0HOzA1sEOmQy+o1YoprUqIz5Nx9I6rrFKrUGy1HZUkPMmOjKnCl3+9maWg
 1GdsNYYM0sAY/FVkiThXRc3afmVOcZcblIxwyo55OD2/2r3pt+VjmF531qy1ec/AF/
 nJ4AaI0nancNp+mrRBLDnG3AJJeb4kjXv2FtVJ/VHHglFEDhz9o/mxI/jlnp5X2DlS
 5Ct0im2UfESxxYEUowIKaR8/cSYh6y1p9AT6lp4oAwdkIRqBdVlWkO89X7OXf1CR2j
 eKkhJhuoCnM9eYUO/a3XQ19tYfht2hhlkKf5OKlyJQPedvRhQ73TS2vCTd6BMSc8ZQ
 cA5757sItzN/g==
Date: Sat, 28 Sep 2024 14:17:30 -0700
From: Kees Cook <kees@kernel.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: Yafang Shao <laoar.shao@gmail.com>, akpm@linux-foundation.org,
 torvalds@linux-foundation.org, justinstitt@google.com,
 ebiederm@xmission.com, alexei.starovoitov@gmail.com,
 rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 5/8] mm/util: Fix possible race condition in kstrdup()
Message-ID: <202409281414.487BFDAB@keescook>
References: <20240817025624.13157-1-laoar.shao@gmail.com>
 <20240817025624.13157-6-laoar.shao@gmail.com>
 <w6fx3gozq73slfpge4xucpezffrdioauzvoscdw2is5xf7viea@a4doumg264s4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w6fx3gozq73slfpge4xucpezffrdioauzvoscdw2is5xf7viea@a4doumg264s4>
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

On Sat, Aug 17, 2024 at 10:48:15AM +0200, Alejandro Colomar wrote:
> Hi Yafang,
> 
> On Sat, Aug 17, 2024 at 10:56:21AM GMT, Yafang Shao wrote:
> > In kstrdup(), it is critical to ensure that the dest string is always
> > NUL-terminated. However, potential race condidtion can occur between a
> > writer and a reader.
> > 
> > Consider the following scenario involving task->comm:
> > 
> >     reader                    writer
> > 
> >   len = strlen(s) + 1;
> >                              strlcpy(tsk->comm, buf, sizeof(tsk->comm));
> >   memcpy(buf, s, len);
> > 
> > In this case, there is a race condition between the reader and the
> > writer. The reader calculate the length of the string `s` based on the
> > old value of task->comm. However, during the memcpy(), the string `s`
> > might be updated by the writer to a new value of task->comm.
> > 
> > If the new task->comm is larger than the old one, the `buf` might not be
> > NUL-terminated. This can lead to undefined behavior and potential
> > security vulnerabilities.
> > 
> > Let's fix it by explicitly adding a NUL-terminator.
> > 
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > ---
> >  mm/util.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/mm/util.c b/mm/util.c
> > index 983baf2bd675..4542d8a800d9 100644
> > --- a/mm/util.c
> > +++ b/mm/util.c
> > @@ -62,8 +62,14 @@ char *kstrdup(const char *s, gfp_t gfp)
> >  
> >  	len = strlen(s) + 1;
> >  	buf = kmalloc_track_caller(len, gfp);
> > -	if (buf)
> > +	if (buf) {
> >  		memcpy(buf, s, len);
> > +		/* During memcpy(), the string might be updated to a new value,
> > +		 * which could be longer than the string when strlen() is
> > +		 * called. Therefore, we need to add a null termimator.
> > +		 */
> > +		buf[len - 1] = '\0';
> > +	}
> 
> I would compact the above to:
> 
> 	len = strlen(s);
> 	buf = kmalloc_track_caller(len + 1, gfp);
> 	if (buf)
> 		strcpy(mempcpy(buf, s, len), "");
> 
> It allows _FORTIFY_SOURCE to track the copy of the NUL, and also uses
> less screen.  It also has less moving parts.  (You'd need to write a
> mempcpy() for the kernel, but that's as easy as the following:)
> 
> 	#define mempcpy(d, s, n)  (memcpy(d, s, n) + n)
> 
> In shadow utils, I did a global replacement of all buf[...] = '\0'; by
> strcpy(..., "");.  It ends up being optimized by the compiler to the
> same code (at least in the experiments I did).

Just to repeat what's already been said: no, please, don't complicate
this with yet more wrappers. And I really don't want to add more str/mem
variants -- we're working really hard to _remove_ them. :P

-Kees

-- 
Kees Cook
