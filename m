Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB97BB8E2B9
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 19:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A857D10E0AE;
	Sun, 21 Sep 2025 17:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oNji14LK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFCF10E37B;
 Sun, 21 Sep 2025 17:28:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 63B6D40468;
 Sun, 21 Sep 2025 17:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22692C4CEE7;
 Sun, 21 Sep 2025 17:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1758475727;
 bh=OhAKhAi+AnzI3Qc3qjl3chOvflGQ1Z6G7nQKCQgIA6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oNji14LKsaN74d6/6VxXQLAaEWqiMK1odhhlWG54PmdesR086HbzOQPsvLp4l8W8h
 erd/geKCs7blyB1imhKlNfDZtIHl2vwbNw8z3TSYAfWxPI4STRspwkbfLQuyq+0pRc
 wfxpVS7OtRaNl868jtRKMkgfZDW20Ck1f7t2BQsw=
Date: Sun, 21 Sep 2025 19:28:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Eliav Farber <farbere@amazon.com>
Cc: linux@armlinux.org.uk, jdike@addtoit.com, richard@nod.at,
 anton.ivanov@cambridgegreys.com, dave.hansen@linux.intel.com,
 luto@kernel.org, peterz@infradead.org, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 tony.luck@intel.com, qiuxu.zhuo@intel.com, mchehab@kernel.org,
 james.morse@arm.com, rric@kernel.org, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 evan.quan@amd.com, james.qian.wang@arm.com, liviu.dudau@arm.com,
 mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robdclark@gmail.com, sean@poorly.run,
 jdelvare@suse.com, linux@roeck-us.net, fery@cypress.com,
 dmitry.torokhov@gmail.com, agk@redhat.com, snitzer@redhat.com,
 dm-devel@redhat.com, rajur@chelsio.com, davem@davemloft.net,
 kuba@kernel.org, peppe.cavallaro@st.com, alexandre.torgue@st.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, malattia@linux.it,
 hdegoede@redhat.com, mgross@linux.intel.com,
 intel-linux-scu@intel.com, artur.paszkiewicz@intel.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com,
 sakari.ailus@linux.intel.com, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com, jack@suse.com, tytso@mit.edu,
 adilger.kernel@dilger.ca, dushistov@mail.ru,
 luc.vanoostenryck@gmail.com, rostedt@goodmis.org, pmladek@suse.com,
 sergey.senozhatsky@gmail.com, andriy.shevchenko@linux.intel.com,
 linux@rasmusvillemoes.dk, minchan@kernel.org, ngupta@vflare.org,
 akpm@linux-foundation.org, kuznet@ms2.inr.ac.ru,
 yoshfuji@linux-ipv6.org, pablo@netfilter.org, kadlec@netfilter.org,
 fw@strlen.de, jmaloy@redhat.com, ying.xue@windriver.com,
 willy@infradead.org, sashal@kernel.org, ruanjinjie@huawei.com,
 David.Laight@aculab.com, herve.codina@bootlin.com, Jason@zx2c4.com,
 bvanassche@acm.org, keescook@chromium.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-um@lists.infradead.org, linux-edac@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-mm@kvack.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, tipc-discussion@lists.sourceforge.net,
 stable@vger.kernel.org, jonnyc@amazon.com
Subject: Re: [PATCH 00/27 5.10.y] Backport minmax.h updates from v6.17-rc6
Message-ID: <2025092136-unelected-skirt-d91d@gregkh>
References: <20250919101727.16152-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919101727.16152-1-farbere@amazon.com>
X-Mailman-Approved-At: Sun, 21 Sep 2025 17:58:49 +0000
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

On Fri, Sep 19, 2025 at 10:17:00AM +0000, Eliav Farber wrote:
> This series includes a total of 27 patches, to align minmax.h of
> v5.15.y with v6.17-rc6.
> 
> The set consists of 24 commits that directly update minmax.h:
> 1) 92d23c6e9415 ("overflow, tracing: Define the is_signed_type() macro
>    once")

But this isn't in 5.15.y, so how is this syncing things up?

I'm all for this, but I got confused here, at the first commit :)

> 2) 5efcecd9a3b1 ("minmax: sanity check constant bounds when clamping")



> 3) 2122e2a4efc2 ("minmax: clamp more efficiently by avoiding extra
>    comparison")
> 4) f9bff0e31881 ("minmax: add in_range() macro")
> 5) c952c748c7a9 ("minmax: Introduce {min,max}_array()")
> 6) 5e57418a2031 ("minmax: deduplicate __unconst_integer_typeof()")
> 7) f6e9d38f8eb0 ("minmax: fix header inclusions")
> 8) d03eba99f5bf ("minmax: allow min()/max()/clamp() if the arguments
>    have the same signedness.")
> 9) f4b84b2ff851 ("minmax: fix indentation of __cmp_once() and
>    __clamp_once()")
> 10) 4ead534fba42 ("minmax: allow comparisons of 'int' against 'unsigned
>     char/short'")
> 11) 867046cc7027 ("minmax: relax check to allow comparison between
>     unsigned arguments and signed constants")
> 12) 3a7e02c040b1 ("minmax: avoid overly complicated constant
>     expressions in VM code")
> 14) 017fa3e89187 ("minmax: simplify and clarify min_t()/max_t()
>     implementation")
> 15) 1a251f52cfdc ("minmax: make generic MIN() and MAX() macros
>     available everywhere")
> 18) dc1c8034e31b ("minmax: simplify min()/max()/clamp()
>     implementation")
> 19) 22f546873149 ("minmax: improve macro expansion and type
>     checking")
> 20) 21b136cc63d2 ("minmax: fix up min3() and max3() too")
> 21) 71ee9b16251e ("minmax.h: add whitespace around operators and after
>     commas")
> 22) 10666e992048 ("minmax.h: update some comments")
> 23) b280bb27a9f7 ("minmax.h: reduce the #define expansion of min(),
>     max() and clamp()")
> 24) a5743f32baec ("minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi
>     test in clamp()")
> 25) c3939872ee4a ("minmax.h: move all the clamp() definitions after the
>     min/max() ones")
> 26) 495bba17cdf9 ("minmax.h: simplify the variants of clamp()")
> 27) 2b97aaf74ed5 ("minmax.h: remove some #defines that are only
>     expanded once")

Some of these are also only in newer kernels, which, as you know, is
generally a bad thing (i.e. I can't take patches only for older
kernels.)

I want these changes, as they are great, but can you perhaps provide
patch series for newer kernels first so that I can then take these?

thanks,

greg k-h
