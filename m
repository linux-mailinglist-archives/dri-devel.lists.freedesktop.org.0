Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682348BABAF
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 13:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4EF10F19E;
	Fri,  3 May 2024 11:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kU+Pbgfm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8434610F0A6;
 Fri,  3 May 2024 11:36:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6738261454;
 Fri,  3 May 2024 11:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FEDC116B1;
 Fri,  3 May 2024 11:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714736165;
 bh=fIbetBuQVrEG023U7eI1zy1F+Dx8KclRAJyueT8XV4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kU+PbgfmV2WYTvcKoIKD2SagvRYfVtWIILVja2exLH0MFtfHic0+Py5SLz8ioBh2c
 bqpbYbxJ/W9l6syTIapYfSN8oXLB4jn8f3Me0mm0uAJK/HVh9Fym6kP9MVBwSMsr3k
 Jxor+f8RX7pVwuuRJivzQlZh7ay51U+v39/npfLfZ7SyAMSRMB4SIfamdKqeQwinVk
 K9VNzZ0cPydBqTF+/eTYn5JPlrfdcNvCY5ixi4VD0+WIvYHt43TEYrbf91dw/oLydB
 tffGxIoNupZL31C61JfQelalR2aYh/QVLvdIroxHiS3/lJQpV1lJ/uyXJPQRKOstnd
 l8jmPUnOkSLrw==
Date: Fri, 3 May 2024 13:35:54 +0200
From: Christian Brauner <brauner@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <keescook@chromium.org>, Al Viro <viro@zeniv.linux.org.uk>, 
 Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
 Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Andi Shyti <andi.shyti@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Mark Rutland <mark.rutland@arm.com>,
 Kent Overstreet <kent.overstreet@linux.dev>, 
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Andrew Morton <akpm@linux-foundation.org>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] fs: Convert struct file::f_count to refcount_long_t
Message-ID: <20240503-kramen-punkten-848aa0cfd3d0@brauner>
References: <20240502224250.GM2118490@ZenIV> <202405021548.040579B1C@keescook>
 <20240502231228.GN2118490@ZenIV> <202405021620.C8115568@keescook>
 <20240502234152.GP2118490@ZenIV> <202405021708.267B02842@keescook>
 <20240503001445.GR2118490@ZenIV> <202405021736.574A688@keescook>
 <20240503-inventar-braut-c82e15e56a32@brauner>
 <20240503103614.GF30852@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240503103614.GF30852@noisy.programming.kicks-ass.net>
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

On Fri, May 03, 2024 at 12:36:14PM +0200, Peter Zijlstra wrote:
> On Fri, May 03, 2024 at 11:37:25AM +0200, Christian Brauner wrote:
> > On Thu, May 02, 2024 at 05:41:23PM -0700, Kees Cook wrote:
> > > On Fri, May 03, 2024 at 01:14:45AM +0100, Al Viro wrote:
> > > > On Thu, May 02, 2024 at 05:10:18PM -0700, Kees Cook wrote:
> > > > 
> > > > > But anyway, there needs to be a general "oops I hit 0"-aware form of
> > > > > get_file(), and it seems like it should just be get_file() itself...
> > > > 
> > > > ... which brings back the question of what's the sane damage mitigation
> > > > for that.  Adding arseloads of never-exercised failure exits is generally
> > > > a bad idea - it's asking for bitrot and making the thing harder to review
> > > > in future.
> > > 
> > > Linus seems to prefer best-effort error recovery to sprinkling BUG()s
> > > around.  But if that's really the solution, then how about get_file()
> > > switching to to use inc_not_zero and BUG on 0?
> > 
> > Making get_file() return an error is not an option. For all current
> > callers that's pointless churn for a condition that's not supposed to
> > happen at all.
> > 
> > Additionally, iirc *_inc_not_zero() variants are implemented with
> > try_cmpxchg() which scales poorly under contention for a condition
> > that's not supposed to happen.
> 
> 	unsigned long old = atomic_long_fetch_inc_relaxed(&f->f_count);
> 	WARN_ON(!old);
> 
> Or somesuch might be an option?

Yeah, I'd be fine with that. WARN_ON() (or WARN_ON_ONCE() even?) and
then people can do their panic_on_warn stuff to get the BUG_ON()
behavior if they want to.
