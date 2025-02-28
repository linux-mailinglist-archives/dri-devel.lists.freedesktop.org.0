Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB55A499B5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 13:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3350B10EC86;
	Fri, 28 Feb 2025 12:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mhr5x0kO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207B310EC86
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 12:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740746763; x=1772282763;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4CzUfTOzdBr2io5qs/wvZvi9xQM74P30+0gBffCsVmo=;
 b=Mhr5x0kOxwjRk6pZG4pCDF0HUUxTb+dEMdxBsu1ZnV6hRQhGKmSbRaUq
 90HuC0IW5vlDoaKydKILxTRRh4k9u8QYz6z3Sj9/dJRlDlHE4hkbBywiZ
 805aJvdm9rIs27oLNUcv+ipicbqzk1drzYBDz8alW44H81omwdF7+Vqs7
 MeDJ9F1fjOEAxEOlzgtC92N9uWh8jCBkPTb4tOL/qGT+/Qm0u7ihu9A1Y
 cnAKmBWRIyYY09sdfXQeCxCg+bUTXC+NmB7WuO3ErZ/RfrMwe16rfu/9S
 sdHCHPyXVDhKZDGhycjpuXOcblqN0ig7YOegUE4gq/g30mzrSj6uEuO89 g==;
X-CSE-ConnectionGUID: 8ElxmzDBTZewqsCmVG45xQ==
X-CSE-MsgGUID: iFmlUL/HRka8zRQFg3rIvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="52317292"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="52317292"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 04:46:02 -0800
X-CSE-ConnectionGUID: ajGdwdEZQOOrIPjuHjZ3PA==
X-CSE-MsgGUID: 5W+i9JMQQYam4vO3lZCOcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="117364013"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 04:45:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tnzkW-0000000Fwmo-1iGO; Fri, 28 Feb 2025 14:45:52 +0200
Date: Fri, 28 Feb 2025 14:45:52 +0200
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
Subject: Re: [PATCH v2 0/5] Check Rust signatures at compile time
Message-ID: <Z8GwAPDbxpf-WQOM@smile.fi.intel.com>
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
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

On Fri, Feb 28, 2025 at 12:39:29PM +0000, Alice Ryhl wrote:
> Rust has two different tools for generating function declarations to
> call across the FFI boundary:
> 
> * bindgen. Generates Rust declarations from a C header.
> * cbindgen. Generates C headers from Rust declarations.
> 
> In the kernel, we only use bindgen. This is because cbindgen assumes a
> cargo-based buildsystem, so it is not compatible with the kernel's build
> system. This means that when C code calls a Rust function by name, its
> signature must be duplicated in both Rust code and a C header, and the
> signature needs to be kept in sync manually.
> 
> To eliminate this manual checking, introduce a new macro that verifies
> at compile time that the two function declarations use the same
> signature. The idea is to run the C declaration through bindgen, and
> then have rustc verify that the function pointers have the same type.
> 
> The main commit of this series is "rust: add #[export] macro". Please
> see its commit message for more details.

Thanks for the cover letter, makes much more sense now!

-- 
With Best Regards,
Andy Shevchenko


