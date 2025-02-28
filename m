Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDCAA49D94
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 16:34:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663AD10ECD7;
	Fri, 28 Feb 2025 15:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EUy4xZ7A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6114D10ECD7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 15:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740756892; x=1772292892;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hoIVAnEnmN6EuWjyk3vWzUsF+GUxQ5fLOK1avR054jM=;
 b=EUy4xZ7ATz4B3BA8biNLlu6tp1Vm9uixahKWLdnQ0qlsM2s44uoX8Bxr
 Jzjw9OioiQl3nSkJiMonEYXryRsP47P0c1nVIGqY+Tc5tgYTgQ5HvnZ2t
 aWZKkfvDzgutbRtE6Z0wrDF3J50uNQTvIPYSSn/S0tNUmOmql1dB57sy6
 nSq4cTQjn55sRVbXXgNlB6LSr4SAjYnVyPvCaW7Lc5XKBriNTk9d5a2qs
 fej91bGMXjPlGoYAmdI5qzGLG1D3OZ3g0Dow5s187fdJbtvLOhKGazuzC
 KUyrFVUT2LmKHCLq5o7wF+DBBwvgEo8OQ2qbAWW2OExF3Siqa/IHc3u07 w==;
X-CSE-ConnectionGUID: +fdNud7hS0WYHY4r1pvirw==
X-CSE-MsgGUID: 2PS4R0JoTa+SrAesru+HcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="29282397"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="29282397"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 07:34:52 -0800
X-CSE-ConnectionGUID: oVLb54hiRr+7MeX9VmAH4w==
X-CSE-MsgGUID: 05cxxMQ1SI6OYdNLCpiw+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="117115612"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 07:34:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1to2Nu-0000000Fz4s-2Hwg; Fri, 28 Feb 2025 17:34:42 +0200
Date: Fri, 28 Feb 2025 17:34:42 +0200
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
Subject: Re: [PATCH v2 5/5] panic_qr: use new #[export] macro
Message-ID: <Z8HXkmtrMMD1dATZ@smile.fi.intel.com>
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-5-569cc7e8926c@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228-export-macro-v2-5-569cc7e8926c@google.com>
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

On Fri, Feb 28, 2025 at 12:39:34PM +0000, Alice Ryhl wrote:
> This validates at compile time that the signatures match what is in the
> header file. It highlights one annoyance with the compile-time check,
> which is that it can only be used with functions marked unsafe.
> 
> If the function is not unsafe, then this error is emitted:
> 
> error[E0308]: `if` and `else` have incompatible types
>    --> <linux>/drivers/gpu/drm/drm_panic_qr.rs:987:19
>     |
> 986 | #[export]
>     | --------- expected because of this
> 987 | pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
>     |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^ expected unsafe fn, found safe fn
>     |
>     = note: expected fn item `unsafe extern "C" fn(_, _) -> _ {kernel::bindings::drm_panic_qr_max_data_size}`
>                found fn item `extern "C" fn(_, _) -> _ {drm_panic_qr_max_data_size}`

...

> +#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +extern size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
> +
> +extern u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data_len, size_t data_size,
> +				u8 *tmp, size_t tmp_size);

Is extern needed?

> +#endif

-- 
With Best Regards,
Andy Shevchenko


