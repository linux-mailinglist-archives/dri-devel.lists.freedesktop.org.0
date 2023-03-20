Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2972A6C1EF9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 19:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCDC10E057;
	Mon, 20 Mar 2023 18:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AD710E057
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 18:05:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C66F61751;
 Mon, 20 Mar 2023 18:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A3CC433EF;
 Mon, 20 Mar 2023 18:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679335503;
 bh=8np/lbjjJ8FCVyjL6iQLvblXqr7n0c7bPvXEH9MwKbE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PVhKuCK81gyCbt2F0XSDTdoqnqHLkkLR6w7sbAyxyyRHgzPsA/51b07az4zQ9Ealq
 C3qnFJQxHicSx/XpZwuyEMJi+jnCKOlvI+OFUFPzTKPUdcI7OjSMl62E+qQIOfjVoI
 XCq4hu23ApqbOex9a8OAp4oUgAn5PHAMEhwvuBdNDoNnl3MCh9AvaiBVYlGvtS9hgP
 +D+MmwUBy3saoHMiRhCpjdvQ9C2HG6gbVMy1TcNFWnRc9MOkckFso4uA/gpqv5yt24
 dC1MnxF0MXPpvzgQjdce2+qiRStI5/0ayrLgEc5I4hATrwdkXJK8U7aBHUjs1A0pHy
 P8pSDQyL6BoGA==
Date: Mon, 20 Mar 2023 11:05:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Linux 6.3-rc3
Message-ID: <20230320180501.GA598084@dev-arch.thelio-3990X>
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 19, 2023 at 01:50:21PM -0700, Linus Torvalds wrote:
> So rc3 is fairly big, but that's not hugely usual: it's when a lot of
> the fixes tick up as it takes a while before people find and start
> reporting issues.

...

> Please test and report any issues you find,

On the clang front, I am still seeing the following warning turned error
for arm64 allmodconfig at least:

  drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is uninitialized when used here [-Werror,-Wuninitialized]
          if (syncpt_irq < 0)
              ^~~~~~~~~~
  drivers/gpu/host1x/dev.c:490:16: note: initialize the variable 'syncpt_irq' to silence this warning
          int syncpt_irq;
                        ^
                         = 0
  1 error generated.

There is an obvious fix that has been available on the mailing list for
some time:

https://lore.kernel.org/20230127221418.2522612-1-arnd@kernel.org/

It appears there was some sort of process snafu, since the fix never got
applied to the drm tree before the main pull for 6.3 and I have not been
able to get anyone to apply it to a tree targeting -rc releases.

https://lore.kernel.org/Y%2FeULFO4jbivQ679@dev-arch.thelio-3990X/
https://lore.kernel.org/67f9fe7f-392a-9acd-1a4d-0a43da634367@nvidia.com/

If that does not come to you through other means before -rc4, could you
just apply it directly so that I can stop applying it to our CI? :)

Cheers,
Nathan
