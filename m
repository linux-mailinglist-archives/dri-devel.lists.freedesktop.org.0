Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3497CBBE1CF
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 15:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398F410E362;
	Mon,  6 Oct 2025 13:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="E597mMN/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D87610E412;
 Mon,  6 Oct 2025 10:47:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7F5B860454;
 Mon,  6 Oct 2025 10:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FDD7C4CEF5;
 Mon,  6 Oct 2025 10:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1759747669;
 bh=FX1Lzu7+bvM9e8qmukvbO1hpPMzmlxgfp1qFo7AK/EQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E597mMN/x7YVkjNX1Bc0G8W7GHt89kk8u2seksXgi5q2H3Gw9DqBry/MoIgd7Hl/f
 QcuYuZ/DwxfZxXg04LwRoNwgtiAl8T7SsOstK7UXK8SyqkUmffohAckrwzORjzcTe+
 /i/1SV3Pn0pttPu3dXePy8Hlmyjuwx9fL801o6Qw=
Date: Mon, 6 Oct 2025 12:47:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Eliav Farber <farbere@amazon.com>
Cc: jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, tony.luck@intel.com, qiuxu.zhuo@intel.com,
 james.morse@arm.com, rric@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robdclark@gmail.com,
 sean@poorly.run, jdelvare@suse.com, linux@roeck-us.net,
 linus.walleij@linaro.org, dmitry.torokhov@gmail.com, maz@kernel.org,
 wens@csie.org, jernej.skrabec@gmail.com, agk@redhat.com,
 snitzer@redhat.com, dm-devel@redhat.com, davem@davemloft.net,
 kuba@kernel.org, mcoquelin.stm32@gmail.com,
 krzysztof.kozlowski@canonical.com, malattia@linux.it,
 hdegoede@redhat.com, mgross@linux.intel.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, sakari.ailus@linux.intel.com,
 clm@fb.com, josef@toxicpanda.com, dsterba@suse.com, jack@suse.com,
 tytso@mit.edu, adilger.kernel@dilger.ca, dushistov@mail.ru,
 luc.vanoostenryck@gmail.com, rostedt@goodmis.org, pmladek@suse.com,
 senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
 linux@rasmusvillemoes.dk, minchan@kernel.org, ngupta@vflare.org,
 akpm@linux-foundation.org, yoshfuji@linux-ipv6.org,
 dsahern@kernel.org, pablo@netfilter.org, kadlec@netfilter.org,
 fw@strlen.de, jmaloy@redhat.com, ying.xue@windriver.com,
 shuah@kernel.org, willy@infradead.org, sashal@kernel.org,
 quic_akhilpo@quicinc.com, ruanjinjie@huawei.com,
 David.Laight@aculab.com, herve.codina@bootlin.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-um@lists.infradead.org, linux-edac@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-mm@kvack.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, tipc-discussion@lists.sourceforge.net,
 linux-kselftest@vger.kernel.org, stable@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: [PATCH v2 07/19 5.15.y] minmax: simplify and clarify
 min_t()/max_t() implementation
Message-ID: <2025100648-capable-register-101b@gregkh>
References: <20251003130006.41681-1-farbere@amazon.com>
 <20251003130006.41681-8-farbere@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251003130006.41681-8-farbere@amazon.com>
X-Mailman-Approved-At: Mon, 06 Oct 2025 13:01:27 +0000
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

On Fri, Oct 03, 2025 at 12:59:54PM +0000, Eliav Farber wrote:
> From: Linus Torvalds <torvalds@linux-foundation.org>
> 
> [ Upstream commit 017fa3e89187848fd056af757769c9e66ac3e93d ]
> 
> This simplifies the min_t() and max_t() macros by no longer making them
> work in the context of a C constant expression.
> 
> That means that you can no longer use them for static initializers or
> for array sizes in type definitions, but there were only a couple of
> such uses, and all of them were converted (famous last words) to use
> MIN_T/MAX_T instead.
> 
> Cc: David Laight <David.Laight@aculab.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Eliav Farber <farbere@amazon.com>

Eliav, your testing infrastructure needs some work, this patch breaks
the build on this kernel tree:

In file included from ./include/linux/kernel.h:16,
                 from ./include/linux/list.h:9,
                 from ./include/linux/wait.h:7,
                 from ./include/linux/wait_bit.h:8,
                 from ./include/linux/fs.h:6,
                 from fs/erofs/internal.h:10,
                 from fs/erofs/zdata.h:9,
                 from fs/erofs/zdata.c:6:
fs/erofs/zdata.c: In function ‘z_erofs_decompress_pcluster’:
fs/erofs/zdata.h:185:61: error: ISO C90 forbids variable length array ‘pages_onstack’ [-Werror=vla]
  185 |         min_t(unsigned int, THREAD_SIZE / 8 / sizeof(struct page *), 96U)
      |                                                             ^~~~
./include/linux/minmax.h:49:23: note: in definition of macro ‘__cmp_once_unique’
   49 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
      |                       ^
./include/linux/minmax.h:164:27: note: in expansion of macro ‘__cmp_once’
  164 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
      |                           ^~~~~~~~~~
fs/erofs/zdata.h:185:9: note: in expansion of macro ‘min_t’
  185 |         min_t(unsigned int, THREAD_SIZE / 8 / sizeof(struct page *), 96U)
      |         ^~~~~
fs/erofs/zdata.c:847:36: note: in expansion of macro ‘Z_EROFS_VMAP_ONSTACK_PAGES’
  847 |         struct page *pages_onstack[Z_EROFS_VMAP_ONSTACK_PAGES];
      |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors


I'll drop this whole series, please do a bit more testing before sending
out a new version.

thanks,

greg k-h
