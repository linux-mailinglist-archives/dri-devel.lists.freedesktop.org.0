Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B4764CDE5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 17:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EDA10E431;
	Wed, 14 Dec 2022 16:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FBA10E430;
 Wed, 14 Dec 2022 16:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671034894; x=1702570894;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sugwmwrUIAbwUVd9kUUcbnqMzWklglljdUgzpTG789o=;
 b=lahGrUkUD0Z7+QLr7Q/N3kJuQextTU1sjp1H1Ej60c+3QEwSf9Vwy8WI
 dRz9RynL6Yt6Am7L8oFsBM3+aI/rIcbphx+CqHwt9amt9VlEGje5/cNwW
 y1VOtEu1T+5Mv2HUkjAjmtEmGEGVERuUSp2jR95Lh4nDImiriMP6TBo7Q
 SYoOCHcIJyjiTZMfejPOtlA7AO3CFQCtC4G1vQkTYVnpRxmwmL4Cq6VHd
 xQSbFNgSMe3/MJ6tF6ExwHXQLr7m6YIiGgQR2IRzmFxkBC3xm9c3ubpAd
 JvXI+aSMa5srGEfwUhzuiGMv69J07M4zHp4xpr7NFZlwqTXXesHXAjBkZ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="404716283"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; d="scan'208";a="404716283"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 08:21:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="642559944"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; d="scan'208";a="642559944"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 08:21:20 -0800
Date: Wed, 14 Dec 2022 17:21:17 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH 1/5] Renaming weak prng invocations -
 prandom_bytes_state, prandom_u32_state
Message-ID: <20221214162117.GC1062210@linux.intel.com>
References: <cover.1670778651.git.david.keisarschm@mail.huji.ac.il>
 <b3caaa5ac5fca4b729bf1ecd0d01968c09e6d083.1670778652.git.david.keisarschm@mail.huji.ac.il>
 <Y5c8KLzJFz/XZMiM@zx2c4.com>
 <20221214123358.GA1062210@linux.intel.com>
 <CANn89iJtK4m1cWvCwp=L_rEOEBa+B1kLZJAw0D9_cYPQcAj+Mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANn89iJtK4m1cWvCwp=L_rEOEBa+B1kLZJAw0D9_cYPQcAj+Mw@mail.gmail.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Peter Zijlstra <peterz@infradead.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org,
 Stanislav Fomichev <sdf@google.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Christoph Lameter <cl@linux.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Richard Weinberger <richard@nod.at>,
 x86@kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, ilay.bahat1@gmail.com,
 Ingo Molnar <mingo@redhat.com>, Jiri Pirko <jiri@nvidia.com>,
 David Rientjes <rientjes@google.com>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, intel-gfx@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, david.keisarschm@mail.huji.ac.il,
 Dave Hansen <dave.hansen@linux.intel.com>, Hao Luo <haoluo@google.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, KP Singh <kpsingh@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Borislav Petkov <bp@alien8.de>,
 Hannes Reinecke <hare@suse.de>, Andy Lutomirski <luto@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, bpf@vger.kernel.org,
 Vlastimil Babka <vbabka@suse.cz>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mm@kvack.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, aksecurity@gmail.com,
 Jiri Olsa <jolsa@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 14, 2022 at 04:15:49PM +0100, Eric Dumazet wrote:
> On Wed, Dec 14, 2022 at 1:34 PM Stanislaw Gruszka
> <stanislaw.gruszka@linux.intel.com> wrote:
> >
> > On Mon, Dec 12, 2022 at 03:35:20PM +0100, Jason A. Donenfeld wrote:
> > > Please CC me on future revisions.
> > >
> > > As of 6.2, the prandom namespace is *only* for predictable randomness.
> > > There's no need to rename anything. So nack on this patch 1/5.
> >
> > It is not obvious (for casual developers like me) that p in prandom
> > stands for predictable. Some renaming would be useful IMHO.
> 
> Renaming makes backports more complicated, because stable teams will
> have to 'undo' name changes.
> Stable teams are already overwhelmed by the amount of backports, and
> silly merge conflicts.

Since when backporting problems is valid argument for stop making
changes? That's new for me.

> linux kernel is not for casual readers.

Sure.

Regards
Stanislaw
