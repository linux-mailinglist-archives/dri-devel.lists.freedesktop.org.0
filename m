Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AC696DE7A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 17:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EA510E90E;
	Thu,  5 Sep 2024 15:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KUVnyjnQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5504D10E909;
 Thu,  5 Sep 2024 15:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725550705; x=1757086705;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WqFaPHVKKRJUrSjh96WSLvDVpyIouu48maZXtKVDdA8=;
 b=KUVnyjnQGxdQea3woI03s3r4ejpvpmu8xG+yGk50e6TB7q3aG1FLXqVR
 ayaGzp6n0o7nFzTnHHQmttelZkWy5148rWzHB1wdww5VacUHPQNiMzjF/
 fxDLAnCbR7dwHU79Eeflb98whNr4OSN+l4PdAip3DB3Rz0nnaMZBuZsqz
 l4eAkOpKjAXUGwzIoK8HVfz9dtI+wiIYf19F9+LA1YFvMf2p719Xi2fyA
 bC2yC0ldchJaKtFZVmi1IDXq852VYRlZXa4nDobjPPiIOs1NnYbopFAmL
 kWXjaWqcgpKB/pRL6pvmwdZpw5hqHkAn4+r38kmAeOitqOryZ3g15b1CU Q==;
X-CSE-ConnectionGUID: m2icqAuJQPWlIjRJFhVGgQ==
X-CSE-MsgGUID: 7rd5IxDMT2mFEh5S0s/sKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35634030"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="35634030"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 08:38:24 -0700
X-CSE-ConnectionGUID: u6pWWqheTeempRaYMfBO/g==
X-CSE-MsgGUID: pKR7g3A+S6q/KP0BCfW6iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="65652927"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 08:38:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1smEWm-00000005Rhy-32CS; Thu, 05 Sep 2024 18:36:08 +0300
Date: Thu, 5 Sep 2024 18:36:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Hannes Reinecke <hare@suse.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Subject: Re: [PATCH 00/18] random: Include <linux/percpu.h> and resolve
 circular include dependency
Message-ID: <ZtnP6CK-Zd8SJAgY@smile.fi.intel.com>
References: <20240905122020.872466-1-ubizjak@gmail.com>
 <Ztmm00eLBQGtiwRM@smile.fi.intel.com>
 <CAFULd4bzyNGcJqeg7w2ZQ0Xmw-HsBhczf8yPna7mSgG4NmdcWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFULd4bzyNGcJqeg7w2ZQ0Xmw-HsBhczf8yPna7mSgG4NmdcWw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Thu, Sep 05, 2024 at 03:03:24PM +0200, Uros Bizjak wrote:
> On Thu, Sep 5, 2024 at 2:41 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Thu, Sep 05, 2024 at 02:17:08PM +0200, Uros Bizjak wrote:
> > > There were several attempts to resolve circular include dependency
> > > after the addition of percpu.h: 1c9df907da83 ("random: fix circular
> > > include dependency on arm64 after addition of percpu.h"), c0842fbc1b18
> > > ("random32: move the pseudo-random 32-bit definitions to prandom.h") and
> > > finally d9f29deb7fe8 ("prandom: Remove unused include") that completely
> > > removes inclusion of <linux/percpu.h>.
> > >
> > > Due to legacy reasons, <linux/random.h> includes <linux/prandom.h>, but
> > > with the commit entry remark:
> > >
> > > --quote--
> > > A further cleanup step would be to remove this from <linux/random.h>
> > > entirely, and make people who use the prandom infrastructure include
> > > just the new header file.  That's a bit of a churn patch, but grepping
> > > for "prandom_" and "next_pseudo_random32" "struct rnd_state" should
> > > catch most users.
> > >
> > > But it turns out that that nice cleanup step is fairly painful, because
> > > a _lot_ of code currently seems to depend on the implicit include of
> > > <linux/random.h>, which can currently come in a lot of ways, including
> > > such fairly core headfers as <linux/net.h>.
> > >
> > > So the "nice cleanup" part may or may never happen.
> > > --/quote--
> > >
> > > __percpu tag is currently defined in include/linux/compiler_types.h,
> > > so there is no direct need for the inclusion of <linux/percpu.h>.
> > > However, in [1] we would like to repurpose __percpu tag as a named
> > > address space qualifier, where __percpu macro uses defines from
> > > <linux/percpu.h>.
> > >
> > > This patch series is the "nice cleanup" part, and allows us to finally
> > > include <linux/percpu.h> in prandom.h.
> > >
> > > The whole series was tested by compiling the kernel for x86_64 allconfig
> > > and some popular architectures, namely arm64 defconfig, powerpc defconfig
> > > and loongarch defconfig.
> >
> > Obvious question(s) is(are):
> > 1) have you seen the Ingo's gigantic patch series towards resolving issues with
> > the headers?
> > 2) if not, please look at the preliminary work and take something from there, I
> > believe there are many useful changes already waiting for a couple of years to
> > be applied.
> >
> > Because I haven't found any references nor mentions of that in the cover letter
> > here and explanation why it was not taking into consideration.
> 
> I am aware of the series, but the patch takes only a small bite of it
> and specifically resolves the inclusion of <linux/prandom.h> from
> linux/random.h. The series fixes the missing inclusion of
> <linux/prandom.h> in files that use pseudo-random function and it was
> not meant to be a general header cleanup. The end goal is to allow us
> to include <linux/percpu.h> in linux/prandom.h - which uses __percpu
> tag without the correct include.

Thank you for elaboration, it's all clear now.

> Thus, the patch series is only tangentially connected to Ingo's patch series.

-- 
With Best Regards,
Andy Shevchenko


