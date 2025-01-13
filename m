Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF26A0B90F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 15:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE0310E693;
	Mon, 13 Jan 2025 14:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZXEQie2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF8F10E68F;
 Mon, 13 Jan 2025 14:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736777264; x=1768313264;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Daub8vm06w8IcRjMHeGOmiLMe3eJdiQxwNfwcfeWF2w=;
 b=LZXEQie2oZxYYWcSDtB990fx87PL7Izh/ETI7DuxlOpaqAx7Varso50Y
 Fyz4Dz14FCySW9erkD2LJvNVw+Y/BDiX7mEl/A+KjT88izQM1G91+PXqi
 dtMn7tXg9VjGf0rkZZ0Z1MFNQxuZEyULO2plW6l0qB3ke5LGIPeX6wM0W
 VH5T8c+uJNCXxTCD46uQ5MwrX4XMpm8lX4OZxwZ/PGHKVbayKkekPVc8g
 Mq7Dy26aLn69izQpVrBmxfITb+Z7RLhBhSQsodo2tw2RrvEgHfhXJ/vu1
 6ZpTcezcsgK6lT9Ac8Lkt6E3Fl65jgu8A6j+8vMaxlkvfp3HSyBFJ1DqN w==;
X-CSE-ConnectionGUID: 3/bSOzv5Tt2zw26ID2dCaw==
X-CSE-MsgGUID: qXQOgNkmTkOXP9E45SjF2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40980040"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40980040"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 06:07:37 -0800
X-CSE-ConnectionGUID: ubPh+2y6SDe1z80joJq8Kg==
X-CSE-MsgGUID: asJbCXYfTLCwN1vcFS+m3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="104448520"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa007.fm.intel.com with ESMTP; 13 Jan 2025 06:07:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
 id DA7883B7; Mon, 13 Jan 2025 16:07:28 +0200 (EET)
Date: Mon, 13 Jan 2025 16:07:28 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Jens Axboe <axboe@kernel.dk>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chengming Zhou <chengming.zhou@linux.dev>, 
 Christian Brauner <brauner@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Dan Carpenter <dan.carpenter@linaro.org>, David Airlie <airlied@gmail.com>, 
 David Hildenbrand <david@redhat.com>, Hao Ge <gehao@kylinos.cn>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Josef Bacik <josef@toxicpanda.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Nhat Pham <nphamcs@gmail.com>, 
 Oscar Salvador <osalvador@suse.de>, Ran Xiaokai <ran.xiaokai@zte.com.cn>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, 
 Steven Rostedt <rostedt@goodmis.org>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Vlastimil Babka <vbabka@suse.cz>, Yosry Ahmed <yosryahmed@google.com>,
 Yu Zhao <yuzhao@google.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] mm: Remove PG_reclaim
Message-ID: <v7on5acvkgseggdrhgicq3slzecnnfdknvm3s4ohblaazhfdui@y2pdupkfe2cw>
References: <20250113093453.1932083-1-kirill.shutemov@linux.intel.com>
 <Z4UZDAWj_8Ez-vN-@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4UZDAWj_8Ez-vN-@casper.infradead.org>
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

On Mon, Jan 13, 2025 at 01:45:48PM +0000, Matthew Wilcox wrote:
> On Mon, Jan 13, 2025 at 11:34:45AM +0200, Kirill A. Shutemov wrote:
> > Use PG_dropbehind instead of PG_reclaim and remove PG_reclaim.
> 
> I was hoping we'd end up with the name PG_reclaim instead of the name
> PG_dropbehind.  PG_reclaim is a better name for this functionality.

I got burned by re-using the name with MAX_ORDER redefinition.
I guess it is less risky as it is less used, but still...

Anyway, it can be done with a patch on top of the patchset. We must get
rid of current PG_reclaim first.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
