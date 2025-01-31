Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFA9A23E74
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 14:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0C410E172;
	Fri, 31 Jan 2025 13:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEOF1UwU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6F710E172;
 Fri, 31 Jan 2025 13:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738330690; x=1769866690;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sdAktvye9gszZrotFlv9Jol1M6CpUsq/odpFMNnUQ08=;
 b=hEOF1UwUC+NkMr+YEg3HBM5+UEw2i8OZIhAMQBf0TaV6aU+s/MeI7dPN
 HEKlODi9LTFgjjRt3pkWEiSCVG1L1kJ4GotMhv7EXxUFYt8BkkvXSqY5+
 KlhcLcf00crStcPUcQfoHQgsyeRiLniWjc9QG70p8Tz/iEQeXVLjuYyKS
 mjkEuZ05X3y6BXrvm5d9Ds85l2L4HbMEsCptIB+kuocClmvglvUNd+0a1
 en1xQrR6W4etHdJBLpf8mXoPb45mAuG+2lcDXyQnFKEWmJ9pIHY/9OM03
 7pntW+mG53B/Ch3q/ZXJIvJgit+U5afTK+NR4Nf5EMp5eXE62OsrqLDKS w==;
X-CSE-ConnectionGUID: kdVhZI4KScOvwCSGht3mtg==
X-CSE-MsgGUID: rArNZLuKSHGPf6Lt4Azozg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="61367919"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="61367919"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 05:38:09 -0800
X-CSE-ConnectionGUID: zpQaMs/cQWqssvq7bbPLfA==
X-CSE-MsgGUID: u+rHSdoJR+y9VNuNhmjpzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113656117"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.175])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 05:37:57 -0800
Date: Fri, 31 Jan 2025 14:37:53 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jens Axboe <axboe@kernel.dk>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Christian Brauner <brauner@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dan Carpenter <dan.carpenter@linaro.org>, David Airlie <airlied@gmail.com>,
 David Hildenbrand <david@redhat.com>, Hao Ge <gehao@kylinos.cn>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Josef Bacik <josef@toxicpanda.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Nhat Pham <nphamcs@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Ran Xiaokai <ran.xiaokai@zte.com.cn>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Vlastimil Babka <vbabka@suse.cz>,
 Yosry Ahmed <yosryahmed@google.com>, Yu Zhao <yuzhao@google.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCHv3 02/11] drm/i915/gem: Convert __shmem_writeback() to
 folios
Message-ID: <Z5zSMSBAmPrUTu2A@ashyti-mobl2.lan>
References: <20250130100050.1868208-1-kirill.shutemov@linux.intel.com>
 <20250130100050.1868208-3-kirill.shutemov@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130100050.1868208-3-kirill.shutemov@linux.intel.com>
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

Hi Kirill,

On Thu, Jan 30, 2025 at 12:00:40PM +0200, Kirill A. Shutemov wrote:
> Use folios instead of pages.
> 
> This is preparation for removing PG_reclaim.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Acked-by: David Hildenbrand <david@redhat.com>

looks good:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
