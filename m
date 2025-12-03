Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86837CA048B
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 18:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33DB10E7D9;
	Wed,  3 Dec 2025 17:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e32CVAxJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D7E10E7C0;
 Wed,  3 Dec 2025 17:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764781979; x=1796317979;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+Np+rdth2n0BXySDCBD2ekap4SNTZcCx3ChiDEozi8w=;
 b=e32CVAxJyveEI3Lc//vkt9JWS0HQMG6vgiR7JDun1nX6Ngn6FdPDJ8jq
 r4P4ftkQ+eqYlwCp8LKmutPfYefi+AyzYtxTT9aHzCOoAG4Tn65Tbh8aO
 p5wjrojVtSFNKmAg9qAUOC6pXo6q32HrcwCvQfUKLr2kPiyHKh+3vZa7W
 /B4CJKBtMkS9kOUjcp73/4fEqQehcUMNEQQSFfyzYvAcK+nIfb8quLiAM
 LJJ77pC5BNi0dd/BDMrM3l+z/qqnexjAAZO6kg1OF3iJHmhYS3Se74/Dr
 r4+VIKftJwL36s/K6Wr9JdmYEkYKd03DCMzybvyRrO+uZwqafyY9bFGzq w==;
X-CSE-ConnectionGUID: nRWKNc/2R927RZOeLE73vw==
X-CSE-MsgGUID: N+sR4V9zTRSoE84q2+M/1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="69380513"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="69380513"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 09:12:58 -0800
X-CSE-ConnectionGUID: P+yCIrBnRmGNhQVtXETb+w==
X-CSE-MsgGUID: gazCu8PbQGC1Ktbu8bL9hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="199208118"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.81])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 09:12:49 -0800
Date: Wed, 3 Dec 2025 19:12:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] tracing: move tracing declarations from kernel.h
 to a dedicated header
Message-ID: <aTBvj8zcVKj8hBJK@smile.fi.intel.com>
References: <20251203162329.280182-1-yury.norov@gmail.com>
 <20251203162329.280182-5-yury.norov@gmail.com>
 <aTBvE_Arj16yB83I@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTBvE_Arj16yB83I@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Wed, Dec 03, 2025 at 07:10:53PM +0200, Andy Shevchenko wrote:
> On Wed, Dec 03, 2025 at 11:23:25AM -0500, Yury Norov (NVIDIA) wrote:

...

> > +#ifndef _LINUX_TRACING_H
> > +#define _LINUX_TRACING_H
> > +
> > +#include <linux/compiler_attributes.h>
> > +#include <linux/instruction_pointer.h>
> 
> + stddef.h // you use NULL
> 
> + string.h // use of strlen()

Why it should not conflict, it might be worth to research more and perhaps even
use intrinsic instead of strlen(). Just a thought spoken loudly.

> > +#include <linux/stringify.h>

-- 
With Best Regards,
Andy Shevchenko


