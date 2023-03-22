Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168E76C4AF1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 13:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7704B10E925;
	Wed, 22 Mar 2023 12:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D5410E934
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 12:44:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 507C0620A6;
 Wed, 22 Mar 2023 12:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2730AC433D2;
 Wed, 22 Mar 2023 12:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679489093;
 bh=cYht+F6XkhcFtC9v6SKL72id95a8krZJbrH6VmzeT4Q=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=WONpPLt9AmcBhHrRzuN0Qnbyrl+ANDZBJK9VwQ+ZPTMFUOb7DtKCXUj1nGbyIhwl6
 C85TEyMv3uRNjotWlL/CmGroxtM9UAiFltY/EtQ3hKYPEz3SWc0vxnVaKGlgnOvuEu
 dSVK/zjKyMPpx1roUkDIqvSmxuJALfSbW/c0U5B52Aq9fuvqb96lNkjryPXvfQWx3R
 icYhHDJRJQLuyzYk60vhv9U9WYW+wN70A8U2V19lBUxDy5PWEKCVJYB+/a93CTy64B
 33gtmFtpskmrNeO9u/LTa7/LW6PNCrvVqFTID7hNXzIaa7c8g1JsfKapGmmT7TXoVX
 9T4Dm0UcjZXoA==
From: Kalle Valo <kvalo@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: Linux 6.3-rc3
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <20230320185337.GA615556@dev-arch.thelio-3990X>
Date: Wed, 22 Mar 2023 14:44:47 +0200
In-Reply-To: <20230320185337.GA615556@dev-arch.thelio-3990X> (Nathan
 Chancellor's message of "Mon, 20 Mar 2023 11:53:37 -0700")
Message-ID: <87pm91uf9c.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, llvm@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-toolchains@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nathan Chancellor <nathan@kernel.org> writes:

> On Mon, Mar 20, 2023 at 11:26:17AM -0700, Linus Torvalds wrote:
>> On Mon, Mar 20, 2023 at 11:05=E2=80=AFAM Nathan Chancellor <nathan@kerne=
l.org> wrote:
>> >
>> > On the clang front, I am still seeing the following warning turned err=
or
>> > for arm64 allmodconfig at least:
>> >
>> >   drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is unin=
itialized when used here [-Werror,-Wuninitialized]
>> >           if (syncpt_irq < 0)
>> >               ^~~~~~~~~~
>>=20
>> Hmm. I do my arm64 allmodconfig builds with gcc, and I'm surprised
>> that gcc doesn't warn about this.
>
> Perhaps these would make doing allmodconfig builds with clang more
> frequently less painful for you?
>
> https://lore.kernel.org/llvm/20230319235619.GA18547@dev-arch.thelio-3990X/

Thank you, at least for me this is really helpful. I tried now clang for
the first time but seeing a strange problem.

I prefer to define the compiler in GNUmakefile so it's easy to change
compilers and I don't need to remember the exact command line. So I have
this in the top level GNUmakefile (all the rest commented out):

LLVM=3D/opt/clang/llvm-16.0.0/bin/

If I run 'make oldconfig' it seems to use clang but after I run just
'make' it seems to switch back to the host GCC compiler and ask for GCC
specific config questions again. Workaround for this seems to be adding
'export LLVM' to GNUmakefile, after that also 'make' uses clang as
expected.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes
