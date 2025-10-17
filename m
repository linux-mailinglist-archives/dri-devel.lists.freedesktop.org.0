Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5662FBECA5E
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 10:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2048B10E38D;
	Sat, 18 Oct 2025 08:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WO0rcs1L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAE310EBEC;
 Fri, 17 Oct 2025 13:21:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A1A76412EF;
 Fri, 17 Oct 2025 13:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD3EC4CEE7;
 Fri, 17 Oct 2025 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1760707282;
 bh=TsK5Tt2ouVurdxip4F9N9xRTQrAAUe+nydbZDh4kkR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WO0rcs1LB08EtrlI4UYOZp3vA2LU4PF6GUqMUMIpmEXqmoXG3Qcm749CWSEMtRx21
 yd1cGcnjGwOdTi+mZWhyxu/7KjiFh8ulKGdwL02YJnjsySVFFQu9HMse0CT5qdfDbQ
 MZ11xTjtf2Wz3cpg9lhgccKHoyKXK7QAQW5csdhc=
Date: Fri, 17 Oct 2025 15:21:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Farber, Eliav" <farbere@amazon.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "jdike@addtoit.com" <jdike@addtoit.com>, "richard@nod.at" <richard@nod.at>,
 "anton.ivanov@cambridgegreys.com" <anton.ivanov@cambridgegreys.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "luto@kernel.org" <luto@kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "tony.luck@intel.com" <tony.luck@intel.com>,
 "qiuxu.zhuo@intel.com" <qiuxu.zhuo@intel.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "rric@kernel.org" <rric@kernel.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "evan.quan@amd.com" <evan.quan@amd.com>,
 "james.qian.wang@arm.com" <james.qian.wang@arm.com>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 "mihail.atanassov@arm.com" <mihail.atanassov@arm.com>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "fery@cypress.com" <fery@cypress.com>,
 "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
 "agk@redhat.com" <agk@redhat.com>,
 "snitzer@redhat.com" <snitzer@redhat.com>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "rajur@chelsio.com" <rajur@chelsio.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "malattia@linux.it" <malattia@linux.it>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "intel-linux-scu@intel.com" <intel-linux-scu@intel.com>,
 "artur.paszkiewicz@intel.com" <artur.paszkiewicz@intel.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "clm@fb.com" <clm@fb.com>, "josef@toxicpanda.com" <josef@toxicpanda.com>,
 "dsterba@suse.com" <dsterba@suse.com>,
 "xiang@kernel.org" <xiang@kernel.org>, "chao@kernel.org" <chao@kernel.org>,
 "jack@suse.com" <jack@suse.com>, "tytso@mit.edu" <tytso@mit.edu>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "dushistov@mail.ru" <dushistov@mail.ru>,
 "luc.vanoostenryck@gmail.com" <luc.vanoostenryck@gmail.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "pmladek@suse.com" <pmladek@suse.com>,
 "sergey.senozhatsky@gmail.com" <sergey.senozhatsky@gmail.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "minchan@kernel.org" <minchan@kernel.org>,
 "ngupta@vflare.org" <ngupta@vflare.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "kuznet@ms2.inr.ac.ru" <kuznet@ms2.inr.ac.ru>,
 "yoshfuji@linux-ipv6.org" <yoshfuji@linux-ipv6.org>,
 "pablo@netfilter.org" <pablo@netfilter.org>,
 "kadlec@netfilter.org" <kadlec@netfilter.org>,
 "fw@strlen.de" <fw@strlen.de>, "jmaloy@redhat.com" <jmaloy@redhat.com>,
 "ying.xue@windriver.com" <ying.xue@windriver.com>,
 "willy@infradead.org" <willy@infradead.org>,
 "sashal@kernel.org" <sashal@kernel.org>,
 "ruanjinjie@huawei.com" <ruanjinjie@huawei.com>,
 "David.Laight@aculab.com" <David.Laight@aculab.com>,
 "herve.codina@bootlin.com" <herve.codina@bootlin.com>,
 "Jason@zx2c4.com" <Jason@zx2c4.com>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "kbusch@kernel.org" <kbusch@kernel.org>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>,
 "coreteam@netfilter.org" <coreteam@netfilter.org>,
 "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>, Arnd Bergmann <arnd@arndb.de>,
 Dan Williams <dan.j.williams@intel.com>,
 Eric Dumazet <edumazet@google.com>, Isabella Basso <isabbasso@riseup.net>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Sander Vanheule <sander@svanheule.net>,
 Vlastimil Babka <vbabka@suse.cz>, Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH v2 01/27 5.10.y] overflow, tracing: Define the
 is_signed_type() macro once
Message-ID: <2025101740-scion-flavoring-3a21@gregkh>
References: <20251017090519.46992-1-farbere@amazon.com>
 <20251017090519.46992-2-farbere@amazon.com>
 <2025101708-obtuse-ellipse-e355@gregkh>
 <CH0PR18MB54337BD648C23CBE40C1060CC6F6A@CH0PR18MB5433.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH0PR18MB54337BD648C23CBE40C1060CC6F6A@CH0PR18MB5433.namprd18.prod.outlook.com>
X-Mailman-Approved-At: Sat, 18 Oct 2025 08:38:36 +0000
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

On Fri, Oct 17, 2025 at 12:16:27PM +0000, Farber, Eliav wrote:
> > On Fri, Oct 17, 2025 at 09:04:53AM +0000, Eliav Farber wrote:
> > > From: Bart Van Assche <bvanassche@acm.org>
> > >
> > > [ Upstream commit 92d23c6e94157739b997cacce151586a0d07bb8a ]
> >
> > This isn't in 5.15.y, why is it needed in 5.10.y?
> 
> This is the mainline commit:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/linux/overflow.h?h=v6.18-rc1&id=92d23c6e94157739b997cacce151586a0d07bb8a
> 
> The commit hash is 92d23c6e94157739b997cacce151586a0d07bb8a, which is
> the one I used for the backport.
> 
> And here is the corresponding commit in the 5.15.y branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/include/linux/overflow.h?h=v5.15.194&id=ed6e37e30826b12572636c6bbfe6319233690c90
> However, the commit message there references a different hash:
> a49a64b5bf195381c09202c524f0f84b5f3e816f.

Ugh, that hash is invalid, I missed that :(

Thanks for the info, I'll go work on queueing these up.

greg k-h
