Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF7A64A378
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 15:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1521489336;
	Mon, 12 Dec 2022 14:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313A3891CC;
 Mon, 12 Dec 2022 14:35:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C246B80D8A;
 Mon, 12 Dec 2022 14:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B7EEC433EF;
 Mon, 12 Dec 2022 14:35:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Wl6pADoH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1670855721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1KyY32z5nf0Lu8vM4J/2IpAlTcstrOO9+asdsS0mdQs=;
 b=Wl6pADoHCtIIbQYtGWyzoK0/ft/6K3+8UZfyGZQbHCn0OgumkLD978IERouS9rLh91V7py
 ofol1dOocMk4p1DFNAhuJ2rC6+TlFlqFiUo0IADIb6l2vBWdPsmninRN5yWI9N/OpXZpdd
 5BCaUAKkpp98C6Hq6gwjcSOdDz781ww=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id db04abc2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 12 Dec 2022 14:35:21 +0000 (UTC)
Date: Mon, 12 Dec 2022 15:35:20 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: david.keisarschm@mail.huji.ac.il
Subject: Re: [PATCH 1/5] Renaming weak prng invocations -
 prandom_bytes_state, prandom_u32_state
Message-ID: <Y5c8KLzJFz/XZMiM@zx2c4.com>
References: <cover.1670778651.git.david.keisarschm@mail.huji.ac.il>
 <b3caaa5ac5fca4b729bf1ecd0d01968c09e6d083.1670778652.git.david.keisarschm@mail.huji.ac.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b3caaa5ac5fca4b729bf1ecd0d01968c09e6d083.1670778652.git.david.keisarschm@mail.huji.ac.il>
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>,
 linux-mtd@lists.infradead.org, Stanislav Fomichev <sdf@google.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, Christoph Lameter <cl@linux.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 ilay.bahat1@gmail.com, Ingo Molnar <mingo@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Jiri Pirko <jiri@nvidia.com>,
 David Rientjes <rientjes@google.com>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, intel-gfx@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Jiri Olsa <jolsa@kernel.org>,
 Hao Luo <haoluo@google.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 KP Singh <kpsingh@kernel.org>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Hannes Reinecke <hare@suse.de>, Andy Lutomirski <luto@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mm@kvack.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, aksecurity@gmail.com,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please CC me on future revisions.

As of 6.2, the prandom namespace is *only* for predictable randomness.
There's no need to rename anything. So nack on this patch 1/5.

With regards to the remaining patches in this series, if you want to
move prandom_u32_state callers over to get_random_bytes() and
get_random_u32(), that's fine from my perspective, but last I looked,
there was much usage in places where being repeatable was actually the
goal - test suites and such, where you want to be able to redo your
tests with the same seed. So you'll have to look at each instance case
by case and convince whoever maintains that code that they don't need
predictability. However, if you do that, the right functions to use are
get_random_bytes() and get_random_u32().

Jason
