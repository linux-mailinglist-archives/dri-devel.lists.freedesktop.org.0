Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 581FBD2FB58
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 11:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FCA10E85B;
	Fri, 16 Jan 2026 10:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ge/TpREL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFC110E858;
 Fri, 16 Jan 2026 10:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768560118; x=1800096118;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nG5D28yq7MyPW7K9UDaQ4YtDHaNWaFvEhZSYKBSfzv8=;
 b=Ge/TpRELKAXLhksM1xIdQtvb5UDZiRq+W/Tr5CfXv5eQlGyQ9uFgIX/+
 8vAjBQeOWwdwHVebfo01VzWVGh1ZxeaJWVzTXDZaIgL8RycDAZR+z5CNp
 1eGUREBxhx1TLw1AWWx6TaD9661XZxmJnhyb/ttflfRyJBvOcfBiMR96J
 1Mj1C7MKJpS5Mwvyn86LaxzMRdWlWXh70Pt0u6nPhbw7gcyCzHdzPrP2X
 MbauTQffVrfINCpyoFwIvUCEYh9Z2+7NsALA2zDiVLvsrUePlvst6ZxnP
 XfiMetgrZLVrU+GLH5yra0fx3ROT/tokrR9T+0cPHzO9hk6aH1G5zEA5P A==;
X-CSE-ConnectionGUID: eN/MhFJNR1iNEhobkukSmA==
X-CSE-MsgGUID: axkeG1nTSj+tXGT/Grxt2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73503225"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="73503225"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 02:41:57 -0800
X-CSE-ConnectionGUID: faDvYPF7QraHgKGP0sCxgQ==
X-CSE-MsgGUID: eIsMQWNcRmqC2zOdnGB9rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="204825957"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.99])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 02:41:51 -0800
Date: Fri, 16 Jan 2026 12:41:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <ynorov@nvidia.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
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
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: Re: [PATCH v5 5/6] tracing: Remove size parameter in __trace_puts()
Message-ID: <aWoV7cYMHmMpYVRt@smile.fi.intel.com>
References: <20260116042510.241009-1-ynorov@nvidia.com>
 <20260116042510.241009-6-ynorov@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116042510.241009-6-ynorov@nvidia.com>
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

On Thu, Jan 15, 2026 at 11:25:08PM -0500, Yury Norov wrote:

> The __trace_puts() function takes a string pointer and the size of the
> string itself. All users currently simply pass in the strlen() of the
> string it is also passing in. There's no reason to pass in the size.
> Instead have the __trace_puts() function do the strlen() within the
> function itself.
> 
> This fixes a header recursion issue where using strlen() in the macro
> calling __trace_puts() requires adding #include <linux/string.h> in order
> to use strlen(). Removing the use of strlen() from the header fixes the
> recursion issue.

I like this change, it unloads the header dependencies from string.h, however
the latter is not that messed up.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


