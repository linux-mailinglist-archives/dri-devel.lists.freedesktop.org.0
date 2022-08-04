Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DD858A357
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 00:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0201A942E;
	Thu,  4 Aug 2022 22:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858EC10FF3B;
 Thu,  4 Aug 2022 22:43:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D9F7E6186B;
 Thu,  4 Aug 2022 22:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADEDC433C1;
 Thu,  4 Aug 2022 22:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659653031;
 bh=iTffOwoeKm5s6NsokKGfJ9XtxAISgvJzsUXoAitQXp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q3v+fFLGf5wQF3GIHiotFQrBbVjC8pjV3eCjhbPuhm1d1YLklK0YDiBn3QxkiTFkb
 sXNamCIlPTnsEg6F5AlPGys1aGRkpRb32JhYaJZ8L6p/mT2QFV4IZ4G5BlgiAFzGuX
 JFg/JQ0KTqnvgRLVndky9sowtyYcMocgxZqIp3CJxubIkMAh8Nn2gYIydnZ9D2difO
 +S4MCgYgCc6CXhv5R1wMW3nWP5rnT7R1tE5KWg9oBRsrGiEo+qN4Zc+FQ7m/GHIunD
 EdaOZmnKj8B3VJDHWeVhvkmxiZo7d5+RGDMPwurpdrlg5hcXx3b2MUx1VduM38OBNf
 T+tlYCRaWcAIA==
Date: Thu, 4 Aug 2022 15:43:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: mainline build failure for x86_64 allmodconfig with clang
Message-ID: <YuxLpHndYb0ZEWQI@dev-arch.thelio-3990X>
References: <YuwRyQYPCb1FD+mr@debian>
 <CAHk-=whptVSSZL=wSUQJdRBeVfS+Xy_K4anQ7eQOky7XUrXhUQ@mail.gmail.com>
 <CAK8P3a2bEaExue0OtNeLa2CVzBx-1dE9w2HZ2PAV5N8Ct9G=JQ@mail.gmail.com>
 <YuwvfsztWaHvquwC@dev-arch.thelio-3990X>
 <CAHk-=whpa_FJjvzWdWdSzecTbVtndbQqg35=_o+ohM3X1_xKTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whpa_FJjvzWdWdSzecTbVtndbQqg35=_o+ohM3X1_xKTA@mail.gmail.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@linux.ie>, clang-built-linux <llvm@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Sudip Mukherjee \(Codethink\)" <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 04, 2022 at 02:59:01PM -0700, Linus Torvalds wrote:
> On Thu, Aug 4, 2022 at 1:43 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > I do note that commit 1b54a0121dba ("drm/amd/display: Reduce stack size
> > in the mode support function") did have a workaround for GCC. It appears
> > clang will still inline mode_support_configuration(). If I mark it as
> > 'noinline', the warning disappears in that file.
> 
> That sounds like probably the best option for now. Gcc does not inline
> that function (at least for allmodconfig builds in my testing), so if
> that makes clang match what gcc does, it seems a reasonable thing to
> do.

Sounds good. That solution only takes care of the warning in
display_mode_vba_32.c. I will try and come up with something similar for
the other two files tomorrow, unless the AMD folks beat me to it, since
they will know the driver better than I will ;)

Cheers,
Nathan
