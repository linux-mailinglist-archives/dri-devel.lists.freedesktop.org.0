Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309155E90FA
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 06:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC28610E1A4;
	Sun, 25 Sep 2022 04:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C020E10E1A1;
 Sun, 25 Sep 2022 04:39:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 69376B80D9A;
 Sun, 25 Sep 2022 04:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8511AC433C1;
 Sun, 25 Sep 2022 04:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664080773;
 bh=rYg04agLa5jHZi5i+Mdx/kva6NmKI7QgkYmqo+a6BMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nLK0VSYDvwL1xnkNzhn4wUqkYHWZjIHVO/593K368HUXvtSkmihf1JOPKd+OKm617
 VNz0QiIRGBqPz+ySQ/QwQ5fJpw7q5Cl1ZQRN9yBSpXFEDFZo7jbkDav1lRCNsHUcCb
 GA7JAn0qNHyfFYOiOtP14NreN3jFx+RnWsSR58XAZsl0fnzJFXlSj2XjHhHsCucJgO
 4s4xMuHQZsybIVW1ID+5Ri68chx6HjTuYoi+o7EOUYhkOjIz5gZX2E2LLDGb7LryXZ
 guuCyEv+lU9d0Cr2iCR+6DuyufpkkD3IBr/2TfO/ftX0QViBNv+Wg5DaMyrD+5+rNu
 0BvvdQlybRdew==
Date: Sat, 24 Sep 2022 21:39:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] drm/i915: Fix CFI violations in gt_sysfs
Message-ID: <Yy/bglnYjnFfjDDI@dev-arch.thelio-3990X>
References: <20220922195127.2607496-1-nathan@kernel.org>
 <202209232143.172BCCDC4@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202209232143.172BCCDC4@keescook>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, llvm@lists.linux.dev,
 Tom Rix <trix@redhat.com>, intel-gfx@lists.freedesktop.org,
 Nick Desaulniers <ndesaulniers@google.com>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Sami Tolvanen <samitolvanen@google.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 23, 2022 at 09:57:47PM -0700, Kees Cook wrote:
> On Thu, Sep 22, 2022 at 12:51:27PM -0700, Nathan Chancellor wrote:
> > [...]
> > To make everything work properly, adjust certain functions to match the
> > type of the ->show() and ->store() members in 'struct kobj_attribute'.
> > Add a macro to generate functions for that can be called via both
> > dev_attr_{show,store}() or kobj_attr_{show,store}() so that they can be
> > called through both kobject locations without violating kCFI and adjust
> > the attribute groups to account for this.
> 
> This was quite a roller coaster! I think the solution looks good, even
> if I'm suspicious of the original design that has the same stuff
> available twice in different places. (I have a dim memory of rdma
> needing a refactoring like this too?)

Right, I noticed this comment in intel_gt_sysfs_register() once I fully
saw what was going on:

	/*
	 * We need to make things right with the
	 * ABI compatibility. The files were originally
	 * generated under the parent directory.
	 *
	 * We generate the files only for gt 0
	 * to avoid duplicates.
	 */

Makes it seem like there will be userspace breakage if these files do
not exist? I figured this was the cleanest solution within those
parameters.

> Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks for looking it over!

Cheers,
Nathan
