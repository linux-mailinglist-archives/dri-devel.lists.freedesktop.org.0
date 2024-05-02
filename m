Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 820DB8BA42C
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 01:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A3410F233;
	Thu,  2 May 2024 23:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="BNq4ALpK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AEF10F233;
 Thu,  2 May 2024 23:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+jAuGAUMlirWHwpsbSRnjzxGiwK0lb5RSO05/kE9BCw=; b=BNq4ALpKLbJH/KcTZGVVsf3CKJ
 6oohbExTsN0l0871Q/7TlyO/laXpsBkWo09az4DGUWLvE3ZnhSutgPPbRrSdmjVD64ociH3mDN1/r
 gcuF5m3Wd1/GtmS9WdQNT76M7n0pZW4/4mjMhFRhlNHD7QLOPUWnD3I2+RAnpUlOKzb3y7KyOS98x
 K09oUyMoAR7KSwTEuyYKEXwf8HhZd5wgO8ntlHUFD+3XXf7A8HhJSuBcTLMaabEHDix2ylHnIL6m+
 FlrlcoZL1dAfDyMQU82WNe22tv6MCZ5QyTfCry9vkmmNLUa09aNWUKuoG7qNYKGPHCEEaBGvCjE3I
 mJG5dmsQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1s2g3k-009s3X-2Z; Thu, 02 May 2024 23:41:52 +0000
Date: Fri, 3 May 2024 00:41:52 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Kees Cook <keescook@chromium.org>
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] fs: Convert struct file::f_count to refcount_long_t
Message-ID: <20240502234152.GP2118490@ZenIV>
References: <20240502222252.work.690-kees@kernel.org>
 <20240502223341.1835070-5-keescook@chromium.org>
 <20240502224250.GM2118490@ZenIV> <202405021548.040579B1C@keescook>
 <20240502231228.GN2118490@ZenIV> <202405021620.C8115568@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405021620.C8115568@keescook>
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

On Thu, May 02, 2024 at 04:21:13PM -0700, Kees Cook wrote:
> On Fri, May 03, 2024 at 12:12:28AM +0100, Al Viro wrote:
> > On Thu, May 02, 2024 at 03:52:21PM -0700, Kees Cook wrote:
> > 
> > > As for semantics, what do you mean? Detecting dec-below-zero means we
> > > catch underflow, and detected inc-from-zero means we catch resurrection
> > > attempts. In both cases we avoid double-free, but we have already lost
> > > to a potential dangling reference to a freed struct file. But just
> > > letting f_count go bad seems dangerous.
> > 
> > Detected inc-from-zero can also mean an RCU lookup detecting a descriptor
> > in the middle of getting closed.  And it's more subtle than that, actually,
> > thanks to SLAB_TYPESAFE_BY_RCU for struct file.
> 
> But isn't that already handled by __get_file_rcu()? i.e. shouldn't it be
> impossible for a simple get_file() to ever see a 0 f_count under normal
> conditions?

For get_file() it is impossible.  The comment about semantics had been
about the sane ways to recover if such crap gets detected.

__get_file_rcu() is a separate story - consider the comment in there: 
	* atomic_long_inc_not_zero() above provided a full memory
	* barrier when we acquired a reference.
         *
         * This is paired with the write barrier from assigning to the
         * __rcu protected file pointer so that if that pointer still
         * matches the current file, we know we have successfully
         * acquired a reference to the right file.

and IIRC, refcount_t is weaker wrt barriers.
