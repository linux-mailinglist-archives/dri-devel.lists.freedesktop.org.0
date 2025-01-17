Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D017A14B58
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 09:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDC710E2EF;
	Fri, 17 Jan 2025 08:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KzhRkYun";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E34010E2EF;
 Fri, 17 Jan 2025 08:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737103357; x=1768639357;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=28NiPYsFXE32MP2Q2BME0MlX1uv69uodnGAvgVz5KwQ=;
 b=KzhRkYunP/PEz9CFboDrpB7ahMxCaBZOQYjNPYkmyJDjlojH3pU42zRF
 PaugY8xtY3pE3ddDjH2Hks4e9xAEcY7lvSICfZrD5pNbr2fN4fySghYUS
 YPrlSzQAUmiaenPRe44Zd0eOOLd/hX8tKFtrUqbl33iUv0rqw5I/gbPyR
 8jqyV/8bFVESvIG3bB1Yj700vLzdj8zXQBHqdNb0sj5m2pDdbU73dyDKa
 xl7s5eVHOZMPKPWKdE36z3jT1k14L5+9yhPMOJ/l/OiM8BY6em+9deTlc
 EAqDguhs2v3XK2eUkS+6j19vHsSEOlmZiBFP0VDCpcKHfIbC7LdHsY89R A==;
X-CSE-ConnectionGUID: LSCGZt0OQDOhL5Mk3LaF4g==
X-CSE-MsgGUID: mbePJKGGRz+6V428w0aWFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="48923410"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="48923410"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 00:42:36 -0800
X-CSE-ConnectionGUID: e1YD5/pBSvOBI/os6GkRkA==
X-CSE-MsgGUID: 3A6q1Mm2TpybOA1rY5fzPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106634486"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa008.jf.intel.com with ESMTP; 17 Jan 2025 00:42:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
 id 7B06510F; Fri, 17 Jan 2025 10:42:26 +0200 (EET)
Date: Fri, 17 Jan 2025 10:42:26 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jens Axboe <axboe@kernel.dk>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Christian Brauner <brauner@kernel.org>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dan Carpenter <dan.carpenter@linaro.org>, 
 David Airlie <airlied@gmail.com>, David Hildenbrand <david@redhat.com>,
 Hao Ge <gehao@kylinos.cn>, 
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
Subject: Re: [PATCHv2 11/11] mm: Rename PG_dropbehind to PG_reclaim
Message-ID: <w6x4k6mjv6x5kjiuxszdhl56ldrem5cfhygkjrko3u5vqufylo@krcva5mltyre>
References: <20250115093135.3288234-1-kirill.shutemov@linux.intel.com>
 <20250115093135.3288234-12-kirill.shutemov@linux.intel.com>
 <Z4ikqJBQ-fBFM6UL@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4ikqJBQ-fBFM6UL@infradead.org>
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

On Wed, Jan 15, 2025 at 10:18:16PM -0800, Christoph Hellwig wrote:
> On Wed, Jan 15, 2025 at 11:31:35AM +0200, Kirill A. Shutemov wrote:
> > Now as PG_reclaim is gone, its name can be reclaimed for better
> > use :)
> > 
> > Rename PG_dropbehind to PG_reclaim and rename all helpers around it.
> 
> Why?  reclaim is completely generic and reclaim can mean many
> different things.  dropbehind is much more specific.

Dropbehind is somewhat obscure name. You need fair bit of context to
understand what it does.

But I don't care that much. We can keep it as PG_dropbehind.

Anybody else has opinion on this?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
