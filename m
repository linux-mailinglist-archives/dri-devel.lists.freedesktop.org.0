Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7239CBECA49
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 10:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7E510E388;
	Sat, 18 Oct 2025 08:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cSItTMlZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF6310EBC9;
 Fri, 17 Oct 2025 11:59:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AFE674B012;
 Fri, 17 Oct 2025 11:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3037FC4CEE7;
 Fri, 17 Oct 2025 11:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1760702377;
 bh=38uFLiDTAO+A1PWpRP2bVJ1ijHpCWsegoKBcJwzF2PE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cSItTMlZ+xkWo77L3dJDjTz61eq44oatBXCgbcCC5ycxjVd62F5ZBD5t/I/P7IMAl
 lQe+zy+uvgq1Iphq58yIzjQNmbjsJLGcQk9xMD89Oyn29Qra+kKcuYPJON2XTLg6Wc
 Tx4/0gvLYtBA9RdvGnygRkoazMU/mLdzs1fx2bZA=
Date: Fri, 17 Oct 2025 13:59:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Eliav Farber <farbere@amazon.com>
Cc: stable@vger.kernel.org, linux@armlinux.org.uk, jdike@addtoit.com,
 richard@nod.at, anton.ivanov@cambridgegreys.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, tony.luck@intel.com, qiuxu.zhuo@intel.com,
 mchehab@kernel.org, james.morse@arm.com, rric@kernel.org,
 harry.wentland@amd.com, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, evan.quan@amd.com,
 james.qian.wang@arm.com, liviu.dudau@arm.com,
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
 dsterba@suse.com, xiang@kernel.org, chao@kernel.org, jack@suse.com,
 tytso@mit.edu, adilger.kernel@dilger.ca, dushistov@mail.ru,
 luc.vanoostenryck@gmail.com, rostedt@goodmis.org, pmladek@suse.com,
 sergey.senozhatsky@gmail.com, andriy.shevchenko@linux.intel.com,
 linux@rasmusvillemoes.dk, minchan@kernel.org, ngupta@vflare.org,
 akpm@linux-foundation.org, kuznet@ms2.inr.ac.ru,
 yoshfuji@linux-ipv6.org, pablo@netfilter.org, kadlec@netfilter.org,
 fw@strlen.de, jmaloy@redhat.com, ying.xue@windriver.com,
 willy@infradead.org, sashal@kernel.org, ruanjinjie@huawei.com,
 David.Laight@aculab.com, herve.codina@bootlin.com, Jason@zx2c4.com,
 keescook@chromium.org, kbusch@kernel.org, nathan@kernel.org,
 bvanassche@acm.org, ndesaulniers@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-um@lists.infradead.org, linux-edac@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-btrfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 linux-sparse@vger.kernel.org, linux-mm@kvack.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 tipc-discussion@lists.sourceforge.net, Arnd Bergmann <arnd@arndb.de>,
 Dan Williams <dan.j.williams@intel.com>,
 Eric Dumazet <edumazet@google.com>, Isabella Basso <isabbasso@riseup.net>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Sander Vanheule <sander@svanheule.net>,
 Vlastimil Babka <vbabka@suse.cz>, Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH v2 01/27 5.10.y] overflow, tracing: Define the
 is_signed_type() macro once
Message-ID: <2025101708-obtuse-ellipse-e355@gregkh>
References: <20251017090519.46992-1-farbere@amazon.com>
 <20251017090519.46992-2-farbere@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017090519.46992-2-farbere@amazon.com>
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

On Fri, Oct 17, 2025 at 09:04:53AM +0000, Eliav Farber wrote:
> From: Bart Van Assche <bvanassche@acm.org>
> 
> [ Upstream commit 92d23c6e94157739b997cacce151586a0d07bb8a ]

This isn't in 5.15.y, why is it needed in 5.10.y?

thanks,

greg k-h
