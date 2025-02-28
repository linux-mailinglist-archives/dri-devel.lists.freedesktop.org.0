Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46654A49936
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 13:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A7F10E295;
	Fri, 28 Feb 2025 12:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EbtW7YjC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F5910E295
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 12:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740745655; x=1772281655;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=D7zHHQU8x/t+aPG7jNWtRdAX0S65Ib4QP2cl0EV7yWk=;
 b=EbtW7YjCn0lV3NrdjI7Ks6zn2txMYkBZ4uVTQb1h4B8KuGltRV66ZZqP
 f0mMQzZwGtticuTBeP8Tsj4/WUFXJ3Z7O7vj94qAycz8L/BIJ6QUkFC3B
 0E1Yz+hZN/OQ1MnE/fRa3hMAyMfyLTUFhUmGtOPGuygwdF1e99bILQcuG
 tEcUdyNk7lndmJsIHgbBdtD7W6cNB2NemcucWrWiA+THRzNYQvwod0ome
 VphEXW+00gnU4r832QZZl1euYVhcVi+8i/D689VMkZU8lFk/ucr+Ro6kE
 XkGY+INVEJNs8JMiqPkrjbEFarwEuZYvOxB9OorB2NyHfvYq6MxQM5cAK A==;
X-CSE-ConnectionGUID: ca5mLks3S/6rmtUXlF6gAw==
X-CSE-MsgGUID: cljohTiGQ2acjN8RLLPrgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="53082889"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="53082889"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 04:27:35 -0800
X-CSE-ConnectionGUID: 5e0OC6KWQ4WRvAvDygPQkw==
X-CSE-MsgGUID: g4+/gMxaQvq+26wuw/LZfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="122273689"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 04:27:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tnzSf-0000000FwXh-37W4; Fri, 28 Feb 2025 14:27:25 +0200
Date: Fri, 28 Feb 2025 14:27:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/4] Check Rust signatures at compile time
Message-ID: <Z8Grrb80WOf99qoX@smile.fi.intel.com>
References: <UXTosjUFv_CKOV-K4oqNGBhMEv64tds9NgXWhHEYdCHuKM2qSPFrpBnTqhFGkcbv5_KXYERykIXhn-sYnEeuUg==@protonmail.internalid>
 <20250227-export-macro-v1-0-948775fc37aa@google.com>
 <877c5apmdi.fsf@kernel.org>
 <CAH5fLgiNs-VKEQduL16eymSPnqA0_6aR8WDRYm68SE8FXGDHRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgiNs-VKEQduL16eymSPnqA0_6aR8WDRYm68SE8FXGDHRw@mail.gmail.com>
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

On Fri, Feb 28, 2025 at 09:46:32AM +0100, Alice Ryhl wrote:
> On Fri, Feb 28, 2025 at 8:19 AM Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >
> > "Alice Ryhl" <aliceryhl@google.com> writes:
> >
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >
> > What is going on with the cover letter of this one?
> 
> It's empty.

So, it means nothing to review, sorry.

-- 
With Best Regards,
Andy Shevchenko


