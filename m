Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2140D6C2436
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 23:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0EB10E323;
	Mon, 20 Mar 2023 22:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5584010E323
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 22:06:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BBFF1B80EFD;
 Mon, 20 Mar 2023 22:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171E1C4339B;
 Mon, 20 Mar 2023 22:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679349993;
 bh=WPdzXlRJ1fhN25/Inu78vyMKnvSuUso+LnIegiA5uII=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o/V1nJbI3uohMZ6GjTYOokx8ZmK4THRr3F1oJhLYnS+hBfSDXrZODIG031hnpCjN+
 24Y9x26OwwCUQpVgPqj39sPkbIh8GtEdAymzAmu0NfmxpaMgm4Le/6hYg03HdVy7hE
 60dNpI0nyTog/bQ7qp0DdGVOMVuEo65rRMXCRTLt6DXBU5ZMUfD7qiirU/CqrouKBo
 OUcCMMij+z7hLkY8hPYQrPu/MUIgPDoQsGf4xiRkyieSXZuhE6TAoVx4zX82hgoFQN
 Ud6Q63hxv7nm5AgwDzw05o1SW4RExAZvpe+sfAnwi6T0NGLMrp8psuwuIYvrbjXORl
 uJVgOhNfhBXTA==
Date: Mon, 20 Mar 2023 15:06:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Linux 6.3-rc3
Message-ID: <20230320220631.GA637514@dev-arch.thelio-3990X>
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <4adbed5a-6f73-42ac-b7be-e12c764ae808@roeck-us.net>
 <CAHk-=wgyJREUR1WgfFmie5XVJnBLr1VPVbSibh1+Cq57Bh4Tag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wgyJREUR1WgfFmie5XVJnBLr1VPVbSibh1+Cq57Bh4Tag@mail.gmail.com>
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
Cc: llvm@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-toolchains@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 01:30:17PM -0700, Linus Torvalds wrote:
> On Mon, Mar 20, 2023 at 1:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > I have noticed that gcc doesn't always warn about uninitialized variables
> > in most architectures.
> 
> Yeah, I'm getting the feeling that when the gcc people were trying to
> make -Wmaybe-uninitialized work better (when moving it into "-Wall"),
> they ended up moving a lot of "clearly uninitialized" cases into it.
> 
> So then because we disable the "maybe" case (with
> -Wno-maybe-uninitialized) because it had too many random false
> positives, we end up not seeing the obvious cases either.

Right, this seems like a subtle difference in semantics between
-Wuninitialized between clang and GCC. My naive attempt to reduce the
problem with cvise spits out:

$ cat dev.i
void *host1x_probe___trans_tmp_1;
void host1x_unregister();
int host1x_probe_syncpt_irqhost1x_probe() {
  int err;
  if (host1x_probe___trans_tmp_1)
    return 2;
  if (err)
    host1x_unregister();
  return err;
}

$ gcc -O2 -Wall -c -o /dev/null dev.i
dev.i: In function ‘host1x_probe_syncpt_irqhost1x_probe’:
dev.i:7:6: warning: ‘err’ may be used uninitialized [-Wmaybe-uninitialized]
    7 |   if (err)
      |      ^
dev.i:4:7: note: ‘err’ was declared here
    4 |   int err;
      |       ^~~

$ clang -Wall -fsyntax-only dev.i
dev.i:7:7: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
  if (err)
      ^~~
dev.i:4:10: note: initialize the variable 'err' to silence this warning
  int err;
         ^
          = 0
1 warning generated.

If I remove the first branch, both compilers show -Wuninitialized.

$ cat dev.i
void *host1x_probe___trans_tmp_1;
void host1x_unregister();
int host1x_probe_syncpt_irqhost1x_probe() {
  int err;
  if (err)
    host1x_unregister();
  return err;
}

$ gcc -O2 -Wall -c -o /dev/null dev.i
dev.i: In function ‘host1x_probe_syncpt_irqhost1x_probe’:
dev.i:5:6: warning: ‘err’ is used uninitialized [-Wuninitialized]
    5 |   if (err)
      |      ^
dev.i:4:7: note: ‘err’ was declared here
    4 |   int err;
      |       ^~~

$ clang -Wall -fsyntax-only dev.i
dev.i:5:7: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
  if (err)
      ^~~
dev.i:4:10: note: initialize the variable 'err' to silence this warning
  int err;
         ^
          = 0
1 warning generated.

It seems like clang takes into account that the branch has no effect on
how uninitialized err is, although it does acknowledge there may be
control flow where err is not used uninitialized because it is not used
at all by stating "when used here". I guess GCC does not make this
distinction and places it under -Wmaybe-uninitialized. I could be
totally wrong though :)

Cheers,
Nathan
