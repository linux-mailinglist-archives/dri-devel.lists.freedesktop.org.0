Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6869636DE
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 02:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E45C10E160;
	Thu, 29 Aug 2024 00:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q7q2uKup";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 469 seconds by postgrey-1.36 at gabe;
 Thu, 29 Aug 2024 00:25:47 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D124A10E136
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 00:25:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D2CC8AE40F2;
 Thu, 29 Aug 2024 00:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5D1C4CEC0;
 Thu, 29 Aug 2024 00:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724890675;
 bh=wqwfbglmiOW3zEjrozGHbRY21H9OrGw1J7tCUk4qVjg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q7q2uKupXiWrXEb5VBisQRcVpWz1lLcSeE7zINvaSJm8aB8JKzaa1Qlj4qvHMl9T/
 mB0q0BY6SVtNcYAr1aQd4hYDHFHib8zZ9wUNt5pkZkagn7QUYxvdthCYydJEcS6isS
 EIaBZgHBZegmK+8STHem6es+CstqnY94jKsuJoGG9Eu4OXFZpHJMWmXP/XUZReh9Ty
 SwdIv0b0X/rYgMw8zApCJK8AIPIiB13V8lLrSIAOdunytxsuwfeR+sQxj1xQwuY7Db
 UT7C88ojT+76hQqBGXasE9vK2f5kOA2shjJvfoKnyQ6Bq2qrQ6C6FSIanWfsDiAHqV
 G4c5NZzYW7RGA==
Date: Wed, 28 Aug 2024 17:17:55 -0700
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
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Matus Jokay <matus.jokay@stuba.sk>, "Serge E. Hallyn" <serge@hallyn.com>
Subject: Re: [PATCH v8 1/8] Get rid of __get_task_comm()
Message-ID: <202408281712.F78440FF@keescook>
References: <20240828030321.20688-1-laoar.shao@gmail.com>
 <20240828030321.20688-2-laoar.shao@gmail.com>
 <lql4y2nvs3ewadszhmv4m6fnqja4ff4ymuurpidlwvgf4twvru@esnh37a2jxbd>
 <n2fxqs3tekvljezaqpfnwhsmjymch4vb47y744zwmy7urf3flv@zvjtepkem4l7>
 <CALOAHbBAYHjDnKBVw63B8JBFc6U-2RNUX9L=ryA2Gbz7nnJfsQ@mail.gmail.com>
 <7839453E-CA06-430A-A198-92EB906F94D9@kernel.org>
 <ynrircglkinhherehtjz7woq55te55y4ol4rtxhfh75pvle3d5@uxp5esxt4slq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ynrircglkinhherehtjz7woq55te55y4ol4rtxhfh75pvle3d5@uxp5esxt4slq>
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

On Wed, Aug 28, 2024 at 05:09:08PM +0200, Alejandro Colomar wrote:
> Hi Kees,
> 
> On Wed, Aug 28, 2024 at 06:48:39AM GMT, Kees Cook wrote:
> 
> [...]
> 
> > >Thank you for your suggestion. How does the following commit log look
> > >to you? Does it meet your expectations?
> > >
> > >    string: Use ARRAY_SIZE() in strscpy()
> > >
> > >    We can use ARRAY_SIZE() instead to clarify that they are regular characters.
> > >
> > >    Co-developed-by: Alejandro Colomar <alx@kernel.org>
> > >    Signed-off-by: Alejandro Colomar <alx@kernel.org>
> > >    Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > >
> > >diff --git a/arch/um/include/shared/user.h b/arch/um/include/shared/user.h
> > >index bbab79c0c074..07216996e3a9 100644
> > >--- a/arch/um/include/shared/user.h
> > >+++ b/arch/um/include/shared/user.h
> > >@@ -14,7 +14,7 @@
> > >  * copying too much infrastructure for my taste, so userspace files
> > >  * get less checking than kernel files.
> > >  */
> > >-#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
> > >+#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]) + __must_be_array(x))
> > >
> > > /* This is to get size_t and NULL */
> > > #ifndef __UM_HOST__
> > >@@ -60,7 +60,7 @@ static inline void print_hex_dump(const char *level,
> > >const char *prefix_str,
> > > extern int in_aton(char *str);
> > > extern size_t strlcat(char *, const char *, size_t);
> > > extern size_t sized_strscpy(char *, const char *, size_t);
> > >-#define strscpy(dst, src)      sized_strscpy(dst, src, sizeof(dst))
> > >+#define strscpy(dst, src)      sized_strscpy(dst, src, ARRAY_SIZE(dst))
> > 
> > Uh, but why? strscpy() copies bytes, not array elements. Using sizeof() is already correct and using ARRAY_SIZE() could lead to unexpectedly small counts (in admittedly odd situations).
> > 
> > What is the problem you're trying to solve here?
> 
> I suggested that here:
> <https://lore.kernel.org/all/2jxak5v6dfxlpbxhpm3ey7oup4g2lnr3ueurfbosf5wdo65dk4@srb3hsk72zwq/>
> 
> There, you'll find the rationale (and also for avoiding the _pad calls
> where not necessary --I ignore if it's necessary here--).

Right, so we only use byte strings for strscpy(), so sizeof() is
sufficient. There's no technical need to switch to ARRAY_SIZE(), and I'd
like to minimize any changes to such core APIs without a good reason.

And for the _pad change, we are also doing strncpy() replacement via
case-by-case analysis, but with a common function like get_task_comm(),
I don't want to change the behavior without a complete audit of the
padding needs of every caller. Since that's rather a lot for this series,
I'd rather we just leave the existing behavior as-is, and if padding
removal is wanted after that, we can do it on a case-by-case basis then.

-Kees

-- 
Kees Cook
