Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1D2A49D9B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 16:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8DA10ECD4;
	Fri, 28 Feb 2025 15:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JF7pfihr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED88F10ECD4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 15:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740757036; x=1772293036;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pYvYZydkvZyDUBQoc2Wqc7vvt3FYWdqgKN6w6ZhbzpE=;
 b=JF7pfihrP2OAvJ8gd5jTCHxyLc3zjIbbe/zJj0bFRO6Lw3cYfbBK7L0N
 IDZZ3dTv5CqyE14LK9G8yCj0fpl4csUbtnSHP7hRDzX5dE5K3FjUzUtrj
 Z+Sa+4o0mwNRL3Yt5RPUtKUWArIL5p7DokWgdFrjTG/iq4swDWS91qECO
 cvnGohC0GTB5plB2+Z8J3xXA9kclf5EW6hxZqLUz1zz2ddbFlkwsARnID
 J/nUSlV+5606iBwVhZX3UoAxxl6yDZnLMynLHZFthS63974U+ab/UlC+J
 N2Y4sKlz8Y4CJXUw64utHaR2lWrQLDQ1OG7USf/gc4DKmS1kjrytkHBFZ A==;
X-CSE-ConnectionGUID: 4+8Fm64fRLCTZ2OEhpa7zQ==
X-CSE-MsgGUID: LW+n+YhdRzWwsZ9Wi5lhdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="64151164"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="64151164"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 07:37:07 -0800
X-CSE-ConnectionGUID: eDyQtdH7RxmRehcf50MUtw==
X-CSE-MsgGUID: JLpfhLruRj+5n/rUVyD6yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="122375715"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 07:37:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1to2Q5-0000000Fz6n-43o0; Fri, 28 Feb 2025 17:36:57 +0200
Date: Fri, 28 Feb 2025 17:36:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/5] print: use new #[export] macro for
 rust_fmt_argument
Message-ID: <Z8HYGTewVatzRJ34@smile.fi.intel.com>
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-4-569cc7e8926c@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228-export-macro-v2-4-569cc7e8926c@google.com>
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

On Fri, Feb 28, 2025 at 12:39:33PM +0000, Alice Ryhl wrote:
> This moves the rust_fmt_argument function over to use the new #[export]
> macro, which will verify at compile-time that the function signature
> matches what is in the header file.

...

> I'm not sure which header file to put this in. Any advice?

I believe you found the right place.

-- 
With Best Regards,
Andy Shevchenko


