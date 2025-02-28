Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0BDA49931
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 13:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E3510EC95;
	Fri, 28 Feb 2025 12:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fb4WxOI+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B51B10EC93
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 12:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740745619; x=1772281619;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XTJ5YcY4zwZRIsaVC73ZiUNIWKHOD1EZR96gfev93xY=;
 b=fb4WxOI+gnQ3DOypvu3U77fve9hhHO3m/Z63u4eB9I08TaJkAcn+wPcO
 Fv1zkUOABxk1wrl0BOBEN/aSSiMmKg2PSzWTk751nbr+rZDnSuBnwT0YT
 /OWv3R+NefBRCxmn9kQbKKvopK6JIVd4szVxCsxkdvdGyXeox+wPy4Cbs
 pSef2VdQJE/bPy9mkbbcQTwuR827DNcsZyNuyKum4/x3mYZ/z9prflyjo
 tGtHfuaIJEEinOOQLFGUt2s4BsbxqJeulJ7uIfNjLvUZTyk509hIqEdw2
 +APrze7MMGWnSkxfICJg4esYonKGkARlaaiS7PgHhveaRLH8XWqOGoJq6 A==;
X-CSE-ConnectionGUID: gsgtYAj2RDisYifdHN2neg==
X-CSE-MsgGUID: t/+ZPARSQbuAJuZCbU0bQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41923239"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="41923239"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 04:26:58 -0800
X-CSE-ConnectionGUID: 9xS020aiSyGbIWM9zSPWCw==
X-CSE-MsgGUID: X4pxYDX/TLi+1cgb9ccxow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118245544"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 04:26:54 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tnzS5-0000000FwX6-1aq9; Fri, 28 Feb 2025 14:26:49 +0200
Date: Fri, 28 Feb 2025 14:26:49 +0200
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
Subject: Re: [PATCH 0/4] Check Rust signatures at compile time
Message-ID: <Z8GriWN4C-e3583T@smile.fi.intel.com>
References: <20250227-export-macro-v1-0-948775fc37aa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227-export-macro-v1-0-948775fc37aa@google.com>
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

On Thu, Feb 27, 2025 at 05:01:58PM +0000, Alice Ryhl wrote:

This is unfortunate. What does this mean?
Can you, please, provide a meaningful cover letter?

> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

-- 
With Best Regards,
Andy Shevchenko


