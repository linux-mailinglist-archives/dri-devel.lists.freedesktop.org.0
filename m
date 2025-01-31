Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3C3A23E7E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 14:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CB210EAB6;
	Fri, 31 Jan 2025 13:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1GSRVG0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5503210EAB5;
 Fri, 31 Jan 2025 13:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738330740; x=1769866740;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BlkMwqZELP0Gp0TzhdEuSlXKujbDb3xlMAHFMVLsdm8=;
 b=Y1GSRVG0zPo2JYRw28LW1xP51qGwo4Sbm320todu55TO7kzYrQZ0b6a+
 fo43MghPlQn6Fcy9BVFCMdjbNNlKDc0CuMr4tNepzrK7JENEZAp/CSDRj
 8FRuTrjfdO4ak5T19dvT1sfzJguqzf5JmCzzqu8r4g94v8HoTRxQpWYBb
 1V4huAvOJw3t7xFpDee8qOrUsoax+GRamr74+LSkFR153LNAfTQYQ+1yi
 O74W9bnSP4HsbT7+H0g0cDO0RXr2B5XoLIW8/lbtmedFGnHdtoGU2PKgA
 Sn5dtzBLUd95x7cUhuB9Hilp5bmfYuEAek5ErjKU3tuu7jRZAxptpDLaQ w==;
X-CSE-ConnectionGUID: Obq1g/hOTjuQg75uS0pong==
X-CSE-MsgGUID: 79xxlrqmTPOCO2aFJqk6Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="50283177"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="50283177"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 05:38:58 -0800
X-CSE-ConnectionGUID: yJ4rsx1GRSusxX/Vynh0XQ==
X-CSE-MsgGUID: gJj2D0AhTKuPuWC4WLeG5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146816937"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.175])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 05:38:46 -0800
Date: Fri, 31 Jan 2025 14:38:42 +0100
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
Subject: Re: [PATCHv3 03/11] drm/i915/gem: Use PG_dropbehind instead of
 PG_reclaim
Message-ID: <Z5zSYtcGGp73Ip2c@ashyti-mobl2.lan>
References: <20250130100050.1868208-1-kirill.shutemov@linux.intel.com>
 <20250130100050.1868208-4-kirill.shutemov@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130100050.1868208-4-kirill.shutemov@linux.intel.com>
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

On Thu, Jan 30, 2025 at 12:00:41PM +0200, Kirill A. Shutemov wrote:
> The recently introduced PG_dropbehind allows for freeing folios
> immediately after writeback. Unlike PG_reclaim, it does not need vmscan
> to be involved to get the folio freed.
> 
> Instead of using folio_set_reclaim(), use folio_set_dropbehind() in
> __shmem_writeback()
> 
> It is safe to leave PG_dropbehind on the folio if, for some reason
> (bug?), the folio is not in a writeback state after ->writepage().
> In these cases, the kernel had to clear PG_reclaim as it shared a page
> flag bit with PG_readahead.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Acked-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
