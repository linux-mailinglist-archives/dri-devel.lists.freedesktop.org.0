Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B32CF52E9
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 19:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EFC10E290;
	Mon,  5 Jan 2026 18:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kaBW7vZ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD6D10E030;
 Mon,  5 Jan 2026 18:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767636722; x=1799172722;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6wdEmcL6E7q+3kAfrlRMIvHeY7Y5Wr3QYQiqZOjdOQw=;
 b=kaBW7vZ010Koj4Kslm3GkrWSHZu10E4V2pCbHrxrWoFwViihSmVa7gDh
 W4r8JZa4yxJDrIKpQaqbISwRbe9iYBfzfaZZt+4I4EKQIn2w4ZcysBLK4
 bP9k2ee93Agg49ct+XAp8KVrq3bHW8wAltG6roV6Bq1liUG4MfqEXcpvb
 BYeeB+buHx9Pb3stSMsjLBSpGkHC8u2E4qiesH+RlQIZpJqDQm395oTFJ
 YUzMmmmH/pvA15FjVVr5XsRtdWOMbwFQB0QotraXzKw7qbLUa4vVyPck1
 z0q3fHJAvRR9VdiZVuFlnZeawn/0vEjuxsPN8DIm6Ky5QGm10AtrfgY5F g==;
X-CSE-ConnectionGUID: LH9cncPZTpmLWuN0NrRykw==
X-CSE-MsgGUID: DvG0tne7RUaCeRa+oPsCMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="79310652"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="79310652"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 10:12:02 -0800
X-CSE-ConnectionGUID: MqA6g6iGT8edS9Jk7MYGGw==
X-CSE-MsgGUID: oarw9iqVSeuBzJJDGf2UBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="206591309"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.215])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 10:11:56 -0800
Date: Mon, 5 Jan 2026 20:11:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Vivi Rodrigo <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
Message-ID: <aVv-6WZA9aX2r_QH@smile.fi.intel.com>
References: <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
 <20251229111748.3ba66311@gandalf.local.home>
 <20260103005059.GA11015@joelbox2>
 <aVkSVk2L6VH9MYGz@smile.fi.intel.com>
 <937926D0-00DC-499B-9FD8-D921C903882D@nvidia.com>
 <aVmyZ0iXzTkNU86y@smile.fi.intel.com>
 <20260105113902.6bdfcfa8@gandalf.local.home>
 <aVv8vwtGFhssitxG@smile.fi.intel.com> <aVv946dXQfOifz5O@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVv946dXQfOifz5O@yury>
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

On Mon, Jan 05, 2026 at 01:07:31PM -0500, Yury Norov wrote:
> On Mon, Jan 05, 2026 at 08:02:39PM +0200, Andy Shevchenko wrote:
> > On Mon, Jan 05, 2026 at 11:39:02AM -0500, Steven Rostedt wrote:

...

> > Yury, I think in v5 you need to drop this patch, otherwise we won't move further.
> 
> Not sure we need v5 because the only change is dropping the last patch
> in the series. But if you prefer - I can send v5.

It depends on who is going to apply them. For me personally v5 is not needed,
but I think there were some tags given in v4? With that it might make some
sense to have a v5.

-- 
With Best Regards,
Andy Shevchenko


